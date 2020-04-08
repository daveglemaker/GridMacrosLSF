/*******************************************************************************
            Macro name: bacct12
              Location: <SASCONFIGDIR>/LevN/SASApp/SASEnvironment/SASMacro
            Written by: Dave Glemaker, David.Glemaker@sas.com.
         Creation date: Jan 18 2017.
            As of date: April 08 2020.
           SAS version: SAS 9.4M4 SAS Grid Manager
               Purpose: List 12 month grid history for all users all queues 
                        or specific grid user that is provided 
                 Usage: %bacct12
            Parameters: guser
   Optional Parameters: guser
     Data sets created: work.bacct
File Reference created: bacct
           Limitations:
                 Notes: requires xcmd turned on and LSF configured
               History: 04/08/2020 Dave Glemaker added Documentation
                        04/08/2020 Dave Glemaker added Disclaimer
     Sample Macro call: %bacct12 %bacct12(guser=sasdemo)
This macro is made available “as is” and disclaims any and all representations
and warranties, including without limitation, implied warranties of
merchantability, accuracy, and fitness for a particular purpose.
*********************************************************************************/
%macro bacct12(guser=all);
options spool;
filename bacct pipe "bacct -u &guser -C .-12/,.";
data bacct;
   infile bacct truncover;
   input bacct_Status $400.;
   run;
title "Bacct Status for user &guser";
proc print data=bacct;
run;
options nospool;
%mend bacct12;

