using System;
using System.Collections.Generic;
using System.Linq;
using TechShop.entity;
using TechShop.exception;

public class InventoryManager
{
    private SortedList<int, Inventory> inventoryList = new SortedList<int, Inventory>();

    public void AddOrUpdateInventory(Inventory inventory)
    {
        if (inventoryList.ContainsKey(inventory.Product.ProductID))
        {
            inventoryList[inventory.Product.ProductID].AddToInventory(inventory.QuantityInStock);
        }
        else
        {
            inventoryList[inventory.Product.ProductID] = inventory;
        }
    }

    public Inventory GetInventory(int productId) =>
        inventoryList.ContainsKey(productId) ? inventoryList[productId] : null;

    public void ProcessOrder(Orders order, List<OrderDetails> details)
    {
        foreach (var detail in details.Where(d => d.Order.OrderID == order.OrderID))
        {
            var inv = GetInventory(detail.Product.ProductID);
            if (inv == null || !inv.IsProductAvailable(detail.Quantity))
                throw new InsufficientStockException("Stock not available.");
            inv.RemoveFromInventory(detail.Quantity);
        }
        order.UpdateOrderStatus("Processed");
    }
}