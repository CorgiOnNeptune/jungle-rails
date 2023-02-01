# Jungle

Jungle is a mini e-commerce application built with Rails 6.1 for the purposes of refining understanding of Ruby, OOP, and MVC concepts/patterns.

Features I implemented:
- The Admin Dashboard
- Admin Categories
- User Auth
- Order Details Page
- BugFix: Missing Admin HTTP Auth
- BugFix: Empty Cart error/warning message

Unit testing was done with RSpec and feature testing was done with Cypress.

---


## Getting Started

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env variables
8. Run `bin/rails s -b 0.0.0.0` to start the server

### Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

### Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

---

## Final Product

### Product Page

![product page](https://github.com/CorgiOnNeptune/jungle-rails/blob/master/docs/product-page.png?raw=true)

![products view](https://github.com/CorgiOnNeptune/jungle-rails/blob/master/docs/products-view.png?raw=true)

### Admin Views

<details>
<summary>Dashboard</summary>

![admin dashboard view](https://github.com/CorgiOnNeptune/jungle-rails/blob/master/docs/admin-dashboard.png?raw=true)

</details>

<details>
<summary>Sales View</summary>

![admin sales view](https://github.com/CorgiOnNeptune/jungle-rails/blob/master/docs/admin-sales.png?raw=true)

</details>

&nbsp;

### Order Views

<details>
<summary>Order Details and Confirmation</summary>

![order details and confirmation alert](https://github.com/CorgiOnNeptune/jungle-rails/blob/master/docs/order-details.png?raw=true)

</details>

<details>
<summary>Empty Cart</summary>

![empty cart message](https://github.com/CorgiOnNeptune/jungle-rails/blob/master/docs/empty-cart.png?raw=true)

</details>

&nbsp;

---

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

## Test Libraries

- Cypress
- RSpec