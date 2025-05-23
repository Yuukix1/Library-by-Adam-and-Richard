using System;
using System.Data;
using System.Windows;

namespace Library
{
    public partial class DashboardWindow : Window
    {
        private int _userId;
        private DataTable _bookTable;

        public DashboardWindow(int userId)
        {
            InitializeComponent();
            _userId = userId;

            _bookTable = BookService.GetBooks();
            BookGrid.ItemsSource = _bookTable.DefaultView;
        }

        private void Rent_Click(object sender, RoutedEventArgs e)
        {
            if (BookGrid.SelectedItem is DataRowView row)
            {
                int bookId = Convert.ToInt32(row["id"]);
                BookService.RecordTransaction(_userId, bookId, "rent");
                MessageBox.Show($"Könyv kikölcsönzöve: {row["Cím"]}");
            }
        }

        private void Buy_Click(object sender, RoutedEventArgs e)
        {
            if (BookGrid.SelectedItem is DataRowView row)
            {
                int bookId = Convert.ToInt32(row["id"]);
                BookService.RecordTransaction(_userId, bookId, "buy");
                MessageBox.Show($"Könyv megvásárolva: {row["Cím"]}");
            }
        }
    }
}
