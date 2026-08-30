#!/usr/bin/env bash

set -e

m=""
d=""

while getopts ":m:d" opt; do
    case $opt in
        m) m="$OPTARG" ;;
        d) d="$OPTARG" ;;
    esac
done

yolo train project=$d name=$m model=$m.pt data=datasets/$d/configs.yaml \
    epochs=200 batch=32 imgsz=640 device=0 workers=4 patience=20 augment=True

yolo val model=$d/$m/weights/best.pt data=datasets/$d/configs.yaml split=test

yolo export model=$d/$m/weights/best.pt format=onnx
