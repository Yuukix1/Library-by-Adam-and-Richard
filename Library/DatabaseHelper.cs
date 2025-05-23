using MySql.Data.MySqlClient;

public static class DatabaseHelper
{
    public static string ConnectionString = "server=localhost;user=root;password=;database=library_db;";

    public static MySqlConnection GetConnection()
    {
        return new MySqlConnection(ConnectionString);
    }
}
