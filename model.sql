SELECT * FROM inpatient_claims
--WHERE clm_id= '196661176988405'
LIMIT 10;

SELECT desynpuf_id,hcpcs_cd_1,LINE_PRCSG_IND_CD_1 FROM 
carrier_claims
WHERE LINE_PRCSG_IND_CD_1='M'

SELECT desynpuf_id,hcpcs_cd_1,LINE_PRCSG_IND_CD_1 FROM carrier_claims
WHERE desynpuf_id = '3833A3F180F698F7'
ORDER BY clm_from_dt