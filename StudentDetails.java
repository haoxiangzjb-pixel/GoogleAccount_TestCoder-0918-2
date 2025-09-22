import java.util.ArrayList;
import java.util.List;

public class StudentDetails {
    // 学生的基本信息
    private String name;
    private int id;
    private int age;
    private String major;
    private List<Double> grades;
    
    // 构造函数
    public StudentDetails(String name, int id, int age, String major) {
        this.name = name;
        this.id = id;
        this.age = age;
        this.major = major;
        this.grades = new ArrayList<>();
    }
    
    // 获取学生姓名
    public String getName() {
        return name;
    }
    
    // 设置学生姓名
    public void setName(String name) {
        this.name = name;
    }
    
    // 获取学生ID
    public int getId() {
        return id;
    }
    
    // 设置学生ID
    public void setId(int id) {
        this.id = id;
    }
    
    // 获取学生年龄
    public int getAge() {
        return age;
    }
    
    // 设置学生年龄
    public void setAge(int age) {
        this.age = age;
    }
    
    // 获取学生专业
    public String getMajor() {
        return major;
    }
    
    // 设置学生专业
    public void setMajor(String major) {
        this.major = major;
    }
    
    // 添加成绩
    public void addGrade(double grade) {
        if (grade >= 0.0 && grade <= 100.0) {
            grades.add(grade);
        } else {
            System.out.println("成绩必须在0到100之间");
        }
    }
    
    // 计算平均成绩
    public double calculateAverageGrade() {
        if (grades.isEmpty()) {
            return 0.0;
        }
        
        double sum = 0.0;
        for (double grade : grades) {
            sum += grade;
        }
        return sum / grades.size();
    }
    
    // 获取最高成绩
    public double getHighestGrade() {
        if (grades.isEmpty()) {
            return 0.0;
        }
        
        double highest = grades.get(0);
        for (double grade : grades) {
            if (grade > highest) {
                highest = grade;
            }
        }
        return highest;
    }
    
    // 获取最低成绩
    public double getLowestGrade() {
        if (grades.isEmpty()) {
            return 0.0;
        }
        
        double lowest = grades.get(0);
        for (double grade : grades) {
            if (grade < lowest) {
                lowest = grade;
            }
        }
        return lowest;
    }
    
    // 显示学生信息
    public void displayInfo() {
        System.out.println("学生姓名: " + name);
        System.out.println("学生ID: " + id);
        System.out.println("年龄: " + age);
        System.out.println("专业: " + major);
        System.out.println("平均成绩: " + String.format("%.2f", calculateAverageGrade()));
        System.out.println("最高成绩: " + getHighestGrade());
        System.out.println("最低成绩: " + getLowestGrade());
    }
    
    // 主方法，用于测试
    public static void main(String[] args) {
        // 创建一个学生对象
        StudentDetails student = new StudentDetails("张三", 2023001, 20, "计算机科学与技术");
        
        // 添加一些成绩
        student.addGrade(85.5);
        student.addGrade(92.0);
        student.addGrade(78.5);
        student.addGrade(88.0);
        
        // 显示学生信息
        student.displayInfo();
    }
}