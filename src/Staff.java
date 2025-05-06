public class Staff {
    private String name; // VARCHAR(30), PRIMARY KEY
    private String emailAddress; // VARCHAR(150), PRIMARY KEY
    private String position; // VARCHAR(100)
    private float salary; // DECIMAL(10,2)
    private String hotelName; // VARCHAR(30), FOREIGN KEY
    private String hotelAddress; // VARCHAR(100), FOREIGN KEY

    /**
     * Constructs a Staff object with specified details.
     *
     * @param name the name of the staff member
     * @param emailAddress the email address of the staff member
     * @param position the job position of the staff member
     * @param salary the salary of the staff member
     * @param hotelName the name of the hotel the staff is associated with
     * @param hotelAddress the address of the hotel the staff is associated with
     */
    public Staff(String name, String emailAddress, String position, float salary, String hotelName, String hotelAddress) {
        this.name = name;
        this.emailAddress = emailAddress;
        this.position = position;
        this.salary = salary;
        this.hotelName = hotelName;
        this.hotelAddress = hotelAddress;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public float getSalary() {
        return salary;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }

    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    public String getHotelAddress() {
        return hotelAddress;
    }

    public void setHotelAddress(String hotelAddress) {
        this.hotelAddress = hotelAddress;
    }
}