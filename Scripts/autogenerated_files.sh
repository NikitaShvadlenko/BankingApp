#!/bin/sh

GENERATED_DIR="./BankingApp/Generated"
eval mkdir -p $GENERATED_DIR
eval touch $GENERATED_DIR/Strings+Generated.swift
eval touch $GENERATED_DIR/XCAssets+Generated.swift

swiftgen config run --config swiftgen.yml


SOURCERY_MODULES=(
	)

for MODULE in "${SOURCERY_MODULES[@]}"; do
	MODULE_DIR="${MODULES_FOLDER}/${MODULE}"
	sourcery --config "${MODULE_DIR}/.sourcery.yml"
done
