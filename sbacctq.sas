%macro sbacctq(guser=all, que=normal);

options linesize=max ;
filename cmdout pipe "bacct -u &_metauser -q &que" LRECL=2000;

data _null_ ;
  infile cmdout;
  input;
  file print notitles;
  if _n_ = 1 then put "Bacct Status for user &guser on queue &que";
  put _infile_;
run;

%mend sbacctq;


/* 
%bacctq(guser=sasdemo, que=normal);

%bacctq(guser=all, que=priority);

*/