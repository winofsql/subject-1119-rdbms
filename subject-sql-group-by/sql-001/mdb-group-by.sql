-- 1) MySQL 取引先コード( 得意先 )
SELECT
    取引先コード
FROM
    OPENDATASOURCE('Microsoft.ACE.OLEDB.12.0','Data Source=C:\app\workspace\販売管理.mdb')...取引データ;

-- 2) GROUP BY に記述した列を表示できる
SELECT
    取引先コード
FROM
    OPENDATASOURCE('Microsoft.ACE.OLEDB.12.0','Data Source=C:\app\workspace\販売管理.mdb')...取引データ
GROUP BY
    取引先コード;

-- 3) 得意先毎の売り上げ金額
SELECT
    取引先コード,
    sum(金額) AS 売上金額
FROM
    OPENDATASOURCE('Microsoft.ACE.OLEDB.12.0','Data Source=C:\app\workspace\販売管理.mdb')...取引データ
GROUP BY
    取引先コード;

-- 4) カンマ編集
SELECT
    取引先コード,
    format(sum(金額), '#,##0') AS 売上金額
FROM
    OPENDATASOURCE('Microsoft.ACE.OLEDB.12.0','Data Source=C:\app\workspace\販売管理.mdb')...取引データ
GROUP BY
    取引先コード;

-- 5) 取引件数
SELECT
    取引先コード,
    format(sum(金額), '#,##0') AS 売上金額,
    count(取引先コード) AS 売上伝票行数
FROM
    OPENDATASOURCE('Microsoft.ACE.OLEDB.12.0','Data Source=C:\app\workspace\販売管理.mdb')...取引データ
GROUP BY
    取引先コード;

-- 6) 得意先マスタを結合
SELECT
    取引先コード,
    format(sum(金額), '#,##0') AS 売上金額,
    count(取引先コード) AS 売上伝票行数
FROM
    OPENDATASOURCE('Microsoft.ACE.OLEDB.12.0','Data Source=C:\app\workspace\販売管理.mdb')...取引データ
    LEFT OUTER JOIN OPENDATASOURCE('Microsoft.ACE.OLEDB.12.0','Data Source=C:\app\workspace\販売管理.mdb')...得意先マスタ ON 取引先コード = 得意先コード
GROUP BY
    取引先コード;

-- 7) 得意先マスタ名を表示
SELECT
    取引先コード,
    max(得意先名) AS 得意先名,
    format(sum(金額), '#,##0') AS 売上金額,
    count(取引先コード) AS 売上伝票行数
FROM
    OPENDATASOURCE('Microsoft.ACE.OLEDB.12.0','Data Source=C:\app\workspace\販売管理.mdb')...取引データ
    LEFT OUTER JOIN OPENDATASOURCE('Microsoft.ACE.OLEDB.12.0','Data Source=C:\app\workspace\販売管理.accdb')...得意先マスタ ON 取引先コード = 得意先コード
GROUP BY
    取引先コード;

-- 8) 得意先マスタ名を表示(MySQL 仕様なのでエラー)
SELECT
    取引先コード,
    得意先名,
    format(sum(金額), '#,##0') AS 売上金額,
    count(取引先コード) AS 売上伝票行数
FROM
    OPENDATASOURCE('Microsoft.ACE.OLEDB.12.0','Data Source=C:\app\workspace\販売管理.mdb')...取引データ
    LEFT OUTER JOIN OPENDATASOURCE('Microsoft.ACE.OLEDB.12.0','Data Source=C:\app\workspace\販売管理.mdb')...得意先マスタ ON 取引先コード = 得意先コード
GROUP BY
    取引先コード;
