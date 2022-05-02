#! /bin/bash
set -x

CRD=$1
CRD_NAME=$2

read -r -d '' DEPENDENCIES << EOM
//DEPS io.fabric8:kubernetes-client:6.0-SNAPSHOT
//DEPS io.sundr:builder-annotations:0.90.4
//DEPS org.projectlombok:lombok:1.18.24
//DEPS io.sundr:builder-annotations:0.90.4
//DEPS javax.validation:validation-api:2.0.1.Final
EOM

TMP_DIR=$(mktemp -d -t $CRD_NAME)

wget ${CRD} -O $TMP_DIR/$CRD_NAME.yaml
mkdir -p $TMP_DIR/src

jbang --insecure io.fabric8:java-generator-cli:6.0-SNAPSHOT --add-extra-annotations=true --source=$TMP_DIR/$CRD_NAME.yaml --target=$TMP_DIR/src

echo "$DEPENDENCIES" > $TMP_DIR/$CRD_NAME.java
echo "//SOURCES src/**.java" >> $TMP_DIR/$CRD_NAME.java

(
  cd $TMP_DIR
  jbang export local --force $TMP_DIR/$CRD_NAME.java
)

echo "$DEPENDENCIES" > $TMP_DIR/$CRD_NAME.jsh

(
  cd $TMP_DIR
  jbang --class-path $TMP_DIR/$CRD_NAME.jar -i $TMP_DIR/$CRD_NAME.jsh
)

rm -rf $TMP_DIR
