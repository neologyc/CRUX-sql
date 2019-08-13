SELECT
  origin,
  concat( CAST( round(fast_ttfb*100) AS STRING) , "%") fast_ttfb,
  concat( CAST( round(avg_ttfb*100) AS STRING) , "%") avg_ttfb,
  concat( CAST( round(slow_ttfb*100) AS STRING) , "%") slow_ttfb
FROM `chrome-ux-report.materialized.metrics_summary`
WHERE
date = '2019-07-01' AND
origin LIKE "https://www.firmy.cz" 
# pokud má web více subdomén, tak místo URL domény dejte: "%.firmy.cz"  


# SQL pro vás a vaši konkurenci
SELECT
  origin,
  concat( CAST( round(fast_ttfb*100) AS STRING) , "%") fast_ttfb,
  concat( CAST( round(avg_ttfb*100) AS STRING) , "%") avg_ttfb,
  concat( CAST( round(slow_ttfb*100) AS STRING) , "%") slow_ttfb
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
