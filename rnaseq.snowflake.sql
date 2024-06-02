CREATE OR REPLACE TASK rna_seq_analysis
WAREHOUSE = 'COMPUTE_WH'
SCHEDULE = 'USING CRON 0 0 * * * UTC'
AS
CALL run_rna_seq_analysis();
