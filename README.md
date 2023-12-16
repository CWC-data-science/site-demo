# template-docker-fastapi-site

## Fastapi for the backend, npm based front end, runs in docker and can be fired up immediately in Render.com or DigitalOcean.

Very minimal website is included.

## Easy, cross platform development (tested on linux, windows, mac)

## Docker image for easy deployement.

## Full linters on python and javascript/html/css.

Github lints / unit tests with badges, 404 checker.

# Recommended Workflow

- Background worker performs work
- FastAPI workers move as fast as possible
- Recommended ORM is sqlalchemy (installed)

Developer experience:

- Designed for VSCode, and github co-pilot.
- Windows must have git-bash installed

# Directories:

- `www/` - Web front end (webpack)
- `src/` - Python source (fastapi)

# Commands

## Developement

- `./install` - Installs the product
- `./activate.sh` - Activates the environment
- `./dev` - Runs the server with hot front end reloading
- `./lint` - Runs linting on all source code

## Production

- `./run_docker` - Run this if you have docker, the p
- `./prod`- Compiles the website into a `dist` folder and then runs it

# Recommended deployment

- Use github login to get access to Render.com's free tier.
