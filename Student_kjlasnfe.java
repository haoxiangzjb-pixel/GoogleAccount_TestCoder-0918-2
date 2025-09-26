public class Student_kjlasnfe {
    // Private member variables to store student information
    private String name;
    private int age;
    private String studentId;

    // Constructor to initialize the student object
    public Student_kjlasnfe(String name, int age, String studentId) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
    }

    // Getter method for name
    public String getName() {
        return name;
    }

    // Setter method for name
    public void setName(String name) {
        this.name = name;
    }

    // Getter method for age
    public int getAge() {
        return age;
    }

    // Setter method for age
    public void setAge(int age) {
        if (age > 0) { // Basic validation
            this.age = age;
        }
    }

    // Getter method for studentId
    public String getStudentId() {
        return studentId;
    }

    // Setter method for studentId
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    // A method to display student information
    public void displayInfo() {
        System.out.println("Student Name: " + this.name);
        System.out.println("Student Age: " + this.age);
        System.out.println("Student ID: " + this.studentId);
    }

    // Main method to test the Student class
    public static void main(String[] args) {
        // Create a new student object
        Student_kjlasnfe student1 = new Student_kjlasnfe("Alice", 20, "S001");

        // Display the student's information
        student1.displayInfo();

        // Modify the student's age using the setter
        student1.setAge(21);

        // Display the updated information
        System.out.println("\nAfter updating age:");
        student1.displayInfo();
    }
}