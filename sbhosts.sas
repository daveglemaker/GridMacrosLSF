%macro sbhosts;

options linesize=max ;
filename cmdout pipe "bhosts" LRECL=2000;

data _null_ ;
  infile cmdout;
  input;
  file print notitles;
  if _n_ = 1 then put "Bhosts Listing";
  put _infile_;
run;

%mend sbhosts;

/*
%bhosts;
*/