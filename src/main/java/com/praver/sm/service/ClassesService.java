package com.praver.sm.service;

import com.praver.sm.pojo.Classes;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ClassesService {

    List<Classes> getClasses();

    void addClasses(Map<String,Object> map);

    int deleteClasses(@Param("id") int id);

    List<Classes> queryClassesByName(int id,String name);

    Classes queryClassesById(int id);

    void updateClasses(Map<String, Object> map);
}
