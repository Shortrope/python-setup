# Project Name
[Github repo](https://github.com/Shortrope/python-setup.git)
## Description
This repo is a collection of files to make setting up a new project on a Linux machine easier.
It includes my basic starter files
- .gitignore
- .pylintrc
- git .pre-commint hook file
- requirements.txt

Also includes a Makefile to 'setup' everything and includes 'run', 'test' and 'clean' targets.
## Setup/Installation
From a Linux terminal perform the following steps:  
```
git clone https://github.com/Shortrope/python-setup.git ./project_dir_name
cd ./project_dir_name
make setup
```
Running `make setup` will perform the following steps:  

1. create a virtual environment - `./venv`
1. upgrade pip
1. pip install requirements.txt which includes:
    - pylint: linter
    - mypy: type checking
    - black: code formating
1. Initialize git
1. cp `pre-commit` hook file to `.git/hooks/` and make it executable
    - checks python files against pylint and mypy
1. creates `./src` subdirectory
1. creates `./src/__init__.py` file

## Notes
### .pylintrc
I generated the .pylintrc file as follows:
```
pylint --generate-rcfile > .pylintrc
```
Under `[MESSAGES CONTROL]` disable `missing-module-docstring` and `missing-function-docstring` 
```
[MESSAGES CONTROL]
...
disable=...,
        ...,
        missing-module-docstring,
        missing-function-docstring

```
I may reconsider allowing `missing-module-docstring`.  
The function is usually self expanitory or should be. Extra comments would just be noise.
