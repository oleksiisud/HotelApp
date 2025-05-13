import java.time.LocalDateTime;

public class Events {
    private String name; // VARCHAR(30), part of PRIMARY KEY
    private String type; // VARCHAR(15)
    private LocalDateTime time; // DATETIME, part of PRIMARY KEY
    private String hotelName; // VARCHAR(30), FOREIGN KEY
    private String hotelAddress; // VARCHAR(60), FOREIGN KEY

    /**
     * Constructs an Event object with specified details.
     *
     * @param name the name of the event
     * @param type the type of the event
     * @param time the date and time of the event
     * @param hotelName the name of the hotel hosting the event
     * @param hotelAddress the address of the hotel hosting the event
     */
    public Events(String name, String type, LocalDateTime time, String hotelName, String hotelAddress) {
        this.name = name;
        this.type = type;
        this.time = time;
        this.hotelName = hotelName;
        this.hotelAddress = hotelAddress;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
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