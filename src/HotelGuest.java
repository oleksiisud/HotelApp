public class HotelGuest {
    private String guestName; //VARCHAR(30), PRIMARY KEY
    private String guestTransactionNo; //VARCHAR(100), PRIMARY KEY
    private float bookingCost;

    /**
     * Constructs a Hotel object with specified details.
     *
     * @param guestName the name of the guest
     * @param guestTransactionNo transaction Number of the guest
     * @param bookingCost cost of the booking
     */

    public HotelGuest(String guestName, String guestTransactionNo, float bookingCost) {
        this.guestName = guestName;
        this.guestTransactionNo = guestTransactionNo;
        this.bookingCost = bookingCost;
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

    public float getBookingCost() {
        return bookingCost;
    }

    public void setBookingCost(float bookingCost) {
        this.bookingCost = bookingCost;
    }
}
