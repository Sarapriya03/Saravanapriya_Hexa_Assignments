using System;
using System.Data.SqlClient;

namespace TicketBookingSystem
{
    public class DatabaseConnection
    {
        public static string connectionString = "Server=SARAVANAPRIYA-2;Database=TicketBookingSystem;Trusted_Connection=True;";


        public static SqlConnection GetConnection()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            return connection;
        }
    }
}

