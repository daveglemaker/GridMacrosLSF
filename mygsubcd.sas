%macro mygsubcd(mypgm);
options spool;
filename results pipe "cd /shared/sas/test ; &gsconfigdir./sasgsubSG -gridsubmitpgm &mypgm -gridsasopts ' -altlog /shared/sas/test -altprint /shared/sas/test '";
data mygsubjob;
   infile results dlm=":" missover truncover;
   length Job $200. Info $200. info2 $200. ;
   input Job Info Info2;
   if substr(job,1,1) not in ("J") then delete;
   if substr(info2,1,1) not in (" ") then info=compress(info)||":"||compress(info2);
run;
title "My SASGSUB Job";
proc print data=mygsubjob; where info ne " ";
var job info;
run;

options nospool;
%mend mygsubcd;
