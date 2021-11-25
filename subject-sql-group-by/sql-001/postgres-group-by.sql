-- 1) MySQL 取引先コード( 得意先 )
SELECT
    lightbox.public.取引データ.取引先コード
FROM
    lightbox.public.取引データ;

-- 2) GROUP BY に記述した列を表示できる
SELECT
    lightbox.public.取引データ.取引先コード
FROM
    lightbox.public.取引データ
GROUP BY
    lightbox.public.取引データ.取引先コード;

-- 3) 得意先毎の売り上げ金額
SELECT
    lightbox.public.取引データ.取引先コード,
    sum(lightbox.public.取引データ.金額) AS 売上金額
FROM
    lightbox.public.取引データ
GROUP BY
    lightbox.public.取引データ.取引先コード;

-- 4) カンマ編集
SELECT
    lightbox.public.取引データ.取引先コード,
    to_char(sum(lightbox.public.取引データ.金額), 'fm999,999,999') AS 売上金額
FROM
    lightbox.public.取引データ
GROUP BY
    lightbox.public.取引データ.取引先コード;

-- 5) 取引件数
SELECT
    lightbox.public.取引データ.取引先コード,
    to_char(sum(lightbox.public.取引データ.金額), 'fm999,999,999') AS 売上金額,
    count(lightbox.public.取引データ.取引先コード) AS 売上伝票行数
FROM
    lightbox.public.取引データ
GROUP BY
    lightbox.public.取引データ.取引先コード;

-- 6) 得意先マスタを結合
SELECT
    lightbox.public.取引データ.取引先コード,
    to_char(sum(lightbox.public.取引データ.金額), 'fm999,999,999') AS 売上金額,
    count(lightbox.public.取引データ.取引先コード) AS 売上伝票行数
FROM
    lightbox.public.取引データ
    LEFT OUTER JOIN lightbox.public.得意先マスタ ON lightbox.public.取引データ.取引先コード = lightbox.public.得意先マスタ.得意先コード
GROUP BY
    lightbox.public.取引データ.取引先コード;

-- 7) 得意先マスタ名を表示
SELECT
    lightbox.public.取引データ.取引先コード,
    max(lightbox.public.得意先マスタ.得意先名) AS 得意先名,
    to_char(sum(lightbox.public.取引データ.金額), 'fm999,999,999') AS 売上金額,
    count(lightbox.public.取引データ.取引先コード) AS 売上伝票行数
FROM
    lightbox.public.取引データ
    LEFT OUTER JOIN lightbox.public.得意先マスタ ON lightbox.public.取引データ.取引先コード = lightbox.public.得意先マスタ.得意先コード
GROUP BY
    lightbox.public.取引データ.取引先コード;

-- 8) 得意先マスタ名を表示(MySQL 仕様なのでエラー)
SELECT
    lightbox.public.取引データ.取引先コード,
--    lightbox.public.得意先マスタ.得意先名 AS 得意先名,
    to_char(sum(lightbox.public.取引データ.金額), 'fm999,999,999') AS 売上金額,
    count(lightbox.public.取引データ.取引先コード) AS 売上伝票行数
FROM
    lightbox.public.取引データ
    LEFT OUTER JOIN lightbox.public.得意先マスタ ON lightbox.public.取引データ.取引先コード = lightbox.public.得意先マスタ.得意先コード
GROUP BY
    lightbox.public.取引データ.取引先コード;    