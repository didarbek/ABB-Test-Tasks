### Task description:

1. You use the same micro-services application with the same APIs you developed for the step-project
2. This time you deploy your application not to a set of EC2-instances managed by Auto-Scaling Groups but to a Kubernees cluster
3. The database part is not scalable — no specific requirements to its architecture
4. The front-end and the back-end parts must be independently scalable
5. The K8s-cluster will be running on your local computer. Use minikube tool for running the cluster. AWS is not used in this project.
6. Docker images are allowed to store on any type of docker-registry: a local one, dockerhub or wahtever you will be able to configure accees to
7. Jenkins server is to be used for CI/CD flow for the services. You may install it locally but it’s up to you
8. Jenkins pipelines for rebuildng the microservices of your application are to be created
9. Jenkins pipelines for rolling-out the microservices in case of faulty builds are to be created
10. Jenkins pipeline must incorporate Sonarqube with check of existing code Statement Coverage configured for 80% (if Sonarqube lessons will be provided)
11. You must create unit tests for the services using AssertThat statement — not assertEquals
12. You must mock controller in the tests
13. You must mock data layer in unit tests
14. (optional) It would be great if you implement asynchronous communication via redis/kafka among the services
