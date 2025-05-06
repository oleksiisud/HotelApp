public class Room {
    private String roomNumber; // CHAR(4), PRIMARY KEY
    private String roomType; // VARCHAR(100)
    private boolean availability; // BOOLEAN
    private int roomCapacity; // INTEGER
    private String hotelName; // VARCHAR(30), FOREIGN KEY
    private String hotelAddress; // VARCHAR(100), FOREIGN KEY

    /**
     * Constructs a Room object with specified details.
     *
     * @param roomNumber the room number
     * @param roomType the type of the room
     * @param availability whether the room is available
     * @param roomCapacity the capacity of the room
     * @param hotelName the name of the hotel the room belongs to
     * @param hotelAddress the address of the hotel the room belongs to
     */
    public Room(String roomNumber, String roomType, boolean availability, int roomCapacity, String hotelName, String hotelAddress) {
        this.roomNumber = roomNumber;
        this.roomType = roomType;
        this.availability = availability;
        this.roomCapacity = roomCapacity;
        this.hotelName = hotelName;
        this.hotelAddress = hotelAddress;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public boolean isAvailable() {
        return availability;
    }

    public void setAvailability(boolean availability) {
        this.availability = availability;
    }

    public int getRoomCapacity() {
        return roomCapacity;
    }

    public void setRoomCapacity(int roomCapacity) {
        this.roomCapacity = roomCapacity;
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
