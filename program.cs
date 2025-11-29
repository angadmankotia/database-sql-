using System;
using System.Data;
using Npgsql;
using Dapper;


class Program
{
static string connString = "Host=localhost;Port=5432;Username=postgres;Password=postgres;Database=copilot_demo";


static void Main()
{
using var conn = new NpgsqlConnection(connString);
conn.Open();


Console.WriteLine("Customers:");
var customers = conn.Query("SELECT * FROM customers");
foreach (var c in customers) Console.WriteLine($"{c.customer_id}: {c.name} ({c.email})");


Console.WriteLine("\nOrders with aggregates:");
var orders = conn.Query(@"
SELECT o.order_id, o.order_date, c.name AS customer_name,
SUM(oi.quantity) AS total_items, o.total
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
LEFT JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY o.order_id, o.order_date, c.name, o.total
ORDER BY o.order_date DESC;");
foreach (var o in orders) Console.WriteLine($"Order {o.order_id} by {o.customer_name}: items={o.total_items} total={o.total}");
}
}