#!/bin/bash

dmY=$(date +%d%m%Y)

tar -czf /home/fl0rest/var/backup/test-backup$dmY.tgz /home/fl0rest/home/test


echo [$(date +%F/%H:%M:%S)]" - Backup finished"
