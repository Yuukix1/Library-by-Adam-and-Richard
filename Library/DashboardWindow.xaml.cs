using System.Data;
using System.Windows;
using System.Windows.Controls;

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
        private void DashboardWindow_Loaded(object sender, RoutedEventArgs e)
        {
            ST(SearchTextBox, null);
        }

        private void ST(object sender, TextChangedEventArgs e)
        {
            if (SearchTextBox == null || CategoryComboBox == null || BookGrid == null) return;

            string searchText = SearchTextBox.Text ?? "";
            string category = (CategoryComboBox.SelectedItem as ComboBoxItem)?.Content?.ToString() ?? "Összes";

            var filteredBooks = BookService.GetFilteredBooks(searchText, category);
            if (filteredBooks != null)
                BookGrid.ItemsSource = filteredBooks.DefaultView;
        }


        private void CB(object sender, SelectionChangedEventArgs e)
        {
            ST(SearchTextBox, null);
        }


        private void Add(object sender, RoutedEventArgs e)
        {
            if (BookGrid.SelectedItem is DataRowView row)
            {
                int bookId = (int)row["Id"];
                CartService.AddToCart(bookId); 
                MessageBox.Show($"Kosárba rakva: {row["title"]}");
            }
            else
            {
                MessageBox.Show("Kérlek válassz ki egy könyvet!");
            }
        }


        private void OpenCart(object sender, RoutedEventArgs e)
        {
            CartWindow cartWindow = new CartWindow(_userId, _bookTable);
            cartWindow.ShowDialog();
        }

        private void Quit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
