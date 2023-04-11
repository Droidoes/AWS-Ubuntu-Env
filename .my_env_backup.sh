#!/bin/bash
# This is a comment
# This script creates a backup of specified files and directories

# Set the backup destination
BACKUP_DEST=$HOME/My_backup

# Create an array of files and directories to back up
FILES_TO_BACKUP=(
    "$HOME/.Xauthority"
    "$HOME/.bash_history"
    "$HOME/.bashrc"
    "$HOME/.gitconfig"
    "$HOME/.gitignore"
    "$HOME/.profile"
    "$HOME/.python_history"
    "$HOME/.vim/"
    "$HOME/.viminfo"
    "$HOME/.vimrc"
    "$HOME/.vnc"
    "$HOME/.xsession"
    "$HOME/.my_env_backup.sh"
)

# Create the backup directory if it doesn't exist
mkdir -p $BACKUP_DEST

# Loop through the array and create a backup of each file/directory
for FILE in "${FILES_TO_BACKUP[@]}"
do
    # Get the base name of the file/directory
    BASENAME=$(basename $FILE)

    # Create the backup
    sudo cp -aR $FILE $BACKUP_DEST/$BASENAME
done

# Set the log file path
LOG_FILE=$BACKUP_DEST/backup.log

# Get the current date and time
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Write the success message to the log file
echo "[$TIMESTAMP] Backup created at $BACKUP_DEST" >> $LOG_FILE
