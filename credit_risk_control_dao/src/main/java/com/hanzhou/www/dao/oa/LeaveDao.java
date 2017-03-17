package com.hanzhou.www.dao.oa;

import com.hanzhou.www.model.oa.Leave;

public interface LeaveDao {
    int deleteByPrimaryKey(Long id);

    int insert(Leave record);

    int insertSelective(Leave record);

    Leave selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Leave record);

    int updateByPrimaryKey(Leave record);
}