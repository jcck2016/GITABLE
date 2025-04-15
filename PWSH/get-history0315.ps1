PS C:\Temp> get-history

  Id     Duration CommandLine
  --     -------- -----------
   1        0.011 cd \
   2        0.004 cd .\Temp\
   3        1.252 get-content *.xml
   4        0.095 get-service d*
   5        0.089 get-process *s
   6        0.012 get-process *ss
   7        0.010 get-process *d
   8        0.148 get-process  | where NPM -gt 100
   9        0.011 get-process  *ss
  10        0.041 get-process  | where CPU -gt 0.33
  11        0.024 get-process  | where CPU -gt 700
  12        0.038 get-process | get-member
  13        0.021 get-process  | where CPU -gt 600
  14        0.021 get-process  | where CPU -gt 300
  15        0.017 get-process  | where CPU -gt 100
  16        0.018 get-process  | where CPU -gt 55
  17        0.022 get-process  | where CPU -gt 55 | sort BaseAddress
  18        0.025 get-process  | where CPU -gt 55 | sort CPU
  19        0.136 get-process -name bits | get-member
  20        0.019 get-process -name bits
  21        0.004 get-service -name bits
  22        0.011 get-service -name bits  | get-member
  23        0.026 get-service -name bits  | get-member | Select-String "Pro"
  24        0.059 get-service -name bits  | get-member | Select-String *Pro*
  25        0.004 get-service -name bits  | get-member | Select-String "Property"
  26        0.005 get-service -name bits  | get-member | Select-String "Property"
  27        0.008 get-service -name bits  | Select-Object -Property CanShutdown
  28        0.006 get-service -name bits  | Select-Object -Property Name, ServiceHandle, Status, Site
  29        0.046 get-service -name b*  | Select-Object -Property Name, ServiceHandle, Status, Site
  30        0.028 get-service -name b*  | Select-Object -Property Name, ServiceHandle, Status, CanPauseAndContinue
  31        0.036 get-service -name b*  | Select-Object -Property Name, ServiceHandle, Status, CanPauseAndContinue, CanShutdown
  32        0.027 get-service -name b*  | Select-Object -Property Name, ServiceHandle, Status, CanPauseAndContinue
  33        0.034 get-service -name b*  | Select-Object -Property Name, Status, CanPauseAndContinue, CanShutdown
  34        0.049 tree
  35        0.109 Get-Eventlog -LogName System -Newest 33
  36        0.068 Get-Eventlog -LogName System -Newest 33 | gm
  37        0.074 Get-Eventlog -LogName System -Newest 33 | Select-Object -Property eventid, timewritten
  38        0.029 Get-Eventlog -LogName System -Newest 33 | Select-Object -Property eventid, timewritten message
  39        0.071 Get-Eventlog -LogName System -Newest 33 | Select-Object -Property eventid, timewritten, message
  40        0.075 Get-Eventlog -LogName System -Newest 33 | Select-Object -Property eventid, timewritten, message | sort eventid
  41        0.069 Get-Eventlog -LogName System -Newest 33 | Select-Object -Property eventid, timewritten, message | sort eventid | ConvertTo-Html | out-file …
  42        0.113 .\error.htm
  43        0.015 get-alias cat
  44        0.093 $xxx =[xml](cat .\r_and_j.xml)
  45        0.582 xxx
  46        0.019 $xxx
  47        0.009 $xxx.GetType()
  48        0.001 $xxx.GetType()
  49        0.002 $xxx.Name
  50        0.009 $xxx.PLAY
  51        0.008 $xxx.PLAY.ACT
  52        0.009 $xxx.PLAY.FM
  53        0.003 $xxx.PLAY.PERSONA
  54        0.006 $xxx.PLAY.ACT
  55        0.004 $xxx.PLAY.ACT[0]
  56        0.010 $xxx.PLAY.ACT[6]
  57        0.002 $xxx.PLAY.ACT[4]
  58        0.004 $xxx.PLAY.SCENE
  59        0.006 $xxx.PLAY.ACT[4].SCENE
  60        0.005 $xxx.PLAY.ACT[4].SCENE[0].SPEECH
  61        0.025 $xxx.PLAY.ACT[4].SCENE.SPEECH | group Speaker | sort count
  62        0.039 $xxx.PLAY.ACT.SCENE.SPEECH | group Speaker | sort count


  62        0.039 $xxx.PLAY.ACT.SCENE.SPEECH | group Speaker | sort count
  63        0.019 get-history
  64        0.002 $xxx
  65        0.002 $xxx.PLAY
  66        0.000 $xxx.PLAY.PERSONA
  67        0.002 $xxx.PLAY.PERSOMAE
  68        0.013 $xxx.PLAY.PERSONAE
  69        0.002 $xxx.PLAY.PERSONAE.ESCALUS
  70        0.791 get-service | where {$_.Status -eq 'Stopped'}
  71        0.576 get-service | where {$_.Status -eq 'Stopped'} | Select-String W*
  72        0.566 get-service | where {$_.Status -eq 'Running' -and $_.Name -like "c*"}
  73        0.636 get-service | where {$_.Status -eq 'Running' -and $_.Name -like "c*" -and $_.Name -like "f*"}
  74        0.565 get-service | where {$_.Status -eq 'Running' -and $_.Name -like "c*" -and $_.Name -like "g*"}
  75        0.538 get-service | where {$_.Status -eq 'Running' -and $_.Name -like "c*" -and $_.Name -like "j*"}
  76        0.542 get-service | where {$_.Status -eq 'Running' -and $_.Name -like "c*" -and $_.Name -like "y*"}
  77        0.491 get-service | where {$_.Status -eq 'Running' -and $_.Name -like "c*" -and $_.Name -like "w*"}
  78        0.929 get-service | where {$_.Status -eq 'Running' -and $_.Name -like "c*" -and $_.Name -like "b*"}
  79        0.624 get-service | where {$_.Status -eq 'Running' -and $_.Name -like "c*"}
  80        0.629 get-service | where {$_.Status -eq 'Running' -and $_.Name -like "w*"}
  81        0.039 gps | where CPU -gt 44




  