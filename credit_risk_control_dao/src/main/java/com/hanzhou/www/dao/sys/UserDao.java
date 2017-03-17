package com.hanzhou.www.dao.sys;

import java.util.List;

import com.hanzhou.www.model.sys.User;
import com.hanzhou.www.vo.sys.UserQueryVo;

public interface UserDao {
    int deleteByPrimaryKey(String id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    User getByUserName(String userName); 
    
    List<User> getListByCriteria(UserQueryVo criteria);
}