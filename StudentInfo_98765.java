/**
 * 学生信息类
 */
public class StudentInfo_98765 {
    // 学生属性
    private String name;
    private int age;
    private String studentId;
    private String major;
    private double gpa;

    // 构造函数
    public StudentInfo_98765(String name, int age, String studentId, String major, double gpa) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.major = major;
        this.gpa = gpa;
    }

    // 无参构造函数
    public StudentInfo_98765() {
        this.name = "";
        this.age = 0;
        this.studentId = "";
        this.major = "";
        this.gpa = 0.0;
    }

    // Getter方法
    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public String getStudentId() {
        return studentId;
    }

    public String getMajor() {
        return major;
    }

    public double getGpa() {
        return gpa;
    }

    // Setter方法
    public void setName(String name) {
        this.name = name;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public void setGpa(double gpa) {
        this.gpa = gpa;
    }

    // 显示学生信息的方法
    public void displayStudentInfo() {
        System.out.println("学生信息:");
        System.out.println("姓名: " + name);
        System.out.println("年龄: " + age);
        System.out.println("学号: " + studentId);
        System.out.println("专业: " + major);
        System.out.println("GPA: " + gpa);
    }

    // 判断学生是否为优秀学生的方法
    public boolean isExcellentStudent() {
        return gpa >= 3.5;
    }

    // 计算学生年级的方法（基于年龄）
    public String getGradeLevel() {
        if (age < 18) {
            return "预科生";
        } else if (age <= 20) {
            return "本科生一年级";
        } else if (age <= 22) {
            return "本科生二年级";
        } else if (age <= 24) {
            return "本科生三年级";
        } else if (age <= 26) {
            return "本科生四年级";
        } else {
            return "研究生";
        }
    }

    // 学生自我介绍的方法
    public void introduce() {
        System.out.println("大家好，我是" + name + "，今年" + age + "岁，专业是" + major + "。");
        if (isExcellentStudent()) {
            System.out.println("我的GPA是" + gpa + "，是一名优秀学生。");
        } else {
            System.out.println("我的GPA是" + gpa + "，我会继续努力。");
        }
    }

    // 主方法，用于测试
    public static void main(String[] args) {
        // 创建学生对象
        StudentInfo_98765 student1 = new StudentInfo_98765("张三", 20, "2021001", "计算机科学", 3.8);
        StudentInfo_98765 student2 = new StudentInfo_98765("李四", 19, "2021002", "数学", 3.2);

        // 显示学生信息
        student1.displayStudentInfo();
        System.out.println();
        student2.displayStudentInfo();

        System.out.println("\n--- 学生自我介绍 ---");
        student1.introduce();
        System.out.println();
        student2.introduce();

        System.out.println("\n--- 年级信息 ---");
        System.out.println(student1.getName() + " 的年级: " + student1.getGradeLevel());
        System.out.println(student2.getName() + " 的年级: " + student2.getGradeLevel());
    }
}