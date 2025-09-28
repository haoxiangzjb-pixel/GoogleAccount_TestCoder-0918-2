import java.util.ArrayList;
import java.util.List;

public class StudentInfo {

    private String name;
    private int age;
    private String studentId;
    private List<Double> grades;

    // Constructor
    public StudentInfo(String name, int age, String studentId) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.grades = new ArrayList<>();
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

    public List<Double> getGrades() {
        return new ArrayList<>(grades); // Return a copy for encapsulation
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

    // Method to add a grade
    public void addGrade(double grade) {
        if (grade >= 0.0 && grade <= 100.0) { // Basic validation
            grades.add(grade);
        } else {
            System.out.println("Invalid grade. Grade must be between 0 and 100.");
        }
    }

    // Method to calculate average grade
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

    // Method to get student info as a string
    @Override
    public String toString() {
        return "StudentInfo{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", studentId='" + studentId + '\'' +
                ", averageGrade=" + calculateAverageGrade() +
                '}';
    }

    // Main method for testing
    public static void main(String[] args) {
        StudentInfo student = new StudentInfo("Alice Johnson", 20, "S123456");

        System.out.println(student); // Print initial info

        student.addGrade(85.5);
        student.addGrade(92.0);
        student.addGrade(78.5);

        System.out.println("After adding grades: " + student);
        System.out.println("Individual Grades: " + student.getGrades());
    }
}