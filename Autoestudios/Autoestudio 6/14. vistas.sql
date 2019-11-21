CREATE VIEW hard14 AS (
	SELECT m_name,'LIVES_IN' as nature , place_town as ciudad
	FROM musician,place
	WHERE place_no = living_in)
	UNION
	(SELECT m_name,'BORN_IN' , place_town
	FROM musician,place
	WHERE place_no = born_in)
	UNION
	(SELECT m_name,'PERFORMED_IN' , place_town
	FROM musician,place,performance,concert
	WHERE m_no = conducted_by and performed_in = concert_no and concert_in = place_no)
	UNION
	(SELECT m_name,'IN_BAND_IN' , place_town
	FROM musician,performer,plays_in,band,place
	WHERE m_no=perf_is and perf_no = player and band_no = band_id and band_home = place_no
);

CREATE VIEW COM_FAMOSA AS 
    SELECT * FROM(
        SELECT c_title AS Cancion, count(band_no) as NUM_BANDAS
        FROM band JOIN(SELECT c_title,gave,count(c_title)
        FROM composition JOIN performance ON c_no=performed
        GROUP BY c_title,gave) TABLA1 ON(band_no=gave)
        GROUP BY c_title
        ORDER BY NUM_BANDAS DESC
        )
    WHERE ROWNUM = 1;
