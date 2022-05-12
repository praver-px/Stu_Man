package com.praver.sm.mapper;

import com.praver.sm.pojo.Admin;
import com.praver.sm.pojo.LoginForm;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminMapper {

    int addAdmin(Admin admin);

    int deleteAdmin(@Param("id")int id);

    int updateAdmin(Admin admin);

    Admin queryAdmin(@Param("id")int id);

    Admin loginAdmin(LoginForm loginForm);
}
