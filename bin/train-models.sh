#!/usr/bin/env bash

set -e

yolo train project=$1 name=$0 model=$0 data=datasets/$1/configs.yaml \
  epochs=200 batch=32 imgsz=640 device=0 workers=4 patience=20 augment=True

yolo val model=$1/$0/weights/best.pt data=datasets/$1/configs.yaml split=test

yolo export model=$1/$1/weights/best.pt format=onnx
