
Build `jbang` from this branch:
https://github.com/andreaTP/jbang/tree/build-jar-no-main

In this folder:
```
tar -xvf .../jbang/build/distributions/jbang.tar
```

Start an interactive shell with Crontab:
```
./k8s-shell.sh https://raw.githubusercontent.com/fabric8io/kubernetes-client/master/java-generator/core/src/test/resources/crontab-crd.yml crontab
```

Start an interactive shell with Keycloak:
```
./k8s-shell.sh https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/main/kubernetes/keycloaks.k8s.keycloak.org-v1.yml keycloak
```