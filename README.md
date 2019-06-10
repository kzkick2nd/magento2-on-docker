## Magento2 on Docker
Magento2 Docker 開発環境。

### 更新履歴
- 2019-06-08 構成を変更
- [Magento Advent Calendar 2018 - Adventar](https://adventar.org/calendars/3176) 17日目 バージョンアップ。
- [Magento Advent Calendar 2017 - Adventar](https://adventar.org/calendars/2349) 16日目 新規作成。

### 動作環境
- Docker 18.09.2
- Magento CE 2.3.1

### 推奨設定
composer をローカルにインストール + 追加設定を行うことで初期化を高速に行います。

```
$ brew install composer
$ composer config -g repos.packagist composer https://packagist.jp
$ composer global require hirak/prestissimo
```

##### Packagist.JP, prestissimo 公式情報
- [Packagist.JP](https://packagist.jp/)
- [hirak/prestissimo: composer parallel install plugin](https://github.com/hirak/prestissimo)

### 初期化（2ステップ）
#### 1. Magento2 auth key 取得
Magento Marketplace にログインし、auth キーペアを取得します。

[Get your authentication keys | Magento 2 Developer Documentation](https://devdocs.magento.com/guides/v2.3/install-gde/prereq/connect-auth.html)

#### 2. Docker 初期化 & Magento インストール
bin/setup スクリプトを実行します。

repo.magento.com へのログイン情報を求められたら(1)で取得したキーペアを入力します。

##### 項目名と対応キー: Username => Public Key, Password => Private Key

```
$ chmod +x bin/*
$ bin/setup
```

#### (OPT) 日本語化パッケージの導入

1. Marketplace で Localization 拡張を購入だけします。これで composer から取得可能になります。=> [Japanese Localization](https://marketplace.magento.com/community-engineering-japan-common.html)
2. 拡張導入スクリプトを実行します。

```
$ bin/localization_ja_JP
```

#### (OPT) 管理画面表示言語の変更
管理画面 Admin Setting の Interface Locale を日本語に変更します。

### 備考: DB 設定情報

| item | value |
|:--|:--|
| Database Host | `db` |
| Database Name | `magento` |
| Database Username | `root` |
| Database Password | なし |

### 備考: 各種コマンド

```
# bin/magento コマンド
$ docker-compose exec app bin/magento

# コンテナ log 出力
$ docker-compose logs -f
```

## TODO
- [x] ディレクトリ構成変更
- [x] bin/setup, bin/drop 追加
- [x] app => magento フォルダ名変更
- [x] composer install 型に変更
- [ ] スクリプト追加
    - [x] 日本語化公式拡張
    - [x] Deployer
    - [ ] 各種更新スクリプト
    - [ ] フロントエンド開発環境構築
    - [ ] テスト実行
- [ ] Magento2 ログの標準出力転送