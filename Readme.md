## k8s-shell

Experimental interactive shell for CRs with Java + fabric8 Kubernetes Client

## Try it!

Directly from your shell:

```bash
bash <(curl -sL https://raw.githubusercontent.com/andreaTP/playing-with-jbang/main/k8s-shell.sh) \
  https://raw.githubusercontent.com/fabric8io/kubernetes-client/master/java-generator/core/src/test/resources/crontab-crd.yml
```

Or in Docker:

```bash
docker run --entrypoint /bin/bash --rm -it jbangdev/jbang-action -c "bash <(curl -sL https://raw.githubusercontent.com/andreaTP/playing-with-jbang/main/k8s-shell.sh) https://raw.githubusercontent.com/fabric8io/kubernetes-client/master/java-generator/core/src/test/resources/crontab-crd.yml"
```


## Usage

`./k8s-shell.sh <crd-url> <optional-crd-name>`

Start an interactive shell with Crontab:
```
./k8s-shell.sh https://raw.githubusercontent.com/fabric8io/kubernetes-client/master/java-generator/core/src/test/resources/crontab-crd.yml
```

Start an interactive shell with Keycloak:
```
./k8s-shell.sh https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/main/kubernetes/keycloaks.k8s.keycloak.org-v1.yml
```

### Notes:

Use `jbang` with version `>= 0.93.0`.
