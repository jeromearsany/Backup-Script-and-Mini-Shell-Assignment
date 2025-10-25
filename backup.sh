#!/bin/bash

if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <source_directory> <destination_directory> <interval_seconds> <backup_count>"
    exit 1
fi

SOURCE_DIR="$1"
DEST_DIR="$2"
INTERVAL="$3"
MAX_BACKUPS="$4"

while true; do
    echo "🔄 Starting backup cycle..."

    TIMESTAMP=$(date +%Y%m%d_%H%M%S)
    BACKUP_FILENAME="backup_${TIMESTAMP}.tar.gz"
    
    echo "📦 Backing up ${SOURCE_DIR} to ${DEST_DIR}/${BACKUP_FILENAME}"
    tar -czf "${DEST_DIR}/${BACKUP_FILENAME}" -C "${SOURCE_DIR}" .

    echo "🧹 Cleaning up old backups..."
    ls -t "${DEST_DIR}"/backup_*.tar.gz | tail -n +$((MAX_BACKUPS + 1)) | xargs --no-run-if-empty rm

    echo "✅ Cleanup complete. Next backup in ${INTERVAL} seconds."
    sleep ${INTERVAL}
done
