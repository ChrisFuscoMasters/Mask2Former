cd mask2former/modeling/pixel_decoder/ops
python3 setup.py build install
cd ../../../../
python train_net.py --num-gpus 8 --config-file configs/coco/panoptic-segmentation/maskformer2_R50_bs16_50ep.yaml OUTPUT_DIR ~/data/detectron2_training_output