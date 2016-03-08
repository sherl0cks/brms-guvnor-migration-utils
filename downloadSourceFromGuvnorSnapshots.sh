#!/bin/bash

GUVNOR_URL=http://localhost:8080/jboss-brms/org.drools.guvnor.Guvnor/webdav/snapshots/mortgages/1/

IP=$(curl -u jboss:bpmsuite1! $GUVNOR_URL)

COUNT=0

# docs on looping on a variable by line http://mywiki.wooledge.org/BashFAQ/001
printf %s "$IP" | while IFS= read -r line
do
   # the first two lines are meta data and a binary, so the counter skips them
   if (( "$COUNT" > 1 )) 
   then
     echo -e "Downloading $line ...\n"
     echo -e "==========================================\n"
     URL=$GUVNOR_URL$line
     wget "$URL" --http-user=jboss --password=bpmsuite1!
     echo -e "==========================================\n"	

   fi
   COUNT=$((COUNT+1))
done
