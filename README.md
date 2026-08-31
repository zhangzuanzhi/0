# 任务一：妙脆角猫 & 刀盾 目标检测

## 一、任务说明

训练一个 YOLOv8 目标检测模型，同时检测两类目标：

- **cat**：妙脆角猫
- **dog**：刀盾（刀盾狗）

最终输出推理演示视频，检测框实时框出目标并标出类别。

## 二、环境

| 项目 | 配置 |
| --- | --- |
| 硬件 | AutoDL RTX 3080Ti (12GB) ×1 |
| 系统 | Ubuntu 22.04 |
| Python | 3.10.8 |
| PyTorch | 2.1.2+cu118 |
| numpy | 1.26.4 |
| opencv-python | 4.10.0 |
| ultralytics | 8.4.135 |

## 三、数据集

- **来源**：网络采集图片 + 素材视频抽帧(非效果表现视频)标注
- **总数**：约 79 张（妙脆角猫 29 + 刀盾狗 41 + 素视频抽帧 9）
- **划分**：train / val = 8 : 2
- **标注工具**：makesense.ai（在线标注），导出 COCO 格式后经脚本转 YOLO 格式
- **类别**：`0 = cat`，`1 = dog`
- **目录结构**：

```
task1_combined/
├── data.yaml
├── images/
│   ├── train/   (65 张)
│   └── val/     (14 张)
└── labels/
    ├── train/   (65 个 txt)
    └── val/     (14 个 txt)
```

## 四、训练

```bash
yolo detect train \
  model=yolov8n.pt \
  data=task1_combined/data.yaml \
  epochs=100 \
  imgsz=640 \
  batch=16 \
  device=0
```

## 五、结果

最终模型：`runs/detect/train-6/weights/best.pt`

| 类别 | Precision | Recall | mAP50 | mAP50-95 |
| --- | --- | --- | --- | --- |
| cat | 0.861 | 0.875 | 0.907 | 0.745 |
| dog | 0.929 | 0.895 | 0.892 | 0.685 |
| **all** | **0.895** | **0.885** | **0.899** | **0.715** |

## 六、推理演示

```bash
yolo detect predict \
  model=runs/detect/train-6/weights/best.pt \
  source=演示视频.mp4 \
  conf=0.25 \
  save=True
```

- 输入：任意视频/图片
- 输出：带检测框（框出 cat / dog 并标注类别与置信度）的推理视频
- 演示视频：`task1_demo_v2.mp4`

## 七、说明

- 数据量较小（约 79 张），模型对个别相似颜色目标存在轻微误检（如颜色相近的猫被识别成狗、泥土误检成猫），整体检测效果良好。
- 后续可增加数据量、数据增强进一步提升稳定性。
