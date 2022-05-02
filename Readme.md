
Use `jbang` with version `>= 0.93.0`.

Start an interactive shell with Crontab:
```
./k8s-shell.sh https://raw.githubusercontent.com/fabric8io/kubernetes-client/master/java-generator/core/src/test/resources/crontab-crd.yml crontab
```

Start an interactive shell with Keycloak:
```
./k8s-shell.sh https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/main/kubernetes/keycloaks.k8s.keycloak.org-v1.yml keycloak
```

Directly from your shell:

```bash
bash <(curl -sL https://raw.githubusercontent.com/andreaTP/playing-with-jbang/main/k8s-shell.sh) \
  https://raw.githubusercontent.com/fabric8io/kubernetes-client/master/java-generator/core/src/test/resources/crontab-crd.yml \
  crontab
```
