public class RandomStudentClass {
    // 私有成员变量
    private String name;
    private int age;
    private String studentId;
    private String major;
    private double gpa;

    // 无参构造函数
    public RandomStudentClass() {
        this.name = "";
        this.age = 0;
        this.studentId = "";
        this.major = "";
        this.gpa = 0.0;
    }

    // 有参构造函数
    public RandomStudentClass(String name, int age, String studentId, String major, double gpa) {
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
        if (age > 0) { // 确保年龄为正数
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
        if (gpa >= 0.0 && gpa <= 4.0) { // 确保GPA在合理范围内
            this.gpa = gpa;
        }
    }

    // 显示学生信息的方法
    public void displayInfo() {
        System.out.println("学生信息:");
        System.out.println("姓名: " + name);
        System.out.println("年龄: " + age);
        System.out.println("学号: " + studentId);
        System.out.println("专业: " + major);
        System.out.println("GPA: " + gpa);
    }

    // 计算学生等级的方法
    public String getGradeLevel() {
        if (gpa >= 3.7) {
            return "A+";
        } else if (gpa >= 3.3) {
            return "A";
        } else if (gpa >= 3.0) {
            return "B+";
        } else if (gpa >= 2.7) {
            return "B";
        } else if (gpa >= 2.3) {
            return "B-";
        } else if (gpa >= 2.0) {
            return "C+";
        } else if (gpa >= 1.7) {
            return "C";
        } else if (gpa >= 1.3) {
            return "C-";
        } else if (gpa >= 1.0) {
            return "D";
        } else {
            return "F";
        }
    }

    // 判断学生是否及格的方法
    public boolean isPassing() {
        return gpa >= 2.0;
    }

    // 更新GPA的方法
    public void updateGpa(double newGpa) {
        if (newGpa >= 0.0 && newGpa <= 4.0) {
            this.gpa = newGpa;
            System.out.println("GPA已更新为: " + newGpa);
        } else {
            System.out.println("无效的GPA值，请输入0.0到4.0之间的值。");
        }
    }

    // 重写toString方法
    @Override
    public String toString() {
        return "RandomStudentClass{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", studentId='" + studentId + '\'' +
                ", major='" + major + '\'' +
                ", gpa=" + gpa +
                '}';
    }

    // 重写equals方法
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        RandomStudentClass student = (RandomStudentClass) obj;
        return studentId.equals(student.studentId);
    }

    // 主方法用于测试
    public static void main(String[] args) {
        // 创建学生对象
        RandomStudentClass student1 = new RandomStudentClass("张三", 20, "2021001", "计算机科学", 3.8);
        RandomStudentClass student2 = new RandomStudentClass();

        // 显示学生信息
        student1.displayInfo();
        System.out.println("\n学生等级: " + student1.getGradeLevel());
        System.out.println("是否及格: " + student1.isPassing());

        // 设置第二个学生的信息
        student2.setName("李四");
        student2.setAge(19);
        student2.setStudentId("2021002");
        student2.setMajor("数学");
        student2.setGpa(3.2);

        System.out.println("\n" + student2.toString());
        System.out.println("学生等级: " + student2.getGradeLevel());
        System.out.println("是否及格: " + student2.isPassing());

        // 更新GPA
        student2.updateGpa(3.5);
        System.out.println("更新后的学生等级: " + student2.getGradeLevel());
    }
}