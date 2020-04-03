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
&fn footnote '<img title="PoweredBySAS-ColorHorizontal" class="cq-dd-image" alt="PoweredBySAS-ColorHorizontal" src="https://brand.sas.com/en/home/our-identity/visual-elements/logo/_jcr_content/par/styledcontainer_1011938127/par/image_2006980209.img.png/1549480759537.png">';
proc print data=lshosts label;
  var HostName type model cpuf ncpu maxmem maxswp server resources; 
run;
title;footnote;
options nospool;
%mend lshosts;

