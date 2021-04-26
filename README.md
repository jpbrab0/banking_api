# BankingApi

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

Yet not have none route, but this routes is in development.

## Todo List 📝

- [x] Get balance of an account
- [x] Create User
- [x] Make deposits
- [x] Make withdraws
- [x] Make transfer to anouther account

Made by [João Pedro Resende](https://jpres.dev)
