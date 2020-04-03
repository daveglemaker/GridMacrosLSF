%macro sgsstatus(jobid=all);

options linesize=max ;
filename cmdout pipe "&gsconfigdir./sasgsub -gridgetstatus &jobid" LRECL=2000;

data _null_ ;
  infile cmdout;
  input;
  file print notitles;
  if _n_ = 1 then put "My SASGSUB Jobs Status";
  put _infile_;
run;

%mend sgsstatus;

/*
%gsstatus(jobid=all);
%gsstatus;
*/