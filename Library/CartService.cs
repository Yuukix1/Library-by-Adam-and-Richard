using System.Collections.Generic;

namespace Library
{
    public static class CartService
    {
        private static List<int> CartItems = new();

        public static void AddToCart(int bookId)
        {
            if (!CartItems.Contains(bookId))
                CartItems.Add(bookId);
        }

        public static void RemoveFromCart(int bookId)
        {
            CartItems.Remove(bookId);
        }

        public static List<int> GetCartItems()
        {
            return new List<int>(CartItems); 
        }

        public static void ClearCart()
        {
            CartItems.Clear();
        }
    }
}
