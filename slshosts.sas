%macro slshosts;

options linesize=max ;
filename cmdout pipe "lshosts" LRECL=2000;

data _null_ ;
  infile cmdout;
  input;
  file print notitles;
  if _n_ = 1 then put 'lshosts Listing';
  put _infile_;
run;

%mend slshosts;

/*
%lshosts;
*/



