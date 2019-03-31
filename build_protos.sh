#!/bin/bash

working_dir=$(pwd)
proto_dirs=($(pwd)/trainingInstance)

for dir in $proto_dirs
do
    srcdir=$dir/protos #./trainingInstance/protos
    destdir=$dir/app #./trainingInstance/app
    echo Building $dir protos...

    python3 -m grpc_tools.protoc\
        --proto_path=$srcdir\
        --python_out=$destdir\
        --grpc_python_out=$destdir\
        $srcdir/*.proto #./trainingInstance/protos/*.proto

done