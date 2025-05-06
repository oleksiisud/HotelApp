import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;
import java.util.logging.Logger;

/**
 * The HotelController class handles the user interactions and controls the flow of the hotel
 * application.
 */
public class HotelController {
  private static final Logger logger = Logger.getLogger(HotelController.class.getName());
  private static final Scanner in = new Scanner(System.in);
  private static String roomType;
  private static String firstRoomType;
  private static String secondRoomType;
  private static String hotelName;

  /**
   * Controls the main loop of the hotel application.
   *
   * @param connection the database connection
   * @param userId the customer ID
   * @throws SQLException if a database access error occurs
   */
  public static void controllerLoop(Connection connection, String userId)
      throws SQLException {
    /*
    if (HotelDataModel.getCustomerById(connection, customerId) == null) {
      HotelView.displayInvalidCustomerMsg();
      return;
    }
    */
    logger.info("Starting the hotel application controller loop for User ID: " + userId);

    System.out.print(HotelView.titleScreen());
    int action = 0;
    do {
      System.out.print(HotelView.getMenuText());
      action = Integer.parseInt(in.nextLine());
      switch (action) {
        case 1:
          listAllGuests(connection);
          break;
        case 2:
          listGuestBookings(connection);
          break;
        case 3:
          System.out.println("Enter Hotel Name:\nGrand Plaza | Seaside Resort | Mountain Lodge | City Inn | Sunset Hotel");
          hotelName = in.nextLine().trim();
          listTotalProfit(connection, hotelName);
          break;
        case 4:
          showAvailableRoomTypes(connection);
          break;
        case 5:
          showAvgBookingCost(connection);
          break;
        case 6:
          System.out.println("Enter Room Type:\nStandard | Single | Double | Deluxe");
          roomType = in.nextLine().toLowerCase().trim();
          listDeluxeGuests(connection, roomType);
          break;
        case 7:
          listGoodHotels(connection);
          break;
        case 8:
          listHotelEvents(connection);
          break;
        case 9:
          System.out.println("Enter Room Type:\nStandard | Single | Double | Deluxe");
          firstRoomType = in.nextLine().toLowerCase().trim();
          String anotherRoom;
          do {
            System.out.println("Do you want to add another room type? (y or n)");
            anotherRoom = in.nextLine().toLowerCase().trim();
            if (anotherRoom.equals("y")) {
              System.out.println("Enter Room Type:\nStandard | Single | Double | Deluxe");
              secondRoomType = in.nextLine().toLowerCase().trim();
              break;
            } else if (anotherRoom.equals("n")) {
              secondRoomType = "";
              break;
            }
          }
          while (!(anotherRoom.equals("y") && !anotherRoom.equals("n")));
          listRoomTypeNumbers(connection, firstRoomType, secondRoomType);
          break;
        case 0:
          HotelView.sayGoodbye();
          break;
        default:
          HotelView.promptForInvalidChoice();
      }
    } while (action != 0);
  }

  private static void listAllHotels(Connection connection) throws SQLException {
    List<Hotel> hotels = HotelDataModel.getAllHotels(connection);
    HotelView.displayHotels(hotels);
  }

  private static void listAllGuests(Connection connection) throws SQLException {
    List<HotelGuest> hotelGuests = HotelDataModel.getHotelGuests(connection);
    HotelView.displayHotelGuests(hotelGuests);
  }

  private static void listGuestBookings(Connection connection) throws SQLException {
    List<Booking> guestBookings = HotelDataModel.getGuestBookings(connection);
    HotelView.displayGuestBookings(guestBookings);
  }

  private static void listTotalProfit(Connection connection, String hotelName) throws SQLException {
    List<Booking> totalProfit = HotelDataModel.getTotalProfit(connection, hotelName);
    HotelView.displayTotalProfit(totalProfit);
  }

  private static void showAvgBookingCost(Connection connection) throws SQLException {
    List<HotelStats> stats = HotelDataModel.getAvgBookingCostPerHotel(connection);
    HotelView.displayAvgBookingCost(stats);
  }

  private static void showAvailableRoomTypes(Connection connection) throws SQLException {
    List<Room> roomTypes = HotelDataModel.getAvailableRoomTypes(connection);
    HotelView.displayAvailableRoomTypes(roomTypes);
  }

  private static void listDeluxeGuests(Connection connection, String roomType) throws SQLException {
    roomType = (roomType.substring(0, 1).toUpperCase() + roomType.substring(1));
    List<Guest> guests = HotelDataModel.getDeluxeGuests(connection, roomType);
    HotelView.showDeluxeGuests(guests, roomType);
  }

  private static void listGoodHotels(Connection connection) throws SQLException {
    List<Hotel> hotels = HotelDataModel.getGoodHotels(connection);
    HotelView.displayGoodHotels(hotels);
  }

  private static void listHotelEvents(Connection connection) throws SQLException {
    List<HotelEvent> hotelEvents = HotelDataModel.getHotelEvents(connection);
    HotelView.displayHotelEvents(hotelEvents);
  }

  private static void listRoomTypeNumbers(Connection connection, String firstRoomType, String secondRoomType) throws SQLException {
    List<Room> roomTypeNumbers = HotelDataModel.getRoomTypeNumbers(connection,
            (firstRoomType.substring(0, 1).toUpperCase() + firstRoomType.substring(1)),
            (secondRoomType.length() > 0 ? (secondRoomType.substring(0, 1).toUpperCase() + secondRoomType.substring(1)) : ""));
    HotelView.displayRoomTypeNumbers(roomTypeNumbers);
  }
  /*
  private static void listAllStudios(Connection connection) throws SQLException {
    List<Studio> studios = MovieDataModel.getAllStudios(connection);
    MovieView.displayStudios(studios);
  }

  private static void listAmblinStudios(Connection connection) throws SQLException {
    List<Studio> studios = MovieDataModel.getAmblinStudios(connection);
    MovieView.displayStudios(studios);
  }

  private static void listCustomerTransactionSummary(Connection connection, String storeNo,
      String customerId) throws SQLException {
    List<CustomerTransaction> transactions =
        MovieDataModel.getCustomerTransactions(connection, storeNo, customerId);
    MovieView.displayTransactions(transactions);
  }

  private static void printCustomerInvoice(Connection connection, String storeNo, String customerId)
      throws SQLException {
    MovieView.promptForTransactionNo();
    String transactionNo = in.next();
    Invoice invoice = MovieDataModel.getCustomerInvoiceByTransactionNo(connection, storeNo,
        customerId, transactionNo);
    MovieView.displayCustomerInvoice(invoice);
  }

  private static void orderMovieMedia(Connection connection, String storeNo, String customerId)
      throws SQLException {
    ShoppingCart cart = new ShoppingCart();
    List<MovieItem> movieItems = MovieDataModel.getAllMovieItems(connection);
    while (true) {
      MovieView.displayItemOrderMenu(movieItems);
      int action = in.nextInt();
      if (action < 0) {
        MovieView.displayCancelMsg();
        break;
      }
      if (action == 0 && cart.isEmpty()) {
        MovieView.displayEmptyCartMsg();
        continue;
      }
      if (action == 0) {
        String transNo = MovieDataModel.confirmOrder(connection, storeNo, customerId, cart);
        MovieView.displayConfirmedMsg(transNo);
        break;
      }
      if (action > 0 && action <= movieItems.size()) {
        int row = action;
        MovieItem item = movieItems.get(row - 1);
        CartItem cartItem = new CartItem(item, 1);
        cart.addItem(cartItem);
        item.setQuantity(item.getQuantity() - 1);
      }
    }
  }
   */
}
