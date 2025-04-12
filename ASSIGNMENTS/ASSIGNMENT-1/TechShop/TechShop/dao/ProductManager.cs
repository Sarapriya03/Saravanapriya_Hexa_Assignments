using System;
using System.Collections.Generic;
using System.Linq;
using TechShop.entity;
using TechShop.exception;

public class ProductManager
{
    private List<Products> products = new List<Products>();

    public void AddProduct(Products product)
    {
        if (products.Any(p => p.ProductID == product.ProductID))
            throw new TechShop.exception.InvalidDataException("Product already exists.");
        products.Add(product);
    }

    public void UpdateProduct(Products updatedProduct)
    {
        var existing = products.FirstOrDefault(p => p.ProductID == updatedProduct.ProductID);
        if (existing == null)
            throw new TechShop.exception.InvalidDataException("Product not found.");

        existing.ProductName = updatedProduct.ProductName;
        existing.Description = updatedProduct.Description;
        existing.Price = updatedProduct.Price;
    }

    public void RemoveProduct(int productId)
    {
        var product = products.FirstOrDefault(p => p.ProductID == productId);
        if (product != null)
            products.Remove(product);
        else
            throw new TechShop.exception.InvalidDataException("Product not found.");
    }

    public List<Products> GetAllProducts() => products;

    public List<Products> SearchProducts(string keyword)
    {
        return products
            .Where(p => p.ProductName.Contains(keyword, StringComparison.OrdinalIgnoreCase))
            .ToList();
    }
}
