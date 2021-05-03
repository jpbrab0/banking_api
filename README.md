# BankingApi

[![Elixir CI](https://github.com/jpbrab0/banking_api/actions/workflows/elixir.yml/badge.svg)](https://github.com/jpbrab0/banking_api/actions/workflows/elixir.yml)

## About the project 📜

This project is a challenge of an company 👀💚

The challenge is make a Banking Api, and can

- Create Users
- Deposit money in your Account
- Make withdraws and more

And is builded with:

- Elixir
- Phoenix
- Ecto
- Docker-Compose

## Installing the project 📦

Prerequisites:

- Elixir
- Erlang
- Docker-Compose

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

- `mix deps.get`

2. Setting up the database:

- `docker-compose up -d`

3. Initialize the phoenix server:

- `iex -S mix phx.server`

## Run tests 🧪

To run tests, run the following command

```bash
mix test
```
## Endpoints

Url: `https://localhost:4000/api`

### Returns the balance of a user.

```http
GET `/users/user/:id`
```

| Parameter | Type   |
| :-------- | :----- |
| `id`      | `uuid` |

### Create a user with an account.

```http
POST /users/user` 
```

| Parameter  | Type      |
| :--------- | :-------- |
| `name`     | `string`  |
| `email`    | `string`  |
| `age`      | `integer` |
| `cpf`      | `string`  |
| `nickname` | `string`  |
| `password` | `string`  |

### Deposit an quantity in a account.

```http
POST `/users/user/deposit` 
```

| Parameter  | Type      |
| :--------- | :-------- |
| `id`       | `uuid`    |
| `quantity` | `decimal` |

### Withdraw an quantity in a account.

```http
POST `/users/user/withdraw`
```

| Parameter  | Type      |
| :--------- | :-------- |
| `id`       | `uuid`    |
| `quantity` | `decimal` |

### Makes a transaction for another account

```http
POST `/users/user/transaction` 
```

| Parameter  | Type      |
| :--------- | :-------- |
| `sender`   | `uuid`    |
| `receiver` | `uuid`    |
| `quantity` | `decimal` |

In sender and receiver the value is the uuid of account sender and account receiver

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
