using System;
using System.Collections.Generic;
using System.Linq;
using TechShop.entity;
using TechShop.exception;
using TechShop.exception;

public class OrderManager
{
    private List<Orders> orders = new List<Orders>();

    public decimal TotalAmount { get; internal set; }

    public void AddOrder(Orders order) => orders.Add(order);

    public void UpdateOrderStatus(int orderId, string newStatus)
    {
        var order = orders.FirstOrDefault(o => o.OrderID == orderId);
        if (order != null)
            order.UpdateOrderStatus(newStatus);
        else
            throw new IncompleteOrderException("Order not found.");
    }

    public void RemoveOrder(int orderId)
    {
        var order = orders.FirstOrDefault(o => o.OrderID == orderId);
        if (order != null)
            orders.Remove(order);
    }

    public List<Orders> GetOrders() => orders;

    public List<Orders> GetSortedOrders(bool ascending = true)
    {
        return ascending
            ? orders.OrderBy(o => o.OrderDate).ToList()
            : orders.OrderByDescending(o => o.OrderDate).ToList();
    }
}
