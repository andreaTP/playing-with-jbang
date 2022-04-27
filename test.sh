#! /bin/bash
set -x


# # Get the Keycloak CRD
# wget https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/main/kubernetes/keycloaks.k8s.keycloak.org-v1.yml

# Run java-gen via alias k8s-java-gen in .jbang-catalog.json
mkdir -p src
jbang --insecure k8s-java-gen --add-extra-annotations=true --source=keycloaks.k8s.keycloak.org-v1.yml --target=${PWD}

# build a jar out of src/**.java included in Main.java + dependencies
jbang export local Main.java

# run Main.jsh
jbang --class-path Main.jar -i Main.jsh
