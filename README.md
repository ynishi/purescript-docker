# Purescript in Docker

* simple purescript in docker
* https://github.com/purescript/purescript
* Task runner: https://github.com/go-task/task

## Usage
### Build 
```
task build
```
### Run
```
docker run --rm -it -v ${path to prj dir}:/home/node/app ${image}
```
### Run repl
```
docker run --rm -it -v ${path to prj dir}:/home/node/app ${image} pulp repl
```
## License
* MIT, see LICENSE
