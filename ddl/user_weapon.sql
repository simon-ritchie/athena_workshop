CREATE EXTERNAL TABLE `user_weapon`(
  `user_id` bigint,
  `date` string,
  `device_type` int,
  `weapons` array<struct<mst_id: bigint, attack: bigint, level: bigint>>)
PARTITIONED BY ( 
  `dt` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.IgnoreKeyTextOutputFormat'
LOCATION
  's3://<S3バケット名>/workshop/user_weapon'
TBLPROPERTIES (
  'has_encrypted_data'='false',
    'projection.enabled' = 'true',
    'projection.dt.type' = 'date',
    'projection.dt.range' = '2021-01-01,NOW',
    'projection.dt.format' = 'yyyy-MM-dd',
    'projection.dt.interval' = '1',
    'projection.dt.interval.unit' = 'DAYS',
    'storage.location.template' = 's3://<S3バケット名>/workshop/user_weapon/dt=${dt}');
