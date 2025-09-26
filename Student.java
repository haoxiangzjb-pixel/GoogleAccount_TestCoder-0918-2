import java.util.ArrayList;
import java.util.List;

public class Student {

    // Private fields to store student information
    private String name;
    private int id;
    private List<Double> grades;

    // Constructor
    public Student(String name, int id) {
        this.name = name;
        this.id = id;
        this.grades = new ArrayList<>();
    }

    // Getter methods
    public String getName() {
        return name;
    }

    public int getId() {
        return id;
    }

    public List<Double> getGrades() {
        // Return a copy to prevent external modification of the internal list
        return new ArrayList<>(grades);
    }

    // Method to add a grade
    public void addGrade(double grade) {
        if (grade >= 0.0 && grade <= 100.0) {
            grades.add(grade);
        } else {
            System.out.println("Invalid grade. Grade must be between 0.0 and 100.0.");
        }
    }

    // Method to calculate average grade
    public double getAverageGrade() {
        if (grades.isEmpty()) {
            return 0.0; // Or throw an exception, depending on requirements
        }
        double sum = 0.0;
        for (double grade : grades) {
            sum += grade;
        }
        return sum / grades.size();
    }

    // Override toString for easy printing
    @Override
    public String toString() {
        return "Student{" +
                "name='" + name + '\'' +
                ", id=" + id +
                ", averageGrade=" + getAverageGrade() +
                ", grades=" + grades +
                '}';
    }

    // Main method for testing
    public static void main(String[] args) {
        Student student1 = new Student("Alice", 12345);
        student1.addGrade(85.5);
        student1.addGrade(92.0);
        student1.addGrade(78.5);

        System.out.println(student1);

        Student student2 = new Student("Bob", 54321);
        System.out.println("Student 2 (no grades): " + student2);
    }
}