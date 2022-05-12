import com.praver.sm.pojo.Classes;
import com.praver.sm.pojo.Grade;
import com.praver.sm.pojo.Student;
import com.praver.sm.pojo.Teacher;
import com.praver.sm.service.ClassesService;
import com.praver.sm.service.GradeService;
import com.praver.sm.service.StudentService;
import com.praver.sm.service.TeacherService;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.HashMap;
import java.util.List;

public class Mytest {



    @Test
    public void test_1(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        GradeService gradeService =(GradeService) context.getBean("gradeServiceImpl");
        Grade grade = new Grade(3, "test", "test");
//        System.out.println(gradeService.updateGrade(grade));
//        System.out.println(gradeService.queryGradeByName("医"));
    }

    @Test
    public void test_2(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        TeacherService teacherService= (TeacherService) context.getBean("teacherServiceImpl");
        List<Teacher> teacherList = teacherService.getTeacher();
        for (Teacher teacher : teacherList) {
            System.out.println(teacher);
        }

    }

    @Test
    public void test_3(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        TeacherService teacherService= (TeacherService) context.getBean("teacherServiceImpl");
        Grade grade = new Grade(1,"信息工程系",null);
        Teacher teacher = new Teacher(9,"李璇","男","lxxxx","lx123","1351312","嗨害嗨",2,grade);
        HashMap<String, Object> map = new HashMap<>();
        map.put("name",teacher.getName());
        map.put("sex",teacher.getSex());
        map.put("username",teacher.getUsername());
        map.put("password",teacher.getPassword());
        map.put("mobile",teacher.getMobile());
        map.put("remark",teacher.getRemark());
        map.put("gradeid",teacher.getGrade().getId());
        System.out.println(teacher);
        System.out.println(teacherService.addTeacher(map));

    }


    @Test
    public void test_4(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        TeacherService teacherService= (TeacherService) context.getBean("teacherServiceImpl");
        System.out.println(teacherService.queryTeacherById(1));
    }

    @Test
    public void test_5(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        TeacherService teacherService= (TeacherService) context.getBean("teacherServiceImpl");
        List<Teacher> teacherList = teacherService.queryTeacherByName(0, "");
        for (Teacher teacher : teacherList) {
            System.out.println(teacher);
        }
    }

    @Test
    public void test_6(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        ClassesService classesService= (ClassesService) context.getBean("classesServiceImpl");
        List<Classes> classesList = classesService.queryClassesByName(0, "1");
        for (Classes classes : classesList) {
            System.out.println(classes);
        }
    }

    @Test
    public void test_7(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        StudentService studentService= (StudentService) context.getBean("studentServiceImpl");
        List<Student> studentList = studentService.queryStudentByName(1, "余");
        for (Student student : studentList) {
            System.err.println(student);
        }
    }




}
