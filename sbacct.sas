%macro sbacct;

options linesize=max ;
filename cmdout pipe "bacct -u &_metauser" LRECL=2000;

data _null_ ;
  infile cmdout;
  input;
  file print notitles;
  if _n_ = 1 then put "Bacct Status for user &_metauser";
  put _infile_;
run;

%mend sbacct;

/*
%bacct;
*/