## TODO
- [ ] bin/setup
- [ ] transport magento2 logs to stdout of docker log

## NOTE
- 各種設定項目の意味と位置
- 日本語化手順
- フロントエンド改造方法
- 決済モジュール追加方法
- Mageno2 運用フロー
        - 在庫
        - 注文
        - 決済
        - 運送会社連携
- API型カートシステム

## Magento2 on Docker
Magento2 を Docker で動かすサンプル。

### 更新履歴
- [Magento Advent Calendar 2018 - Adventar](https://adventar.org/calendars/3176) 17日目 バージョンアップ。
- [Magento Advent Calendar 2017 - Adventar](https://adventar.org/calendars/2349) 16日目 新規作成。

### 動作環境
- Docker 18.09.2
- Magento CE 2.3.1

### 初期化
#### 1. Magento2 取得
Magento2 "Full Release with Sample Data"(tar bz2) をダウンロードし、リポジトリルートに設置。

[Open Source Ecommerce Software & Solutions | Magento](https://magento.com/tech-resources/download)

#### 2. 環境構築手順

        $ tar xf Magento-CE-*.tar.bz2 -C app/
        $ chmod +x app/bin/magento

        # Docker 起動
        $ docker-compose up -d

        # セットアップ開始
        $ docker-compose exec app php -d memory_limit=-1 bin/magento setup:install \
            --base-url=http://localhost:8080 \
            --db-host=db \
            --db-name=magento \
            --db-user=root \
            --db-password= \
            --backend-frontname=admin \
            --admin-firstname=admin \
            --admin-lastname=admin \
            --admin-email=admin@example.com \
            --admin-user=admin \
            --admin-password=Passw0rd! \
            --language=ja_JP \
            --currency=JPY \
            --timezone=Asia/Tokyo \
            --use-rewrites=1

        $ open http://localhost:8080

##### DB 設定内容

|  |  |
|:--|:--|
| Database Host | `db` |
| Database Name | `magento` |
| Database Username | `root` |
| Database Password | なし |

#### 各種コマンド

        # bin/magento コマンド
        $ docker-compose exec app bin/magento

        # コンテナ log 出力
        $ docker-compose logs -f
