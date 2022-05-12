package com.praver.sm.service.Impl;

import com.praver.sm.mapper.AdminMapper;
import com.praver.sm.pojo.Admin;
import com.praver.sm.pojo.LoginForm;
import com.praver.sm.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public int addAdmin(Admin admin) {
        return adminMapper.addAdmin(admin);
    }

    @Override
    public int deleteAdmin(int id) {
        return adminMapper.deleteAdmin(id);
    }

    @Override
    public int updateAdmin(Admin admin) {
        return adminMapper.updateAdmin(admin);
    }

    @Override
    public Admin queryAdmin(int id) {
        return adminMapper.queryAdmin(id);
    }

    @Override
    public Admin loginAdmin(LoginForm loginForm) {
        return adminMapper.loginAdmin(loginForm);
    }
}
