--inpatient fields--
----------------------------------------------

--desynpuf, clm_id, and segment PK, check for repeats/nulls
SELECT desynpuf_id,clm_id,segment, COUNT(*)
FROM inpatient_claims
GROUP BY desynpuf_id,clm_id,segment
HAVING COUNT(*)>1 ;

SELECT desynpuf_id,clm_id,segment
FROM inpatient_claims
WHERE desynpuf_id IS NULL OR clm_id IS NULL OR segment IS NULL;

--------------
--check that icd9 codes are valid 
SELECT 




SELECT * FROM inpatient_claims
--WHERE clm_id= '196661176988405'
LIMIT 10;

SELECT * FROM beneficiaries
limit 10;
-- find claims that have more than one segment 
WITH add_segments AS(
SELECT clm_id FROM inpatient_claims
WHERE segment != '1'
)
SELECT * FROM inpatient_claims 
WHERE clm_id in (SELECT clm_id FROM add_segments);







SELECT desynpuf_id,hcpcs_cd_1,LINE_PRCSG_IND_CD_1 FROM 
carrier_claims
WHERE LINE_PRCSG_IND_CD_1='M'

SELECT desynpuf_id,hcpcs_cd_1,LINE_PRCSG_IND_CD_1 FROM carrier_claims
WHERE desynpuf_id = '3833A3F180F698F7'
ORDER BY clm_from_dt