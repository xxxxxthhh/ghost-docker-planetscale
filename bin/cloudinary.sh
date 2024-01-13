#!/bin/bash

# Add the cloudinary storage adapter to Ghost
mkdir -p ./content/adapters/storage
cp -r ./node_modules/ghost-storage-cloudinary ./content/adapters/storage/cloudinary
