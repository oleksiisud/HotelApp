public class Hotel {
    private String name; //VARCHAR(30), PRIMARY KEY
    private String address; //VARCHAR(60), PRIMARY KEY
    private String phoneNumber; //CHAR(10)
    private float rating; //DECIMAL(2,1)

    /**
     * Constructs a Hotel object with specified details.
     *
     * @param name the name of the hotel
     * @param address the address of the hotel
     * @param phoneNumber the hotel phone number
     * @param rating the rating of the hotel
     */

    public Hotel(String name, String address, String phoneNumber, float rating) {
        this.name = name;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.rating = rating;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }
}
