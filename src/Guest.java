public class Guest {
    private String name; // VARCHAR(30), PRIMARY KEY
    private String emailAddress; // VARCHAR(150), PRIMARY KEY
    private String phoneNumber; // CHAR(10)
    private int partySize; // INTEGER
    private String roomNumber; // CHAR(4), FOREIGN KEY
    private String hotelName; // VARCHAR(30), FOREIGN KEY
    private String hotelAddress; // VARCHAR(100), FOREIGN KEY

    /**
     * Constructs a Guest object with specified details.
     *
     * @param name the name of the guest
     * @param emailAddress the email address of the guest
     * @param phoneNumber the guest's phone number
     * @param partySize the number of people in the guest's party
     * @param roomNumber the room number assigned to the guest
     * @param hotelName the name of the hotel the guest is staying at
     * @param hotelAddress the address of the hotel the guest is staying at
     */
    public Guest(String name, String emailAddress, String phoneNumber, int partySize, String roomNumber, String hotelName, String hotelAddress) {
        this.name = name;
        this.emailAddress = emailAddress;
        this.phoneNumber = phoneNumber;
        this.partySize = partySize;
        this.roomNumber = roomNumber;
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

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public int getPartySize() {
        return partySize;
    }

    public void setPartySize(int partySize) {
        this.partySize = partySize;
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