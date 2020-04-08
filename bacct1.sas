/*******************************************************************************
            Macro name: bacct1
              Location: <SASCONFIGDIR>/LevN/SASApp/SASEnvironment/SASMacro
            Written by: Dave Glemaker, David.Glemaker@sas.com.
         Creation date: Jan 18 2017.
            As of date: April 08 2020.
           SAS version: SAS 9.4M4 SAS Grid Manager
               Purpose: List 1 month grid history for all users all queues 
                        or specific grid user that is provided 
                 Usage: %bacct1
            Parameters: guser
   Optional Parameters: guser
     Data sets created: work.bacct
File Reference created: bacct
           Limitations:
                 Notes: requires xcmd turned on and LSF configured
               History: 04/08/2020 Dave Glemaker added Documentation
                        04/08/2020 Dave Glemaker added Disclaimer
     Sample Macro call: %bacct1 %bacct1(guser=sasdemo)
This macro is made available “as is” and disclaims any and all representations
and warranties, including without limitation, implied warranties of
merchantability, accuracy, and fitness for a particular purpose.
*********************************************************************************/
%macro bacct1(guser=all);
options spool;
filename bacct pipe "bacct -u &guser -C .-1/,.";
data bacct;
   infile bacct truncover;
   input bacct_Status $400.;
   run;
title "Bacct Status for user &guser";
proc print data=bacct;
run;
options nospool;
%mend bacct1;

