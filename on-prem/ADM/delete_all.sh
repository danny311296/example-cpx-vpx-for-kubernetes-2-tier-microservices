source values.sh
kubectl delete namespace $NAMESPACE 
kubectl delete -f .temp/rbac.yaml --ignore-not-found
rm -rf .temp
