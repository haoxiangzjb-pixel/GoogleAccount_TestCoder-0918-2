public class Student {
    // 学生的基本信息
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
    
    // 默认构造函数
    public Student() {
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
    
    // 学生学习方法
    public void study(String subject) {
        System.out.println(name + " is studying " + subject);
    }
    
    // 学生参加考试方法
    public void takeExam(String subject) {
        System.out.println(name + " is taking exam in " + subject);
        // 模拟考试结果，随机生成一个分数
        double score = 60 + Math.random() * 40; // 分数在60-100之间
        System.out.printf("%s's score in %s: %.2f%n", name, subject, score);
    }
    
    // 学生自我介绍方法
    public void introduce() {
        System.out.println("Hello, I'm " + name + ", " + age + " years old.");
        System.out.println("My student ID is " + studentId + " and I major in " + major + ".");
        System.out.printf("My GPA is %.2f%n", gpa);
    }
    
    // 判断学生是否优秀（GPA > 3.5）
    public boolean isExcellent() {
        return gpa > 3.5;
    }
    
    // 重写toString方法
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
        // 创建学生对象
        Student student1 = new Student("Alice Johnson", 20, "S001", "Computer Science", 3.8);
        Student student2 = new Student("Bob Smith", 19, "S002", "Mathematics", 3.2);
        
        // 测试学生方法
        student1.introduce();
        System.out.println("Is " + student1.getName() + " excellent? " + student1.isExcellent());
        student1.study("Java Programming");
        student1.takeExam("Data Structures");
        
        System.out.println();
        
        student2.introduce();
        System.out.println("Is " + student2.getName() + " excellent? " + student2.isExcellent());
        student2.study("Calculus");
        student2.takeExam("Linear Algebra");
    }
}