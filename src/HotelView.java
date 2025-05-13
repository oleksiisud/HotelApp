import java.util.List;

/**
 * This class is a view class that provides methods to display various
 * movie-related information.
 */
public class HotelView {
  /**
   * Returns the menu text for the hotel application.
   *
   * @return the menu text as a String
   */
  public static String titleScreen() {
    return "\n" +
            "\n" +
            " ____  ____         _          __         _                        \n" +
            "|_   ||   _|       / |_       [  |       / \\                       \n" +
            "  | |__| |   .--. `| |-'.---.  | |      / _ \\    _ .--.   _ .--.   \n" +
            "  |  __  | / .'`\\ \\| | / /__\\\\ | |     / ___ \\  [ '/'`\\ \\[ '/'`\\ \\ \n" +
            " _| |  | |_| \\__. || |,| \\__., | |   _/ /   \\ \\_ | \\__/ | | \\__/ | \n" +
            "|____||____|'.__.' \\__/ '.__.'[___] |____| |____|| ;.__/  | ;.__/  \n" +
            "                                                [__|     [__|      \n" +
            "by Oleksii Sudarin, Allen Garcia, Ghufran Ali\n";
  }

  public static String getGuestMenuText() {
    return "\n\n\n"
        + "1. [Easy; Ghufran Ali] Room types currently available\n"
        + "2. [Medium; Ghufran Ali] Average cost of bookings in each hotel\n"
        + "3. [Easy; Oleksii Sudarin] Good Hotels rated above 3.0\n"
        + "4. [Medium; Oleksii Sudarin] View all hotel events\n"
        + "5. [Hard; Oleksii Sudarin] Room number of up to 2 types of rooms\n"
        + "6. [Hardest; Oleksii Sudarin] Book a room\n"
        + "0. Exit\n" + "Enter your choice: ";
  }
  public static String getManagerMenuText() {
    return "\n\n\n"
            + "1. [Easy; Allen Garcia] Database List\n"
            + "2. [Easy; Allen Garcia] List guests and their transaction numbers\n"
            + "3. [Medium; Allen Garcia] List guests with booking over $300\n"
            + "4. [Hard; Allen Garcia] Total profit of a hotel\n"
            + "5. [Easy; Ghufran Ali] Room types currently available\n"
            + "6. [Medium; Ghufran Ali] Average cost of bookings in each hotel\n"
            + "7. [Hard; Ghufran Ali] Guests who reserved a specific room\n"
            + "8. [Hard; Oleksii Sudarin] Room number of up to 2 types of rooms\n"
            + "9. [Hardest; ] Add assistance\n"
            + "0. Exit\n" + "Enter your choice: ";
  }
  public static String getDBMenuText() {
    return "\n\n\n"
            + "1. [Hotel]\n"
            + "2. [Staff]\n"
            + "3. [Guests]\n"
            + "4. [Rooms]\n"
            + "5. [Booking]\n"
            + "6. [Services]\n"
            + "7. [Events]\n"
            + "8. [Assistance]\n"
            + "0. Exit\n" + "Enter your choice: ";
  }

  public static void displayInvalidCustomerMsg() {
    System.out.printf("Invalid customer ID. Ensure the customer exists in the database.\n");
  }

  /**
   * Displays a list of hotels with their details. This is an example.
   *
   * @param hotels the list of hotels to display
   */
  public static void displayHotels(List<Hotel> hotels) {
    System.out.printf("%s\n", "-".repeat(92));
    System.out.printf("%-6s | %-20s | %-60s\n", "Number", "Name", "Address");
    System.out.printf("%s\n", "-".repeat(92));
    int i = 1;
    for (Hotel hotel : hotels) {
      System.out.printf("%-6s | %-20s | %-60s\n", i , hotel.getName(), hotel.getAddress());
      i++;
    }
    System.out.printf("%s\n", "-".repeat(92));
  }

  public static void displayHotelEntity(List<Hotel> hotels) {
    System.out.printf("%s\n", "-".repeat(110));
    System.out.printf("%-20s | %-60s | %-20s | %-6s\n", "Name", "Address", "Phone Number", "Rating");
    System.out.printf("%s\n", "-".repeat(110));
    for (Hotel hotel : hotels) {
      System.out.printf("%-20s | %-60s | %-20s | %-6s\n", hotel.getName(), hotel.getAddress(), hotel.getPhoneNumber(),
              hotel.getRating());
    }
    System.out.printf("%s\n", "-".repeat(110));
  }

  public static void displayStaffEntity(List<Staff> staffList) {
    System.out.printf("%s\n", "-".repeat(140));
    System.out.printf("%-20s | %-30s | %-15s | %-10s | %-20s | %-30s\n", "Name", "Email Address", "Position", "Salary", "Hotel Name", "Hotel Address");
    System.out.printf("%s\n", "-".repeat(140));
    for (Staff staff : staffList) {
      System.out.printf("%-20s | %-30s | %-15s | %-10s | %-20s | %-30s\n", staff.getName(), staff.getEmailAddress(),
              staff.getPosition(), staff.getSalary(), staff.getHotelName(), staff.getHotelAddress());
    }
    System.out.printf("%s\n", "-".repeat(140));
  }

  public static void displayGuestsEntity(List<Guests> guestList) {
    System.out.printf("%s\n", "-".repeat(110));
    System.out.printf("%-20s | %-40s | %-20s | %-10s\n", "Name", "Email Address", "Phone Number", "Party Size");
    System.out.printf("%s\n", "-".repeat(110));
    for (Guests guest : guestList) {
      System.out.printf("%-20s | %-40s | %-20s | %-10s\n", guest.getName(), guest.emailAddress(),
              guest.getPhoneNumber(), guest.getPartySize());
    }
    System.out.printf("%s\n", "-".repeat(110));
  }

  public static void displayRoomsEntity(List<Rooms> rooms) {
    System.out.printf("%s\n", "-".repeat(140));
    System.out.printf("%-15s | %-15s | %-15s | %-15s | %-25s | %-40s\n", "Room Number", "Room Type", "Room Availability", "Room Capacity", "Hotel Name", "Hotel Address");
    System.out.printf("%s\n", "-".repeat(140));
    for (Rooms room : rooms) {
      System.out.printf("%-15s | %-15s | %-15s | %-15s | %-25s | %-40s\n", room.getRoomNumber(), room.getRoomType(),
              room.getAvailability(), room.getRoomCapacity(), room.getHotelName(), room.getHotelAddress());
    }
    System.out.printf("%s\n", "-".repeat(140));
  }

  public static void displayBookingEntity(List<Booking> bookings) {
    System.out.printf("%s\n", "-".repeat(140));
    System.out.printf("%-20s | %-30s | %-10s | %-12s | %-25s | %-30s\n", "Transaction Number", "Guest Email Address", "Cost", "Room Number", "Hotel Name", "Hotel Address");
    System.out.printf("%s\n", "-".repeat(140));
    for (Booking booking : bookings) {
      System.out.printf("%-20s | %-30s | %-10s | %-12s | %-25s | %-30s\n", booking.getTransactionNumber(), booking.getGuestEmailAddress(),
              booking.getCost(), booking.getRoomNumber(), booking.getHotelName(), booking.getHotelAddress());
    }
    System.out.printf("%s\n", "-".repeat(140));
  }

  public static void displayServicesEntity(List<Services> services) {
    System.out.printf("%s\n", "-".repeat(130));
    System.out.printf("%-20s | %-50s | %-10s | %-20s | %-25s\n", "Title", "Description", "Cost", "Hotel Name", "Hotel Address");
    System.out.printf("%s\n", "-".repeat(130));
    for (Services service : services) {
      System.out.printf("%-20s | %-50s | %-10s | %-20s | %-25s\n", service.getTitle(), service.getDescription(),
              service.getCost(), service.getHotelName(), service.getHotelAddress());
    }
    System.out.printf("%s\n", "-".repeat(130));
  }

  public static void displayEventsEntity(List<Events events) {
    System.out.printf("%s\n", "-".repeat(130));
    System.out.printf("%-25s | %-20s | %-20s | %-30s | %-30s\n", "Name", "Type", "Time", "Hotel Name", "Hotel Address");
    System.out.printf("%s\n", "-".repeat(130));
    for (Events event : events) {
      System.out.printf("%-25s | %-20s | %-20s | %-30s | %-30s\n", event.getName(), event.getType(),
              event.getTime(), event.getHotelName(), event.getHotelAddress());
    }
    System.out.printf("%s\n", "-".repeat(130));
  }

  public static void displayAssistanceRelation(List<Assistance> assistanceList) {
    System.out.printf("%s\n", "-".repeat(110));
    System.out.printf("%-30s | %-30s | %-30s\n", "Staff Email Address", "Staff Position", "Guest Email Address");
    System.out.printf("%s\n", "-".repeat(110));
    for (Assistance assistance : assistanceList) {
      System.out.printf("%-30s | %-30s | %-30s\n", assistance.getStaffEmailAddress(), assistance.getStaffPosition(),
              assistance.getGuestEmailAddress());
    }
    System.out.printf("%s\n", "-".repeat(110));
  }

  /**
   * 1. [Easy; Allen Garcia] List guests and their transaction numbers
   *
   * @param hotelGuests list of guests with transactionNo
   */
  public static void displayHotelGuests(List<HotelGuest> hotelGuests) {
    System.out.printf("%s\n", "-".repeat(37));
    System.out.printf("%-20s | %-14s\n", "Guest", "Transaction No");
    System.out.printf("%s\n", "-".repeat(37));
    for (HotelGuest hotelGuest : hotelGuests) {
      System.out.printf("%-20s | %-14s\n", hotelGuest.getGuestName(), hotelGuest.getGuestTransactionNo());
    }
    System.out.printf("%s\n", "-".repeat(37));
  }

  /**
   * 2. [Medium; Allen Garcia] List guests with booking over $300
   *
   * @param guestBookings list of guests and their booking costs
   */
  public static void displayGuestBookings(List<HotelGuest> guestBookings) {
    System.out.printf("%s\n", "-".repeat(31));
    System.out.printf("%-20s | %-8s\n", "Name", "Cost");
    System.out.printf("%s\n", "-".repeat(31));
    for (HotelGuest booking : guestBookings) {
      System.out.printf("%-20s | $%-8.2f%n", booking.getGuestName(), booking.getBookingCost());
    }
    System.out.printf("%s\n", "-".repeat(31));
  }

  /**
   * 3. [Hard; Allen Garcia] Total profit of a hotel
   *
   * @param hotelProfitList list of hotels and their total costs
   */
  public static void displayTotalProfit(List<Booking> hotelProfitList) {
    System.out.printf("%s\n", "-".repeat(35));
    System.out.printf("%-20s | %-12s\n", "Name", "Total Profit");
    System.out.printf("%s\n", "-".repeat(35));
    for (Booking booking : hotelProfitList) {
      System.out.printf("%-20s | $%-12.2f%n", booking.getHotelName(), booking.getCost());
    }
    System.out.printf("%s\n", "-".repeat(35));
  }

  /**
   * 4. [Easy; Ghufran Ali] Room types currently available
   *
   * @param hotelStatsList list of hotel names and addresses and their avg booking cost
   */
  public static void displayAvgBookingCost(List<HotelStats> hotelStatsList) {
    System.out.printf("%n%s%n", "-".repeat(102));
    System.out.printf("%-20s | %-60s | %-16s%n", "Hotel", "Address", "Avg Booking Cost");
    System.out.printf("%n%s%n", "-".repeat(102));
    for (HotelStats stat : hotelStatsList) {
      System.out.printf("%-20s | %-60s | $%-16.2f%n",
              stat.getName(), stat.getAddress(), stat.getAvgBookingCost());
    }
    System.out.printf("%s%n", "-".repeat(102));
  }

  /**
   * 5. [Medium; Ghufran Ali] Average cost of bookings in each hotel
   *
   * @param roomTypes list of room types
   */
  public static void displayAvailableRoomTypes(List<Rooms> roomTypes) {
    System.out.printf("%n%s%n", "-".repeat(20));
    System.out.printf("%-20s%n", "Available Room Types");
    System.out.printf("%n%s%n", "-".repeat(20));
    for (Rooms room : roomTypes) {
      System.out.printf("%-20s%n", room.getRoomType());
    }
    System.out.printf("%s%n", "-".repeat(20));
  }

  /**
   * 6. [Hard; Ghufran Ali] Guests who reserved a specific room
   *
   * @param guests list of guest info
   * @param roomType room type of the guests
   */
  public static void showDeluxeGuests(List<HotelGuest> guests, String roomType) {
    System.out.printf("%s\n", "-".repeat(58));
    System.out.printf("%-25s | %-30s\n", roomType + " Room Guest Names", "Email Address");
    System.out.printf("%s\n", "-".repeat(58));
    for (HotelGuest guest : guests) {
      System.out.printf("%-25s | %-30s\n", guest.getGuestName(), guest.getGuestTransactionNo());
    }
    System.out.printf("%s\n", "-".repeat(58));
  }

  /**
   * 7. [Easy; Oleksii Sudarin] Good Hotels rated above 3.0
   *
   * @param hotels list of hotel info and rating
   */
  public static void displayGoodHotels(List<Hotel> hotels) {
    System.out.printf("%s\n", "-".repeat(92));
    System.out.printf("%-20s | %-60s | %-6s\n", "Name", "Address", "Rating");
    System.out.printf("%s\n", "-".repeat(92));
    for (Hotel hotel : hotels) {
      System.out.printf("%-20s | %-60s | %-6s\n", hotel.getName(), hotel.getAddress(),
              hotel.getRating());
    }
    System.out.printf("%s\n", "-".repeat(92));
  }

  /**
   * 8. [Medium; Oleksii Sudarin] View all hotel events
   *
   * @param hotelEvents list of hotel info and their events
   */
  public static void displayHotelEvents(List<HotelEvent> hotelEvents) {
    System.out.printf("%s\n", "-".repeat(101));
    System.out.printf("%-20s | %-60s | %-15s\n", "Hotel", "Address", "Event");
    System.out.printf("%s\n", "-".repeat(101));
    for (HotelEvent hotelEvent : hotelEvents) {
      System.out.printf("%-20s | %-60s | %-15s\n", hotelEvent.getHotelName(), hotelEvent.getAddress(),
              hotelEvent.getEventName());
    }
    System.out.printf("%s\n", "-".repeat(101));
  }

  /**
   * 9. [Hard; Oleksii Sudarin] Room number of up to 2 types of rooms
   *
   * @param rooms list of room number and the type
   */

  public static void displayRoomTypeNumbers(List<Rooms> rooms) {
    System.out.printf("%s\n", "-".repeat(39));
    System.out.printf("%-11s | %-9s | %-13s\n", "Room Number", "Room Type", "Room Capacity");
    System.out.printf("%s\n", "-".repeat(39));
    for (Rooms room : rooms) {
      System.out.printf("%-11s | %-9s | %-13s\n", room.getRoomNumber(), room.getRoomType(), room.getRoomCapacity());
    }
    System.out.printf("%s\n", "-".repeat(39));
  }

  public static void displayBookingConfirmation(String txnNo) {
    System.out.println("Booking successful! Transaction #: " + txnNo);
  }

  public static void displaySystemErrorMsg(Exception e) {
    System.err.println("System error. Call technical support! " + e.getMessage());
  }

  public static void displayLogErrorMsg(Exception e) {
    System.err.println("Error initializing log file: " + e.getMessage());
  }

  public static void sayGoodbye() {
    System.out.println("Goodbye!");
  }

  public static void promptForInvalidChoice() {
    System.out.println("Invalid choice. Please try again.");
  }
}
