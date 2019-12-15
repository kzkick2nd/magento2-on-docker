## Magento2 on Docker
ビルドと開発用途だけでなく、コンテナホスティングに対応した Magento2 用 コンテナイメージビルドスクリプト。

## 更新履歴
- [Magento Advent Calendar 2019 - Adventar](https://adventar.org/calendars/4213) 14日目 ホスティング対応、マルチステージ対応
- [Magento Advent Calendar 2018 - Adventar](https://adventar.org/calendars/3176) 17日目 Magento2 バージョンアップ対応
- [Magento Advent Calendar 2017 - Adventar](https://adventar.org/calendars/2349) 16日目 新規作成対応

## 動作環境
- Docker Desktop 19.03.5
- Magento Open Source 2.3.3

## 初期化の手順
### 1. Magento2 Marketplace Auth key を登録
- Magento Marketplace から Auth キーペアを取得します
    - [Get your authentication keys | Magento 2 Developer Documentation](https://devdocs.magento.com/guides/v2.3/install-gde/prereq/connect-auth.html)
- `.env.sample` を `.env` として複製保存し、環境変数に Auth キーペアを登録します

### 2. 初期化 & インストール
初期化スクリプトを実行します。

        $ chmod +x bin/*
        $ bin/setup

これで日本語化対応済みの Magento2 on Docker ローカル環境が立ち上がります。

## ローカル開発のヒント
この Magento2 on Docker スクリプトは、2019年バージョンから開発時の動作高速化のために Magento2 初期ファイルのローカル・コンテナ間同期をやめました。

ローカル同期をやめた理由は高速化以外にもあります。Magento2 開発では、提供される初期ファイルを編集することはバッドプラクティスですので、ソースコードリーディング以外でローカルに同期して参照する必要が無かったからです。

そのため、各種開発が必要な際には、都度 `docker-compose.yaml` の `app > volumes` 設定で、必要なディレクトリをローカルにマウントしてください。参考例として、標準出力ロガーサンプルモジュールを `app/code` 以下にマウントしています。

※ なお現在、Magento2 コードリーディング専用の Docker イメージも開発中です。

## docker-compose DB 初期パラメーター

| item | value |
|:--|:--|
| Database Host | `db` |
| Database Name | `magento` |
| Database Username | `root` |
| Database Password | なし |
