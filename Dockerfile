FROM python:3.10-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential libgl1 libglib2.0-0 \
    tesseract-ocr ghostscript git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# 先裝 Marker
RUN pip install --no-cache-dir marker-pdf

# 強制安裝 2026 年最新支援 Blackwell (sm_120) 的 Nightly 版
# 這是目前唯一能驅動 RTX 5070 的解法
RUN pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu128 --upgrade