%macro gsstatus(jobid=all);
options spool;
filename results pipe "&gsconfigdir./sasgsub -gridgetstatus &jobid";
data status;
   infile results dlm="," missover truncover;
   length jobid $10. status $200. start $200. end $200. rc $10.;
   input status start end rc;
   if substr(status,1,1) in (" ","C","S","E") then delete;
   jobid=scan(status,1);
run;
title "My SASGSUB Jobs Status";
proc print data=status;
run;
options nospool;
%mend gsstatus;



