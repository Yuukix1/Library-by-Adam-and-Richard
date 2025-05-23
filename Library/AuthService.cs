using System;
using MySql.Data.MySqlClient;

namespace Library
{
    public static class AuthService
    {
        private static readonly string ConnectionString = "Server=localhost;Database=library_db;Uid=root;Pwd=;"
;

        public static int? Login(string username, string password)
        {
            using var conn = new MySqlConnection(ConnectionString);
            conn.Open();

            var cmd = new MySqlCommand("SELECT id FROM users WHERE username = @username AND password = @password", conn);
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@password", password); 

            var result = cmd.ExecuteScalar();

            return result != null ? Convert.ToInt32(result) : (int?)null;
        }

        public static bool Register(string username, string password)
        {
            using var conn = new MySqlConnection(ConnectionString);
            conn.Open();

            var checkCmd = new MySqlCommand("SELECT COUNT(*) FROM users WHERE username = @username", conn);
            checkCmd.Parameters.AddWithValue("@username", username);
            if (Convert.ToInt32(checkCmd.ExecuteScalar()) > 0)
                return false;

            var cmd = new MySqlCommand("INSERT INTO users (username, password) VALUES (@username, @password)", conn);
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@password", password);
            cmd.ExecuteNonQuery();

            return true;
        }
    }
}
