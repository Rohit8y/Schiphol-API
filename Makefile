run-test:
	pytest tests/
clean-directory:
	rm -rf dist/
	rm -rf src/Schiphol_API.egg-info
build-app: clean-directory run-test
	uv pip install build twine pytest
	python -m build
install-locally: build-app
	uv pip install -e .
push-app-pypi: build-app
	python -m twine upload --repository-url https://upload.pypi.org/legacy/ dist/*
