# 概要
## 要事前準備
・T-DASHのインストール
・tdash.exe setupの実行

## T-DASHで組んだテストケースをエクスポート
・syncディレクトリを、任意の箇所に配置する
・tdash.exeの起動オプションに--syncで↑のディレクトリを指定

## ログファイルの場所
ログファイルは、テスト実行時に作成される `tdash_test_logs` ディレクトリ内に保存されます。

パス例：
```
<このbatファイルのあるディレクトリ>\tdash_test_logs\yyyyMMdd_HHmmss.txt
```

`yyyyMMdd_HHmmss` の部分は、実行日時に応じて変わります。

yyyy,MM,dd,HH,mm,ssのそれぞれで、0埋めを行います

## 実行順
tdash.exeが起動中の場合testrunを実行できないので
①tdash.exeを強制終了するバッチ
②testrunを実行するバッチ
を用意

①の実行後、間を置いて(5分)②を実行するように
スケジューリングを実施

間を置いているのは、tdash.exeの強制終了直後に
tdashの内部でログファイル書き出しのエラーが発生するケースが
見つかったため