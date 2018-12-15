# README

Search by product name REST API using Rails.

Include:

* Search REST API

* Postgresql DB that have products table with one column product name

* Unit testing

## How to use

1- Create DB then run rails db:seed.

2- Get a list to all products => api/v1/products.

3- Search products using product name => api/v1/product?query=ProductName, 
e.g.=> api/v1/product?query=Durable Copper Watch.

