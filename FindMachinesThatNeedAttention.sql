/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
       CASE WHEN [Number] = 109 THEN 'Need Restart'
	   WHEN [Number] = 107 THEN 'Download of RMSNT failed'
	   WHEN [Number] =103 THEN 'Failed to Install Sophos Firewall Client'
	   WHEN [Number] =113 THEN 'Could Not find packages for an updated source'
	    ELSE CAST([Number] AS NVARCHAR(25)) END AS [Reason Code]
	  ,[Name]
      /*,[Connected]
      ,[IPAddress]
      ,[IPAddressText]*/
	  
      ,a.*
	  ,b.*
	  , b.Insert1
	  ,b.insert2

  FROM [SOPHOS521].[dbo].[Computers] a,
      [SOPHOS521].[dbo].[Errors] b
  where /*name ='hosp-tablet07'
   or Name = 'qs-nurse11'
   or name='it-whitely'
   --
   
   a.[LastAUErrorAlert]=b.id*/
   
   -- Connected=0 AND
   (a.[LastAUErrorAlert]=b.id OR a.[LastSAVErrorAlert]=b.id OR a.[LastSCFErrorAlert]=b.id)
   --OR  (a.[LastAUErrorAlert]=NULL AND a.[LastSAVErrorAlert]=NULL AND a.[LastSCFErrorAlert]=NULL)
  -- or computerid=1623
   --AND b.Number <> -1604845562 

   --AlertState=1
  ORDER BY a.Name