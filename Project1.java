// Ani Movsesian
// CS 4222 - Project 1
// Note: you will need to include the postgresql-42.5.1.jar in your class path to run this program
// https://jdbc.postgresql.org/download/postgresql-42.5.1.jar

import java.sql.*;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Scanner;

class Project1 {
    public static Scanner scanner;
    public static Connection connection;
    public static String operation; // add, remove, display
    public static String tableName;
    public static String selectedTableName; 
    public static String mainMenu = "1) Add data\n" + 
    "2) Remove data\n" +
    "3) Display table data\n" +
    "4) Exit the program\n";
    public static String addRemoveMenu = "1) Musician\n" + 
    "2) Album\n" +
    "3) Song\n" +
    "4) Return to the previous menu\n";
    public static String displayTableMenu = "1) Musician\n" + 
    "2) Album\n" +
    "3) Song\n" +
    "4) Instrument\n" +
    "5) Plays\n" +
    "6) Performs\n" +
    "7) Return to the previous menu\n";
    public static Map<String, String> optionOperationMap = Map.of(
        "1", "add", 
        "2", "remove", 
        "3", "display"
    );
    public static Map<String, String> optionTableMap = Map.of(
        "1", "Musician", 
        "2", "Album", 
        "3", "Song", 
        "4", "Instrument", 
        "5", "Plays", 
        "6", "Performs"
    );
    public static Map<String, Map<String, List<String>>> tableColumnMap = Map.of(
        "Musician", Map.of(
            "columnNames", List.of("ssn", "name", "address", "phone_number"),
            "columnTypes", List.of("string", "string", "string", "string")
        ),
        "Album", Map.of(
            "columnNames", List.of("id", "title", "copyright_date", "format", "album_identifier", "producer_ssn"),
            "columnTypes", List.of("int", "string", "string", "string", "string", "string")
        ),
        "Song", Map.of(
            "columnNames", List.of("title", "author", "album_id"),
            "columnTypes", List.of("string", "string", "int")
        ),
        "Instrument", Map.of(
            "columnNames", List.of("id", "name", "musical_key"),
            "columnTypes", List.of("int", "string", "string")
        ),
        "Plays", Map.of(
            "columnNames", List.of("ssn", "instrument_id"),
            "columnTypes", List.of("string", "int")
        ),
        "Performs", Map.of(
            "columnNames", List.of("ssn", "song_title"),
            "columnTypes", List.of("string", "string")
        )
    );
    public static String templateInsertQuery = "insert into %s values (";
    public static String templateDeleteQuery = "delete from %s where %s = ?";
    public static String templateSelectQuery = "select * from %s";

    public static void main(String args[]) {
        String url = "jdbc:postgresql://<DATABASE_URL>:5432/<USERNAME>";
        Properties props = new Properties();
        props.setProperty("user", "<USERNAME>");
        props.setProperty("password", "<PASSWORD>");

        try {
            connection = DriverManager.getConnection(url, props);
            scanner = new Scanner(System.in);
            startProgram();
            scanner.close();
            connection.close();
        } catch (SQLException e) {
            System.out.println(String.format("There was an error %s", e));
            e.printStackTrace();
        }
    }

    public static void startProgram() {
        System.out.println("Welcome to NoTown Records!");
        boolean endProgram = false;
        while (!endProgram) {
            operation = interactiveMenu(mainMenu, optionOperationMap, "4");
            if (operation == null) {
                break;
            }
            if (operation.equals("add") || operation.equals("remove")) {
                tableName = interactiveMenu(addRemoveMenu, optionTableMap, "4"); 
            } else if (operation.equals("display")) {
                tableName = interactiveMenu(displayTableMenu, optionTableMap, "7"); 
            }
            if (tableName == null) {
                continue;
            }
            runQuery();
        }
        System.out.println("Thank you for using the program!");
    }

    public static String interactiveMenu(String menu, Map<String, String> optionMap, String backOption) {
        System.out.println("Please select an option");
        boolean endMenu = false;
        String result = null;
        while (!endMenu) {
            System.out.print(menu);
            String input = scanner.nextLine();
            if (input.equals(backOption)) {
                endMenu = true;
            } else if (optionMap.containsKey(input) && Integer.parseInt(input) < Integer.parseInt(backOption)) {
                result = optionMap.get(input);
                endMenu = true;
            } else {
                System.out.println("Unknown option, please choose another option");
            }
        }
        return result;
    }

    public static void runQuery() {
        System.out.println(String.format("Operation: %s, Tablename: %s", operation, tableName));
        if (operation.equals("add")) {
            runInsertQuery();
        } else if (operation.equals("remove")) {
            runDeleteQuery();
        } else if (operation.equals("display")) {
            runSelectQuery();
        }
    }
    
    public static String getUserInput(String columnType, String columnName) {
        System.out.print(String.format("Please enter a %s for %s:\n", columnType, columnName));
        String input = scanner.nextLine();
        return input;
    }

    public static String generateInsertPreparedQuery(int numCols) {
        String insertQuery = String.format(templateInsertQuery, tableName);
        // First include the correct number of ? in the string
        for (int i = 0; i < numCols; i++) {
            insertQuery += "?";
            insertQuery += i == numCols - 1 ? ")" : ", ";
        }
        return insertQuery;
    }


    public static PreparedStatement fillPreparedStatement(PreparedStatement stmt, int numCols) throws SQLException {
        // Then prepare those ? with values
        for (int i = 0; i < numCols; i++) {
            String columnType = tableColumnMap.get(tableName).get("columnTypes").get(i);
            String columnName = tableColumnMap.get(tableName).get("columnNames").get(i);
            // While there is an error try to get the input again
            boolean error = true;
            while (error) {
                try {
                    if (columnType.equals("string")) {
                        stmt.setString(i + 1, getUserInput(columnType, columnName));
                    } else if (columnType.equals("int")) {
                        stmt.setInt(i + 1, Integer.parseInt(getUserInput(columnType, columnName)));
                    }
                    error = false;
                } catch (Exception e) {
                    System.out.println(String.format("Error: %s", e.getMessage()));
                }
            }
        }
        return stmt;
    }

    public static void runInsertQuery() {
        int numCols = tableColumnMap.get(tableName).get("columnNames").size();
        String insertQuery = generateInsertPreparedQuery(numCols);
        try {
            PreparedStatement stmt = connection.prepareStatement(insertQuery);
            stmt = fillPreparedStatement(stmt, numCols);
            stmt.executeUpdate();
            System.out.println("Record Inserted Successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void runDeleteQuery() {
        String primaryKeyColumnName = tableColumnMap.get(tableName).get("columnNames").get(0);
        String deleteQuery = String.format(templateDeleteQuery, tableName, primaryKeyColumnName);
        try {
            PreparedStatement stmt = connection.prepareStatement(deleteQuery);
            stmt = fillPreparedStatement(stmt, 1);
            stmt.executeUpdate();
            System.out.println("Record Removed Successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void runSelectQuery() {
        int numCols = tableColumnMap.get(tableName).get("columnNames").size();
        String selectQuery = String.format(templateSelectQuery, tableName);
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(selectQuery);
            System.out.println("Query Results:");
            while (rs.next()) {
                for (int i = 0; i < numCols; i++) {
                    String columnName = tableColumnMap.get(tableName).get("columnNames").get(i);
                    System.out.print(String.format("%s: %s%s ", columnName, rs.getString(columnName), i == numCols - 1 ? "" : ","));
                }
                System.out.println();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }    
}
