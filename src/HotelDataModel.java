import java.math.BigDecimal;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;

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
   * Retrieves all movies from the database. This is an example.
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

  /**
   * 1. [Easy; Allen Garcia] List guests and their transaction numbers
   *
   * @param connection the database connection
   * @return a list of guests and their transaction numbers
   * @throws SQLException if a database access error occurs
   */
  public static List<HotelGuest> getHotelGuests(Connection connection) throws SQLException {
    List<HotelGuest> hotelGuestList = new LinkedList<HotelGuest>();

    String sql = "SELECT Guests.name, Booking.transactionNumber " +
            "FROM Guests INNER JOIN Booking " +
            "ON Guests.name = Booking.guestName";
    PreparedStatement pstmt = connection.prepareStatement(sql);
    ResultSet resultSet = pstmt.executeQuery();
    while (resultSet.next()) {
      hotelGuestList.add(new HotelGuest(resultSet.getString("name"), resultSet.getString("transactionNumber")));
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
  public static List<Booking> getGuestBookings(Connection connection) throws SQLException {
    List<Booking> guestBookingList = new LinkedList<Booking>();

    String sql = "SELECT guestName, cost FROM Booking WHERE cost > 300";
    PreparedStatement pstmt = connection.prepareStatement(sql);
    ResultSet resultSet = pstmt.executeQuery();
    while (resultSet.next()) {
      guestBookingList.add(new Booking(null, resultSet.getString("guestName"), resultSet.getFloat("cost"),
              null, null, null));
    }
    return guestBookingList;
  }

  /**
   * 3. [Hard; Allen Garcia] Total profit of a hotel
   *
   * @param connection the database connection
   * @param hotelName name of hotel
   * @return a list of hotel name and its total profit
   * @throws SQLException if a database access error occurs
   */
  public static List<Booking> getTotalProfit(Connection connection, String hotelName) throws SQLException {
    List<Booking> hotelProfitList = new LinkedList<Booking>();

    String sql = "SELECT hotelName, SUM(cost) FROM Booking WHERE hotelName = '" + hotelName + "'";
    PreparedStatement pstmt = connection.prepareStatement(sql);
    ResultSet resultSet = pstmt.executeQuery();
    while (resultSet.next()) {
      hotelProfitList.add(new Booking(null, null, resultSet.getFloat("SUM(cost)"), null,
              resultSet.getString("hotelName"), null));
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
  public static List<Room> getAvailableRoomTypes(Connection connection) throws SQLException {
    List<Room> roomTypes = new LinkedList<>();

    String sql = "SELECT DISTINCT roomType FROM Rooms WHERE availability = TRUE";
    PreparedStatement pstmt = connection.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();

    while (rs.next()) {
      roomTypes.add(new Room(null, rs.getString("roomType"), false, 0,
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
  public static List<Guest> getDeluxeGuests(Connection connection, String roomType) throws SQLException {
    List<Guest> guests = new LinkedList<>();

    String sql = "SELECT DISTINCT Guests.name, Guests.emailAddress " +
            "FROM Guests INNER JOIN Rooms ON Guests.roomNumber = Rooms.roomNumber " +
            "WHERE roomType = '" + roomType + "'";

    PreparedStatement pstmt = connection.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();

    while (rs.next()) {
      guests.add(new Guest(rs.getString("name"), rs.getString("emailAddress"), null, 0,
              null, null, null));
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
  public static List<Room> getRoomTypeNumbers(Connection connection,
                                                   String hotelName, String hotelAddress, String firstRoomType, String secondRoomType) throws SQLException {
    List<Room> rooms = new LinkedList<>();
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
          rooms.add(new Room(
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

    String lookup = "SELECT name, phoneNumber, partySize FROM Guests WHERE emailAddress = ?";
    String guestName, guestPhone;
    int partySize;
    try (PreparedStatement ps = connection.prepareStatement(lookup)) {
      ps.setString(1, guestEmail);
      try (ResultSet rs = ps.executeQuery()) {
        if (!rs.next()) {
          throw new SQLException("No guest found with email: " + guestEmail);
        }
        guestName  = rs.getString("name");
        guestPhone = rs.getString("phoneNumber");
        partySize  = rs.getInt("partySize");
      }
    }

    try (CallableStatement cs = connection.prepareCall("{ CALL AddGuestBooking(?,?,?,?,?,?,?,?,?) }")) {
      cs.setString(1, guestName);
      cs.setString(2, guestEmail);
      cs.setString(3, guestPhone);
      cs.setInt   (4, partySize);
      cs.setString(5, txnNo);
      cs.setBigDecimal(6, BigDecimal.valueOf(cost));
      cs.setString(7, roomNumber);
      cs.setString(8, hotelName);
      cs.setString(9, hotelAddress);

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

  /*


   * Retrieves a customer from the database by their ID.
   *
   * @param connection the database connection
   * @param customerId the ID of the customer to retrieve
   * @return the customer object if found, otherwise null
   * @throws SQLException if a database access error occurs

  public static Customer getCustomerById(Connection connection, String customerId)
      throws SQLException {
    String sql = "SELECT * FROM P1Customer WHERE id = ?";
    try (PreparedStatement stmt = connection.prepareStatement(sql)) {
      stmt.setString(1, customerId);
      try (ResultSet rs = stmt.executeQuery()) {
        if (rs.next()) {
          return new Customer(rs.getString("id"),
              rs.getString("name"),
              rs.getInt("addressID"),
              rs.getString("homephone"),
              rs.getString("cellphone"),
              rs.getString("primaryemail"),
              rs.getString("secondemail"));
        }
      }
    }
    return null;
  }

   * Retrieves all studios from the database.
   *
   * @param connection the database connection
   * @return a list of studios
   * @throws SQLException if a database access error occurs

  public static List<Studio> getAllStudios(Connection connection) throws SQLException {
    List<Studio> studioList = new LinkedList<Studio>();

    String sql = "SELECT * FROM P1Studio";
    PreparedStatement pstmt = connection.prepareStatement(sql);
    ResultSet resultSet = pstmt.executeQuery();
    while (resultSet.next()) {
      studioList.add(new Studio(resultSet.getString("name"), resultSet.getString("addressID"),
          resultSet.getString("prescnum")));
    }
    return studioList;
  }


   * Retrieves all studios from the database whose name starts with 'Amblin'.
   *
   * @param connection the database connection
   * @return a list of studios
   * @throws SQLException if a database access error occurs

  public static List<Studio> getAmblinStudios(Connection connection) throws SQLException {
    List<Studio> studioList = new LinkedList<Studio>();

    String sql = "SELECT * FROM P1Studio WHERE name LIKE 'Amblin%'";
    PreparedStatement pstmt = connection.prepareStatement(sql);
    ResultSet resultSet = pstmt.executeQuery();
    while (resultSet.next()) {
      studioList.add(new Studio(resultSet.getString("name"), resultSet.getString("addressID"),
          resultSet.getString("prescnum")));
    }
    return studioList;
  }


   * Retrieves all movie items from the database.
   *
   * @param connection the database connection
   * @return a list of movie items
   * @throws SQLException if a database access error occurs

  public static List<HotelItem> getAllHotelItems(Connection connection) throws SQLException {
    List<HotelItem> movieItemList = new LinkedList<HotelItem>();

    String sql = "SELECT * FROM P1Item";
    PreparedStatement pstmt = connection.prepareStatement(sql);
    ResultSet resultSet = pstmt.executeQuery();
    while (resultSet.next()) {
      movieItemList
          .add(new MovieItem(resultSet.getInt("itemnum"), resultSet.getString("movietitle"),
              resultSet.getInt("movieyear"), resultSet.getString("mediatype"),
              resultSet.getInt("qty"), resultSet.getBigDecimal("price")));
    }
    return movieItemList;
  }



   * Retrieves summaries of customer transactions from the database. The summary of a transaction
   * does not contain item level details.
   *
   * @param connection the database connection
   * @param storeNo the store number
   * @param customerId the customer ID
   * @return a list of customer transactions
   * @throws SQLException if a database access error occurs

  public static List<CustomerTransaction> getCustomerTransactions(Connection connection,
      String storeNo, String customerId) throws SQLException {
    List<CustomerTransaction> transactions = new LinkedList<>();
    String query = "SELECT " + "t.transno,t.transdate,t.transtime,t.price,"
        + "t.tax1rate,t.tax2rate,t.tax3rate,t.tax4rate,"
        + "t.tax1,t.tax2,t.tax3,t.tax4,t.total,c.name" + " "
        + "FROM P1Transaction AS t INNER JOIN P1Customer AS c ON t.custid = c.id "
        + "WHERE c.id = ?";
    try (PreparedStatement stmt = connection.prepareStatement(query)) {
      stmt.setString(1, customerId);

      try (ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
          String transactionNo = rs.getString("transno");
          String customerName = rs.getString("name");
          Date transactionDate = rs.getDate("transdate");
          Time transactionTime = rs.getTime("transtime");
          BigDecimal price = rs.getBigDecimal("price");
          BigDecimal taxRate1 = rs.getBigDecimal("tax1rate");
          BigDecimal taxRate2 = rs.getBigDecimal("tax2rate");
          BigDecimal taxRate3 = rs.getBigDecimal("tax3rate");
          BigDecimal taxRate4 = rs.getBigDecimal("tax4rate");
          BigDecimal tax1 = rs.getBigDecimal("tax1");
          BigDecimal tax2 = rs.getBigDecimal("tax2");
          BigDecimal tax3 = rs.getBigDecimal("tax3");
          BigDecimal tax4 = rs.getBigDecimal("tax4");
          BigDecimal total = rs.getBigDecimal(("total"));
          CustomerTransaction transaction = new CustomerTransaction(transactionNo, customerId,
              customerName, transactionDate, transactionTime, price, taxRate1, taxRate2, taxRate3,
              taxRate4, tax1, tax2, tax3, tax4, total);
          transactions.add(transaction);
        }
      }
    }
    return transactions;
  }


   * Retrieves the summary of a customer transaction by transaction number. he summary of a
   * transaction does not contain item level details.
   *
   * @param connection the database connection
   * @param storeNo the store number
   * @param customerId the customer ID
   * @param transactionNo the transaction number
   * @return the customer transaction
   * @throws SQLException if a database access error occurs

  public static CustomerTransaction getCustomerTransactionByTransactionNo(Connection connection,
      String storeNo, String customerId, String transactionNo) throws SQLException {
    CustomerTransaction transaction = null;
    String query = "SELECT " + "t.transno,t.transdate,t.transtime,t.price,"
        + "t.tax1rate,t.tax2rate,t.tax3rate,t.tax4rate,"
        + "t.tax1,t.tax2,t.tax3,t.tax4,t.total,c.name" + " "
        + "FROM P1Transaction AS t INNER JOIN P1Customer AS c ON custid = ?" + " "
        + "WHERE transno = ?";
    try (PreparedStatement stmt = connection.prepareStatement(query)) {
      stmt.setString(1, customerId);
      stmt.setString(2, transactionNo);

      try (ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
          if (transaction != null) {
            throw new SQLException("Multiple transactions found for transaction number.");
          }
          String customerName = rs.getString("name");
          Date transactionDate = rs.getDate("transdate");
          Time transactionTime = rs.getTime("transtime");
          BigDecimal price = rs.getBigDecimal("price");
          BigDecimal taxRate1 = rs.getBigDecimal("tax1rate");
          BigDecimal taxRate2 = rs.getBigDecimal("tax2rate");
          BigDecimal taxRate3 = rs.getBigDecimal("tax3rate");
          BigDecimal taxRate4 = rs.getBigDecimal("tax4rate");
          BigDecimal tax1 = rs.getBigDecimal("tax1");
          BigDecimal tax2 = rs.getBigDecimal("tax2");
          BigDecimal tax3 = rs.getBigDecimal("tax3");
          BigDecimal tax4 = rs.getBigDecimal("tax4");
          BigDecimal total = rs.getBigDecimal(("total"));
          transaction = new CustomerTransaction(transactionNo, customerId, customerName,
              transactionDate, transactionTime, price, taxRate1, taxRate2, taxRate3, taxRate4, tax1,
              tax2, tax3, tax4, total);
        }
      }
    }
    return transaction;
  }



   * Retrieves the invoice for a customer by transaction number.
   *
   * @param connection the database connection
   * @param storeNo the store number
   * @param customerId the customer ID
   * @param transactionNo the transaction number
   * @return the customer invoice
   * @throws SQLException if a database access error occurs

  public static Invoice getCustomerInvoiceByTransactionNo(Connection connection, String storeNo,
      String customerId, String transactionNo) throws SQLException {
    String query = "SELECT * "
        + "FROM P1Store AS s CROSS JOIN P1Transaction AS t "
        + "INNER JOIN P1TransactionDetail AS d ON t.transno = d.transno "
        + "INNER JOIN P1Customer AS c ON t.custid = c.id "
        + "INNER JOIN P1Item AS i on d.itemnum = i.itemnum "
        + "WHERE t.transno = ? AND custid = ?";

    Invoice invoice = new Invoice(storeNo, customerId, transactionNo);
    try (PreparedStatement stmt = connection.prepareStatement(query)) {
      stmt.setString(1, transactionNo);
      stmt.setString(2, customerId);
      Date transDate = null;
      Time transTime = null;
      BigDecimal tax1 = null;
      BigDecimal tax1Rate = null;
      BigDecimal tax2 = null;
      BigDecimal tax2Rate = null;
      BigDecimal tax3 = null;
      BigDecimal tax3Rate = null;
      BigDecimal tax4 = null;
      BigDecimal tax4Rate = null;
      BigDecimal total = null;
      String customerName = null;

      try (ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
          if (customerName == null) {
            customerName = rs.getString("name");
            invoice.setCustomerName(customerName);
          }
          if (transDate == null) {
            transDate = rs.getDate("transdate");
            invoice.setTransDate(transDate);
          }
          if (transTime == null) {
            transTime = rs.getTime("transtime");
            invoice.setTransTime(transTime);
          }
          if (tax1 == null) {
            tax1 = rs.getBigDecimal("tax1");
          }
          if (tax2 == null) {
            tax2 = rs.getBigDecimal("tax2");
          }
          if (tax3 == null) {
            tax3 = rs.getBigDecimal("tax3");
          }
          if (tax4 == null) {
            tax4 = rs.getBigDecimal("tax4");
          }
          if (tax1Rate == null) {
            tax1Rate = rs.getBigDecimal("tax1rate");
          }
          if (tax2Rate == null) {
            tax2Rate = rs.getBigDecimal("tax2rate");
          }
          if (tax3Rate == null) {
            tax3Rate = rs.getBigDecimal("tax3rate");
          }
          if (tax4Rate == null) {
            tax4Rate = rs.getBigDecimal("tax4rate");
          }
          invoice.setTax(tax1, tax1Rate, tax2, tax2Rate, tax3, tax3Rate, tax4, tax4Rate);
          if (total == null) {
            total = rs.getBigDecimal("total");
            invoice.setTotal(total);
          }

          InvoiceItem item = new InvoiceItem(rs.getInt("itemnum"), rs.getString("movietitle"),
              rs.getInt("movieyear"), rs.getString("mediatype"), rs.getBigDecimal("itemprice"),
              rs.getInt("d.qty"));
          invoice.addItem(item);
        }
      }
    }
    return invoice;
  }


   * Confirms an order by processing the shopping cart and updating the database.
   *
   * @param connection the database connection
   * @param storeNo the store number
   * @param customerId the customer ID
   * @param cart the shopping cart
   * @return the transaction number
   * @throws SQLException if a database access error occurs

  public static String confirmOrder(Connection connection, String storeNo, String customerId,
      ShoppingCart cart) throws SQLException {
    LocalDate transDate = LocalDate.now();
    String transNo = null;
    try {
      // 1. begin transaction
      connection.setAutoCommit(false);
      BigDecimal totalPrice = new BigDecimal(0);

      // 2. Reduce quantity in hand
      reduceQuantityInHand(connection, cart);

      // 3. Compute cart total
      totalPrice = computeCartTotal(cart);

      // 4. Add transaction summary
      // 4.1 Get a transaction number
      transNo = getNextTransactionNo(connection, storeNo);

      // 4.2 Update transaction number in store
      updateNextTransactionNo(connection, transNo, storeNo);

      // 4.3. Insert transaction record
      insertTransactionRecord(connection, transNo, customerId, cart, totalPrice, transDate);

      // 5. Insert transaction detail record for each item in cart
      insertTransactionDetailRecords(connection, transNo, transDate, cart);

      // 6. Commit transaction
      connection.commit();
    } catch (SQLException e) {
      connection.rollback();
      throw e;
    } finally {
      connection.setAutoCommit(true);
    }
    return transNo;
  }

  private static void reduceQuantityInHand(Connection connection, ShoppingCart cart)
      throws SQLException {
    // Reduce quantity in hand
    StringBuilder setClause = new StringBuilder(" SET qty = CASE itemnum ");
    StringBuilder whereClause = new StringBuilder(" WHERE itemnum IN (");
    boolean first = true;

    for (CartItem cartItem : cart) {
      if (!first) {
        whereClause.append(", '").append(cartItem.getItemNum()).append("'");
      } else {
        whereClause.append("'").append(cartItem.getItemNum()).append("'");
        first = false;
      }
      setClause.append("WHEN ").append(cartItem.getItemNum()).append(" THEN qty - ")
          .append(cartItem.getQtyToOrder()).append(" ");
    }

    setClause.append("END");
    whereClause.append(")");

    String updateItemSql = "UPDATE P1Item " + setClause.toString() + whereClause.toString();

    try (PreparedStatement stmt = connection.prepareStatement(updateItemSql)) {
      if (stmt.executeUpdate() == 0) {
        connection.rollback();
        throw new SQLException("Failed to update item quantities, suspect the cart is empty.");
      }
    }
  }

  private static BigDecimal computeCartTotal(ShoppingCart cart) {
    BigDecimal total = new BigDecimal(0);
    for (CartItem cartItem : cart) {
      total = total.add(cartItem.getLineTotal());
    }
    return total;
  }

  private static String getNextTransactionNo(Connection connection, String storeNo)
      throws SQLException {
    String getTransNoSql =
        "SELECT LPAD(CONVERT(transno, DECIMAL(9,0)) + 1, 9, '0') FROM P1Store WHERE storeno = ?";
    try (PreparedStatement stmt = connection.prepareStatement(getTransNoSql)) {
      stmt.setString(1, storeNo);
      try (ResultSet rs = stmt.executeQuery()) {
        if (!rs.next()) {
          throw new SQLException("Failed to get transaction number.");
        }
        return rs.getString(1);
      }
    }
  }

  private static void updateNextTransactionNo(Connection connection, String transNo, String storeNo)
      throws SQLException {
    String updateStoreSql = "UPDATE P1Store SET transno = ? WHERE storeno = ?";
    try (PreparedStatement stmt = connection.prepareStatement(updateStoreSql)) {
      stmt.setString(1, transNo);
      stmt.setString(2, storeNo);
      if (stmt.executeUpdate() == 0) {
        connection.rollback();
        throw new SQLException("Failed to update transaction number in Store.");
      }
    }
  }

  private static void insertTransactionRecord(Connection connection, String transNo,
      String customerId, ShoppingCart cart, BigDecimal totalPrice, LocalDate transDate)
      throws SQLException {
    String insertTransSql =
        "INSERT INTO P1Transaction (transno, custid, transdate, transtime, price, "
            + "tax1, tax2, tax3, tax4, tax1rate, tax2rate, tax3rate, tax4rate, total) " + "VALUES "
            + "(?, ?, ?, CURRENT_TIME, ?, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, ?)";

    try (PreparedStatement stmt = connection.prepareStatement(insertTransSql)) {
      stmt.setString(1, transNo);
      stmt.setString(2, customerId);
      stmt.setDate(3, Date.valueOf(transDate));
      stmt.setBigDecimal(4, totalPrice);
      stmt.setBigDecimal(5, totalPrice);
      if (stmt.executeUpdate() == 0) {
        connection.rollback();
        throw new SQLException("Failed to insert transaction record.");
      }
    }
  }

  private static void insertTransactionDetailRecords(Connection connection, String transNo,
      LocalDate transDate, ShoppingCart cart) throws SQLException {
    String insertDetailSql =
        "INSERT INTO P1TransactionDetail (transno, transdate, itemnum, itemprice, lineprice, qty) "
            + "VALUES (?, ?, ?, ?, ?, ?)";

    try (PreparedStatement stmt = connection.prepareStatement(insertDetailSql)) {
      for (CartItem cartItem : cart) {
        stmt.setString(1, transNo);
        stmt.setDate(2, Date.valueOf(transDate));
        stmt.setInt(3, cartItem.getItemNum());
        stmt.setBigDecimal(4, cartItem.getItemPrice());
        stmt.setBigDecimal(5, cartItem.getLineTotal());
        stmt.setInt(6, cartItem.getQtyToOrder());
        stmt.addBatch();
      }

      int[] updateCounts = stmt.executeBatch();
      for (int count : updateCounts) {
        if (count == 0) {
          connection.rollback();
          throw new SQLException("Failed to insert transaction detail.");
        }
      }
    }
  }

   */
}
