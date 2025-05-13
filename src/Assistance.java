public class Assistance {
    private String staffEmailAddress; // VARCHAR(150), part of PRIMARY KEY, FOREIGN KEY
    private String staffPosition; // VARCHAR(30), part of PRIMARY KEY, FOREIGN KEY
    private String guestEmailAddress; // VARCHAR(150), part of PRIMARY KEY, FOREIGN KEY

    /**
     * Constructs an Assistance object with specified staff and guest that was assisted.
     *
     * @param staffEmailAddress the email address of the staff member
     * @param staffPosition the position of the staff member
     * @param guestEmailAddress the email address of the guest
     */
    public Assistance(String staffEmailAddress, String staffPosition, String guestEmailAddress) {
        this.staffEmailAddress = staffEmailAddress;
        this.staffPosition = staffPosition;
        this.guestEmailAddress = guestEmailAddress;
    }

    public String getStaffEmailAddress() {
        return staffEmailAddress;
    }

    public void setStaffEmailAddress(String staffEmailAddress) {
        this.staffEmailAddress = staffEmailAddress;
    }

    public String getGuestName() {
        return staffPosition;
    }

    public void setGuestName(String staffPosition) {
        this.staffPosition = staffPosition;
    }

    public String getGuestEmailAddress() {
        return guestEmailAddress;
    }

    public void setGuestEmailAddress(String guestEmailAddress) {
        this.guestEmailAddress = guestEmailAddress;
    }
}
