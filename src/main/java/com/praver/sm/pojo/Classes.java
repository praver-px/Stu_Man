package com.praver.sm.pojo;

public class Classes {
    private int id;
    private Grade grade;
    private String name;
    private String remark;

    public Classes() {
    }

    public Classes(int id, Grade grade, String name, String remark) {
        this.id = id;
        this.grade = grade;
        this.name = name;
        this.remark = remark;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Grade getGrade() {
        return grade;
    }

    public void setGrade(Grade grade) {
        this.grade = grade;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "Classes{" +
                "id=" + id +
                ", grade=" + grade +
                ", name='" + name + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
