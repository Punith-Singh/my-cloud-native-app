# Cloud-Native Application Development with IBM Cloud and Kubernetes

This project demonstrates how to develop a cloud-native application using **IBM Cloud**, **Kubernetes**, **Docker**, **Helm**, **Terraform**, **Istio**, **Prometheus**, and **Grafana**.

The application is based on **Flask** and **Python** and is deployed on Kubernetes using **Helm**. **Prometheus** and **Grafana** are used for monitoring, and **Istio** is used to manage the traffic.

---

## **Table of Contents**

1. [Prerequisites](#prerequisites)
2. [Setup Instructions](#setup-instructions)
   - [Clone the Repository](#clone-the-repository)
   - [Build Docker Image](#build-docker-image)
   - [Push Docker Image](#push-docker-image)
   - [Deploy the App with Helm](#deploy-the-app-with-helm)
3. [Monitoring and Observability](#monitoring-and-observability)
4. [Additional Features](#additional-features)
5. [Deployment Notes](#deployment-notes)
6. [Troubleshooting](#troubleshooting)
7. [Contributing](#contributing)
8. [License](#license)

---

## **Prerequisites**

To set up and run this project, you’ll need the following tools and accounts:

1. **IBM Cloud Account**: [Create one here](https://cloud.ibm.com/)
2. **Kubernetes Cluster**: You can use **IBM Cloud Kubernetes** or any cloud provider's Kubernetes service.
3. **Docker**: For building the application image. [Install Docker](https://www.docker.com/products/docker-desktop).
4. **Helm**: Kubernetes package manager for deploying applications. [Install Helm](https://helm.sh/docs/intro/install/).
5. **Terraform**: For provisioning infrastructure as code. [Install Terraform](https://www.terraform.io/downloads.html).
6. **Istio**: For managing microservice communication and traffic. [Install Istio](https://istio.io/latest/docs/setup/install/).
7. **Prometheus**: For monitoring application metrics. [Install Prometheus](https://prometheus.io/docs/prometheus/latest/getting_started/).
8. **Grafana**: For visualizing application metrics. [Install Grafana](https://grafana.com/docs/grafana/latest/getting-started/getting-started-grafana/).

---

## **Setup Instructions**

Follow these steps to set up and run the application.

### **Clone the Repository**

1) clone this repository to your local machine

2) docker build -t my-app .

3) Push Docker Image to Registry
    docker tag my-app your-dockerhub-username/my-app:v1
    docker login
    docker push your-dockerhub-username/my-app:v1

4) Configure Kubernetes Cluster
    ibmcloud login
    ibmcloud ks cluster create classic --name my-cluster
    ibmcloud ks cluster config --cluster my-cluster
    kubectl get nodes

5) Deploy App with Helm
    helm install my-app ./helm/my-app
    kubectl get pods


6) Access the App
    kubectl get svc

7) Monitoring with Prometheus and Grafana
    a)Install Prometheus: helm install prometheus prometheus-community/kube-prometheus-stack
    b)Port-forward Prometheus: kubectl port-forward svc/prometheus-grafana 3000:80
    c)Install Grafana: kubectl apply -f grafana/grafana-dashboard.yaml
    d)Port-forward Grafana: kubectl port-forward svc/grafana 3000:80

8) Traffic Management with Istio 
    a)Install istio: istioctl install --set profile=demo -y
    b)Deploy Istio Gateway and VirtualService: kubectl apply -f istio/gateway.yaml
                                        kubectl apply -f istiovirtualservice.yaml

9) Auto-Scale App: kubectl autoscale deployment my-app --cpu-percent=50 --min=2 --max=10




