public class Assistance {
    private String staffName; // VARCHAR(30), part of PRIMARY KEY, FOREIGN KEY
    private String staffEmailAddress; // VARCHAR(150), part of PRIMARY KEY, FOREIGN KEY
    private String guestName; // VARCHAR(30), part of PRIMARY KEY, FOREIGN KEY
    private String guestEmailAddress; // VARCHAR(150), part of PRIMARY KEY, FOREIGN KEY

    /**
     * Constructs an Assistance object with specified staff and guest that was assisted.
     *
     * @param staffName the name of the staff member providing assistance
     * @param staffEmailAddress the email address of the staff member
     * @param guestName the name of the guest receiving assistance
     * @param guestEmailAddress the email address of the guest
     */
    public Assistance(String staffName, String staffEmailAddress, String guestName, String guestEmailAddress) {
        this.staffName = staffName;
        this.staffEmailAddress = staffEmailAddress;
        this.guestName = guestName;
        this.guestEmailAddress = guestEmailAddress;
    }

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public String getStaffEmailAddress() {
        return staffEmailAddress;
    }

    public void setStaffEmailAddress(String staffEmailAddress) {
        this.staffEmailAddress = staffEmailAddress;
    }

    public String getGuestName() {
        return guestName;
    }

    public void setGuestName(String guestName) {
        this.guestName = guestName;
    }

    public String getGuestEmailAddress() {
        return guestEmailAddress;
    }

    public void setGuestEmailAddress(String guestEmailAddress) {
        this.guestEmailAddress = guestEmailAddress;
    }
}
