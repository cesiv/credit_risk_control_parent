package com.hanzhou.www.controller.oa;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.activiti.engine.ActivitiException;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hanzhou.www.DateUtil;
import com.hanzhou.www.dao.oa.LeaveDao;
import com.hanzhou.www.dto.oa.LeaveDto;
import com.hanzhou.www.model.oa.Leave;
import com.hanzhou.www.service.oa.LeaveWorkflowService;
import com.hanzhou.www.vo.oa.LeaveVo;

/**
 * 请假控制器，包含保存、启动流程
 *
 * @author HenryYan
 */
@Controller
@RequestMapping(value = "/oa/leave")
public class LeaveController {

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    protected LeaveWorkflowService workflowService;

    @Autowired
    protected RuntimeService runtimeService;

    @Autowired
    protected TaskService taskService;
    
    @Autowired
    private LeaveDao leaveDao;

    @RequestMapping(value = {"apply", ""})
    public void createForm(Model model) {
        model.addAttribute("leave", new Leave());
    }

    /**
     * 启动请假流程
     *
     * @param leave
     */
    @RequestMapping(value = "start", method = RequestMethod.GET)
    public void startWorkflow(RedirectAttributes redirectAttributes, HttpSession session) {
        try {
        	Leave leave = new Leave();
        	leave.setStartTime(DateUtil.getDateFromString("2017-03-07 00:00:00",DateUtil.FORMAT_YMDHMS));
        	leave.setEndTime(DateUtil.getDateFromString("2017-03-08 00:00:00",DateUtil.FORMAT_YMDHMS));
        	leave.setLeaveType("2");
        	leave.setReason("test");
        	String userId = (String) SecurityUtils.getSubject().getPrincipal();
            leave.setUserId(userId);
            Map<String, Object> variables = new HashMap<String, Object>();
            ProcessInstance processInstance = workflowService.startWorkflow(leave, variables);
            redirectAttributes.addFlashAttribute("message", "流程已启动，流程ID：" + processInstance.getId());
        } catch (ActivitiException e) {
            if (e.getMessage().indexOf("no processes deployed with key") != -1) {
                logger.warn("没有部署流程!", e);
                redirectAttributes.addFlashAttribute("error", "没有部署流程，请在[工作流]->[流程管理]页面点击<重新部署流程>");
            } else {
                logger.error("启动请假流程失败：", e);
                redirectAttributes.addFlashAttribute("error", "系统内部错误！");
            }
        } catch (Exception e) {
            logger.error("启动请假流程失败：", e);
            redirectAttributes.addFlashAttribute("error", "系统内部错误！");
        }
    }

    /**
     * 任务列表
     *
     * @param leave
     */
    @RequestMapping(value = "list/task")
    public ModelAndView taskList(HttpSession session, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("/oa/leave/taskList");
        int[] pageParams = {0,20};
        String userId = (String) SecurityUtils.getSubject().getPrincipal();
        workflowService.findTodoTasks(userId,pageParams);
        return mav;
    }

    /**
     * 读取运行中的流程实例
     *
     * @return
     */
    @RequestMapping(value = "list/running")
    public ModelAndView runningList(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("/oa/leave/running");
        int[] pageParams = {0,20};
        workflowService.findRunningProcessInstaces(pageParams);
        return mav;
    }

    /**
     * 读取运行中的流程实例
     *
     * @return
     */
    @RequestMapping(value = "list/finished")
    public ModelAndView finishedList(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("/oa/leave/finished");
        int[] pageParams = {0,20};
        workflowService.findFinishedProcessInstaces(pageParams);
        return mav;
    }

    /**
     * 签收任务
     */
    @RequestMapping(value = "task/claim/{id}")
    public String claim(@PathVariable("id") String taskId, HttpSession session, RedirectAttributes redirectAttributes) {
    	String userId = (String) SecurityUtils.getSubject().getPrincipal();
        taskService.claim(taskId, userId);
        redirectAttributes.addFlashAttribute("message", "任务已签收");
        return "redirect:/oa/leave/list/task";
    }

    /**
     * 读取详细数据
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "detail/{id}")
    @ResponseBody
    public Leave getLeave(@PathVariable("id") Long id) {
        Leave leave = leaveDao.selectByPrimaryKey(id);
        return leave;
    }

    /**
     * 读取详细数据
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "detail-with-vars/{id}/{taskId}")
    @ResponseBody
    public LeaveDto getLeaveWithVars(@PathVariable("id") Long id, @PathVariable("taskId") String taskId) {
    	Leave leave = leaveDao.selectByPrimaryKey(id);
        Map<String, Object> variables = taskService.getVariables(taskId);
        LeaveDto dto = new LeaveDto();
        BeanUtils.copyProperties(leave, dto);
        dto.setVariables(variables);
        return dto;
    }

    /**
     * 完成任务
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "complete/{id}", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public String complete(@PathVariable("id") String taskId, LeaveVo var) {
        try {
            Map<String, Object> variables = var.getVariableMap();
            taskService.complete(taskId, variables);
            return "success";
        } catch (Exception e) {
            logger.error("error on complete task {}, variables={}", new Object[]{taskId, var.getVariableMap(), e});
            return "error";
        }
    }

}
