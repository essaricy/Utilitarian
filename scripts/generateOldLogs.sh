#!/bin/bash

touch root.log
touch nohup.log
touch stacktrace.log
touch system.log
touch server.log

PAST_DAYS=10
echo ""
echo "###### Generating files for the past $DAYS_TO_TEST days" 

for i in {0..10}
do
  echo "counter is $i"

  CURRENT_DATE=$(date -d "-$PAST_DAYS days")
  TOUCH_FORMAT=$(date -d "-$PAST_DAYS days" +%y%m%d%H%M)
  DATE_FORMAT=$(date -d "-$PAST_DAYS days" +%Y%m%d)

  echo "CURRENT_DATE is $CURRENT_DATE"
  #echo "TOUCH_FORMAT is $TOUCH_FORMAT"
  #echo "DATE_FORMAT is $DATE_FORMAT"

  touch -t $TOUCH_FORMAT server.$DATE_FORMAT.log
  touch -t $TOUCH_FORMAT server.$DATE_FORMAT.log.1
  touch -t $TOUCH_FORMAT server.$DATE_FORMAT.log.2

  touch -t $TOUCH_FORMAT system.$DATE_FORMAT.log
  touch -t $TOUCH_FORMAT system.$DATE_FORMAT.log.1
  touch -t $TOUCH_FORMAT system.$DATE_FORMAT.log.2

  PAST_DAYS=$((PAST_DAYS-1))
  echo ""
done
