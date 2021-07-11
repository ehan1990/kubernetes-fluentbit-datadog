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

<img width="855" alt="Screen Shot 2021-07-11 at 10 47 28 AM" src="https://user-images.githubusercontent.com/1936983/125205183-e0f18200-e235-11eb-8395-428a95d65078.png">
<img width="855" alt="Screen Shot 2021-07-11 at 10 39 27 AM" src="https://user-images.githubusercontent.com/1936983/125205188-e353dc00-e235-11eb-9e6e-af722f4664b8.png">
