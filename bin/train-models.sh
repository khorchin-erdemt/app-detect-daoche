#!/usr/bin/env bash

set -e

yolo train project=yolo name=exp model=$0 data=datasets/$1/configs.yaml \
  epochs=200 batch=32 imgsz=640 device=0 workers=4 patience=20 augment=True

yolo val model=yolo/exp/weights/best.pt data=datasets/$1/configs.yaml split=test

yolo export model=yolo/exp/weights/best.pt format=onnx
