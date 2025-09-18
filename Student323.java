public class Student323 {
    // 学生属性
    private String name;
    private int age;
    private String studentId;
    private String major;
    private double gpa;

    // 构造方法
    public Student323() {
        this.name = "";
        this.age = 0;
        this.studentId = "";
        this.major = "";
        this.gpa = 0.0;
    }

    public Student323(String name, int age, String studentId, String major, double gpa) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.major = major;
        this.gpa = gpa;
    }

    // 访问器方法 (Getters)
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

    // 修改器方法 (Setters)
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

    // 其他方法
    public void displayInfo() {
        System.out.println("学生信息:");
        System.out.println("姓名: " + name);
        System.out.println("年龄: " + age);
        System.out.println("学号: " + studentId);
        System.out.println("专业: " + major);
        System.out.println("GPA: " + gpa);
    }

    public void study(String subject) {
        System.out.println(name + " 正在学习 " + subject);
    }

    public void takeExam(String subject) {
        System.out.println(name + " 正在参加 " + subject + " 考试");
    }

    public String getGradeLevel() {
        if (gpa >= 3.5) {
            return "优秀";
        } else if (gpa >= 3.0) {
            return "良好";
        } else if (gpa >= 2.0) {
            return "中等";
        } else if (gpa >= 1.0) {
            return "及格";
        } else {
            return "不及格";
        }
    }

    // toString方法
    @Override
    public String toString() {
        return "Student323{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", studentId='" + studentId + '\'' +
                ", major='" + major + '\'' +
                ", gpa=" + gpa +
                '}';
    }
}