CREATE EXTERNAL TABLE `login`(
  `user_id` bigint COMMENT 'from deserializer', 
  `time` string COMMENT 'from deserializer', 
  `device_type` int COMMENT 'from deserializer')
PARTITIONED BY ( 
  `dt` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.IgnoreKeyTextOutputFormat'
LOCATION
  's3://<S3バケット名>/workshop/login'
TBLPROPERTIES (
  'has_encrypted_data'='false');

MSCK REPAIR TABLE login;
