public class TestStudent {
    public static void main(String[] args) {
        // 创建学生对象
        Student student1 = new Student("张三", 20, "2021001", "计算机科学", 3.8);
        Student student2 = new Student();

        // 设置第二个学生的信息
        student2.setName("李四");
        student2.setAge(19);
        student2.setStudentId("2021002");
        student2.setMajor("软件工程");
        student2.setGpa(3.2);

        // 显示学生信息
        System.out.println("=== 学生1信息 ===");
        student1.displayInfo();
        System.out.println("是否优秀学生: " + student1.isExcellentStudent());
        System.out.println("等级: " + student1.getGradeLevel());
        student1.study(6);

        System.out.println("\n=== 学生2信息 ===");
        student2.displayInfo();
        System.out.println("是否优秀学生: " + student2.isExcellentStudent());
        System.out.println("等级: " + student2.getGradeLevel());
        student2.study(3);

        System.out.println("\n=== 学生对象字符串表示 ===");
        System.out.println(student1.toString());
        System.out.println(student2.toString());
    }
}