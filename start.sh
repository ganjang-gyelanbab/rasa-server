#!/bin/bash

# models 폴더 만들기
mkdir -p models

# 구글 드라이브 파일 ID
FILE_ID="1yJLDbWkv4gC2O8t8tCl13R-Ea6ZUvh9R"

# 다운로드 URL 생성
DOWNLOAD_URL="https://drive.google.com/uc?export=download&id=${FILE_ID}"

# 모델 다운로드 (wget으로 다운로드, 확인 페이지 우회 안 할 경우 간단히)
wget --no-check-certificate "${DOWNLOAD_URL}" -O models/model.tar.gz

# 압축 해제
tar -xzf models/model.tar.gz -C models/

# Rasa 서버 실행 (models 폴더를 모델 경로로 지정)
rasa run --enable-api --port 5005 --model models
