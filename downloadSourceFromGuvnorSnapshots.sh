#!/bin/bash

# Do not leave a trailling / here
GUVNOR_URL=http://10.3.12.100:32770/jboss-brms/org.drools.guvnor.Guvnor/webdav/snapshots/mortgages/TEST
GUVNOR_USER=jboss
GUVNOR_PASSWORD=bpmsuite1!
FILE_DOWNLOAD_LOCATION=/tmp

# get file listing
FILE_LIST=$(curl -u $GUVNOR_USER:$GUVNOR_PASSWORD $GUVNOR_URL 2>>wget.output)

echo -e "\nDownloading your sources from $GUVNOR_URL to $FILE_DOWNLOAD_LOCATION..."
echo -e "==========================================\n"

# change directory
cd $FILE_DOWNLOAD_LOCATION
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
     wget "$URL" --http-user=$GUVNOR_USER --password=$GUVNOR_PASSWORD 2>>wget.output
   fi
   COUNT=$((COUNT+1))
done

echo -e "\n==========================================\n"
echo -e "Downloads complete. If you don't see your files, check wget.output for the results of each download.\n"
