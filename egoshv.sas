/*******************************************************************************
            Macro name: egoshv
              Location: <SASCONFIGDIR>/LevN/SASApp/SASEnvironment/SASMacro
            Written by: Dave Glemaker, David.Glemaker@sas.com.
         Creation date: Jan 18 2017.
            As of date: April 08 2020.
           SAS version: SAS 9.4M4 SAS Grid Manager
               Purpose: Reports EGO individual service information  
                 Usage: %egoshv
            Parameters: service
   Optional Parameters: none
     Data sets created: work.egoshv
File Reference created: egoshv
           Limitations:
                 Notes: requires xcmd turned on and LSF configured
               History: 04/08/2020 Dave Glemaker added Documentation
                        04/08/2020 Dave Glemaker added Disclaimer
     Sample Macro call: %egoshv
This macro is made available “as is” and disclaims any and all representations
and warranties, including without limitation, implied warranties of
merchantability, accuracy, and fitness for a particular purpose.
*********************************************************************************/
%macro egoshv(service=ProcessManager);
options spool;
filename egoshv pipe "egosh service view &service";
data egoshv;
   length egosh_service_view $90.;
   infile egoshv firstobs=2 truncover;
   input @1 egosh_service_view $90.;
run;
title "EGO View of Service &service";
proc print data=egoshv;
run;
options nospool;
%mend egoshv;

