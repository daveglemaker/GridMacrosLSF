/*******************************************************************************
            Macro name: lshosts
              Location: <SASCONFIGDIR>/LevN/SASApp/SASEnvironment/SASMacro
            Written by: Dave Glemaker, David.Glemaker@sas.com.
         Creation date: Jan 18 2017.
            As of date: April 08 2020.
           SAS version: SAS 9.4M4 SAS Grid Manager
               Purpose: List Grid Host with thier info with wide parameter
                 Usage: %lshosts
            Parameters: none
   Optional Parameters: none
     Data sets created: work.lshosts 
File Reference created: lshosts
           Limitations:
                 Notes: requires xcmd turned on and LSF configured
               History: 04/08/2020 Dave Glemaker added Documentation
                        04/08/2020 Dave Glemaker added Disclaimer
     Sample Macro call: %lshosts
This macro is made available “as is” and disclaims any and all representations
and warranties, including without limitation, implied warranties of
merchantability, accuracy, and fitness for a particular purpose.
*********************************************************************************/
%macro lshosts;
options spool;
filename lshosts pipe "lshosts  -w";
data lshosts;
   infile lshosts firstobs=2 dlm=" " missover;
   length HostName $30. type $20. model $5. cpuf $5. ncpu $5. maxmem $10. maxswp $10. server $5. resources $150. resource1 $50. resource2 $50. resource3 $50. resource4 $50. resource5 $50.  resource6 $50. resource7 $50.  resource8 $50.;
   input HostName $ type $ model $ cpuf $ ncpu $ maxmem $ maxswp $ server $ resources $ resource1 $ resource2 $ resource3 $ resource4 $ resource5 $ resource6 $ resource7 $ resource8 $;
   resources=compress(resources)||" "||compress(resource1)||" "||compress(resource2)||" "||compress(resource3)||" "||compress(resource4)||" "||compress(resource5)||" "||compress(resource6)||" "||compress(resource7)||" "||compress(resource8);
label cpuf="CPU Factor"
      ncpu="Number CPU";
run;
title "lshosts Listing";
&fn footnote '<img title="PoweredBySAS-ColorHorizontal" class="cq-dd-image" alt="PoweredBySAS-ColorHorizontal" src="https://brand.sas.com/en/home/brand-assets/design-elements/logos/_jcr_content/par/styledcontainer_1011938127/par/image_2006980209.img.png/1549480759537.png">';
proc print data=lshosts label;
  var HostName type model cpuf ncpu maxmem maxswp server resources; 
run;
title;footnote;
options nospool;
%mend lshosts;

