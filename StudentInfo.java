public class StudentInfo {
    // 学生属性
    private String name;
    private int age;
    private String studentId;
    private String major;
    private double gpa;

    // 构造函数
    public StudentInfo(String name, int age, String studentId, String major, double gpa) {
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
        System.out.println("Student Information:");
        System.out.println("Name: " + name);
        System.out.println("Age: " + age);
        System.out.println("Student ID: " + studentId);
        System.out.println("Major: " + major);
        System.out.println("GPA: " + gpa);
    }

    public boolean isExcellentStudent() {
        return gpa >= 3.5;
    }

    public String getAcademicStatus() {
        if (gpa >= 3.5) {
            return "Excellent";
        } else if (gpa >= 3.0) {
            return "Good";
        } else if (gpa >= 2.0) {
            return "Pass";
        } else {
            return "Fail";
        }
    }

    @Override
    public String toString() {
        return "StudentInfo{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", studentId='" + studentId + '\'' +
                ", major='" + major + '\'' +
                ", gpa=" + gpa +
                '}';
    }

    // 主方法用于测试
    public static void main(String[] args) {
        StudentInfo student1 = new StudentInfo("Zhang San", 20, "2021001", "Computer Science", 3.7);
        StudentInfo student2 = new StudentInfo("Li Si", 19, "2021002", "Mathematics", 2.8);

        student1.displayInfo();
        System.out.println("Academic Status: " + student1.getAcademicStatus());
        System.out.println("Is Excellent Student: " + student1.isExcellentStudent());
        System.out.println();

        student2.displayInfo();
        System.out.println("Academic Status: " + student2.getAcademicStatus());
        System.out.println("Is Excellent Student: " + student2.isExcellentStudent());
    }
}