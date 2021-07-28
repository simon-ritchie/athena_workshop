CREATE EXTERNAL TABLE `book_jp`(
  `date` string, 
  `sentence` string)
PARTITIONED BY ( 
  `dt` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.IgnoreKeyTextOutputFormat'
LOCATION
  's3://s3://<バケット名>/workshop/book_jp'
TBLPROPERTIES (
  'has_encrypted_data'='false',
    'projection.enabled' = 'true',
    'projection.dt.type' = 'date',
    'projection.dt.range' = '2021-01-01,NOW',
    'projection.dt.format' = 'yyyy-MM-dd',
    'projection.dt.interval' = '1',
    'projection.dt.interval.unit' = 'DAYS',
    'storage.location.template' = 's3://s3://<バケット名>/workshop/book_jp/dt=${dt}');
