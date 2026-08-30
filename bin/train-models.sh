#!/usr/bin/env bash

set -e

yolo train project=$2 name=$1 model=$1.pt data=datasets/$2/configs.yaml \
  epochs=200 batch=32 imgsz=640 device=0 workers=4 patience=20 augment=True

yolo val model=$2/$1/weights/best.pt data=datasets/$2/configs.yaml split=test

yolo export model=$2/$1/weights/best.pt format=onnx
