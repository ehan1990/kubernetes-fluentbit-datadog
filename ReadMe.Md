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

<img width="865" alt="Screen Shot 2021-07-11 at 10 51 44 AM" src="https://user-images.githubusercontent.com/1936983/125205208-03839b00-e236-11eb-8f9e-0c99430dcf08.png">
<img width="1083" alt="Screen Shot 2021-07-11 at 10 51 36 AM" src="https://user-images.githubusercontent.com/1936983/125205216-07afb880-e236-11eb-8ff8-f1eaa3dd8249.png">

