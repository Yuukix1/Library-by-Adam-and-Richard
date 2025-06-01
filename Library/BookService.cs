using System.Data;
using System.Windows;
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

            var cmd = new MySqlCommand("SELECT Id, title, author, price, available FROM books", conn);
            using var adapter = new MySqlDataAdapter(cmd);
            adapter.Fill(dt);

            return dt;
        }

        public static void RecordTransaction(int userId, int bookId, string action)
        {
            using var conn = new MySqlConnection(ConnectionString);
            conn.Open();

            var cmd = new MySqlCommand("INSERT INTO transactions (user_id, book_id, type, date) VALUES (@user, @book, @type, NOW())", conn);
            cmd.Parameters.AddWithValue("@user", userId);
            cmd.Parameters.AddWithValue("@book", bookId);
            cmd.Parameters.AddWithValue("@type", action);
            cmd.ExecuteNonQuery();
        }
        public static DataTable GetFilteredBooks(string search, string category)
        {
            DataTable dt = new DataTable();

            try
            {
                using (var conn = new MySqlConnection(ConnectionString))
                {
                    conn.Open();

                    string sql = @"
                SELECT books.id, books.title, books.author, books.price, books.available, categories.name AS category
                FROM books
                LEFT JOIN categories ON books.category_id = categories.id
                WHERE 1 = 1
            ";

                    if (!string.IsNullOrEmpty(search))
                        sql += " AND (LOWER(books.title) LIKE @search OR LOWER(books.author) LIKE @search)";

                    if (!string.IsNullOrEmpty(category) && category != "Összes")
                        sql += " AND LOWER(categories.name) = @category";

                    using (var cmd = new MySqlCommand(sql, conn))
                    {
                        if (!string.IsNullOrEmpty(search))
                            cmd.Parameters.AddWithValue("@search", "%" + search.ToLower() + "%");
                        if (!string.IsNullOrEmpty(category) && category != "Összes")
                            cmd.Parameters.AddWithValue("@category", category.ToLower().Trim());

                        using (var adapter = new MySqlDataAdapter(cmd))
                        {
                            adapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Hiba a könyvek lekérésekor: " + ex.Message);
            }

            return dt;
        }


    }
}
