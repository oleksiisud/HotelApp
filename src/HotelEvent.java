public class HotelEvent {
    private String hotelName; //VARCHAR(30), PRIMARY KEY
    private String address; //VARCHAR(100), PRIMARY KEY
    private String eventName; // VARCHAR(30), part of PRIMARY KEY

    /**
     * Constructs a Hotel object with specified details.
     *
     * @param hotelName the name of the hotel
     * @param address the address of the hotel
     * @param eventName the name of the event
     */

    public HotelEvent(String hotelName, String address, String eventName) {
        this.hotelName = hotelName;
        this.address = address;
        this.eventName = eventName;
    }

    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }
}


/*
public class Customer {
  private String id; // char(9), primary key
  private String name; // varchar(60)
  private int addressId; // int(11), foreign key
  private String homePhone; // char(10)
  private String cellPhone; // char(10)
  private String primaryEmail; // varchar(60)
  private String secondEmail; // varchar(60)


   * Constructs a Customer object with the specified details.
   *
   * @param id the unique identifier of the customer
   * @param name the name of the customer
   * @param addressId the address ID associated with the customer
   * @param homePhone the home phone number of the customer
   * @param cellPhone the cell phone number of the customer
   * @param primaryEmail the primary email address of the customer
   * @param secondEmail the secondary email address of the customer

public Customer(String id, String name, int addressId, String homePhone, String cellPhone,
                String primaryEmail, String secondEmail) {
    this.id = id;
    this.name = name;
    this.addressId = addressId;
    this.homePhone = homePhone;
    this.cellPhone = cellPhone;
    this.primaryEmail = primaryEmail;
    this.secondEmail = secondEmail;
}

public String getId() {
    return id;
}

public void setId(String id) {
    this.id = id;
}

public String getName() {
    return name;
}

public void setName(String name) {
    this.name = name;
}

public int getAddressId() {
    return addressId;
}

public void setAddressId(int addressId) {
    this.addressId = addressId;
}

public String getHomePhone() {
    return homePhone;
}

public void setHomePhone(String homePhone) {
    this.homePhone = homePhone;
}

public String getCellPhone() {
    return cellPhone;
}

public void setCellPhone(String cellPhone) {
    this.cellPhone = cellPhone;
}

public String getPrimaryEmail() {
    return primaryEmail;
}

public void setPrimaryEmail(String primaryEmail) {
    this.primaryEmail = primaryEmail;
}

public String getSecondEmail() {
    return secondEmail;
}

public void setSecondEmail(String secondEmail) {
    this.secondEmail = secondEmail;
}
}
 */
