-- year column for beneficiaries
ALTER TABLE beneficiaries_08
ADD COLUMN IF NOT EXISTS ben_year INT DEFAULT 2008;
ALTER TABLE beneficiaries_09
ADD COLUMN IF NOT EXISTS ben_year INT DEFAULT 2009;
ALTER TABLE beneficiaries_10
ADD COLUMN IF NOT EXISTS ben_year INT DEFAULT 2010;

-- ensure no duplicates in benficiary id for each year
SELECT desynpuf_id,COUNT(desynpuf_id)
FROM beneficiaries_08
GROUP BY desynpuf_id
HAVING COUNT(desynpuf_id)>1;

SELECT desynpuf_id,COUNT(desynpuf_id)
FROM beneficiaries_09
GROUP BY desynpuf_id
HAVING COUNT(desynpuf_id)>1;

SELECT desynpuf_id,COUNT(desynpuf_id)
FROM beneficiaries_10
GROUP BY desynpuf_id
HAVING COUNT(desynpuf_id)>1;

-- combine benficiaries
DROP TABLE IF EXISTS beneficiaries;
CREATE TABLE IF NOT EXISTS beneficiaries AS
(
SELECT * FROM beneficiaries_08
UNION ALL
SELECT * FROM beneficiaries_09
UNION ALL 
SELECT * FROM beneficiaries_10
);

-- check counts from union
SELECT 
(SELECT COUNT(*) FROM beneficiaries_08)+
(SELECT COUNT(*) FROM beneficiaries_09)+
(SELECT COUNT(*) FROM beneficiaries_10) AS comb_count_real,
(SELECT COUNT(*) FROM beneficiaries) AS comb_count_union;

--clean fields in beneficiaries


SELECT clm_id,count(*)
FROM inpatient_claims
GROUP BY clm_id
HAVING count(*)>1
;

SELECT * FROM inpatient_claims 
WHERE clm_id = '196861177018065';
