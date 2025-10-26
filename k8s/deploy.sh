set -e

NAME="k8s-demo-api"
USERNAME="lior114452"
IMAGE="$USERNAME/$NAME:0.1.0"

echo "Building Docker image..."
docker build -t $IMAGE .

echo "Pushing Docker image to Docker Hub..."
docker push $IMAGE

echo "Applying Kubernetes deployment..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Getting pods..."
kubectl get pods
echo "Getting services..."
kubectl get services

echo "Fetching the main service"
kubectl get services $NAME