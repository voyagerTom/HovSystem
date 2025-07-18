### 【檔案說明】

- dockercps_DB_init.yaml: 是建立資料庫並初始化
- dockercps_hov_service.yaml: 是建立各項服務並初始化
- .env: compose 啟動所需的變數資料，使用者可自行設定

### 【資料夾說明】

- nginx: 放置 nginx 設定檔
- initdb: 放 PSQL 初始化的資料與 schema
- config: 放各個微服務縮需的設定檔
- postmanData: 放置 postman 環境資料以供測試使用

### 【docker compose 安裝說明】

<!--建立database-->

1.  docker-compose -f .\dockercps\DB_init.yaml up -d

    _#建立 database，待容器出現
    **database system is ready to accept connections**
    在進行步驟 2_

2.  docker-compose -f .\dockercps\hov\service.yaml up -d

    _#啟動服務_

3.  將 postman Json 檔匯入，即可依照 passenger / driver / admin 呼叫 API
