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
  private static String hotelAddress;

  /**
   * Controls the main loop of the hotel application.
   *
   * @param connection the database connection
   * @param userId the customer ID
   * @throws SQLException if a database access error occurs
   */
  public static void controllerLoop(Connection connection, String userId)
      throws SQLException {
    logger.info("Starting the hotel application controller loop for User ID: " + userId);

    System.out.print(HotelView.titleScreen());
    int action = 0;
    /**
     * Guest menu
     */
    if (userId.charAt(0) == 'G') {
      do {
        System.out.print(HotelView.getGuestMenuText());
        action = Integer.parseInt(in.nextLine());
        switch (action) {
          case 1:
            showAvailableRoomTypes(connection);
            break;
          case 2:
            showAvgBookingCost(connection);
            break;
          case 3:
            listGoodHotels(connection);
            break;
          case 4:
            listHotelEvents(connection);
            break;
          case 5:
            hotelSelection(connection);
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
            while (!(anotherRoom.equals("y") || anotherRoom.equals("n")));
            listRoomTypeNumbers(connection, hotelName, hotelAddress, firstRoomType, secondRoomType);
            break;
          case 6:
            hotelSelection(connection);
            System.out.print("Room type (Standard, Single, Double, Deluxe): ");
            String roomType = in.nextLine().trim().toLowerCase();
            listRoomTypeNumbers(connection, hotelName, hotelAddress, roomType, "");
            System.out.print("Enter roomNumber to book: ");
            String chosen = in.nextLine().trim();
            while (!HotelDataModel.isRoomAvailable(connection, hotelName, hotelAddress, chosen)) {
              System.out.println("Invalid or unavailable room. Please choose one from the list above:");
              chosen = in.nextLine().trim();
            }
            String txn = HotelDataModel.generateTransactionNumber(connection);
            double cost;
            switch (roomType) {
              case "single":   cost = 80.00;  break;
              case "standard": cost = 100.00; break;
              case "double":   cost = 120.00; break;
              case "deluxe":   cost = 200.00; break;
              default:
                cost = 100.00;
            }
            System.out.printf("Booking a %s room will cost $%.2f. Confirm? (y/n): ", roomType, cost);
            if (!in.nextLine().trim().equalsIgnoreCase("y")) {
              System.out.println("Booking cancelled.");
              break;
            }
            HotelDataModel.addBooking(connection, txn, userId.substring(1), cost, chosen, hotelName, hotelAddress);
            HotelView.displayBookingConfirmation(txn);
            break;
          case 0:
            HotelView.sayGoodbye();
            break;
          default:
            HotelView.promptForInvalidChoice();
        }
      } while (action != 0);
      /**
       * Manager Menu
       */
    } else if (userId.charAt(0) == 'M') {
      do {
        System.out.print(HotelView.getManagerMenuText());
        action = Integer.parseInt(in.nextLine());
        switch (action) {
          case 1:
            int databaseAction = 0;
            do {
              System.out.print(HotelView.getDBMenuText());
              databaseAction = Integer.parseInt(in.nextLine());
              switch (databaseAction) {
                case 1:
                  listHotelEntity(connection);
                  break;
                case 2:
                  listStaffEntity(connection);
                  break;
                case 3:
                  listGuestsEntity(connection);
                  break;
                case 4:
                  listRoomsEntity(connection);
                  break;
                case 5:
                  listBookingEntity(connection);
                  break;
                case 6:
                  listServicesEntity(connection);
                  break;
                case 7:
                  listEventsEntity(connection);
                  break;
                case 8:
                  listAssistanceRelation(connection);
                  break;
                case 0:
                  break;
                default:
                  HotelView.promptForInvalidChoice();
              }
            } while (databaseAction != 0);
            break;
          case 2:
            listAllGuests(connection);
            break;
          case 3:
            listGuestBookings(connection);
            break;
          case 4:
            hotelSelection(connection);
            listTotalProfit(connection, hotelName, hotelAddress);
            break;
          case 5:
            showAvailableRoomTypes(connection);
            break;
          case 6:
            showAvgBookingCost(connection);
            break;
          case 7:
            System.out.println("Enter Room Type:\nStandard | Single | Double | Deluxe");
            roomType = in.nextLine().toLowerCase().trim();
            listDeluxeGuests(connection, roomType);
            break;
          case 8:
            hotelSelection(connection);
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
            while (!(anotherRoom.equals("y") || anotherRoom.equals("n")));
            listRoomTypeNumbers(connection, hotelName, hotelAddress, firstRoomType, secondRoomType);
            break;
          case 9:
            hotelSelection(connection);

            System.out.print("Enter staff name: ");
            String staffName = in.nextLine().trim();

            System.out.print("Enter staff email: ");
            String staffEmail = in.nextLine().trim();

            System.out.print("Enter guest email: ");
            String guestEmail = in.nextLine().trim();

            HotelDataModel.addAssistance(connection, staffName, staffEmail, guestEmail);

            System.out.printf("Assistance recorded for hotel: %s, staff: %s, guest: %s\n",
                    hotelName, staffName, guestEmail);
            break;
          case 0:
            HotelView.sayGoodbye();
            break;
          default:
            HotelView.promptForInvalidChoice();
        }
      } while (action != 0);
    }
  }

  private static void hotelSelection(Connection connection) throws SQLException {
    List<Hotel> hotels = HotelDataModel.getAllHotels(connection);
    HotelView.displayHotels(hotels);
    System.out.print("Enter the number of Hotel: ");
    int hotelNumber = Integer.parseInt(in.nextLine().trim());
    hotelName = hotels.get(hotelNumber-1).getName();
    hotelAddress = hotels.get(hotelNumber-1).getAddress();
  }

  private static void listAllGuests(Connection connection) throws SQLException {
    List<HotelGuest> hotelGuests = HotelDataModel.getHotelGuests(connection);
    HotelView.displayHotelGuests(hotelGuests);
  }

  private static void listGuestBookings(Connection connection) throws SQLException {
    List<HotelGuest> guestBookings = HotelDataModel.getGuestBookings(connection);
    HotelView.displayGuestBookings(guestBookings);
  }

  private static void listTotalProfit(Connection connection, String hotelName, String hotelAddress) throws SQLException {
    List<Booking> totalProfit = HotelDataModel.getTotalProfit(connection, hotelName, hotelAddress);
    HotelView.displayTotalProfit(totalProfit);
  }

  private static void showAvgBookingCost(Connection connection) throws SQLException {
    List<HotelStats> stats = HotelDataModel.getAvgBookingCostPerHotel(connection);
    HotelView.displayAvgBookingCost(stats);
  }

  private static void showAvailableRoomTypes(Connection connection) throws SQLException {
    List<Rooms> roomTypes = HotelDataModel.getAvailableRoomTypes(connection);
    HotelView.displayAvailableRoomTypes(roomTypes);
  }

  private static void listDeluxeGuests(Connection connection, String roomType) throws SQLException {
    roomType = (roomType.substring(0, 1).toUpperCase() + roomType.substring(1));
    List<HotelGuest> guests = HotelDataModel.getDeluxeGuests(connection, roomType);
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

  private static void listRoomTypeNumbers(Connection connection, String hotelName, String hotelAddress, String firstRoomType, String secondRoomType) throws SQLException {
    List<Rooms> roomTypeNumbers = HotelDataModel.getRoomTypeNumbers(
            connection, hotelName, hotelAddress, firstRoomType, secondRoomType);
    HotelView.displayRoomTypeNumbers(roomTypeNumbers);
    if (roomTypeNumbers.isEmpty()) {
      System.out.println("No rooms available.");
    }
  }

  private static void listHotelEntity(Connection connection) throws SQLException {
    List<Hotel> hotels = HotelDataModel.getHotelEntity(connection);
    HotelView.displayHotelEntity(hotels);
  }

  private static void listStaffEntity(Connection connection) throws SQLException {
    List<Staff> staff = HotelDataModel.getStaffEntity(connection);
    HotelView.displayStaffEntity(staff);
  }

  private static void listGuestsEntity(Connection connection) throws SQLException {
    List<Guests> guests = HotelDataModel.getGuestsEntity(connection);
    HotelView.displayGuestsEntity(guests);
  }

  private static void listRoomsEntity(Connection connection) throws SQLException {
    List<Rooms> rooms = HotelDataModel.getRoomsEntity(connection);
    HotelView.displayRoomsEntity(rooms);
  }

  private static void listBookingEntity(Connection connection) throws SQLException {
    List<Booking> booking = HotelDataModel.getBookingEntity(connection);
    HotelView.displayBookingEntity(booking);
  }

  private static void listServicesEntity(Connection connection) throws SQLException {
    List<Services> services = HotelDataModel.getServicesEntity(connection);
    HotelView.displayServicesEntity(services);
  }

  private static void listEventsEntity(Connection connection) throws SQLException {
    List<Events> events = HotelDataModel.getEventsEntity(connection);
    HotelView.displayEventsEntity(events);
  }

  private static void listAssistanceRelation(Connection connection) throws SQLException {
    List<Assistance> assistance = HotelDataModel.getAssistanceRelation(connection);
    HotelView.displayAssistanceRelation(assistance);
  }
}
