# template-docker-fastapi-site

Fastapi for the backend, npm based front end, runs in docker and can be fired up immediately in Render.com or DigitalOcean.

Easy, cross platform development (tested on linux, windows, mac)

Slim docker image for production deployement.

Full linters on python and javascript/html/css.

Github lints / unit tests with badges, 404 checker.

# Recommended Workflow

  * Background worker performs work
  * FastAPI workers move as fast as possible
  * Recommended ORM is sqlalchemy (installed)


Developer experience:
  * Designed for VSCode, and github co-pilot.
  * Windows must have git-bash installed

File structure:

  * `www` - Web front end (webpack)
  * `src` - Python source (fastapi)
  * `lint` - Runs linting on all source code
  * `dev` - Runs the server with hot front end reloading
  * `prod`- Compiles the website into a `dist` folder
