-- 1) MySQL 取引先コード( 得意先 )
SELECT
    lightbox.dbo.取引データ.取引先コード
FROM
    lightbox.dbo.取引データ;

-- 2) GROUP BY に記述した列を表示できる
SELECT
    lightbox.dbo.取引データ.取引先コード
FROM
    lightbox.dbo.取引データ
GROUP BY
    lightbox.dbo.取引データ.取引先コード;

-- 3) 得意先毎の売り上げ金額
SELECT
    lightbox.dbo.取引データ.取引先コード,
    sum(lightbox.dbo.取引データ.金額) AS 売上金額
FROM
    lightbox.dbo.取引データ
GROUP BY
    lightbox.dbo.取引データ.取引先コード;

-- 4) カンマ編集
SELECT
    lightbox.dbo.取引データ.取引先コード,
    format(sum(lightbox.dbo.取引データ.金額), '#,##0') AS 売上金額
FROM
    lightbox.dbo.取引データ
GROUP BY
    lightbox.dbo.取引データ.取引先コード;

-- 5) 取引件数
SELECT
    lightbox.dbo.取引データ.取引先コード,
    format(sum(lightbox.dbo.取引データ.金額), '#,##0') AS 売上金額,
    count(lightbox.dbo.取引データ.取引先コード) AS 売上伝票行数
FROM
    lightbox.dbo.取引データ
GROUP BY
    lightbox.dbo.取引データ.取引先コード;

-- 6) 得意先マスタを結合
SELECT
    lightbox.dbo.取引データ.取引先コード,
    format(sum(lightbox.dbo.取引データ.金額), '#,##0') AS 売上金額,
    count(lightbox.dbo.取引データ.取引先コード) AS 売上伝票行数
FROM
    lightbox.dbo.取引データ
    LEFT OUTER JOIN lightbox.dbo.得意先マスタ ON lightbox.dbo.取引データ.取引先コード = lightbox.dbo.得意先マスタ.得意先コード
GROUP BY
    lightbox.dbo.取引データ.取引先コード;

-- 7) 得意先マスタ名を表示
SELECT
    lightbox.dbo.取引データ.取引先コード,
    max(lightbox.dbo.得意先マスタ.得意先名) AS 得意先名,
    format(sum(lightbox.dbo.取引データ.金額), '#,##0') AS 売上金額,
    count(lightbox.dbo.取引データ.取引先コード) AS 売上伝票行数
FROM
    lightbox.dbo.取引データ
    LEFT OUTER JOIN lightbox.dbo.得意先マスタ ON lightbox.dbo.取引データ.取引先コード = lightbox.dbo.得意先マスタ.得意先コード
GROUP BY
    lightbox.dbo.取引データ.取引先コード;

-- 8) 得意先マスタ名を表示(MySQL 仕様なのでエラー)
SELECT
    lightbox.dbo.取引データ.取引先コード,
    lightbox.dbo.得意先マスタ.得意先名 AS 得意先名,
    format(sum(lightbox.dbo.取引データ.金額), '#,##0') AS 売上金額,
    count(lightbox.dbo.取引データ.取引先コード) AS 売上伝票行数
FROM
    lightbox.dbo.取引データ
    LEFT OUTER JOIN lightbox.dbo.得意先マスタ ON lightbox.dbo.取引データ.取引先コード = lightbox.dbo.得意先マスタ.得意先コード
GROUP BY
    lightbox.dbo.取引データ.取引先コード;    