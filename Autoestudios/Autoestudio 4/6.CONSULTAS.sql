--CONSULTAS EASY QUESTIONS--

SELECT m_name
FROM musician,concert
WHERE m_no = concert_orgniser
AND con_date > TO_DATE('1997/02/01','YYYY/MM/DD')
AND concert_venue = 'Assembly Rooms';

SELECT m_name
FROM musician,place,performer
WHERE born_in = place_no and perf_is = m_no
AND (instrument = 'violin' or instrument = 'guitar')
AND place_country = 'England';


SELECT m_name,place_town,con_date
FROM musician,concert,place
WHERE concert_orgniser = m_no and concert_in = place_no
AND place_country = 'USA';


SELECT con_date,concert_venue,c_title
FROM concert ,performance , composition ,has_composed ,composer ,musician
where concert_no=performed_in and c_no=performed and c_no= cmpn_no
and cmpr_no=comp_no and comp_is=m_no and m_name='Andy Jones';


SELECT instrument,COUNT(instrument)/(SELECT DISTINCT COUNT(m_name)
FROM musician) as promedio
FROM musician,performer
WHERE perf_is = m_no
GROUP BY instrument;


--MEDIUM QUESTIONS--

SELECT m_name,born,instrument
FROM musician,performer
WHERE instrument in (SELECT instrument
FROM musician,performer
WHERE m_no = perf_is AND m_name like 'Theo%')
AND m_no = perf_is
AND died is null
AND m_name not like 'Theo%';


SELECT band_id, COUNT(player) As P1
FROM band,plays_in
WHERE band_id=band_no 
GROUP BY band_id
HAVING P1>(SELECT AVG(P2)
FROM( SELECT band_id,COUNT(player) as P2
FROM band,plays_in
WHERE band_id=band_no
GROUP BY band_id) as t);


SELECT DISTINCT m_name  
FROM musician,performance,composer,place 
WHERE conducted_by = m_no AND comp_is=m_no AND living_in IN (SELECT place_no FROM place WHERE place_country= 'England' OR place_country= 'Scotland');


SELECT instrument,players
FROM (SELECT instrument,COUNT(instrument) as players
FROM performer
GROUP BY instrument) as tabla
WHERE players <= all (SELECT COUNT(instrument)
FROM performer
GROUP BY instrument);


SELECT band_name,c_title
FROM band,performance,composition,has_composed,composer,musician
WHERE gave=band_no and performed=c_no and c_no=cmpn_no and comp_is = m_no and m_name = 'Sue Little'
and cmpr_no = comp_no;

--HARD QUESTIONS--

SELECT DISTINCT m_name,place_town
FROM musician,performer,place
WHERE born_in = place_no and perf_is = m_no and m_name != 'James First' and place_town = (SELECT place_town
FROM musician,place
WHERE born_in = place_no and m_name = 'James First');


SELECT m_name,count(distinct cmpn_no) as compositions,count(distinct 
instrument)as instruments
FROM musician left join place on born_in=place_no
LEFT JOIN composer on comp_is=m_no
LEFT JOIN performer on perf_is=m_no
LEFT JOIN has_composed on comp_no = cmpr_no
WHERE place_country = 'England' or place_country = 'Scotland'
group by m_name;


SELECT band_name as banda,contacto,conductor
FROM (SELECT band_name,m_name as contacto
FROM band,performance,musician,concert
WHERE band_no = gave and performed_in = concert_no and band_contact = m_no and concert_venue = 'Royal Albert Hall' and con_date = (SELECT MAX (con_date) FROM concert WHERE concert_venue = 'Royal Albert Hall')) as t1  inner join
(SELECT band_name as band2,m_name as conductor
FROM band,performance,musician,concert
WHERE conducted_by = m_no and gave = band_no and  performed_in = concert_no  and concert_venue = 'Royal Albert Hall' and con_date = (SELECT MAX (con_date) FROM concert WHERE concert_venue = 'Royal Albert Hall'))as t2
on band_name = band2;


(SELECT m_name,'LIVES_IN' as nature
FROM musician,place
WHERE place_no = living_in and place_town = 'Glasgow')
UNION
(SELECT m_name,'BORN_IN'
FROM musician,place
WHERE place_no = born_in and place_town = 'Glasgow')
UNION
(SELECT m_name,'PERFORMED_IN'
FROM musician,place,performance,concert
WHERE m_no = conducted_by and performed_in = concert_no and concert_in = place_no and place_town = 'Glasgow')
UNION
(SELECT m_name,'IN_BAND_IN'
FROM musician,performer,plays_in,band,place
WHERE m_no=perf_is and perf_no = player and band_no = band_id and band_home = place_no and place_town = 'Glasgow');


SELECT m_name as nombre,Sue_Band,Jeff_Band
FROM
(SELECT DISTINCT m_name as n1,band_name as Sue_Band
FROM musician,performer,band,plays_in
WHERE band_no = band_id and m_name!= 'Jeff Dawn' and m_no = perf_is and perf_no = player and band_id in (SELECT band_id
FROM musician,performer,band,plays_in
WHERE m_no = perf_is and perf_no = player and m_name = 'Sue Little')) as t1
JOIN
(SELECT DISTINCT m_name,band_name as Jeff_band
FROM musician,performer,band,plays_in
WHERE band_no = band_id and m_name!= 'Jeff Dawn' and m_no = perf_is and perf_no = player and band_id in (SELECT band_id
FROM musician,performer,band,plays_in
WHERE m_no = perf_is and perf_no = player and m_name = 'Jeff Dawn')) as t2
ON m_name = n1;