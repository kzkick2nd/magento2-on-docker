# 意識低めのMagento2 on Docker
[Magento Advent Calendar 2017](https://adventar.org/calendars/2349) 16日目の成果物。

できるだけ手軽にMagento2の開発環境を構築する実験。

- Magento会員登録が必要なのでMagento本体を含めるのはボツ。
- ホストComposerのキャッシュ利用を狙ったが、ホスト側依存関係の処理が手間なためボツ。
- 今のところzipで取ってくるのがベター。

## 動作環境
- Docker For Mac (17.12.0)
- Magento 2.2.3

## 使い方
- 公式から2.2.3のzipを取得 [https://magento.com/tech-resources/download](https://magento.com/tech-resources/download)
- 取得したzipをプロジェクトディレクトリに展開。（このREADME.mdと同階層）
- Docker-composeを起動 `docker-compose up -d`
- `http://localhost/`からセットアップウィザード。以下のDB接続情報を利用。

| 項目 | 内容 |
|:--|:--|
| Database Server Host | `db` |
| Database Server Username | `root` |
| Database Server Password | なし |
| Database Name | `magento` |

## 備考
- apacheとmysqlのログは`./docker-logs`にマウント済み
