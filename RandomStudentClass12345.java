public class RandomStudentClass12345 {
    // 私有属性
    private String name;
    private int age;
    private String studentId;
    private String major;
    private double gpa;

    // 构造函数
    public RandomStudentClass12345() {
        this.name = "";
        this.age = 0;
        this.studentId = "";
        this.major = "";
        this.gpa = 0.0;
    }

    public RandomStudentClass12345(String name, int age, String studentId, String major, double gpa) {
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
        if (age > 0) {
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
        if (gpa >= 0.0 && gpa <= 4.0) {
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

    // 判断学生是否为优秀学生的方法
    public boolean isExcellentStudent() {
        return gpa >= 3.5;
    }

    // 更新GPA的方法
    public void updateGpa(double newGpa) {
        if (newGpa >= 0.0 && newGpa <= 4.0) {
            this.gpa = newGpa;
            System.out.println("GPA已更新为: " + newGpa);
        } else {
            System.out.println("无效的GPA值，GPA应在0.0到4.0之间");
        }
    }

    // 比较年龄的方法
    public int compareAge(RandomStudentClass12345 otherStudent) {
        if (this.age > otherStudent.age) {
            return 1;
        } else if (this.age < otherStudent.age) {
            return -1;
        } else {
            return 0;
        }
    }

    // 重写toString方法
    @Override
    public String toString() {
        return "RandomStudentClass12345{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", studentId='" + studentId + '\'' +
                ", major='" + major + '\'' +
                ", gpa=" + gpa +
                '}';
    }

    // 主方法，用于测试
    public static void main(String[] args) {
        // 创建学生对象
        RandomStudentClass12345 student1 = new RandomStudentClass12345("张三", 20, "2021001", "计算机科学", 3.7);
        RandomStudentClass12345 student2 = new RandomStudentClass12345();

        // 显示学生信息
        student1.displayInfo();
        System.out.println();

        // 测试toString方法
        System.out.println(student1.toString());
        System.out.println();

        // 测试isExcellentStudent方法
        if (student1.isExcellentStudent()) {
            System.out.println(student1.getName() + " 是优秀学生");
        } else {
            System.out.println(student1.getName() + " 不是优秀学生");
        }
        System.out.println();

        // 测试updateGpa方法
        student1.updateGpa(3.9);
        System.out.println();

        // 设置第二个学生的信息
        student2.setName("李四");
        student2.setAge(19);
        student2.setStudentId("2021002");
        student2.setMajor("数学");
        student2.setGpa(3.2);

        // 比较年龄
        int ageComparison = student1.compareAge(student2);
        if (ageComparison > 0) {
            System.out.println(student1.getName() + " 比 " + student2.getName() + " 年龄大");
        } else if (ageComparison < 0) {
            System.out.println(student1.getName() + " 比 " + student2.getName() + " 年龄小");
        } else {
            System.out.println(student1.getName() + " 和 " + student2.getName() + " 年龄相同");
        }
    }
}