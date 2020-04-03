%macro mygsubwait(mypgm,que=normal);
options spool;
filename results pipe "&gsconfigdir./sasgsub -gridsubmitpgm &mypgm -gridwait -gridjobopts queue=&que";
data mygsubjob;
   infile results dlm=":" missover truncover;
   length Job $200. Info $200. ;
   input Job Info;
   if substr(job,1,1) not in ("J") then delete;
run;
title "My SASGSUB Job";
proc print data=mygsubjob; where info ne " ";
run;

options nospool;
%mend mygsubwait;
