#!/bin/bash

tar -czf /home/fl0rest/var/backup/script-backup$(date +%d%m%Y).tgz /home/fl0rest/bin

echo [$(date +%F/%H:%M:%S)]" - Scripts backed up"
