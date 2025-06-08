#!/bin/bash

mkdir -p models

FILE_ID="1yJLDbWkv4gC2O8t8tCl13R-Ea6ZUvh9R"
COOKIE_FILE="/tmp/cookie.txt"

# 구글 드라이브 확인 토큰 받아오기 + 실제 다운로드
wget --quiet --save-cookies $COOKIE_FILE --keep-session-cookies --no-check-certificate \
     "https://docs.google.com/uc?export=download&id=${FILE_ID}" -O- | \
     sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1/p' > /tmp/confirm.txt

CONFIRM=$(< /tmp/confirm.txt)

wget --load-cookies $COOKIE_FILE "https://docs.google.com/uc?export=download&confirm=${CONFIRM}&id=${FILE_ID}" \
     -O models/model.tar.gz

rm -f $COOKIE_FILE /tmp/confirm.txt

tar -xzf models/model.tar.gz -C models/

rasa run --enable-api --port 5005 --model models
