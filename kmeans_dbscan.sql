SELECT
    SUM(count)::integer count,
    JSON_Agg(JSON_Build_Object(cat, count)) cat,
    ST_AsGeoJson(ST_PointOnSurface(ST_Union(geom))) geomj
  FROM (
    SELECT
      COUNT(cat) count,
      ST_Union(geom) geom,
      cat,
      kmeans_cid,
      dbscan_cid
    FROM (
      SELECT
        cat,
        kmeans_cid,
        geom AS geom,
        ST_ClusterDBSCAN(geom, 0.009, 1) OVER (PARTITION BY kmeans_cid) dbscan_cid
      FROM (
        SELECT
          folio AS cat,
          ST_ClusterKMeans(geom, 20) OVER () kmeans_cid,
          geom
        FROM (select folio, fecha_hora, geom from llamadas_9112018 l 
		where date_part('minute', fecha_hora) >= 50 and date_part('hour', fecha_hora) = 20 and date_part('month', fecha_hora) = 8 
		and date_part('day', fecha_hora) = 5  ) lp 
      ) kmeans
    ) dbscan GROUP BY kmeans_cid, dbscan_cid, cat
  ) cluster GROUP BY kmeans_cid, dbscan_cid;
