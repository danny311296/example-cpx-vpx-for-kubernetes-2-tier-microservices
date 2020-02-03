kubectl delete namespace sg-demo
kubectl delete -f .temp/rbac.yaml --ignore-not-found
rm -rf .temp
