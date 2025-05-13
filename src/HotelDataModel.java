import java.math.BigDecimal;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;
import java.util.Scanner;

/**
 * This class provides methods to interact with the hotel database. Along with a few other classes,
 * this class constitutes the "model" of the application.
 */
public class HotelDataModel {

  /**
   * Check if a guest with that email already exists
   */
  public static boolean guestExists(Connection conn, String email) throws SQLException {
    String sql = "SELECT 1 FROM Guests WHERE emailAddress = ?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
      ps.setString(1, email);
      try (ResultSet rs = ps.executeQuery()) {
        return rs.next();
      }
    }
  }

  /**
   * Check if a staff/manager with that email exists
   */
  public static boolean staffExists(Connection conn, String email) throws SQLException {
    String sql = "SELECT 1 FROM Staff WHERE emailAddress = ?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
      ps.setString(1, email);
      try (ResultSet rs = ps.executeQuery()) {
        return rs.next();
      }
    }
  }

  /**
   * Retrieves all hotels from the database.
   *
   * @param connection the database connection
   * @return a list of hotels
   * @throws SQLException if a database access error occurs
   */
  public static List<Hotel> getAllHotels(Connection connection) throws SQLException {
    List<Hotel> hotelList = new LinkedList<Hotel>();

    String sql = "SELECT name, address FROM Hotel";
    PreparedStatement pstmt = connection.prepareStatement(sql);
    ResultSet resultSet = pstmt.executeQuery();
    while (resultSet.next()) {
      hotelList.add(new Hotel(resultSet.getString("name"), resultSet.getString("address"),
          null, 0));
    }
    return hotelList;
  }

  public static List<Hotel> getHotelEntity(Connection connection) throws SQLException {
    List<Hotel> hotelList = new LinkedList<Hotel>();

    String sql = "SELECT * FROM Hotel";
    PreparedStatement pstmt = connection.prepareStatement(sql);
    ResultSet resultSet = pstmt.executeQuery();
    while (resultSet.next()) {
      hotelList.add(new Hotel(resultSet.getString("name"), resultSet.getString("address"),
          resultSet.getString("phoneNumber"), resultSet.getFloat("rating")));
    }
    return hotelList;
  }

  public static List<Staff> getStaffEntity(Connection connection) throws SQLException {
    List<Staff> staffList = new LinkedList<Staff>();

    String sql = "SELECT * FROM Staff";
    PreparedStatement pstmt = connection.prepareStatement(sql);
    ResultSet resultSet = pstmt.executeQuery();
    while (resultSet.next()) {
      staffList.add(new Staff(resultSet.getString("name"), resultSet.getString("emailAddress"),
          resultSet.getString("position"), resultSet.getFloat("salary"), resultSet.getString("hotelName"), resultSet.getString("hotelAddress")));
    }
    return staffList;
  }

  public static List<Guests> getGuestsEntity(Connection connection) throws SQLException {
    List<Guests> guestList = new LinkedList<Guests>();

    String sql = "SELECT * FROM Guests";
    PreparedStatement pstmt = connection.prepareStatement(sql);
    ResultSet resultSet = pstmt.executeQuery();
    while (resultSet.next()) {
      guestList.add(new Guests(resultSet.getString("name"), resultSet.getString("emailAddress"),
          resultSet.getString("phoneNumber"), resultSet.getInt("partySize")));
    }
    return guestList;
  }

  public static List<Rooms> getRoomsEntity(Connection connection) throws SQLException {
    List<Rooms> rooms = new LinkedList<Rooms>();

    String sql = "SELECT * FROM Rooms";
    PreparedStatement pstmt = connection.prepareStatement(sql);
    ResultSet resultSet = pstmt.executeQuery();
    while (resultSet.next()) {
      rooms.add(new Rooms(resultSet.getString("roomNumber"), resultSet.getString("roomType"),
          resultSet.getBoolean("availabilty"), resultSet.getInt("roomCapacity"), resultSet.getString("hotelName"), resultSet.getString("hotelAddress")));
    }
    return rooms;
  }

  public static List<Booking> getBookingEntity(Connection connection) throws SQLException {
    List<Booking> booking = new LinkedList<Booking>();

    String sql = "SELECT * FROM Booking";
    PreparedStatement pstmt = connection.prepareStatement(sql);
    ResultSet resultSet = pstmt.executeQuery();
    while (resultSet.next()) {
      booking.add(new Booking(resultSet.getString("transactionNumber"), resultSet.getString("guestEmailAddress"),
          resultSet.getFloat("cost"), resultSet.getString("roomNumber"), resultSet.getString("hotelName"), resultSet.getString("hotelAddress")));
    }
    return booking;
  }

  public static List<Services> getServicesEntity(Connection connection) throws SQLException {
    List<Booking> services = new LinkedList<Services>();

    String sql = "SELECT * FROM Services";
    PreparedStatement pstmt = connection.prepareStatement(sql);
    ResultSet resultSet = pstmt.executeQuery();
    while (resultSet.next()) {
      services.add(new Services(resultSet.getString("title"), resultSet.getString("description"),
          resultSet.getFloat("cost"), resultSet.getString("hotelName"), resultSet.getString("hotelAddress")));
    }
    return services;
  }

  public static List<Events> getEventsEntity(Connection connection) throws SQLException {
    List<Events> events = new LinkedList<Events>();

    String sql = "SELECT * FROM Events";
    PreparedStatement pstmt = connection.prepareStatement(sql);
    ResultSet resultSet = pstmt.executeQuery();
    while (resultSet.next()) {
      events.add(new Events(resultSet.getString("name"), resultSet.getString("type"),
          resultSet.getLocalDateTime("time"), resultSet.getString("hotelName"), resultSet.getString("hotelAddress")));
    }
    return events;
  }

  public static List<Assistance> getAssistanceRelation(Connection connection) throws SQLException {
    List<Assistance> assistance = new LinkedList<Assistance>();

    String sql = "SELECT * FROM Assistance";
    PreparedStatement pstmt = connection.prepareStatement(sql);
    ResultSet resultSet = pstmt.executeQuery();
    while (resultSet.next()) {
      assistance.add(new Assistance(resultSet.getString("staffEmailAddress"), resultSet.getString("staffPosition"),
          resultSet.getString("guestEmailAddress")));
    }
    return assistance;
  }

  /**
   * 1. [Easy; Allen Garcia] List guests and their transaction numbers
   *
   * @param connection the database connection
   * @return a list of guests and their transaction numbers
   * @throws SQLException if a database access error occurs
   */
  public static List<HotelGuest> getHotelGuests(Connection connection) throws SQLException {
    List<HotelGuest> hotelGuestList = new LinkedList<HotelGuest>();

    String sql = "SELECT Booking.transactionNumber, Guests.name " +
            "FROM Booking INNER JOIN Guests " +
            "ON Booking.guestEmailAddress = Guests.emailAddress";
    PreparedStatement pstmt = connection.prepareStatement(sql);
    ResultSet resultSet = pstmt.executeQuery();
    while (resultSet.next()) {
      hotelGuestList.add(new HotelGuest(resultSet.getString("transactionNumber"), resultSet.getString("name"), 0));
    }
    return hotelGuestList;
  }

  /**
   * 2. [Medium; Allen Garcia] List guests with booking over $300
   *
   * @param connection the database connection
   * @return a list of guests with booking over $300
   * @throws SQLException if a database access error occurs
   */
  public static List<HotelGuest> getGuestBookings(Connection connection) throws SQLException {
    List<HotelGuest> guestBookingList = new LinkedList<HotelGuest>();

    String sql = "SELECT Guests.name, Booking.cost " +
            "FROM Guests INNER JOIN Booking " +
            "ON Guests.emailAddress = Booking.guestEmailAddress " +
            "WHERE cost > 300";
    PreparedStatement pstmt = connection.prepareStatement(sql);
    ResultSet resultSet = pstmt.executeQuery();
    while (resultSet.next()) {
      guestBookingList.add(new HotelGuest(resultSet.getString("name"), null, resultSet.getFloat("cost")));
    }
    return guestBookingList;
  }

  /**
   * 3. [Hard; Allen Garcia] Total profit of a hotel
   *
   * @param connection the database connection
   * @param hotelName name of hotel
   * @param hotelAddress address of the hotel
   * @return a list of hotel name and its total profit
   * @throws SQLException if a database access error occurs
   */
  public static List<Booking> getTotalProfit(Connection connection, String hotelName, String hotelAddress) throws SQLException {
    List<Booking> hotelProfitList = new LinkedList<Booking>();

    String sql = "SELECT hotelName, hotelAddress, SUM(cost) FROM Booking WHERE hotelName = '" + hotelName + "' AND hotelAddress = '" + hotelAddress + "'";
    PreparedStatement pstmt = connection.prepareStatement(sql);
    ResultSet resultSet = pstmt.executeQuery();
    while (resultSet.next()) {
      hotelProfitList.add(new Booking(null, null, resultSet.getFloat("SUM(cost)"), null,
              resultSet.getString("hotelName"), resultSet.getString("hotelAddress")));
    }
    return hotelProfitList;
  }
  /**
   * 4. [Easy; Ghufran Ali] Room types currently available
   *
   * @param connection the database connection
   * @return room types available
   * @throws SQLException if a database access error occurs
   */
  public static List<Rooms> getAvailableRoomTypes(Connection connection) throws SQLException {
    List<Rooms> roomTypes = new LinkedList<>();

    String sql = "SELECT DISTINCT roomType FROM Rooms WHERE availability = TRUE";
    PreparedStatement pstmt = connection.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();

    while (rs.next()) {
      roomTypes.add(new Rooms(null, rs.getString("roomType"), false, 0,
              null, null));
    }

    return roomTypes;
  }
  /**
   * 5. [Medium; Ghufran Ali] Average cost of bookings in each hotel
   *
   * @param connection the database connection
   * @return a list of hotel info and their avg booking cost
   * @throws SQLException if a database access error occurs
   */
  public static List<HotelStats> getAvgBookingCostPerHotel(Connection connection) throws SQLException {
    List<HotelStats> hotelStatsList = new LinkedList<>();

    String sql = "SELECT hotelName, hotelAddress, AVG(cost) AS avgCost FROM Booking GROUP BY hotelName, hotelAddress";
    PreparedStatement pstmt = connection.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();

    while (rs.next()) {
      hotelStatsList.add(new HotelStats(
              rs.getString("hotelName"),
              rs.getString("hotelAddress"),
              rs.getFloat("avgCost")
      ));
    }

    return hotelStatsList;
  }

  /**
   * 6. [Hard; Ghufran Ali] Guests who reserved a specific room
   *
   * @param connection the database connection
   * @param roomType room type
   * @return a list of guest under the roomType
   * @throws SQLException if a database access error occurs
   */
  public static List<HotelGuest> getDeluxeGuests(Connection connection, String roomType) throws SQLException {
    List<HotelGuest> guests = new LinkedList<>();

    String sql = "SELECT DISTINCT Guests.name, Guests.emailAddress " +
            "FROM Guests INNER JOIN Booking ON Guests.emailAddress = Booking.guestEmailAddress " +
            "INNER JOIN Rooms ON Booking.roomNumber = Rooms.roomNumber " +
            "WHERE roomType = '" + roomType + "'";

    PreparedStatement pstmt = connection.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();

    while (rs.next()) {
      guests.add(new HotelGuest(rs.getString("name"), rs.getString("emailAddress"), 0));
    }

    return guests;
  }

  /**
   * 7. [Easy; Oleksii Sudarin] Good Hotels rated above 3.0
   *
   * @param connection the database connection
   * @return a list of hotels with rating > 3.0
   * @throws SQLException if a database access error occurs
   */
  public static List<Hotel> getGoodHotels(Connection connection) throws SQLException {
    List<Hotel> hotelList = new LinkedList<Hotel>();

    String sql = "SELECT * FROM Hotel WHERE rating > 3.0";
    PreparedStatement pstmt = connection.prepareStatement(sql);
    ResultSet resultSet = pstmt.executeQuery();
    while (resultSet.next()) {
      hotelList.add(new Hotel(resultSet.getString("name"), resultSet.getString("address"),
              resultSet.getString("phoneNumber"), resultSet.getFloat("rating")));
    }
    return hotelList;
  }

  /**
   * 8. [Medium; Oleksii Sudarin] View all hotel events
   *
   * @param connection the database connection
   * @return a list of all hotel events
   * @throws SQLException if a database access error occurs
   */
  public static List<HotelEvent> getHotelEvents(Connection connection) throws SQLException {
    List<HotelEvent> hotelEventList = new LinkedList<HotelEvent>();

    String sql = "SELECT Hotel.name, Hotel.address, Events.name " +
            "FROM Hotel INNER JOIN Events " +
            "ON Hotel.name = Events.hotelName " +
            "AND " +
            "Hotel.address = Events.hotelAddress";
    PreparedStatement pstmt = connection.prepareStatement(sql);
    ResultSet resultSet = pstmt.executeQuery();
    while (resultSet.next()) {
      hotelEventList.add(new HotelEvent(resultSet.getString("name"), resultSet.getString("address"),
              resultSet.getString("name")));
    }
    return hotelEventList;
  }

  /**
   * 9. [Hard; Oleksii Sudarin] Room number of up to 2 types of rooms
   *
   * @param connection the database connection
   * @param hotelName hotel name
   * @param hotelAddress hotel Address
   * @param firstRoomType first room Type
   * @param secondRoomType optional second room Type
   * @return a list of room numbers under certain room Type
   * @throws SQLException if a database access error occurs
   */
  public static List<Rooms> getRoomTypeNumbers(Connection connection, String hotelName, String hotelAddress, String firstRoomType, String secondRoomType) throws SQLException {
    List<Rooms> rooms = new LinkedList<>();
    String sql =
            "SELECT roomNumber, roomType, roomCapacity " +
                    "FROM Rooms " +
                    "WHERE hotelName = ? AND hotelAddress = ? " +
                    "AND roomType IN (?, ?) AND availability = TRUE";
    try (PreparedStatement ps = connection.prepareStatement(sql)) {
      ps.setString(1, hotelName);
      ps.setString(2, hotelAddress);
      ps.setString(3, firstRoomType);
      ps.setString(4, secondRoomType);
      try (ResultSet rs = ps.executeQuery()) {
        while (rs.next()) {
          rooms.add(new Rooms(
                  rs.getString("roomNumber"),
                  rs.getString("roomType"),
                  false,
                  rs.getInt("roomCapacity"),
                  hotelName, hotelAddress
          ));
        }
      }
    }
    return rooms;
  }

  /**
   * 10. [Hardest; Oleksii Sudarin] Book a room
   *
   * @param connection the database connection
   * @param txnNo transaction number
   * @param guestEmail Guest email address
   * @param cost booking cost
   * @param roomNumber room number that is booked
   * @param hotelName hotel name
   * @param hotelAddress hotel address
   * @throws SQLException if a database access error occurs
   */
  public static void addBooking(Connection connection, String txnNo, String guestEmail, double cost, String roomNumber, String hotelName, String hotelAddress) throws SQLException {
    Scanner in = new Scanner(System.in);
    String guestName, guestPhone;
    int partySize;

    String lookup = "SELECT name, phoneNumber, partySize FROM Guests WHERE emailAddress = ?";
    try (PreparedStatement ps = connection.prepareStatement(lookup)) {
      ps.setString(1, guestEmail);
      try (ResultSet rs = ps.executeQuery()) {
        if (!rs.next()) {
          System.out.println("No guest found with email: " + guestEmail);

          System.out.print("Enter your name: ");
          guestName = in.nextLine().trim();

          String candidateEmail;
          do {
            System.out.print("Enter your email address: ");
            candidateEmail = in.nextLine().trim();
            if (guestExists(connection, candidateEmail)) {
              System.out.println("That email is already registered. Please use a different one.");
            } else {
              break;
            }
          } while (true);
          guestEmail = candidateEmail;

          System.out.print("Enter your phone number (10 digits): ");
          guestPhone = in.nextLine().trim();

          System.out.print("Enter party size: ");
          partySize = Integer.parseInt(in.nextLine().trim());
        } else {
          guestName  = rs.getString("name");
          guestPhone = rs.getString("phoneNumber");
          partySize  = rs.getInt("partySize");
        }
      }
    }

    try (CallableStatement cs =
                 connection.prepareCall("{CALL AddGuestBooking(?,?,?,?,?,?,?,?,?)}")) {
      cs.setString   (1, guestName);
      cs.setString   (2, guestEmail);
      cs.setString   (3, guestPhone);
      cs.setInt      (4, partySize);
      cs.setString   (5, txnNo);
      cs.setBigDecimal(6, BigDecimal.valueOf(cost));
      cs.setString   (7, roomNumber);
      cs.setString   (8, hotelName);
      cs.setString   (9, hotelAddress);
      cs.execute();
    }
  }

  public static String generateTransactionNumber(Connection conn) throws SQLException {
    String sql =
            "SELECT MAX(transactionNumber) FROM Booking";
    String maxTxn = null;
    try (PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {
      if (rs.next()) maxTxn = rs.getString(1);
    }
    int next = 1;
    if (maxTxn != null && maxTxn.startsWith("TXN")) {
      next = Integer.parseInt(maxTxn.substring(3)) + 1;
    }
    return String.format("TXN%07d", next);
  }

  public static boolean isRoomAvailable(Connection conn, String hotelName, String hotelAddress, String roomNumber) throws SQLException {
    String sql =
            "SELECT availability FROM Rooms " +
                    "WHERE hotelName = ? AND hotelAddress = ? AND roomNumber = ?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
      ps.setString(1, hotelName);
      ps.setString(2, hotelAddress);
      ps.setString(3, roomNumber);
      try (ResultSet rs = ps.executeQuery()) {
        if (!rs.next()) return false;               // doesn't exist
        return rs.getBoolean("availability");      // must be TRUE
      }
    }
  }
}
