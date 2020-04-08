/*******************************************************************************
            Macro name: bhosts
              Location: <SASCONFIGDIR>/LevN/SASApp/SASEnvironment/SASMacro
            Written by: Dave Glemaker, David.Glemaker@sas.com.
         Creation date: Jan 18 2017.
            As of date: April 08 2020.
           SAS version: SAS 9.4M4 SAS Grid Manager
               Purpose: List Grid Host Names, the state they are in, number of
                        jobs running and suspended on each, and Operating System
                 Usage: %bhosts
            Parameters: none
   Optional Parameters: none
     Data sets created: work.bhosts
File Reference created: bhosts
           Limitations: 
                 Notes: requires xcmd turned on and LSF configured
               History: 04/08/2020 Dave Glemaker added Documentation
                        04/08/2020 Dave Glemaker added Disclaimer
     Sample Macro call: %bhosts
This macro is made available “as is” and disclaims any and all representations 
and warranties, including without limitation, implied warranties of 
merchantability, accuracy, and fitness for a particular purpose.
*******************************************************************************/
%macro bhosts;
options spool;
filename bhosts pipe "bhosts";
data bhosts;
   infile bhosts firstobs=2 dlm=" ";
   length HostName $20. Status $20. JobsPerUser $5. MaxJobs $5. NumJobs $5. Running $20. SSuspend $20. USuspend $20. RSV $20.;
   input HostName $ Status $ JobsPerUser $ MaxJobs $ NumJobs $ Running $ SSuspend $ USuspend $ RSV $;
label jobsperuser="Jobs Per User"
      Maxjobs="Max Jobs"
      numjobs="Num Jobs";
   run;
title "Bhosts Listing";
&fn footnote '<img title="PoweredBySAS-ColorHorizontal" class="cq-dd-image" alt="PoweredBySAS-ColorHorizontal" src="https://brand.sas.com/en/home/our-identity/visual-elements/logo/_jcr_content/par/styledcontainer_1011938127/par/image_2006980209.img.png/1549480759537.png">';
proc print data=bhosts label;
run;
title;footnote;
options nospool;
%mend bhosts;

