public class RandomStudent1760950607 {
    // 学生属性
    private String name;
    private int age;
    private String studentId;
    private double gpa;
    private String major;

    // 构造函数
    public RandomStudent1760950607(String name, int age, String studentId, double gpa, String major) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.gpa = gpa;
        this.major = major;
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

    public double getGpa() {
        return gpa;
    }

    public String getMajor() {
        return major;
    }

    // Setter方法
    public void setName(String name) {
        this.name = name;
    }

    public void setAge(int age) {
        if (age > 0) {
            this.age = age;
        }
    }

    public void setGpa(double gpa) {
        if (gpa >= 0.0 && gpa <= 4.0) {
            this.gpa = gpa;
        }
    }

    public void setMajor(String major) {
        this.major = major;
    }

    // 业务方法
    public boolean isHonorStudent() {
        return gpa >= 3.5;
    }

    public String getStudentStatus() {
        if (gpa >= 3.8) {
            return "优秀";
        } else if (gpa >= 3.0) {
            return "良好";
        } else if (gpa >= 2.0) {
            return "及格";
        } else {
            return "不及格";
        }
    }

    public void displayStudentInfo() {
        System.out.println("学生信息:");
        System.out.println("姓名: " + name);
        System.out.println("年龄: " + age);
        System.out.println("学号: " + studentId);
        System.out.println("GPA: " + gpa);
        System.out.println("专业: " + major);
        System.out.println("状态: " + getStudentStatus());
    }

    @Override
    public String toString() {
        return "Student{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", studentId='" + studentId + '\'' +
                ", gpa=" + gpa +
                ", major='" + major + '\'' +
                '}';
    }

    public static void main(String[] args) {
        RandomStudent1760950607 student1 = new RandomStudent1760950607("张三", 20, "2021001", 3.7, "计算机科学");
        RandomStudent1760950607 student2 = new RandomStudent1760950607("李四", 19, "2021002", 2.8, "数学");

        student1.displayStudentInfo();
        System.out.println("是否为优秀学生: " + student1.isHonorStudent());
        System.out.println();

        student2.displayStudentInfo();
        System.out.println("是否为优秀学生: " + student2.isHonorStudent());
    }
}