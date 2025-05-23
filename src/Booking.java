public class Booking {
    private String transactionNumber; // CHAR(10), PRIMARY KEY
    private String guestEmailAddress; // VARCHAR(150), FOREIGN KEY
    private float cost; // DECIMAL(10,2)
    private String roomNumber; // CHAR(4), FOREIGN KEY
    private String hotelName; // VARCHAR(30), FOREIGN KEY
    private String hotelAddress; // VARCHAR(60), FOREIGN KEY

    /**
     * Constructs a Booking object with specified details.
     *
     * @param transactionNumber the unique transaction number for the booking
     * @param guestEmailAddress the name of the guest
     * @param cost the cost of the booking
     * @param roomNumber the number of the booked room
     * @param hotelName the name of the hotel
     * @param hotelAddress the address of the hotel
     */
    public Booking(String transactionNumber, String guestEmailAddress, float cost, String roomNumber, String hotelName, String hotelAddress) {
        this.transactionNumber = transactionNumber;
        this.guestEmailAddress = guestEmailAddress;
        this.cost = cost;
        this.roomNumber = roomNumber;
        this.hotelName = hotelName;
        this.hotelAddress = hotelAddress;
    }

    public String getTransactionNumber() {
        return transactionNumber;
    }

    public void setTransactionNumber(String transactionNumber) {
        this.transactionNumber = transactionNumber;
    }

    public String getGuestEmailAddress() {
        return guestEmailAddress;
    }

    public void setGuestEmailAddress(String guestEmailAddress) {
        this.guestEmailAddress = guestEmailAddress;
    }

    public float getCost() {
        return cost;
    }

    public void setCost(float cost) {
        this.cost = cost;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
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