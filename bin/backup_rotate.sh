#!/bin/bash

files=$(find /home/fl0rest/var/backup/* -type f -mtime +2 -print | wc -l)
if [[ $files -gt 0 ]]; then
	echo "[$(date +%F/%H:%M:%S)] - Found $files files older than 3 days"
	echo "Files: "
	find /home/fl0rest/var/backup/* -type f -mtime +2 -print
	echo "[$(date +%F/%H:%M:%S)] - Deleting..."
	find /home/fl0rest/var/backup/* -type f -mtime +2 | xargs rm
	echo "[$(date +%F/%H:%M:%S)] - Deleted $files files"
else
	echo "[$(date +%F/%H:%M:%S)] - No files to delete"
fi
