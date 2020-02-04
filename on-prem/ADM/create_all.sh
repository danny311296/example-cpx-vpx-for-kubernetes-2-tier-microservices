mkdir .temp
cp *.yaml .temp/
source values.sh
sed -i "s,\`CIC_IMAGE\`,$CIC_IMAGE,g" .temp/*.yaml
sed -i "s,\`CPX_IMAGE\`,$CPX_IMAGE,g" .temp/*.yaml
sed -i "s/\`ADM_AGENT_IP\`/$ADM_AGENT_IP/g" .temp/*.yaml
sed -i "s/\`FINGERPRINT\`/$FINGERPRINT/g" .temp/*.yaml
sed -i "s/\`NAMESPACE\`/$NAMESPACE/g" .temp/*.yaml
kubectl create -f .temp/namespace.yaml 
kubectl create -f .temp/team_hotdrink.yaml -n $NAMESPACE
kubectl create -f .temp/hotdrink-secret.yaml -n $NAMESPACE
kubectl create -f .temp/rbac.yaml
kubectl create -f .temp/cpx.yaml -n $NAMESPACE
kubectl create -f .temp/team-guestbook.yaml -n $NAMESPACE
kubectl create -f .temp/tracing.yaml -n $NAMESPACE