#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. ${DIR}/common.sh

EXTRA_ARGS=""
if [ $# -ge 1 ]; then
	EXTRA_ARGS="--clear"
fi

TOOLCHAIN=ios-9-1-arm64

rename_tab gatherer $TOOLCHAIN

function build_all
{
    COMMANDS=(
        "--toolchain ${TOOLCHAIN} "
        "--verbose "
        "--fwd HUNTER_CONFIGURATION_TYPES=Release "
        "USE_OGLES_GPGPU=ON "
        "${GATHERER_BUILD_ARGS[*]} "
        "CMAKE_XCODE_ATTRIBUTE_IPHONEOS_DEPLOYMENT_TARGET=8.0 "
        "--config Release "
        "--jobs 8 "
        "--open "
        "--reconfig "
        "--nobuild "
        "${EXTRA_ARGS}"
    )
    
	build.py ${COMMANDS[*]}
}

(cd ${DIR}/.. && build_all)



