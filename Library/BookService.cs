﻿using System.Data;
using MySql.Data.MySqlClient;

namespace Library
{
    public static class BookService
    {
        private static readonly string ConnectionString = "Server=localhost;Database=library_db;Uid=root;Pwd=;";

        public static DataTable GetBooks()
        {
            var dt = new DataTable();

            using var conn = new MySqlConnection(ConnectionString);
            conn.Open();

            var cmd = new MySqlCommand("SELECT Id, Cím, Szerző, Ár, Elérhetőség FROM books", conn);
            using var adapter = new MySqlDataAdapter(cmd);
            adapter.Fill(dt);

            return dt;
        }

        public static void RecordTransaction(int userId, int bookId, string action)
        {
            using var conn = new MySqlConnection(ConnectionString);
            conn.Open();

            var cmd = new MySqlCommand("INSERT INTO transactions (user_id, book_id, date) VALUES (@user, @book, NOW())", conn);
            cmd.Parameters.AddWithValue("@user", userId);
            cmd.Parameters.AddWithValue("@book", bookId);
            cmd.ExecuteNonQuery();
        }
    }
}
