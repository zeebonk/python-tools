#!/bin/sh
set -eo pipefail

SETUP_CFG="$WORKDIR/setup.cfg"
PRETTIERRC="$WORKDIR/.prettierrc"

cd /src

if [ "$1" = "check" ]; then
    if [ "$2" = "python" ] || [ "$2" = "all" ]; then
        echo "Checking with isort"
        isort --check-only --diff --settings-path $SETUP_CFG */**.py
        echo "Checking with black"
        black --check --diff --quiet .
        echo "Chekcking with flake8"
        flake8 --config $SETUP_CFG
    fi
    if [ "$2" = "markdown" ] || [ "$2" = "all" ]; then
        echo "Checking markdown with prettier"
        prettier --config $PRETTIERRC --parser markdown --check **/*.md
    fi
    if [ "$2" = "json" ] || [ "$2" = "all" ]; then
        echo "Checking json with prettier"
        prettier --config $PRETTIERRC --parser json --check **/*.json
    fi
    if [ "$2" = "yaml" ] || [ "$2" = "all" ]; then
        echo "Checking yaml with prettier"
        prettier --config $PRETTIERRC --parser yaml --check **/*.y*ml
    fi
fi

if [ "$1" = "format" ]; then
    if [ "$2" = "python" ] || [ "$2" = "all" ]; then
        echo "Formatting with isort"
        isort -y --settings-path $SETUP_CFG
        echo "Formatting with black"
        black .
    fi
    if [ "$2" = "markdown" ] || [ "$2" = "all" ]; then
        echo "Formatting markdown with prettier"
        prettier --config $PRETTIERRC --parser markdown --write **/*.md
    fi
    if [ "$2" = "json" ] || [ "$2" = "all" ]; then
        echo "Formatting json with prettier"
        prettier --config $PRETTIERRC --parser json --write **/*.json
    fi
    if [ "$2" = "yaml" ] || [ "$2" = "all" ]; then
        echo "Formatting yaml with prettier"
        prettier --config $PRETTIERRC --parser yaml --write **/*.yml
    fi
fi

