#!/bin/bash

docker build -t qc-api:latest ../qc-api/
docker build -t qc-contracts:latest ../qc-contracts/
docker build -t qc-frontend:latest ../qc-frontend/
