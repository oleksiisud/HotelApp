public class Guests {
    private String name; // VARCHAR(30), PRIMARY KEY
    private String emailAddress; // VARCHAR(150), PRIMARY KEY
    private String phoneNumber; // CHAR(10)
    private int partySize; // INTEGER

    /**
     * Constructs a Guest object with specified details.
     *
     * @param name the name of the guest
     * @param emailAddress the email address of the guest
     * @param phoneNumber the guest's phone number
     * @param partySize the number of people in the guest's party
     */
    public Guests(String name, String emailAddress, String phoneNumber, int partySize) {
        this.name = name;
        this.emailAddress = emailAddress;
        this.phoneNumber = phoneNumber;
        this.partySize = partySize;
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
}