/*******************************************************************************
            Macro name: bacctq1
              Location: <SASCONFIGDIR>/LevN/SASApp/SASEnvironment/SASMacro
            Written by: Dave Glemaker, David.Glemaker@sas.com.
         Creation date: Jan 18 2017.
            As of date: April 08 2020.
           SAS version: SAS 9.4M4 SAS Grid Manager
               Purpose: List 1 month grid history for all users provided queue
                        or specific grid user that is provided 
                 Usage: %bacctq1
            Parameters: guser que
   Optional Parameters: guser que
     Data sets created: work.bacctq
File Reference created: bacctq
           Limitations:
                 Notes: requires xcmd turned on and LSF configured
               History: 04/08/2020 Dave Glemaker added Documentation
                        04/08/2020 Dave Glemaker added Disclaimer
     Sample Macro call: %bacctq1 %bacctq1(guser=sasdemo,que=normal)
This macro is made available “as is” and disclaims any and all representations
and warranties, including without limitation, implied warranties of
merchantability, accuracy, and fitness for a particular purpose.
*********************************************************************************/
%macro bacctq1(guser=all, que=normal);
options spool;
filename bacctq pipe "bacct -u &guser -q &que -C .-1/,.";
data bacctq;
   infile bacctq truncover;
   input bacct_Status $400.;
run;
title "Bacct Status for user &guser on queue &que";
proc print data=bacctq;
run;
options nospool;
%mend bacctq1;

