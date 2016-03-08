#!/bin/bash

# Do not leave a trailling / here
GUVNOR_URL=http://10.3.12.100:32770/jboss-brms/org.drools.guvnor.Guvnor/webdav/snapshots/mortgages/TEST

# get file listing
FILE_LIST=$(curl -u jboss:bpmsuite1! $GUVNOR_URL 2>>wget.output)

echo -e "\nDownloading your sources from $GUVNOR_URL ..."
echo -e "==========================================\n"

# loop over the file list line by line
# docs on looping on a variable by line http://mywiki.wooledge.org/BashFAQ/001
COUNT=0
printf %s "$FILE_LIST" | while IFS= read -r line
do
   # the first two lines are meta data and a binary, so the counter skips them
   if (( "$COUNT" > 1 ))
   then
     echo -e "$line"
     URL=$GUVNOR_URL/$line
     wget "$URL" --http-user=jboss --password=bpmsuite1! 2>>wget.output
   fi
   COUNT=$((COUNT+1))
done

echo -e "\n==========================================\n"
echo -e "Downloads complete. If you don't see your files, check wget.output for the results of each download.\n"
