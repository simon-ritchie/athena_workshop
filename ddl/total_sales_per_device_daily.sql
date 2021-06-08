CREATE EXTERNAL TABLE `total_sales_per_device_daily`(
  `date` string, 
  `device_type` int, 
  `sales` int)
PARTITIONED BY ( 
  `dt` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.IgnoreKeyTextOutputFormat'
LOCATION
  's3://simonritchie.athena.workshop/workshop/total_sales_per_device_daily'
TBLPROPERTIES (
  'has_encrypted_data'='false',
    'projection.enabled' = 'true',
    'projection.dt.type' = 'date',
    'projection.dt.range' = '2021-01-01,NOW',
    'projection.dt.format' = 'yyyy-MM-dd',
    'projection.dt.interval' = '1',
    'projection.dt.interval.unit' = 'DAYS',
    'storage.location.template' = 's3://simonritchie.athena.workshop/workshop/total_sales_per_device_daily/dt=${dt}');
