Copilot SQL Project 

This project demonstrates how GitHub Copilot can help write, debug, and optimize SQL queries.
It includes SQL scripts, sample data, and a small .NET console app to run the queries.

📁 Project Contents

schema.sql – Creates tables

data.sql – Inserts sample data

queries_basic.sql – Simple SELECT & filtering queries

queries_complex.sql – JOINs, nested queries, aggregations

queries_optimized.sql – Index suggestions & optimized queries

debug_notes.md – Common SQL errors and fixes

C# Console App – Runs queries using PostgreSQL + Dapper

✔ Copilot Tasks Demonstrated

Generate basic SQL queries

Generate complex SQL queries

Debug SQL errors with Copilot

Optimize SQL queries using Copilot suggestions

🚀 How to Run

Install PostgreSQL

Create database: copilot_demo

Run:

psql -d copilot_demo -f sql/schema.sql
psql -d copilot_demo -f sql/data.sql


Update connection string in the C# app

Run the app:

dotnet run
