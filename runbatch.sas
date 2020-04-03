%macro runbatch(mydir=~,mypat=AD);

options linesize=max ;

filename rbat pipe "cd &mydir;./runbatch.sh -p '&mypat*'";

data myrbatjob;
   infile rbat dlm=":" missover truncover;
   length Job $200. Info $200. info2 $200. ;
   input Job Info Info2;
   if substr(job,1,1) not in ("J") then delete;
   if substr(info2,1,1) not in (" ") then info=compress(info)||":"||compress(info2);
run;
title "My runbatch Jobs for &mydir with pattern &mypat";
proc print data=myrbatjob; where info ne " ";
var job info;
run;


%mend runbatch;
