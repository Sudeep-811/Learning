# Git Cheat Sheet

## 1. Setup and Configuration

### 1.1 Initialize a Repository
```
git init
```
**Example:** `git init`  
**Description:** Creates a new Git repository in the current directory.

### 1.2 Clone a Repository
```
git clone <repository-url>
```
**Example:** `git clone https://github.com/username/repository.git`  
**Description:** Creates a copy of a remote repository on your local machine.

### 1.3 Configure User Information
```
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```
**Example:** `git config --global user.name "John Doe"`  
**Description:** Sets the name and email address that will be attached to your commits.

## 2. Basic Commands

### 2.1 Check Repository Status
```
git status
```
**Example:** `git status`  
**Description:** Shows the working tree status, including staged changes, unstaged changes, and untracked files.

### 2.2 Add Files to Staging
```
git add <file-name>
git add .
```
**Example:** `git add index.html` or `git add .`  
**Description:** Adds a specific file or all changes to the staging area for the next commit.

### 2.3 Commit Changes
```
git commit -m "commit message"
```
**Example:** `git commit -m "Fix navigation bar bug"`  
**Description:** Records the changes in the repository with a descriptive message.

### 2.4 View Commit History
```
git log
git log --oneline
```
**Example:** `git log --oneline`  
**Description:** Shows the commit history, with `--oneline` providing a condensed view.

## 3. Branching and Merging

### 3.1 List Branches
```
git branch
```
**Example:** `git branch`  
**Description:** Lists all local branches, with the current branch highlighted.

### 3.2 Create a New Branch
```
git branch <branch-name>
```
**Example:** `git branch feature-login`  
**Description:** Creates a new branch (but doesn't switch to it).

### 3.3 Switch Branches
```
git checkout <branch-name>
git switch <branch-name>  # Git 2.23+
```
**Example:** `git checkout develop` or `git switch develop`  
**Description:** Switches to the specified branch.

### 3.4 Create and Switch to a New Branch
```
git checkout -b <branch-name>
git switch -c <branch-name>  # Git 2.23+
```
**Example:** `git checkout -b feature-user-profile`  
**Description:** Creates a new branch and immediately switches to it.

### 3.5 Merge Branches
```
git merge <branch-name>
```
**Example:** `git merge feature-login`  
**Description:** Merges the specified branch into the current branch.

## 4. Remote Operations

### 4.1 Add Remote Repository
```
git remote add <remote-name> <repository-url>
```
**Example:** `git remote add origin https://github.com/username/repository.git`  
**Description:** Adds a new remote repository.

### 4.2 List Remote Repositories
```
git remote -v
```
**Example:** `git remote -v`  
**Description:** Lists all remote repositories with their URLs.

### 4.3 Fetch Changes from Remote
```
git fetch <remote-name>
```
**Example:** `git fetch origin`  
**Description:** Downloads changes from the remote repository without merging them.

### 4.4 Pull Changes from Remote
```
git pull <remote-name> <branch-name>
```
**Example:** `git pull origin main`  
**Description:** Fetches and merges changes from the remote repository.

### 4.5 Push Changes to Remote
```
git push <remote-name> <branch-name>
```
**Example:** `git push origin main`  
**Description:** Uploads local branch commits to the remote repository.

## 5. Undoing Changes

### 5.1 Discard Changes in Working Directory
```
git checkout -- <file-name>
git restore <file-name>  # Git 2.23+
```
**Example:** `git checkout -- index.html` or `git restore index.html`  
**Description:** Discards changes in the working directory for a specific file.

### 5.2 Unstage Changes
```
git reset HEAD <file-name>
git restore --staged <file-name>  # Git 2.23+
```
**Example:** `git reset HEAD index.html` or `git restore --staged index.html`  
**Description:** Removes a file from the staging area without discarding its changes.

### 5.3 Amend Last Commit
```
git commit --amend
```
**Example:** `git commit --amend -m "Updated commit message"`  
**Description:** Modifies the most recent commit (message and/or content).

### 5.4 Reset to a Previous Commit
```
git reset --soft <commit-hash>  # Keep changes staged
git reset --mixed <commit-hash>  # Keep changes unstaged (default)
git reset --hard <commit-hash>  # Discard changes
```
**Example:** `git reset --soft abc1234`  
**Description:** Moves HEAD and branch pointer to a specified commit.

## 6. Stashing

### 6.1 Stash Changes
```
git stash
```
**Example:** `git stash`  
**Description:** Temporarily saves modified tracked files, allowing you to switch branches.

### 6.2 List Stashes
```
git stash list
```
**Example:** `git stash list`  
**Description:** Shows all stashed changesets.

### 6.3 Apply Stash
```
git stash apply
git stash apply stash@{n}
```
**Example:** `git stash apply stash@{2}`  
**Description:** Applies a stashed changeset without removing it from the stash list.

### 6.4 Apply and Remove Stash
```
git stash pop
git stash pop stash@{n}
```
**Example:** `git stash pop`  
**Description:** Applies the most recent stash and removes it from the stash list.

### 6.5 Remove Stash
```
git stash drop stash@{n}
```
**Example:** `git stash drop stash@{1}`  
**Description:** Removes a specified stash from the stash list.

## 7. Advanced Commands

### 7.1 Show Changes Between Commits
```
git diff <commit-hash1> <commit-hash2>
```
**Example:** `git diff abc1234 def5678`  
**Description:** Shows the differences between two commits.

### 7.2 Create a Tag
```
git tag <tag-name>
git tag -a <tag-name> -m "tag message"
```
**Example:** `git tag -a v1.0.0 -m "Version 1.0.0 release"`  
**Description:** Creates a lightweight tag or an annotated tag with a message.

### Cherry-pick Commits
```
git cherry-pick <commit-hash>
```
**Example:** `git cherry-pick abc1234`  
**Description:** Applies the changes from a specific commit to the current branch.

### Rebase Branch
```
git rebase <branch-name>
```
**Example:** `git rebase main`  
**Description:** Reapplies commits from the current branch on top of another branch's history.

### Clean Untracked Files
```
git clean -n  # Dry run, shows what would be deleted
git clean -f  # Force deletion
```
**Example:** `git clean -f`  
**Description:** Removes untracked files from the working directory.
