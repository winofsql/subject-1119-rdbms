select * from 取引データ;

-- MySQL の 非常識な表示
SELECT
    取引先コード
    ,商品コード
FROM
    取引データ
GROUP BY
    取引先コード;

-- 1) MySQL 取引先コード( 得意先 )
SELECT
    lightbox.取引データ.取引先コード
FROM
    lightbox.取引データ;

-- 2) GROUP BY に記述した列を表示できる
SELECT
    lightbox.取引データ.取引先コード
FROM
    lightbox.取引データ
GROUP BY
    lightbox.取引データ.取引先コード;

-- 3) 得意先毎の売り上げ金額
SELECT
    lightbox.取引データ.取引先コード,
    sum(lightbox.取引データ.金額) AS 売上金額
FROM
    lightbox.取引データ
GROUP BY
    lightbox.取引データ.取引先コード;

-- 4) カンマ編集
SELECT
    lightbox.取引データ.取引先コード,
    format(sum(lightbox.取引データ.金額), 0) AS 売上金額
FROM
    lightbox.取引データ
GROUP BY
    lightbox.取引データ.取引先コード;

-- 5) 取引件数
SELECT
    lightbox.取引データ.取引先コード,
    format(sum(lightbox.取引データ.金額), 0) AS 売上金額,
    count(lightbox.取引データ.取引先コード) AS 売上伝票行数
FROM
    lightbox.取引データ
GROUP BY
    lightbox.取引データ.取引先コード;

-- 6) 得意先マスタを結合
SELECT
    lightbox.取引データ.取引先コード,
    format(sum(lightbox.取引データ.金額), 0) AS 売上金額,
    count(lightbox.取引データ.取引先コード) AS 売上伝票行数
FROM
    lightbox.取引データ
    LEFT OUTER JOIN lightbox.得意先マスタ ON lightbox.取引データ.取引先コード = lightbox.得意先マスタ.得意先コード
GROUP BY
    lightbox.取引データ.取引先コード;

-- 7) 得意先マスタ名を表示
SELECT
    lightbox.取引データ.取引先コード,
    max(lightbox.得意先マスタ.得意先名) as 得意先名,
    format(sum(lightbox.取引データ.金額), 0) AS 売上金額,
    count(lightbox.取引データ.取引先コード) AS 売上伝票行数
FROM
    lightbox.取引データ
    LEFT OUTER JOIN lightbox.得意先マスタ ON lightbox.取引データ.取引先コード = lightbox.得意先マスタ.得意先コード
GROUP BY
    lightbox.取引データ.取引先コード;

-- 8) 得意先マスタ名を表示(MySQL 仕様)
SELECT
    lightbox.取引データ.取引先コード,
    lightbox.得意先マスタ.得意先名 as 得意先名,
    format(sum(lightbox.取引データ.金額), 0) AS 売上金額,
    count(lightbox.取引データ.取引先コード) AS 売上伝票行数
FROM
    lightbox.取引データ
    LEFT OUTER JOIN lightbox.得意先マスタ ON lightbox.取引データ.取引先コード = lightbox.得意先マスタ.得意先コード
GROUP BY
    lightbox.取引データ.取引先コード;