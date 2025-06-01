using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Windows;

namespace Library
{
    public partial class CartWindow : Window
    {
        private int _userId;
        private DataTable _bookTable;

        public CartWindow(int userId, DataTable bookTable)
        {
            InitializeComponent();
            _userId = userId;
            _bookTable = bookTable;
            LoadCart();
        }

        private void LoadCart()
        {
            var cartItems = CartService.GetCartItems();
            foreach (int id in cartItems)
            {
                var row = _bookTable.Select($"id = {id}").FirstOrDefault();
                if (row != null)
                {
                    string display = $"[{row["id"]}] {row["title"]} - {row["author"]} ({row["price"]} Ft)";
                    CartList.Items.Add(display);
                }
            }
        }

        private void Buy(object sender, RoutedEventArgs e)
        {
            foreach (int bookId in CartService.GetCartItems())
            {
                BookService.RecordTransaction(_userId, bookId, "buy");
            }
            MessageBox.Show("Sikeres vásárlás!");
            CartService.ClearCart();
            Close();
        }

        private void Rent(object sender, RoutedEventArgs e)
        {
            foreach (int bookId in CartService.GetCartItems())
            {
                BookService.RecordTransaction(_userId, bookId, "rent");
            }
            MessageBox.Show("Sikeres kölcsönzés!");
            CartService.ClearCart();
            Close();
        }
    }
}
