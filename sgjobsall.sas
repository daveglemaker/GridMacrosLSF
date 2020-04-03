%macro sgjobsall;
run;

options linesize=max ;
filename cmdout pipe "bjobs -u all -a -w" LRECL=2000;

data _null_ ;
  infile cmdout;
  input;
  file print notitles;
  if _n_ = 1 then put "All Grid Jobs Today";
  put _infile_;
run;

%mend sgjobsall;

/*
%gjobsall;
*/