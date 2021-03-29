FROM ubuntu:latest
ADD https://github.com/ZimoLoveShuang/wisedu-unified-login-api/releases/download/v1.0.19/wisedu-unified-login-api-v1.0.jar /home/server/
ENV TZ=Asia/Shanghai \
    TESSDATA_PREFIX=/usr/share/tesseract-ocr/4.00/tessdata
RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
    && apt update \
    && apt install --no-install-recommends -y tzdata  openjdk-8-jre tesseract-ocr \
    && ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && rm -rf /var/cache/apt/archives/ \
    && rm -rf /var/lib/apt/lists/*
EXPOSE 8080
CMD ["/usr/bin/java", "-jar", "/home/server/wisedu-unified-login-api-v1.0.jar"]
