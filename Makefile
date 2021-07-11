
export HELLO_WORLD_VERSION=1.0.0
export LOGGER_VERSION=1.0.5

# API_KEY=redacted make setup-cluster
setup-cluster:
	make create-cluster
	make create-secret
	make rbac

build-all:
	make build-hello-world
	make build-logger

push-all:
	make push-hello-world
	make push-logger

deploy-all:
	make deploy-hello-world
	make deploy-logger


### Cluster
create-cluster:
	./cluster/create-local-registry-cluster.sh

# API_KEY=redacted make create-secret
create-secret:
	./cluster/create-secret.sh

delete-cluster:
	kind delete cluster

rbac:
	kubectl create namespace logging
	kubectl apply -f fluentbit/fluent-bit-service-account.yaml
	kubectl apply -f fluentbit/fluent-bit-role.yaml
	kubectl apply -f fluentbit/fluent-bit-role-binding.yaml
	kubectl apply -f fluentbit/fluent-bit-configmap.yaml


### hello-world

build-hello-world:
	docker build -f Dockerfile.helloworld -t localhost:5000/hello-world:${HELLO_WORLD_VERSION} .

run-hello-world:
	docker run --rm localhost:5000/hello-world:${HELLO_WORLD_VERSION}

push-hello-world:
	docker push localhost:5000/hello-world:${HELLO_WORLD_VERSION}

deploy-hello-world:
	kubectl apply -f hello-world/deployment.yaml

delete-hello-world:
	kubectl delete deploy hello-world


### logger

build-logger:
	docker build -f Dockerfile.fluentbit -t localhost:5000/logger:${LOGGER_VERSION} .

run-logger:
	docker run --rm localhost:5000/logger:${LOGGER_VERSION}

push-logger:
	docker push localhost:5000/logger:${LOGGER_VERSION}

deploy-logger:
	kubectl apply -f fluentbit/deployment.yaml

delete-logger:
	kubectl delete daemonset logger
