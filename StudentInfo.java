public class StudentInfo {

    // Private member variables
    private String name;
    private int age;
    private String studentId;
    private double gpa;

    // Constructor
    public StudentInfo(String name, int age, String studentId, double gpa) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.gpa = gpa;
    }

    // Getter methods
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

    // Setter methods
    public void setName(String name) {
        this.name = name;
    }

    public void setAge(int age) {
        if (age > 0) { // Basic validation
            this.age = age;
        }
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public void setGpa(double gpa) {
        if (gpa >= 0.0 && gpa <= 4.0) { // Basic GPA validation
            this.gpa = gpa;
        }
    }

    // Method to display student information
    public void displayInfo() {
        System.out.println("Student Information:");
        System.out.println("Name: " + this.name);
        System.out.println("Age: " + this.age);
        System.out.println("Student ID: " + this.studentId);
        System.out.println("GPA: " + this.gpa);
    }

    // Main method for testing
    public static void main(String[] args) {
        StudentInfo student1 = new StudentInfo("Alice Johnson", 20, "S123456", 3.8);
        student1.displayInfo();

        System.out.println("\n--- Updating GPA ---");
        student1.setGpa(3.95);
        student1.displayInfo();
    }
}