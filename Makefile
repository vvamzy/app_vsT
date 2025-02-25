# Define variables
IMAGE_NAME=trivy-test-app
CONTAINER_NAME=trivy-container
PORT=3000

# Default target
.PHONY: all
all: build run

# Build Docker image
.PHONY: build
build:
	docker build -t $(IMAGE_NAME) -f deploy/Dockerfile .

# Run the container
.PHONY: run
run:
	docker run -d --name $(CONTAINER_NAME) -p $(PORT):3000 $(IMAGE_NAME) -f deploy/Dockerfile .

# Stop and remove the container
.PHONY: stop
stop:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

# Run Trivy security scan
.PHONY: scan
scan:
	trivy image $(IMAGE_NAME)

