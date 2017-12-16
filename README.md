# 意識低めのMagento2 on Docker
[Magento Advent Calendar 2017](https://adventar.org/calendars/2349) 16日目の成果物です。

## 動作環境
- Docker For Mac (latest)

## 使い方
- Magento公式から欲しいMagentoのzipを取得&解凍 [https://magento.com/tech-resources/download](https://magento.com/tech-resources/download)
- `./html`内の.gitignoreを削除して、解凍したMagentoファイルを設置
- `docker-compose up -d`
- `http://localhost/`にアクセス、セットアップウィザードを完了させて起動。DB接続情報は以下。

| 項目 | 内容 |
|:--|:--|
| Database Server Host | `db` |
| Database Server Username | `root` |
| Database Server Password | `Passw0rd!` |
