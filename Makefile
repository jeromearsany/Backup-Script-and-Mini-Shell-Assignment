# --- Configurable Parameters ---
SOURCE      := ./source_folder
DESTINATION := ./backups_folder
# Time in seconds between backups
INTERVAL    := 10
# Number of backups to keep
KEEP_COUNT  := 3

.PHONY: run

run:
	bash ./backup.sh $(SOURCE) $(DESTINATION) $(INTERVAL) $(KEEP_COUNT)
