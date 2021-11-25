# sqlite3-csv

## ダウンロード 
[sqlite-tools-win32-x86-3360000.zip](https://www.sqlite.org/download.html)

▼ createdb.txt ( DBファイル作成の為、tbl1 はダミー )
```
create table tbl1(one varchar(10), two smallint);
.quit
```

▼ コマンドプロンプト
```
sqlite3 dbname.sqlite3 < createdb.txt
```

[lightbox.sqlite3 ダウンロード](https://github.com/winofsql/resource-winofsql/raw/main/sqlite3/lightbox.sqlite3)\
[lightbox.sqlite3 create 文 ダウンロード](https://github.com/winofsql/resource-winofsql/raw/main/sqlite3/create-table.sql)

▼ lightbox.sqlite3 で CSV 出力 ( 1 )
```
sqlite3 lightbox.sqlite3 < csvget.txt
```
▼ csvget.txt
```
.headers on
.mode csv
.output syain.csv
SELECT * FROM 社員マスタ;
.quit
```

▼ lightbox.sqlite3 で CSV 出力 ( 2 ) : ファイル化するにはリダイレクト
```
sqlite3 -csv -header lightbox.sqlite3 "select * from 社員マスタ"
```

▼ csv インポートコマンド
```
.import csv_file_path table_name
```
