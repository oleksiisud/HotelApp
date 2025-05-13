import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Handler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;
import java.util.Scanner;


/**
 * The HotelApp class is the main entry point for the application.
 * It sets up logging, establishes a database connection, and starts the controller loop.
 */
public class HotelApp {
  private static final String LOG_FILE = "HotelApp.log";
  private static final Logger logger = Logger.getLogger(HotelApp.class.getName());

  private static final String DB_CONFIG_FILE_KEY = "db.config.file";
  private static final String DB_CONFIG_FILE = "db.properties";

  private static final Scanner in = new Scanner(System.in);

  /**
   * The main method is the entry point of the application.
   * It sets up logging and establishes a database connection.
   *
   * @param args Command line arguments (unused).
   */
  public static void main(String[] args) {
    try (AutoclosableLoggerFileHandler logFileHandler =
                 new AutoclosableLoggerFileHandler(LOG_FILE, false)) {
      setup_logger(logFileHandler, logger);

      String dbConfigFile = System.getProperty(DB_CONFIG_FILE_KEY, DB_CONFIG_FILE);
      try (Connection conn = getDbConnection(dbConfigFile)) {
        // ← new login step
        String userId = promptLogin(conn);
        HotelController.controllerLoop(conn, userId);
      }
    } catch (IOException e) {
      HotelView.displayLogErrorMsg(e);
    } catch (SQLException e) {
      HotelView.displaySystemErrorMsg(e);
      logger.log(Level.SEVERE, "DB error: " + e);
    }
  }

  private static String promptLogin(Connection conn) throws SQLException {
    while (true) {
      System.out.println("1. Existing Guest\n2. New Guest\n3. Staff/Manager\nChoose option:");
      String opt = in.nextLine().trim();
      switch (opt) {
        case "1":   // existing guest
          System.out.print("Enter your guest email: ");
          String guestEmail = in.nextLine().trim().toLowerCase();
          if (HotelDataModel.guestExists(conn, guestEmail)) {
            return "G" + guestEmail;
          }
          System.out.println("No guest found with that email.");
          break;

        case "2":  // register new guest
          int rnd = (int)(Math.random() * 100_000_000);
          String guestId = "G" + String.format("%08d", rnd);
          System.out.println("Welcome, " + guestId + "!");
          System.out.println("Your Guest ID is: " + guestId);
          return guestId;

        case "3":   // staff login
          System.out.print("Enter your staff email: ");
          String staffEmail = in.nextLine().trim().toLowerCase();
          if (HotelDataModel.staffExists(conn, staffEmail)) {
            return "M" + staffEmail;
          }
          System.out.println("No staff account found with that email.");
          break;

        default:
          System.out.println("Invalid choice, please try again.");
      }
    }
  }

  private static void setup_logger(AutoclosableLoggerFileHandler fileHandler, Logger logger)
      throws IOException {
    Logger rootLogger = Logger.getLogger("");
    for (Handler handler : rootLogger.getHandlers()) {
      rootLogger.removeHandler(handler);
    }

    SimpleFormatter formatter = new SimpleFormatter();
    fileHandler.setFormatter(formatter);

    rootLogger.addHandler(fileHandler);

    rootLogger.setLevel(Level.ALL);
    logger.setLevel(Level.ALL);
  }

  private static Properties loadDbProperties(String dbConfigFile) {
    Properties properties = new Properties();

    try (FileInputStream fin = new FileInputStream(dbConfigFile)) {
      properties.load(fin);
    } catch (IOException io) {
      logger.log(Level.SEVERE, "Error reading " + dbConfigFile + ": " + io.getMessage());
    }
    return properties;
  }

  private static Connection getDbConnection(String dbConfigFile) throws SQLException {
    Properties properties = loadDbProperties(dbConfigFile);
    String url = "jdbc:mariadb://" + properties.getProperty("host") + ":"
        + properties.getProperty("port") + "/" + properties.getProperty("database");
    logger.log(Level.FINE, "DB URL => '" + url + "'");
    String user = properties.getProperty("user");
    String password = properties.getProperty("password");

    Connection connection;
    connection = DriverManager.getConnection(url, user, password);
    logger.info("Connected to MariaDB successfully!");
    return connection;
  }
}
