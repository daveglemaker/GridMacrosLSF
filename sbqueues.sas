%macro sbqueues;

options linesize=max ;
filename cmdout pipe "bqueues" LRECL=2000;

data _null_ ;
  infile cmdout;
  input;
  file print notitles;
  if _n_ = 1 then put "Bqueues Listing";
  put _infile_;
run;

%mend sbqueues;

/*
%bqueues;
*/