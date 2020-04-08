/*******************************************************************************
            Macro name: bqueues
              Location: <SASCONFIGDIR>/LevN/SASApp/SASEnvironment/SASMacro
            Written by: Dave Glemaker, David.Glemaker@sas.com.
         Creation date: Jan 18 2017.
            As of date: April 08 2020.
           SAS version: SAS 9.4M4 SAS Grid Manager
               Purpose: List Grid Queue Names, the state they are in, priority,
                        number of jobs running and pending on each, Max Jobs, 
                        and Max Jobs per Host
                 Usage: %bqueues
            Parameters: none
   Optional Parameters: none
     Data sets created: work.bqueues
File Reference created: bqueues
           Limitations:
                 Notes: requires xcmd turned on and LSF configured
               History: 04/08/2020 Dave Glemaker added Documentation
                        04/08/2020 Dave Glemaker added Disclaimer
     Sample Macro call: %bqueues
This macro is made available “as is” and disclaims any and all representations
and warranties, including without limitation, implied warranties of
merchantability, accuracy, and fitness for a particular purpose.
*******************************************************************************/
%macro bqueues;
options spool;
filename bqueues pipe "bqueues";
data bqueues;
   infile bqueues firstobs=2 dlm=" ";
   length QueueName $20. Priority $20. Status $20. MaxJobs $5. JobsPerUser $5. JobsPerProcessor $5. 
          JobsPerHost $5. NumJobs $5. Pending $5. Running $5. Suspended $5.;
   input QueueName $ Priority $ Status $ MaxJobs $ JobsPerUser $ JobsPerProcessor $ JobsPerHost $ NumJobs $ Pending $ Running $ Suspended $;
   label MaxJobs="Max Jobs"
         JobsPerUser="Jobs Per User"
         JobsPerProcessor="Jobs Per CPU"
         JobsPerHost="Jobs Per Host"
         NumJobs="Num Jobs"
         Pending="Jobs Pend"
         Running="Jobs Run"
         Suspended="Jobs Susp"
         ;
   run;
title "Bqueues Listing";
proc print data=bqueues label;
run;
title;
options nospool;
%mend bqueues;

