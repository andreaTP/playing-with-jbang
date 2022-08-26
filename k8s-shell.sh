#! /bin/bash
set -x

CRD=$1
CRD_NAME="${2:-default}"

# .XXXXXXX makes it cross-compatible Mac/Linux
TMP_DIR=$(mktemp -d -t $CRD_NAME.XXXXXXX)

curl -sL ${CRD} > $TMP_DIR/$CRD_NAME.yaml
mkdir -p $TMP_DIR/src

jbang --insecure io.fabric8:java-generator-cli:6.0.0 --add-extra-annotations=true --source=$TMP_DIR/$CRD_NAME.yaml --target=$TMP_DIR/src

cat <<EOF >> $TMP_DIR/$CRD_NAME.java
//DEPS io.fabric8:kubernetes-client:6.0.0
//DEPS io.sundr:builder-annotations:0.90.4
//DEPS org.projectlombok:lombok:1.18.24
//DEPS io.sundr:builder-annotations:0.90.4
//DEPS javax.validation:validation-api:2.0.1.Final
//SOURCES src/**.java
EOF

(
  cd $TMP_DIR
  jbang export portable --force $TMP_DIR/$CRD_NAME.java
  jbang --class-path $TMP_DIR/$CRD_NAME.jar -i
)

rm -rf $TMP_DIR
