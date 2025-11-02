public class AcademicRecord {
    // 私有成员变量
    private String name;
    private int age;
    private String studentId;
    private double gpa;
    
    // 构造函数
    public AcademicRecord(String name, int age, String studentId, double gpa) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.gpa = gpa;
    }
    
    // 无参构造函数
    public AcademicRecord() {
        this.name = "";
        this.age = 0;
        this.studentId = "";
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
    
    public double getGpa() {
        return gpa;
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
    
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }
    
    public void setGpa(double gpa) {
        if (gpa >= 0.0 && gpa <= 4.0) {
            this.gpa = gpa;
        }
    }
    
    // 方法：显示学生信息
    public void displayInfo() {
        System.out.println("学生信息：");
        System.out.println("姓名：" + name);
        System.out.println("年龄：" + age);
        System.out.println("学号：" + studentId);
        System.out.println("GPA：" + gpa);
    }
    
    // 方法：判断学生是否优秀（GPA >= 3.5）
    public boolean isExcellent() {
        return gpa >= 3.5;
    }
    
    // 方法：更新GPA
    public void updateGpa(double newGpa) {
        if (newGpa >= 0.0 && newGpa <= 4.0) {
            this.gpa = newGpa;
            System.out.println("GPA已更新为：" + newGpa);
        } else {
            System.out.println("无效的GPA值！");
        }
    }
    
    // 重写toString方法
    @Override
    public String toString() {
        return "Student{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", studentId='" + studentId + '\'' +
                ", gpa=" + gpa +
                '}';
    }
    
    // 主方法用于测试
    public static void main(String[] args) {
        // 创建学生对象
        AcademicRecord student1 = new AcademicRecord("张三", 20, "2023001", 3.8);
        AcademicRecord student2 = new AcademicRecord();
        
        // 显示学生信息
        student1.displayInfo();
        System.out.println();
        
        // 测试isExcellent方法
        System.out.println("学生" + student1.getName() + "是否优秀：" + student1.isExcellent());
        
        // 更新GPA
        student1.updateGpa(3.9);
        
        // 使用toString方法
        System.out.println(student1.toString());
        
        // 设置学生2的信息
        student2.setName("李四");
        student2.setAge(19);
        student2.setStudentId("2023002");
        student2.setGpa(3.2);
        
        System.out.println("\n学生2信息：" + student2.toString());
        System.out.println("学生" + student2.getName() + "是否优秀：" + student2.isExcellent());
    }
}