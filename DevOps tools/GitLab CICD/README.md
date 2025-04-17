# GitLab & Git Commands with Comments

## 🔁 Basic Git Setup Commands
```bash
git config --global user.name "Your Name"        # Sets your Git username globally
git config --global user.email "you@example.com" # Sets your Git email globally
git config --list                                # Displays the current Git configuration
```

## 🧱 Repository Initialization
```bash
git init                                         # Initializes a new Git repository in your current directory
git clone <repo-url>                             # Clones a GitLab repo to your local machine
```

## 📦 Staging & Committing
```bash
git status                                       # Shows the status of changes (modified, staged, untracked)
git add <file>                                   # Stages a specific file for commit
git add .                                        # Stages all changes in the current directory
git commit -m "Your commit message"              # Commits staged changes with a message
```

## 🔀 Branching
```bash
git branch                                       # Lists all local branches
git branch <branch-name>                         # Creates a new branch
git checkout <branch-name>                       # Switches to the specified branch
git checkout -b <branch-name>                    # Creates and switches to a new branch
git switch <branch-name>                         # Alternative to checkout (switch to a branch)
git switch -c <branch-name>                      # Creates and switches to a branch
```

## 📤 Pushing & Pulling
```bash
git push origin <branch-name>                    # Pushes local branch to GitLab remote
git pull origin <branch-name>                    # Pulls latest changes from GitLab into current branch
git fetch                                        # Fetches all branches from GitLab without merging
git push -u origin <branch-name>                 # Pushes branch and sets upstream tracking
```

## 🔗 Remote Repository Commands
```bash
git remote -v                                    # Shows remote repo URLs
git remote add origin <repo-url>                 # Adds a remote named 'origin'
git remote set-url origin <new-url>              # Updates the remote URL
```

## 🔁 Merging & Rebasing
```bash
git merge <branch-name>                          # Merges specified branch into current branch
git rebase <branch-name>                         # Reapplies commits on top of another base tip
git rebase -i HEAD~3                             # Interactive rebase (squash, edit, reorder)
```

## 🧹 Undoing Changes
```bash
git reset --soft HEAD~1                          # Undoes last commit, keeps changes staged
git reset --hard HEAD~1                          # Undoes last commit, discards changes
git checkout -- <file>                           # Reverts a file to the last committed version
git revert <commit-hash>                         # Creates a new commit that reverses the given commit
```

## 📝 GitLab CI/CD (`.gitlab-ci.yml` related)
```yaml
stages:
  - build
  - test
  - deploy

build_job:
  stage: build
  script:
    - echo "Building the app..."                # Command to build the app

test_job:
  stage: test
  script:
    - echo "Running tests..."                   # Command to run tests

deploy_job:
  stage: deploy
  script:
    - echo "Deploying to production..."        # Command to deploy
```

## 🔐 GitLab Authentication
```bash
git clone https://oauth2:<ACCESS_TOKEN>@gitlab.com/username/repo.git   # Clone using a personal access token
```

## 🧰 Advanced Git Commands
```bash
git log                                           # Shows commit history
git log --oneline --graph --all                   # Pretty history with branches in graph format
git diff                                          # Shows unstaged differences between files
git diff --staged                                 # Shows staged differences
git blame <file>                                  # Shows who last modified each line in a file
git shortlog -s -n                                # Shows contributors sorted by number of commits
```

## 📌 Tags (for Releases)
```bash
git tag                                           # Lists all tags
git tag v1.0                                      # Creates a lightweight tag
git tag -a v1.0 -m "Release version 1.0"          # Creates an annotated tag
git push origin v1.0                              # Pushes a specific tag to GitLab
git push origin --tags                            # Pushes all tags to GitLab
```

## 💾 Stashing Changes
```bash
git stash                                         # Temporarily stashes uncommitted changes
git stash pop                                     # Applies and removes the last stash
git stash list                                    # Lists all stashed changes
git stash drop                                    # Deletes the last stash
```

## 🗑️ Deleting Stuff
```bash
git branch -d <branch-name>                       # Deletes a local branch (safe)
git branch -D <branch-name>                       # Force deletes a local branch
git push origin --delete <branch-name>            # Deletes a remote branch from GitLab
git tag -d v1.0                                   # Deletes a local tag
git push origin :refs/tags/v1.0                   # Deletes a remote tag
```

## 👀 Viewing Remote Info
```bash
git show                                          # Shows info about the latest commit
git show <commit-id>                              # Shows detailed info about a specific commit
git remote show origin                            # Shows detailed info about the remote origin
git config --get remote.origin.url                # Shows URL of origin remote
```

## 🔒 GitLab CI/CD Token Auth (more examples)
```bash
# Clone a repo using GitLab CI_JOB_TOKEN
git clone https://gitlab-ci-token:${CI_JOB_TOKEN}@gitlab.com/<namespace>/<project>.git
```

## 🚀 GitLab CI/CD Job Manual Trigger (via API)
```bash
curl --request POST \
  --form token=YOUR_TRIGGER_TOKEN \
  --form ref=main \
  https://gitlab.com/api/v4/projects/PROJECT_ID/trigger/pipeline
```

## 🔍 GitLab Project Info (via CLI/API)
```bash
curl --header "PRIVATE-TOKEN: <your_access_token>" https://gitlab.com/api/v4/projects/<project_id>/pipelines
```

## 🔧 GitLab Runner Commands
```bash
gitlab-runner register                             # Registers a new runner
gitlab-runner verify                               # Verifies registered runners
gitlab-runner list                                 # Lists all registered runners
gitlab-runner run                                  # Manually run the runner (debugging/testing)
gitlab-runner unregister --name <runner-name>      # Unregisters a runner
```

## 🗂️ Working with Submodules
```bash
git submodule add <repo-url> path/to/dir          # Adds a submodule
git submodule update --init                       # Initializes submodules
git submodule update --remote                     # Pulls the latest changes from submodule repo
git submodule status                               # Shows current submodule commit
```

## ✅ Cherry-picking Commits
```bash
git cherry-pick <commit-hash>                     # Applies a specific commit to current branch
```

## 📂 Clean Untracked Files
```bash
git clean -f                                      # Deletes untracked files
git clean -fd                                     # Deletes untracked files and directories
```

## 📁 Creating .gitlab-ci.yml Easily
```bash
touch .gitlab-ci.yml                              # Creates a new CI/CD file
```

## 🧪 GitLab CI/CD Linting
```bash
# Validate .gitlab-ci.yml syntax via API
curl --header "PRIVATE-TOKEN: <token>" --data "content=$(cat .gitlab-ci.yml)" https://gitlab.com/api/v4/ci/lint
```

## 📦 GitLab Artifacts in CI/CD
```yaml
artifacts:
  paths:
    - build/
  expire_in: 1 week                                # Stores build outputs for later download
```

## 🔍 GitLab API: List Projects
```bash
curl --header "PRIVATE-TOKEN: <your_access_token>" https://gitlab.com/api/v4/projects
```

## 🔄 Git Reflog
```bash
git reflog                                         # View history of HEAD changes (useful to recover lost commits)
```

## 🧪 Git Bisect (Find faulty commit)
```bash
git bisect start                                   # Begin bisecting
git bisect bad                                     # Mark current commit as bad
git bisect good <commit-hash>                      # Mark known good commit
```

## 🔍 Git Grep
```bash
git grep 'TODO'                                    # Search for 'TODO' inside tracked files
