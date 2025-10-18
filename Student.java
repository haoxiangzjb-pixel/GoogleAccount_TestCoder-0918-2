public class Student {
    // 学生属性
    private String name;
    private int age;
    private String studentId;
    private String major;
    private double gpa;

    // 构造函数
    public Student(String name, int age, String studentId, String major, double gpa) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.major = major;
        this.gpa = gpa;
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
        if (age > 0) {  // 年龄必须大于0
            this.age = age;
        }
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public void setGpa(double gpa) {
        if (gpa >= 0.0 && gpa <= 4.0) {  // GPA在0.0到4.0之间
            this.gpa = gpa;
        }
    }

    // 业务方法
    public void displayInfo() {
        System.out.println("学生信息:");
        System.out.println("姓名: " + name);
        System.out.println("年龄: " + age);
        System.out.println("学号: " + studentId);
        System.out.println("专业: " + major);
        System.out.println("GPA: " + gpa);
    }

    public boolean isExcellentStudent() {
        return gpa >= 3.5;
    }

    public String getAcademicStatus() {
        if (gpa >= 3.5) {
            return "优秀";
        } else if (gpa >= 3.0) {
            return "良好";
        } else if (gpa >= 2.0) {
            return "及格";
        } else {
            return "不及格";
        }
    }

    @Override
    public String toString() {
        return "Student{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", studentId='" + studentId + '\'' +
                ", major='" + major + '\'' +
                ", gpa=" + gpa +
                '}';
    }

    // 主方法用于测试
    public static void main(String[] args) {
        Student student1 = new Student("张三", 20, "2021001", "计算机科学", 3.7);
        Student student2 = new Student("李四", 19, "2021002", "数学", 2.8);

        student1.displayInfo();
        System.out.println("学术状态: " + student1.getAcademicStatus());
        System.out.println("是否优秀学生: " + student1.isExcellentStudent());
        System.out.println();

        student2.displayInfo();
        System.out.println("学术状态: " + student2.getAcademicStatus());
        System.out.println("是否优秀学生: " + student2.isExcellentStudent());
    }
}