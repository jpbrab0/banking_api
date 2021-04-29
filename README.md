# BankingApi

[![Elixir CI](https://github.com/jpbrab0/banking_api/actions/workflows/elixir.yml/badge.svg)](https://github.com/jpbrab0/banking_api/actions/workflows/elixir.yml)
## About the project 📜

This project is a challenge of an company 👀💚

The challenge is make a Banking Api, and can 
* Create Users
* Deposit money in your Account
* Make withdraws and more

And is builded with:
* Elixir
* Phoenix
* Ecto
* Docker-Compose

## Installing the project 📦

Prerequisites:
* Elixir
* Erlang
* Docker-Compose

The first step is clone the repository to your local machine:

With Https:

```bash
git clone https://github.com/jpbrab0/banking_api.git
```

With SSH:

```bash
git clone git@github.com:jpbrab0/banking_api.git
```

With Github CLI:

```bash
gh repo clone jpbrab0/banking_api
```

## Running the project 🏃

1. Install all dependencies of the project with mix:
  * ``mix deps.get``

2. Setting up the database:
  * ``docker-compose up -d``

3. Initialize the phoenix server:
  * ``iex -S mix phx.server``

## Endpoints

Url: ``https://localhost:4000/api``

GET ``/users/user/:id``, Returns the balance of a user.

```json
{
  "user": {
    "balance": "200.00",
    "user_id": "57cbe0b9-0940-49a6-a579-3377f97fc3ef"
  }
}
```

POST ``/users/user``, Create a user with an account.

Requisition Body
```json
{
	"name":"penguinshow",
	"email":"penguinshow@gmail.com",
	"age":18,
	"cpf":"123456678",
	"nickname":"penguimshow1234",
	"password":"coxinha1234"
}
```

POST ``/users/user/deposit``, Deposit an quantity in a account.

Requisition Body
```json
{
	"id": "57cbe0b9-0940-49a6-a579-3377f97fc3ef",
	"quantity": "100.00"
}
```

POST ``/users/user/withdraw``, Withdraw an quantity in a account.

Requisition Body
```json
{
	"id": "57cbe0b9-0940-49a6-a579-3377f97fc3ef",
	"quantity": "100.00"
}
```

POST ``/users/user/transaction``, Makes a transaction for another account

Requisition Body
```json
{
	"sender":"57cbe0b9-0940-49a6-a579-3377f97fc3ef",
	"receiver":"9eb7fca9-44ea-49c9-86d5-9ebb85712d55",
	"quantity":"100.00"
}
```

## Todo List 📝

- [x] Get balance of an account
- [x] Create User
- [x] Make deposits
- [x] Make withdraws
- [x] Make transfer to anouther account
- [x] Make User Controllers
- [x] Make User Views
- [x] Make Account Controllers
- [x] Make Account Views
- [x] Configure Github Actions
- [ ] Deploy the aplication

Made by [João Pedro Resende](https://jpres.dev)
