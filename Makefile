run: venv
	./venv/bin/python ./app_name

test: venv
	./venv/bin/python -m pytest --verbose

venv: requirements.txt
	python3 -m venv --upgrade-deps venv
	./venv/bin/pip install -r requirements.txt

git: 
	git init
	mv ./pre-commit ./.git/hooks/
	chmod +x ./.git/hooks/pre-commit
	
setup: venv git
	mkdir src
	touch ./src/__init__.py

clean:
	rm -rf __pycache__
	rm -rf ./tests/__pycache__
	rm -rf .mypy_cache
	rm -rf venv
	rm -rf .git
