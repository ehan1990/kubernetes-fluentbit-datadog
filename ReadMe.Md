### Forward logs to Datadog using Kubernetes and Fluentbit

### Steps

```
# clone repo 
https://github.com/ehan1990/kubernetes-fluentbit-datadog.git

# create local k8 cluster, registry, rbac and datadog secret store
API_KEY=redacted make create-cluster

# build simple python app & logging agent
make build-all

# push images to local registry
make push all

# deploy python app and logging-agent to local k8 cluster
make deploy-all
```
