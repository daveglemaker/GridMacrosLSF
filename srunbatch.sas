%macro srunbatch(mydir=~,mypat=AD);

options linesize=max ;

filename cmdout pipe "cd &mydir;./runbatch.sh -p "&mypat*"" LRECL=2000;

data _null_ ;
  infile cmdout;
  input;
  file print notitles;
  if _n_ = 1 then put "My Directory Jobs in &mydir with pattern &mypat";
  put _infile_;
run;

%mend srunbatch;

