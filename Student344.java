public class Student344 {
    // 学生属性
    private String name;
    private int age;
    private String studentId;
    private double gpa;
    
    // 构造函数
    public Student344(String name, int age, String studentId, double gpa) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.gpa = gpa;
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
        if (age > 0) {
            this.age = age;
        }
    }
    
    // 获取学生ID
    public String getStudentId() {
        return studentId;
    }
    
    // 设置学生ID
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }
    
    // 获取学生成绩GPA
    public double getGpa() {
        return gpa;
    }
    
    // 设置学生成绩GPA
    public void setGpa(double gpa) {
        if (gpa >= 0.0 && gpa <= 4.0) {
            this.gpa = gpa;
        }
    }
    
    // 显示学生信息
    public void displayInfo() {
        System.out.println("学生姓名: " + name);
        System.out.println("学生年龄: " + age);
        System.out.println("学生ID: " + studentId);
        System.out.println("学生成绩(GPA): " + gpa);
    }
    
    // 判断学生是否优秀(绩点3.5以上)
    public boolean isExcellent() {
        return gpa >= 3.5;
    }
    
    // 主方法，用于测试
    public static void main(String[] args) {
        // 创建一个学生对象
        Student344 student = new Student344("张三", 20, "20230001", 3.8);
        
        // 显示学生信息
        student.displayInfo();
        
        // 判断是否优秀
        if (student.isExcellent()) {
            System.out.println(student.getName() + "是一名优秀学生！");
        } else {
            System.out.println(student.getName() + "需要继续努力！");
        }
    }
}