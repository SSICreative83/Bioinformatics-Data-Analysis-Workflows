CREATE OR REPLACE TASK microarray_analysis
WAREHOUSE = 'COMPUTE_WH'
SCHEDULE = 'USING CRON 0 0 * * * UTC'
AS
CALL run_microarray_analysis();
