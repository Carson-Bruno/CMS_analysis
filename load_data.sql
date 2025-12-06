
TRUNCATE TABLE carrier_claims;
COPY carrier_claims
FROM 'C:/Users/cbrun/OneDrive/Documents/CMS_synth_proj/raw_data/DE1_0_2008_to_2010_Carrier_Claims_Sample_1A.csv'
DELIMITER ','
CSV HEADER;