public class Service {
    private String title; // VARCHAR(10), PRIMARY KEY
    private String description; // TEXT
    private float cost; // DECIMAL(10,2)
    private String hotelName; // VARCHAR(30), FOREIGN KEY
    private String hotelAddress; // VARCHAR(100), FOREIGN KEY

    /**
     * Constructs a Service object with specified details.
     *
     * @param title the title of the service
     * @param description the description of the service
     * @param cost the cost of the service
     * @param hotelName the name of the hotel offering the service
     * @param hotelAddress the address of the hotel offering the service
     */
    public Service(String title, String description, float cost, String hotelName, String hotelAddress) {
        this.title = title;
        this.description = description;
        this.cost = cost;
        this.hotelName = hotelName;
        this.hotelAddress = hotelAddress;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getCost() {
        return cost;
    }

    public void setCost(float cost) {
        this.cost = cost;
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
