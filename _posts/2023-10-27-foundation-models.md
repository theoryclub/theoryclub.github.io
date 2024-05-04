---
title: "Training Large-scale Foundation Models on Emerging AI Accelerators"
header: Training Large-scale Foundation Models on Emerging AI Accelerators
date: 2023-10-27 00:00:00 -0400
categories: blog
---

We had Dr. Jun (Luke) Huan, a principal scientist at AWS AI Labs
give a talk on training foundation models with new hardware.

Abstract: Foundation models such as GPT-4 have garnered significant interest
from both academia and industry. An outstanding feature of such models is
so-called emergent capabilities, including multi-step reasoning, instruction
following, and model calibration, in a wide range of application domains.
Such capabilities were previously only attainable with specially designed
ML models, such as those using carefully constructed knowledge graphs, in
specific domains. As the capabilities of foundation models have increased, so
too have their sizes at a rate much faster than Moore's law. The training of
foundation models requires massive computing power. For instance, training a
BERT model on a single state-of-the-art GPU machine with multi-A100 chips can
take several days, while training GPT-3 models on a large multi-instance GPU
cluster can take several months to complete the estimated 3\*10^23 flops.

This talk provides an overview of the latest progress in supporting foundation
model training and inference with new AI accelerators. It reviews progress
on the modeling side, with an emphasis on the transformer architecture, and
presents the system architecture supporting training and serving foundation
models.
