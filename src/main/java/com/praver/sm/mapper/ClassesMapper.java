package com.praver.sm.mapper;

import com.fasterxml.jackson.databind.annotation.JsonAppend.Prop;
import com.praver.sm.pojo.Classes;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ClassesMapper {

    List<Classes> getClasses();

    void addClasses(Map<String,Object> map);

    int deleteClasses(@Param("id") int id);

    List<Classes> queryClassesByName(@Param("id") int id,@Param("name") String name);

    Classes queryClassesById(@Param("id") int id);

    void updateClasses(Map<String, Object> map);
}
