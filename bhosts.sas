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

