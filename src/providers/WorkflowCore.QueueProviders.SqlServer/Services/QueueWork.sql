﻿DECLARE @InitDlgHandle UNIQUEIDENTIFIER
BEGIN TRAN 

BEGIN DIALOG @InitDlgHandle
FROM SERVICE
[{initiatorService}]
TO SERVICE
'{targetService}'
ON CONTRACT
[{contractName}]
WITH ENCRYPTION=OFF; 

SEND ON CONVERSATION @InitDlgHandle 
MESSAGE TYPE [{msgType}]
(@RequestMessage);

COMMIT TRAN