%macro sbqueuessel;

options linesize=max ;
filename cmdout pipe "bqueues priority normal night" LRECL=2000;
* filename cmdout pipe "bqueues priority normal night EG_normal EM_normal DM_normal GS_normal GS_SASGrid" LRECL=2000;

data _null_ ;
  infile cmdout;
  input;
  file print notitles;
  if _n_ = 1 then put "Bqueues Listing";
  put _infile_;
run;

%mend sbqueuessel;

/*
%bqueuessel;   
*/