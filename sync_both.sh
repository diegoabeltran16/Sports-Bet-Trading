#!/bin/bash

# Fetch the latest changes from both remotes
git fetch origin
git fetch gitlab

# Pull from GitHub
git pull origin main
if [ $? -ne 0 ]; then
    echo "Error pulling from origin main. Resolve conflicts and try again."
    exit 1
fi

# Push to GitHub
git push origin main
if [ $? -ne 0 ]; then
    echo "Error pushing to origin main."
    exit 1
fi

# Pull from GitLab with --allow-unrelated-histories
git pull gitlab main --allow-unrelated-histories
if [ $? -ne 0 ]; then
    echo "Error pulling from gitlab main. Resolve conflicts and try again."
    exit 1
fi

# Push to GitLab
git push gitlab main
if [ $? -ne 0 ]; then
    echo "Error pushing to gitlab main."
    exit 1
fi

echo "Sync completed successfully."
