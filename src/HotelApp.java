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
  
  private static final String USER_ID_KEY = "user.id";
  private static final String USER_ID = "U12345678";

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

      String dbConfigFile = System.getProperty(DB_CONFIG_FILE_KEY);
      if (dbConfigFile == null) {
        dbConfigFile = DB_CONFIG_FILE;
      }
      logger.log(Level.FINE, "dbConfigFile => " + dbConfigFile);
      String userId = System.getProperty(USER_ID_KEY);
      if (userId == null) {
        System.out.println("Are you a guest or a manager? (Guest or Manager)");
        String userType = in.nextLine().toLowerCase().trim();
        if (userType.equals("guest")) {
          userId = "G" + String.format("%08d", (int)(Math.random() * 1_000_000_00));
        } else if (userType.equals("manager")) {
          userId = "M" + String.format("%08d", (int)(Math.random() * 1_000_000_00));
        } else {
          System.out.println("Invalid Response, entering as " + USER_ID);
          userId = USER_ID;
        }
      }

      try (Connection connection = getDbConnection(dbConfigFile)) {
        HotelController.controllerLoop(connection, userId);
      } catch (SQLException e) {
        HotelView.displaySystemErrorMsg(e);
        logger.log(Level.SEVERE, "Error operating on MariaDB: " + e.getMessage());
      }
    } catch (IOException e) {
      HotelView.displayLogErrorMsg(e);
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
