%macro slsload;

options linesize=max ;
filename cmdout pipe "lsload -l" LRECL=2000;

data _null_ ;
  infile cmdout;
  input;
  file print notitles;
  if _n_ = 1 then put "lsload Listing";
  put _infile_;
run;

%mend slsload;

/*
%lsload;
*/
