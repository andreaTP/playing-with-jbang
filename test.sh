#! /bin/bash
set -x

# download java-gen
# wget https://oss.sonatype.org/content/repositories/snapshots/io/fabric8/java-generator-cli/6.0-SNAPSHOT/java-generator-cli-6.0-20220426.024241-81.sh
# mv java-generator-cli-6.0-20220426.024241-81.sh java-gen.sh
# chmod a+x java-gen.sh


# # Get the Keycloak CRD
# wget https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/main/kubernetes/keycloaks.k8s.keycloak.org-v1.yml

# # Run java-gen
# ./java-gen.sh -add-extra-annotations=true --source=keycloaks.k8s.keycloak.org-v1.yml --target=${PWD}

# # Run Jbang
all_java_files=$(find ${PWD} -type f -name "*.java" | tr '\n' ' ')

# Doesn't work:
jbang --fresh --deps="io.fabric8:kubernetes-client:6.0-SNAPSHOT,io.sundr:builder-annotations:0.90.4,org.projectlombok:lombok:1.18.24" io.sundr:builder-annotations:0.90.4 --insecure --interactive ${all_java_files%?}

