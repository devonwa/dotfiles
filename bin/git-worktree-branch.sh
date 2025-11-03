#!/bin/sh

# git-worktree-branch.sh - Create or use existing git worktree branch
# Usage: git-worktree-branch.sh <branch-name>

if [ -z "$1" ]; then
    echo "Usage: $0 <branch-name>"
    exit 1
fi

BRANCH_NAME="$1"

# Get the git root directory
GIT_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)
if [ -z "$GIT_ROOT" ]; then
    echo "Error: Not in a git repository"
    exit 1
fi

# Get the parent directory of the git root
PARENT_DIR=$(dirname "$GIT_ROOT")
WORKTREE_PATH="$PARENT_DIR/$BRANCH_NAME"

# Check if directory already exists
if [ -d "$WORKTREE_PATH" ]; then
    # Check if it's already a worktree
    if git worktree list | grep -q "$WORKTREE_PATH"; then
        echo "Worktree already exists at: $WORKTREE_PATH"
        cd "$WORKTREE_PATH"
        EXISTING_WORKTREE=true
    else
        echo "Error: Directory $WORKTREE_PATH exists but is not a git worktree"
        exit 1
    fi
else
    EXISTING_WORKTREE=false
    # Create new worktree
    # Check if branch exists remotely
    if git show-ref --verify --quiet "refs/remotes/origin/$BRANCH_NAME"; then
        echo "Creating worktree for existing remote branch: $BRANCH_NAME"
        git worktree add "$WORKTREE_PATH" "$BRANCH_NAME"
    elif git show-ref --verify --quiet "refs/heads/$BRANCH_NAME"; then
        echo "Creating worktree for existing local branch: $BRANCH_NAME"
        git worktree add "$WORKTREE_PATH" "$BRANCH_NAME"
    else
        echo "Creating new worktree and branch: $BRANCH_NAME"
        git worktree add -b "$BRANCH_NAME" "$WORKTREE_PATH"
    fi

    if [ $? -eq 0 ]; then
        echo "Worktree created at: $WORKTREE_PATH"
        cd "$WORKTREE_PATH"
    else
        echo "Error: Failed to create worktree"
        exit 1
    fi
fi

# Create tmux session for the worktree
REPO_NAME=$(basename "$GIT_ROOT")
# Create a short name from branch name (replace slashes and special chars with dashes)
SHORT_BRANCH=$(echo "$BRANCH_NAME" | sed 's/[\/.]/-/g' | cut -c1-20)
SESSION_NAME="${REPO_NAME}-${SHORT_BRANCH}"

# Check if tmux is available
if command -v tmux >/dev/null 2>&1; then
    # Check if session already exists
    if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
        echo "Attaching to existing tmux session: $SESSION_NAME"
        tmux attach-session -t "$SESSION_NAME"
    else
        echo "Creating tmux session: $SESSION_NAME"
        cd "$WORKTREE_PATH"
        # Check if tmux-new.sh exists
        SCRIPT_DIR=$(dirname "$0")
        if [ -f "$SCRIPT_DIR/tmux-new.sh" ]; then
            # Override SESSION for tmux-new.sh
            SESSION="$SESSION_NAME" "$SCRIPT_DIR/tmux-new.sh"
        else
            # Fallback: create simple tmux session
            tmux new-session -s "$SESSION_NAME" -c "$WORKTREE_PATH"
        fi
    fi
else
    echo "tmux not found, skipping session creation"
    cd "$WORKTREE_PATH"
fi
