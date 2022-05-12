package com.praver.sm.service.Impl;

import com.praver.sm.mapper.ClassesMapper;
import com.praver.sm.pojo.Classes;
import com.praver.sm.service.ClassesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ClassesServiceImpl implements ClassesService {

    @Autowired
    private ClassesMapper classesMapper;

    @Override
    public List<Classes> getClasses() {
        return classesMapper.getClasses();
    }

    @Override
    public void addClasses(Map<String, Object> map) {
        classesMapper.addClasses(map);
    }

    @Override
    public int deleteClasses(int id) {
        return classesMapper.deleteClasses(id);
    }

    @Override
    public List<Classes> queryClassesByName(int id, String name) {
        return classesMapper.queryClassesByName(id,name);
    }

    @Override
    public Classes queryClassesById(int id) {
        return classesMapper.queryClassesById(id);
    }

    @Override
    public void updateClasses(Map<String, Object> map) {
        classesMapper.updateClasses(map);
    }
}
