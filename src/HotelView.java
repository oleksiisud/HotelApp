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

  public static String getMenuText() {
    return "1. [Easy; Allen Garcia] List guests and their transaction numbers\n"
        + "2. [Medium; Allen Garcia] List guests with booking over $300\n"
        + "3. [Hard; Allen Garcia] Total profit of a hotel\n"
        + "4. [Easy; Ghufran Ali] Room types currently available\n"
        + "5. [Medium; Ghufran Ali] Average cost of bookings in each hotel\n"
        + "6. [Hard; Ghufran Ali] Guests who reserved a specific room\n"
        + "7. [Easy; Oleksii Sudarin] Good Hotels rated above 3.0\n"
        + "8. [Medium; Oleksii Sudarin] View all hotel events\n"
        + "9. [Hard; Oleksii Sudarin] Room number of up to 2 types of rooms\n"
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
    System.out.printf("%s\n", "-".repeat(71));
    System.out.printf("%-20s | %-35s | %-10s | %-6s\n", "Name", "Address", "Phone Number", "Rating");
    for (Hotel hotel : hotels) {
      System.out.printf("%-20s | %-35s | %-10s | %-6s\n", hotel.getName(), hotel.getAddress(),
              hotel.getPhoneNumber(), hotel.getRating());
    }
    System.out.printf("%s\n", "-".repeat(71));
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
  public static void displayGuestBookings(List<Booking> guestBookings) {
    System.out.printf("%s\n", "-".repeat(31));
    System.out.printf("%-20s | %-8s\n", "Name", "Cost");
    System.out.printf("%s\n", "-".repeat(31));
    for (Booking booking : guestBookings) {
      System.out.printf("%-20s | $%-8.2f%n", booking.getGuestName(), booking.getCost());
    }
    System.out.printf("%s\n", "-".repeat(31));
  }

  /**
   * 3. [Hard; Allen Garcia] Total profit of a hotel
   *
   * @param hotelProfitList list of hotels and their total costs
   */
  public static void displayTotalProfit(List<Booking> hotelProfitList) {
    System.out.printf("%s\n", "-".repeat(31));
    System.out.printf("%-20s | %-12s\n", "Name", "Total Profit");
    System.out.printf("%s\n", "-".repeat(31));
    for (Booking booking : hotelProfitList) {
      System.out.printf("%-20s | $%-12.2f%n", booking.getHotelName(), booking.getCost());
    }
    System.out.printf("%s\n", "-".repeat(31));
  }

  /**
   * 4. [Easy; Ghufran Ali] Room types currently available
   *
   * @param hotelStatsList list of hotel names and addresses and their avg booking cost
   */
  public static void displayAvgBookingCost(List<HotelStats> hotelStatsList) {
    System.out.printf("%n%s%n", "-".repeat(77));
    System.out.printf("%-20s | %-35s | %-16s%n", "Hotel", "Address", "Avg Booking Cost");
    System.out.printf("%n%s%n", "-".repeat(77));
    for (HotelStats stat : hotelStatsList) {
      System.out.printf("%-20s | %-35s | $%-16.2f%n",
              stat.getName(), stat.getAddress(), stat.getAvgBookingCost());
    }
    System.out.printf("%s%n", "-".repeat(77));
  }

  /**
   * 5. [Medium; Ghufran Ali] Average cost of bookings in each hotel
   *
   * @param roomTypes list of room types
   */
  public static void displayAvailableRoomTypes(List<Room> roomTypes) {
    System.out.printf("%n%s%n", "-".repeat(20));
    System.out.printf("%-20s%n", "Available Room Types");
    System.out.printf("%n%s%n", "-".repeat(20));
    for (Room room : roomTypes) {
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
  public static void showDeluxeGuests(List<Guest> guests, String roomType) {
    System.out.printf("%s\n", "-".repeat(58));
    System.out.printf("%-25s | %-30s\n", roomType + " Room Guest Names", "Email Address");
    System.out.printf("%s\n", "-".repeat(58));
    for (Guest guest : guests) {
      System.out.printf("%-25s | %-30s\n", guest.getName(), guest.getEmailAddress());
    }
    System.out.printf("%s\n", "-".repeat(58));
  }

  /**
   * 7. [Easy; Oleksii Sudarin] Good Hotels rated above 3.0
   *
   * @param hotels list of hotel info and rating
   */
  public static void displayGoodHotels(List<Hotel> hotels) {
    System.out.printf("%s\n", "-".repeat(67));
    System.out.printf("%-20s | %-35s | %-6s\n", "Name", "Address", "Rating");
    System.out.printf("%s\n", "-".repeat(67));
    for (Hotel hotel : hotels) {
      System.out.printf("%-20s | %-35s | %-6s\n", hotel.getName(), hotel.getAddress(),
              hotel.getRating());
    }
    System.out.printf("%s\n", "-".repeat(67));
  }

  /**
   * 8. [Medium; Oleksii Sudarin] View all hotel events
   *
   * @param hotelEvents list of hotel info and their events
   */
  public static void displayHotelEvents(List<HotelEvent> hotelEvents) {
    System.out.printf("%s\n", "-".repeat(76));
    System.out.printf("%-20s | %-35s | %-15s\n", "Hotel", "Address", "Event");
    System.out.printf("%s\n", "-".repeat(76));
    for (HotelEvent hotelEvent : hotelEvents) {
      System.out.printf("%-20s | %-35s | %-15s\n", hotelEvent.getHotelName(), hotelEvent.getAddress(),
              hotelEvent.getEventName());
    }
    System.out.printf("%s\n", "-".repeat(76));
  }

  /**
   * 9. [Hard; Oleksii Sudarin] Room number of up to 2 types of rooms
   *
   * @param rooms list of room number and the type
   */
  public static void displayRoomTypeNumbers(List<Room> rooms) {
    System.out.printf("%s\n", "-".repeat(23));
    System.out.printf("%-11s | %-9s\n", "Room Number", "Room Type");
    System.out.printf("%s\n", "-".repeat(23));
    for (Room room : rooms) {
      System.out.printf("%-11s | %-9s\n", room.getRoomNumber(), room.getRoomType());
    }
    System.out.printf("%s\n", "-".repeat(23));
  }
  /*

   * Displays a list of studios with their details.
   *
   * @param studios the list of studios to display

  public static void displayStudios(List<Studio> studios) {
    System.out.printf("%s\n", "-".repeat(LINE_WIDTH));
    System.out.printf("%-24s %10s %32s\n", "Name", "Address ID", "President Certification Number");
    for (Studio studio : studios) {
      System.out.printf("%-24s %10s %32s\n", studio.getName(), studio.getAddressId(),
          studio.getPresCertNum());
    }
    System.out.printf("%s\n", "-".repeat(LINE_WIDTH));
  }


   * Displays a list of movie items with their details.
   *
   * @param movieItems the list of movie items to display

  public static void displayMovieItems(List<MovieItem> movieItems) {
    System.out.printf("%s\n", "-".repeat(LINE_WIDTH));
    System.out.printf("%-3s %-8s %-22s %4s %6s %8s %10s\n", "Row", "Item", "Title", "Year",
        "Medium", "QTY", "Item Price");
    int row = 0;
    for (MovieItem movieItem : movieItems) {
      row++;
      System.out.printf("%3d %-8d %-22s %4d %-6s %8d %10.2f\n", row, movieItem.getItemNum(),
          movieItem.getMovieTitle(), movieItem.getMovieYear(), movieItem.getMediaType(),
          movieItem.getQuantity(), movieItem.getItemPrice());
    }
    System.out.printf("%s\n", "-".repeat(LINE_WIDTH));
  }


   * Displays a list of customer transactions with their details.
   *
   * @param transactions the list of customer transactions to display

  public static void displayTransactions(List<CustomerTransaction> transactions) {
    System.out.printf("%s\n", "-".repeat(LINE_WIDTH));
    System.out.printf("%-9s %16s %20s %10s %9s\n", "Trans No", "Customer ID", "Customer Name",
        "Date", "Total");
    for (CustomerTransaction transaction : transactions) {
      System.out.printf("%-9s %16s %20s %10s %9.2f\n", transaction.getTransactionNo(),
          transaction.getCustomerId(), transaction.getCustomerName(),
          transaction.getTransactionDate(), transaction.getTotal());
    }
    System.out.printf("%s\n", "-".repeat(LINE_WIDTH));
  }


   * Displays the customer invoice with its details.
   *
   * @param invoice the invoice to display

  public static void displayCustomerInvoice(Invoice invoice) {
    if (invoice == null || invoice.isEmpty()) {
      System.out.printf("No invoice found for the transaction number or the customer.\n");
      return;
    }
    System.out.printf("%s\n", "-".repeat(LINE_WIDTH));
    System.out.printf("Store No: %s\n", invoice.getStoreNo());
    System.out.printf("Customer: %s (%s)\n", invoice.getCustomerName(), invoice.getCustomerId());
    System.out.printf("Transaction No: %s\n", invoice.getTransactionNumber());
    System.out.printf("%s\n", "-".repeat(LINE_WIDTH));
    System.out.printf("%-8s %-22s %4s %6s %8s %3s %10s\n", "Item", "Title", "Year", "Medium",
        "Price", "QTY", "Item Total");
    for (InvoiceItem item : invoice) {
      System.out.printf("%-8d %-22s %4d %6s %8.2f %3d %10.2f\n", item.getItemNum(),
          item.getMovieTitle(), item.getMovieYear(), item.getMediaType(), item.getItemPrice(),
          item.getQuantity(), item.getLineTotal());
    }
    System.out.printf("\n");

    System.out.printf("Invoice Tax: %54.2f\n", invoice.getTax());
    System.out.printf("Invoice Total: %52.2f\n", invoice.getTotal());
    System.out.printf("%s\n", "-".repeat(LINE_WIDTH));
  }


   * Displays the item order menu with the given list of movie items.
   *
   * @param movieItems the list of movie items to display in the order menu

  public static void displayItemOrderMenu(List<MovieItem> movieItems) {
    MovieView.displayMovieItems(movieItems);
    System.out.printf("-1 Cancel order\n");
    System.out.printf(" 0 Confirm order\n");
    System.out.print("Add row number to order, or cancel, or confirm order: ");
  }

  public static void displayCancelMsg() {
    System.out.printf("Shopping cart order cancelled.\n");
  }

  public static void displayConfirmedMsg(String transNo) {
    System.out.printf("Shopping cart order %s confirmed and placed.\n", transNo);
  }

  public static void displayEmptyCartMsg() {
    System.out.printf("Shopping cart is empty, and no order to confirm.\n");
  }

  public static void promptForTransactionNo() {
    System.out.print("Enter transaction number: ");
  }


  */

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
