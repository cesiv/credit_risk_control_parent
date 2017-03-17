package com.hanzhou.www.service.oa;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricProcessInstanceQuery;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.runtime.ProcessInstanceQuery;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hanzhou.www.dao.oa.LeaveDao;
import com.hanzhou.www.dto.oa.LeaveDto;
import com.hanzhou.www.model.oa.Leave;

/**
 * 请假流程Service
 *
 * @author HenryYan
 */
@Service
@Transactional
public class LeaveWorkflowService {

    private static Logger logger = LoggerFactory.getLogger(LeaveWorkflowService.class);
    @Autowired
    private LeaveDao leaveDao;
    @Autowired
    private RuntimeService runtimeService;
    @Autowired
    protected TaskService taskService;
    @Autowired
    protected HistoryService historyService;
    @Autowired
    protected RepositoryService repositoryService;

    @Autowired
    private IdentityService identityService;

    /**
     * 启动流程
     *
     * @param entity
     */
    public ProcessInstance startWorkflow(Leave entity, Map<String, Object> variables) {
        leaveDao.insert(entity);
        logger.debug("save entity: {}", entity);
        String businessKey = entity.getId().toString();

        ProcessInstance processInstance = null;
        try {
            // 用来设置启动流程的人员ID，引擎会自动把用户ID保存到activiti:initiator中
            identityService.setAuthenticatedUserId(entity.getUserId());

            processInstance = runtimeService.startProcessInstanceByKey("leave", businessKey, variables);
            String processInstanceId = processInstance.getId();
            entity.setProcessInstanceId(processInstanceId);
            logger.debug("start process of {key={}, bkey={}, pid={}, variables={}}", new Object[]{"leave", businessKey, processInstanceId, variables});
        } finally {
            identityService.setAuthenticatedUserId(null);
        }
        return processInstance;
    }

    /**
     * 查询待办任务
     *
     * @param userId 用户ID
     * @return
     */
    @Transactional(readOnly = true)
    public List<LeaveDto> findTodoTasks(String userId,int[] pageParams) {
        List<LeaveDto> results = new ArrayList<LeaveDto>();

        // 根据当前人的ID查询
        TaskQuery taskQuery = taskService.createTaskQuery().taskCandidateOrAssigned(userId);
        List<Task> tasks = taskQuery.list();

        // 根据流程的业务ID查询实体并关联
        for (Task task : tasks) {
            String processInstanceId = task.getProcessInstanceId();
            ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).active().singleResult();
            if (processInstance == null) {
                continue;
            }
            String businessKey = processInstance.getBusinessKey();
            if (businessKey == null) {
                continue;
            }
            Leave leave = leaveDao.selectByPrimaryKey(new Long(businessKey));
            LeaveDto dto = new LeaveDto();
            BeanUtils.copyProperties(leave, dto);
            dto.setTask(task);
            dto.setProcessInstance(processInstance);
            dto.setProcessDefinition(getProcessDefinition(processInstance.getProcessDefinitionId()));
            results.add(dto);
        }
        return results;
    }

    /**
     * 读取运行中的流程
     *
     * @return
     */
    @Transactional(readOnly = true)
    public List<LeaveDto> findRunningProcessInstaces(int[] pageParams) {
        List<LeaveDto> results = new ArrayList<LeaveDto>();
        ProcessInstanceQuery query = runtimeService.createProcessInstanceQuery().processDefinitionKey("leave").active().orderByProcessInstanceId().desc();
        List<ProcessInstance> list = query.listPage(pageParams[0], pageParams[1]);

        // 关联业务实体
        for (ProcessInstance processInstance : list) {
            String businessKey = processInstance.getBusinessKey();
            if (businessKey == null) {
                continue;
            }
            Leave leave = leaveDao.selectByPrimaryKey(new Long(businessKey));
            LeaveDto dto = new LeaveDto();
            BeanUtils.copyProperties(leave, dto);
            dto.setProcessInstance(processInstance);
            dto.setProcessDefinition(getProcessDefinition(processInstance.getProcessDefinitionId()));
            results.add(dto);

            // 设置当前任务信息
            List<Task> tasks = taskService.createTaskQuery().processInstanceId(processInstance.getId()).active().orderByTaskCreateTime().desc().listPage(0, 1);
            dto.setTask(tasks.get(0));
        }
        return results;
    }

    /**
     * 读取已结束中的流程
     *
     * @return
     */
    @Transactional(readOnly = true)
    public List<LeaveDto> findFinishedProcessInstaces(int[] pageParams) {
        List<LeaveDto> results = new ArrayList<LeaveDto>();
        HistoricProcessInstanceQuery query = historyService.createHistoricProcessInstanceQuery().processDefinitionKey("leave").finished().orderByProcessInstanceEndTime().desc();
        List<HistoricProcessInstance> list = query.listPage(pageParams[0], pageParams[1]);

        // 关联业务实体
        for (HistoricProcessInstance historicProcessInstance : list) {
            String businessKey = historicProcessInstance.getBusinessKey();
            Leave leave = leaveDao.selectByPrimaryKey(new Long(businessKey));
            LeaveDto dto = new LeaveDto();
            BeanUtils.copyProperties(leave, dto);
            dto.setProcessDefinition(getProcessDefinition(historicProcessInstance.getProcessDefinitionId()));
            dto.setHistoricProcessInstance(historicProcessInstance);
            results.add(dto);
        }
        return results;
    }

    /**
     * 查询流程定义对象
     *
     * @param processDefinitionId 流程定义ID
     * @return
     */
    protected ProcessDefinition getProcessDefinition(String processDefinitionId) {
        ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().processDefinitionId(processDefinitionId).singleResult();
        return processDefinition;
    }
}
