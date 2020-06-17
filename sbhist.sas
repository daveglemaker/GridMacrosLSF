%macro sbhist(jobid=);
options linesize=max ;
filename cmdout pipe "bhist -l &jobid" LRECL=2000;

data _null_ ;
  infile cmdout;
  input;
  file print notitles;
  if _n_ = 1 then put "Job &jobid Status History";
  put _infile_;
run;

%mend sbhist;

