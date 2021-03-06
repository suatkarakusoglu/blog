#!/usr/bin/bash

# Command line arguments.
# $1: (Optional) Git commit message.

# Current working directory.
CWD=$(pwd)

# A function to be called from within a git repository. Stage, commit all
# changes with optional commit message, and push to the corresponding remote
# repository.
git_push () {
    # Stage all changes.
    git add .
    # If there is a commit message, use it, otherwise use a standard message.
    if [ -n "$1" ]; then
        msg="$1"
    else
        msg="Rebuilding blog $(date)."
    fi
    # Commit the changes.
    git commit -m "$msg"
    # Push the changes to the remote repository (origin).
    git push origin master
}

cd hugo || exit 1

echo "Build site with Hugo."
hugo

echo "Push the website built by Hugo to 'suatkarakusoglu/suatkarakusoglu.github.io'."
cd public || exit 1
git_push "$1"

echo "Push the Org Mode source files to 'suatkarakusoglu/blog'."
cd "$CWD" || exit 1
git_push "$1"

echo "Blog Published."
