.PHONY: test test-cov test-html test-ci install clean

# Install dependencies
install:
	pip install -r requirements.txt

# Run tests
test:
	pytest

# Run tests with coverage
test-cov:
	pytest --cov=. --cov-report=term-missing --cov-fail-under=60

# Run tests and generate HTML coverage report
test-html:
	pytest --cov=. --cov-report=html --cov-fail-under=60
	@echo "Coverage report generated in htmlcov/index.html"

# Run tests with coverage threshold (CI mode)
test-ci:
	pytest --cov=. --cov-report=xml --cov-report=term-missing --cov-report=json --cov-fail-under=60 -v

# Clean test artifacts
clean:
	rm -rf .pytest_cache
	rm -rf htmlcov
	rm -rf .coverage
	rm -rf coverage.xml
	find . -type d -name __pycache__ -exec rm -r {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete

# Run tests in verbose mode
test-verbose:
	pytest -v

# Run specific test file
test-file:
	@if [ -z "$(FILE)" ]; then \
		echo "Usage: make test-file FILE=tests/test_device.py"; \
	else \
		pytest $(FILE) -v; \
	fi
