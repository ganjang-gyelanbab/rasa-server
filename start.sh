#!/bin/bash

# models 폴더 없으면 생성
mkdir -p models

# 구글 드라이브 파일 ID (자신 파일 ID로 바꿔주세요)
FILE_ID="1yJLDbWkv4gC2O8t8tCl13R-Ea6ZUvh9R"

# 구글 드라이브 직접 다운로드 URL 생성
DOWNLOAD_URL="https://drive.google.com/uc?export=download&id=${FILE_ID}"

# wget으로 모델 파일 다운로드 (models/model.tar.gz에 저장)
wget --no-check-certificate "${DOWNLOAD_URL}" -O models/model.tar.gz

# Rasa 서버 실행 (포트 5005, 모델 경로 지정)
rasa run --enable-api --port 5005 --model models/model.tar.gz
