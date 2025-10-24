public class Student {
    // 学生属性
    private String studentId;
    private String name;
    private int age;
    private String major;
    private double gpa;
    
    // 构造函数
    public Student() {
        this.studentId = "";
        this.name = "";
        this.age = 0;
        this.major = "";
        this.gpa = 0.0;
    }
    
    public Student(String studentId, String name, int age, String major, double gpa) {
        this.studentId = studentId;
        this.name = name;
        this.age = age;
        this.major = major;
        this.gpa = gpa;
    }
    
    // Getter方法
    public String getStudentId() {
        return studentId;
    }
    
    public String getName() {
        return name;
    }
    
    public int getAge() {
        return age;
    }
    
    public String getMajor() {
        return major;
    }
    
    public double getGpa() {
        return gpa;
    }
    
    // Setter方法
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public void setAge(int age) {
        if (age > 0 && age < 150) {  // 年龄合理性检查
            this.age = age;
        } else {
            System.out.println("Invalid age: " + age);
        }
    }
    
    public void setMajor(String major) {
        this.major = major;
    }
    
    public void setGpa(double gpa) {
        if (gpa >= 0.0 && gpa <= 4.0) {  // GPA合理性检查
            this.gpa = gpa;
        } else {
            System.out.println("Invalid GPA: " + gpa + ". GPA should be between 0.0 and 4.0");
        }
    }
    
    // 业务方法
    public String getStudentInfo() {
        return "Student ID: " + studentId + 
               ", Name: " + name + 
               ", Age: " + age + 
               ", Major: " + major + 
               ", GPA: " + gpa;
    }
    
    public String getGradeLevel() {
        if (gpa >= 3.5) {
            return "Excellent";
        } else if (gpa >= 3.0) {
            return "Good";
        } else if (gpa >= 2.0) {
            return "Average";
        } else {
            return "Below Average";
        }
    }
    
    public boolean isHonorStudent() {
        return gpa >= 3.5;
    }
    
    public void study(int hours) {
        System.out.println(name + " is studying for " + hours + " hours.");
        if (hours > 5) {
            System.out.println("Great dedication to studies!");
        }
    }
    
    // 重写toString方法
    @Override
    public String toString() {
        return getStudentInfo();
    }
    
    // 重写equals方法
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        Student student = (Student) obj;
        return studentId.equals(student.studentId);
    }
    
    // 重写hashCode方法
    @Override
    public int hashCode() {
        return studentId.hashCode();
    }
}