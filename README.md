## TODO
- [x] bin/setup
- [x] app => magento2 フォルダ名変更
- [ ] transport magento2 logs to stdout of docker log
- [x] composer install 型に変更
- [ ] Magento2 日本語化方法
- [ ] Magento2 アップデート方法
- [ ] Magento2 フロント更新手順
- [ ] Magento2 決済モジュール追加手順
- [ ] デプロイ時のセキュア設定忘れずに

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

### 推奨設定
composer をローカルにインストール + 追加設定を行うことで初期化を高速化します。

        $ brew install composer
        $ composer config -g repos.packagist composer https://packagist.jp
        $ composer global require hirak/prestissimo

#### Packagist.JP and prestissimo
- [Packagist.JP](https://packagist.jp/)
- [hirak/prestissimo: composer parallel install plugin](https://github.com/hirak/prestissimo)

### 初期化（2ステップ）
#### 1. Magento2 auth key 取得
Magento Marketplace にログインし、auth キーペアを取得する。

=> [Get your authentication keys | Magento 2 Developer Documentation](https://devdocs.magento.com/guides/v2.3/install-gde/prereq/connect-auth.html)

#### 2. 環境構築手順
bin/setup スクリプトを実行する。
repo.magento.com へのログイン情報を求められたら(1)で取得したキーペアを入力する。(Username = Public Key, Password = Private Key)

        $ chmod +x bin/*
        $ bin/setup

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
