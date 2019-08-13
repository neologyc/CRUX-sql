SELECT
  origin,
  concat( CAST( round(fast_ttfb*100) AS STRING) , "%") fast__ttfb,
  concat( CAST( round(avg_ttfb*100) AS STRING) , "%") avg__ttfb,
  concat( CAST( round(slow_ttfb*100) AS STRING) , "%") slow__ttfb
FROM `chrome-ux-report.materialized.metrics_summary`
WHERE
date = '2019-07-01' AND
origin LIKE "https://www.firmy.cz" 
# pokud má web více subdomén, tak místo URL domény dejte: "%.firmy.cz"  


# SQL pro vás a vaši konkurenci a se seřazením od nejčastější fast_ttfb
SELECT
  origin,
  concat( CAST( round(fast_ttfb*100) AS STRING) , "%") fast__ttfb,
  concat( CAST( round(avg_ttfb*100) AS STRING) , "%") avg__ttfb,
  concat( CAST( round(slow_ttfb*100) AS STRING) , "%") slow__ttfb
FROM `chrome-ux-report.materialized.metrics_summary`
WHERE
date = '2019-07-01' AND 
(
  origin LIKE "https://www.zbozi.cz" OR 
  origin LIKE "https://www.heureka.cz" OR 
  origin LIKE "https://www.alza.cz" OR 
  origin LIKE "https://www.mall.cz" OR 
  origin LIKE "https://www.czc.cz"
)
ORDER BY fast_ttfb DESC LIMIT 100


# vytáhnout top 100 nejčastěji rychlých domén (na TTFB) (ale není to prováženo návštěvností)
SELECT
  origin,
  concat( CAST( round(fast_ttfb*100) AS STRING) , "%") fast__ttfb,
  concat( CAST( round(avg_ttfb*100) AS STRING) , "%") avg__ttfb,
  concat( CAST( round(slow_ttfb*100) AS STRING) , "%") slow__ttfb
FROM `chrome-ux-report.materialized.metrics_summary`
WHERE
date = '2019-07-01' AND 
(
  origin LIKE "%.cz" AND origin LIKE "https://%"
)
ORDER BY fast_ttfb DESC LIMIT 100
