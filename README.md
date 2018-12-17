## Magento2 on local-docker sample
Magento2系をDockerローカルで動かすサンプルです。CE2.3.0で動作確認済みです。

### 更新履歴
- [Magento Advent Calendar 2018 - Adventar](https://adventar.org/calendars/3176) 17日目バージョンアップ。
- [Magento Advent Calendar 2017 - Adventar](https://adventar.org/calendars/2349) 16日目新規作成。

### 動作確認環境
- Docker version 18.09.0
- Magento CE 2.3.0

### 使い方
- 公式サイトからMagento2のアプリ本体を取得※ [DOWNLOAD RELEASES](https://magento.com/tech-resources/download)
- 取得した圧縮ファイルの中身を`./app/`以下に展開。
- Docker起動 `docker-compose up -d`
- `http://localhost/`からセットアップウィザード。※DB接続情報は以下参照。

| 項目 | 内容 |
|:--|:--|
| Database Server Host | `db` |
| Database Server Username | `root` |
| Database Server Password | なし |
| Database Name | `magento` |

### 備考
- アプリ本体を取得する方法のうちもっとも速いのは圧縮ファイルでのダウンロード

## TODO
- イメージもっと軽くしたい
- コンテナホスティング、例えばARUKASで動かしてみる