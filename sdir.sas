%macro sdir(mydir=~);

options linesize=max ;

filename cmdout pipe "cd &mydir;ls -al" LRECL=2000;

data _null_ ;
  infile cmdout;
  input;
  file print notitles;
  if _n_ = 1 then put "My Directory listing for &mydir";
  put _infile_;
run;

%mend sdir;

