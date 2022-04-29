#! /bin/bash
set -x

CRD=$1
CRD_NAME=$2

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

tmp_dir=$(mktemp -d -t $CRD_NAME)

wget ${CRD} -O $tmp_dir/$CRD_NAME.yaml
mkdir -p $tmp_dir/src
$SCRIPT_DIR/jbang/bin/jbang --insecure k8s-java-gen --add-extra-annotations=true --source=$tmp_dir/$CRD_NAME.yaml --target=$tmp_dir/src

cat <<EOF >> $tmp_dir/$CRD_NAME.java
//DEPS io.fabric8:kubernetes-client:6.0-SNAPSHOT
//DEPS io.sundr:builder-annotations:0.90.4
//DEPS org.projectlombok:lombok:1.18.24
//DEPS io.sundr:builder-annotations:0.90.4
//DEPS javax.validation:validation-api:2.0.1.Final
//SOURCES src/**.java

public class $CRD_NAME {}
EOF

(
  cd $tmp_dir
  $SCRIPT_DIR/jbang/bin/jbang export local --force $tmp_dir/$CRD_NAME.java
)

cat <<EOF >> $tmp_dir/$CRD_NAME.jsh
//DEPS io.fabric8:kubernetes-client:6.0-SNAPSHOT
//DEPS io.sundr:builder-annotations:0.90.4
//DEPS org.projectlombok:lombok:1.18.24
//DEPS io.sundr:builder-annotations:0.90.4
//DEPS javax.validation:validation-api:2.0.1.Final
EOF

(
  cd $tmp_dir
  $SCRIPT_DIR/jbang/bin/jbang --class-path $tmp_dir/$CRD_NAME.jar -i $tmp_dir/$CRD_NAME.jsh
)

rm -rf $tmp_dir
