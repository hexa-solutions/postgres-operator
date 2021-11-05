#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

SCRIPT_ROOT=$(dirname ${BASH_SOURCE})/..
CODEGEN_PKG=${CODEGEN_PKG:-$(cd ${SCRIPT_ROOT}; ls -d -1 ./vendor/k8s.io/code-generator 2>/dev/null || echo ${GOPATH}/pkg/mod/k8s.io/code-generator@v0.22.2)}

bash "${CODEGEN_PKG}/generate-groups.sh" all \
  github.com/zalando/postgres-operator/pkg/generated github.com/zalando/postgres-operator/pkg/apis \
  "acid.zalan.do:v1" \
  --go-header-file "${SCRIPT_ROOT}"/hack/custom-boilerplate.go.txt
