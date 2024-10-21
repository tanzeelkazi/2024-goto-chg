# 2024 goto; Chicago scratch repo

## About

The `compose.yml` file in this repository will run an instance of jupyterlab
locally (on port 80). You may change the binding port or IP by editing the
`compose.yml` file.


## Start the Jupyterlab environment

- Clone this repository.
- Run `docker compose up -d` from the repository folder.
- Access [http://127.0.0.1/lab](http://127.0.0.1/lab) in a web-browser.
  - The default password is `tkazi`.
  - The site is NOT accessible over the network by default. You can
    change this behavior by either substituting `127.0.0.1` with the
    network interface address, or removing it completely to bind to
    all available network interfaces.


## Terminate the Jupyterlab environment

Run `docker compose down`.


## Getting Shell Access

To get shell access to the running (keyword is _running_) container run the
`shell.sh` script.

```sh
./shell.sh
```

## Changing the default password.

- Start the jupyterlab container first with:

  ```sh
  docker compose up -d
  ```
- Run `./gen-passwd.sh` to generate a new password hash.
- Copy `example.env` to `.env` and change the default password hash under
  the `JUPYTER_HASHED_PASS` env var to the new value.
- Uncomment the `command` block in `compose.yml`.
- Recreate the container stack with:
  
  ```sh
  docker compose down
  docker compose up -d
  ```
