#! /bin/sh
server=https://kubernetes.docker.internal:6443

ca=$(base64 -w 0 < /var/run/secrets/kubernetes.io/serviceaccount/ca.crt)
token=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)
namespace=$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)

mkdir -p /root/.kube

echo "
apiVersion: v1
kind: Config
clusters:
- name: docker-desktop
  cluster:
    certificate-authority-data: ${ca}
    server: ${server}
contexts:
- name: docker-desktop
  context:
    cluster: docker-desktop
    namesapce: ${namespace}
    user: default-user
current-context: docker-desktop
users:
- name: docker-desktop
  user:
    token: ${token}
" > /root/.kube/config
octant