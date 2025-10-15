import java.util.ArrayList;
import java.util.List;

public class Student {
    private String name;
    private int age;
    private String studentId;
    private List<String> courses;
    private double gpa;

    // 构造函数
    public Student(String name, int age, String studentId) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.courses = new ArrayList<>();
        this.gpa = 0.0;
    }

    // 获取学生姓名
    public String getName() {
        return name;
    }

    // 设置学生姓名
    public void setName(String name) {
        this.name = name;
    }

    // 获取学生年龄
    public int getAge() {
        return age;
    }

    // 设置学生年龄
    public void setAge(int age) {
        this.age = age;
    }

    // 获取学生ID
    public String getStudentId() {
        return studentId;
    }

    // 设置学生ID
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    // 获取GPA
    public double getGpa() {
        return gpa;
    }

    // 设置GPA
    public void setGpa(double gpa) {
        this.gpa = gpa;
    }

    // 添加课程
    public void addCourse(String course) {
        courses.add(course);
    }

    // 移除课程
    public boolean removeCourse(String course) {
        return courses.remove(course);
    }

    // 获取课程列表
    public List<String> getCourses() {
        return new ArrayList<>(courses);
    }

    // 获取课程数量
    public int getCourseCount() {
        return courses.size();
    }

    // 显示学生信息
    public void displayInfo() {
        System.out.println("学生信息:");
        System.out.println("姓名: " + name);
        System.out.println("年龄: " + age);
        System.out.println("学号: " + studentId);
        System.out.println("GPA: " + gpa);
        System.out.println("课程: " + courses);
    }

    // 计算课程等级
    public String getGradeLevel() {
        if (gpa >= 3.7) {
            return "A";
        } else if (gpa >= 3.0) {
            return "B";
        } else if (gpa >= 2.0) {
            return "C";
        } else if (gpa >= 1.0) {
            return "D";
        } else {
            return "F";
        }
    }

    // 检查是否为优秀学生
    public boolean isExcellentStudent() {
        return gpa >= 3.7;
    }

    // 重写toString方法
    @Override
    public String toString() {
        return "Student{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", studentId='" + studentId + '\'' +
                ", gpa=" + gpa +
                ", courses=" + courses +
                '}';
    }

    // 主方法，用于测试
    public static void main(String[] args) {
        // 创建学生对象
        Student student1 = new Student("张三", 20, "S001");
        student1.setGpa(3.8);
        student1.addCourse("数学");
        student1.addCourse("英语");
        student1.addCourse("计算机科学");

        // 显示学生信息
        student1.displayInfo();
        System.out.println("等级: " + student1.getGradeLevel());
        System.out.println("是否为优秀学生: " + student1.isExcellentStudent());

        System.out.println("\n" + student1.toString());
    }
}