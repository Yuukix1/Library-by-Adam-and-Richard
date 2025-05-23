using System.Windows;
using System.Windows.Controls;

namespace Library
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Login_Click(object sender, RoutedEventArgs e)
        {
            string username = UsernameBox.Text.Trim();
            string password = PasswordBox.Password;

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                MessageBox.Show("Please enter both username and password.", "Error", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            var id = AuthService.Login(username, password);
            if (id.HasValue)
            {
                new DashboardWindow(id.Value).Show();
                this.Close();
            }
            else
            {
                MessageBox.Show("Login failed. Incorrect username or password.", "Login Failed", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Register_Click(object sender, RoutedEventArgs e)
        {
            string username = UsernameBox.Text.Trim();
            string password = PasswordBox.Password;

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                MessageBox.Show("Please enter both username and password.", "Error", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            bool registered = AuthService.Register(username, password);
            MessageBox.Show(registered ? "Registration successful!" : "Username already exists.", "Register", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void UsernameBox_GotFocus(object sender, RoutedEventArgs e)
        {
            if (UsernameBox.Text == "Username")
                UsernameBox.Text = "";
        }

        private void UsernameBox_LostFocus(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(UsernameBox.Text))
                UsernameBox.Text = "Username";
        }
    }
}
