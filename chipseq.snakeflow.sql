CREATE OR REPLACE TASK chip_seq_analysis
WAREHOUSE = 'COMPUTE_WH'
SCHEDULE = 'USING CRON 0 0 * * * UTC'
AS
CALL run_chip_seq_analysis();
