using System;
using System.Collections.Generic;
using TechShop.dao;
using TechShop.entity;

namespace TechShop
{
    class Program
    {
        static void Main(string[] args)
        {
            // Creating instances of services
            var productService = new ProductService();
            var customerService = new CustomerService();
            var orderService = new OrdersService();
            var inventoryService = new InventoryService();

            Console.WriteLine("Welcome to TechShop!");

            // Main menu loop
            while (true)
            {
                Console.Clear();
                Console.WriteLine("TechShop Management System");
                Console.WriteLine("1. Add Product");
                Console.WriteLine("2. View All Products");
                Console.WriteLine("3. Add Customer");
                Console.WriteLine("4. Place Order");
                Console.WriteLine("5. View Orders");
                Console.WriteLine("6. Add Inventory");
                Console.WriteLine("7. View Inventory");
                Console.WriteLine("8. Exit");
                Console.Write("Please select an option: ");

                string choice = Console.ReadLine();

                switch (choice)
                {
                    case "1":
                        AddProduct(productService);
                        break;

                    case "2":
                        ViewProducts(productService);
                        break;

                    case "3":
                        AddCustomer(customerService);
                        break;

                    case "4":
                        PlaceOrder(orderService);
                        break;

                    case "5":
                        ViewOrders(orderService);
                        break;

                    case "6":
                        AddInventory(inventoryService);
                        break;

                    case "7":
                        ViewInventory(inventoryService);
                        break;

                    case "8":
                        Console.WriteLine("Goodbye!");
                        return;

                    default:
                        Console.WriteLine("Invalid option. Please try again.");
                        Console.ReadLine();
                        break;
                }
            }
        }

        static void AddProduct(ProductService productService)
        {
            Console.WriteLine("Enter Product Name: ");
            string name = Console.ReadLine();
            Console.WriteLine("Enter Price: ");
            decimal price = Convert.ToDecimal(Console.ReadLine());
            Console.WriteLine("Enter Description: ");
            string description = Console.ReadLine();
            Console.WriteLine("Enter Category: ");
            string category = Console.ReadLine();

            int no_of_times_ordered = 0;
            var product = new Products
            {
                ProductName = name,
                Description = description,
                Price = price,
                No_Of_Times_Ordered = no_of_times_ordered
            };

            productService.AddProduct(product);
            Console.WriteLine("Product added successfully!");
            Console.ReadLine();
        }

        static void ViewProducts(ProductService productService)
        {
            var products = productService.GetAllProducts();
            foreach (var product in products)
            {
                Console.WriteLine(
                    $"Product ID: {product.ProductID}, " +
                    $"Name: {product.ProductName}, " +
                    $"Description: {product.Description}, " +
                    $"Price: {product.Price}, " +
                    $"Times Ordered: {product.No_Of_Times_Ordered}"
                );
            }
            Console.ReadLine();
        }

        static void AddCustomer(CustomerService customerService)
        {
            Console.WriteLine("Enter Customer Name: ");
            string name = Console.ReadLine();
            Console.WriteLine("Enter Email: ");
            string email = Console.ReadLine();
            Console.WriteLine("Enter Phone: ");
            string phone = Console.ReadLine();

            var customer = new Customers
            {
                CustomerName = name,
                Email = email,
                Phone = phone
            };

            customerService.AddCustomer(customer);
            Console.WriteLine("Customer added successfully!");
            Console.ReadLine();
        }

        static void PlaceOrder(OrdersService orderService)
        {
            Console.WriteLine("Enter Customer ID: ");
            int customerId = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Order Date (YYYY-MM-DD): ");
            DateTime orderDate = DateTime.Parse(Console.ReadLine());
            Console.WriteLine("Enter Total Amount: ");
            decimal totalAmount = Convert.ToDecimal(Console.ReadLine());
            Console.WriteLine("Enter Order Status: ");
            string status = Console.ReadLine();

            var order = new Orders
            {
                Customer = new Customers { CustomerID = customerId },
                OrderDate = orderDate,
                TotalAmount = totalAmount,
                Status = status
            };

            orderService.AddOrder(order);
            Console.WriteLine("Order placed successfully!");
            Console.ReadLine();
        }

        static void ViewOrders(OrdersService orderService)
        {
            var orders = orderService.GetAllOrders();
            foreach (var order in orders)
            {
                Console.WriteLine($"Order ID: {order.OrderID}, Customer ID: {order.Customer.CustomerID}, Total Amount: {order.TotalAmount}, Status: {order.Status}");
            }
            Console.ReadLine();
        }

        static void AddInventory(InventoryService inventoryService)
        {
            Console.WriteLine("Enter Product ID: ");
            int productId = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Quantity: ");
            int quantity = Convert.ToInt32(Console.ReadLine());

            var inventory = new Inventory
            {
                Product = new Products { ProductID = productId }
            };

            inventory.AddToInventory(quantity);
            inventoryService.AddInventory(inventory);
            Console.WriteLine("Inventory added successfully!");
            Console.ReadLine();
        }

        static void ViewInventory(InventoryService inventoryService)
        {
            var inventories = inventoryService.GetAllInventory();
            foreach (var inventory in inventories)
            {
                Console.WriteLine($"Product ID: {inventory.Product.ProductID}, Quantity In Stock: {inventory.QuantityInStock}");
            }
            Console.ReadLine();
        }
    }
}
