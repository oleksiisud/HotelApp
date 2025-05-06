public class HotelStats {
    private String name;
    private String address;
    private float avgBookingCost;

    public HotelStats(String name, String address, float avgBookingCost) {
        this.name = name;
        this.address = address;
        this.avgBookingCost = avgBookingCost;
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

    public float getAvgBookingCost() {
        return avgBookingCost;
    }

    public void setAvgBookingCost(float avgBookingCost) {
        this.avgBookingCost = avgBookingCost;
    }
}
