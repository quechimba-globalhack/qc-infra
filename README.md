# qc-infra

Skaffold project using k8s

# Pre-requirements

| Requirement | Version |
| ----------- | ------: |
| Docker      | 19.03.8 |
| Skaffold    |  1.10.1 |

You also need to enable kubernetes with docker

# Running the infra project

Right now we are having issues with `qc-frontend` and `qc-api` artifacts, given taht this project is used only for spinning up the blockchain producer.

We recommend having the following folder structure to have the project correctly working:

```
-- project-folder
|----- `qc-infra`
|----- `qc-contracts`
|----- `qc-api`
|----- `qc-frontend`
```

Infra project is going to try to access other sevices relative to it's location, that is why the folder structure is important.

After having all dependencies installed you need to run the following steps:

1. `skaffold dev --port-forward`:
   the first time you run this command it will start pulling all docker images and this may take a while

2. Wait for the services to start, you may check if the block producer is running by executing: `kubectl get pods` you should see something like:
![running pods](/running-pods.png) this step is important because you need the pod name to connect to it and run blockchain initialization scripts

3. Running blockchain initialization scripts: connect to the running docker container in the contracts pod by running `kubectl exec -it [podname] -- /bin/bash` (Replace [podname] with the result form step 2) the command should look like this: 
```
qc-contracts-6c44855478-8pgxn
```

4. Run initialization scrips: Once inside the running container you now can initialize the demo data by running:
```
./scripts/init-chain.sh && ./scrips/seed.sh
```

Tha was the final step you can run any `cleos` command fromo inside the container to check the block producer status.