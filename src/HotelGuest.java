public class HotelGuest {
    private String guestName; //VARCHAR(30), PRIMARY KEY
    private String guestTransactionNo; //VARCHAR(100), PRIMARY KEY

    /**
     * Constructs a Hotel object with specified details.
     *
     * @param guestName the name of the guest
     * @param guestTransactionNo transaction Number of the guest
     */

    public HotelGuest(String guestName, String guestTransactionNo) {
        this.guestName = guestName;
        this.guestTransactionNo = guestTransactionNo;
    }

    public String getGuestName() {
        return guestName;
    }

    public void setGuestName(String guestName) {
        this.guestName = guestName;
    }

    public String getGuestTransactionNo() {
        return guestTransactionNo;
    }

    public void setGuestTransactionNo(String guestTransactionNo) {
        this.guestTransactionNo = guestTransactionNo;
    }
}
