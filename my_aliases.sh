# git aliases
alias gits="git status"
alias gitl="git log --pretty='format:%h %C(yellow)%ad %<(15)%C(green)%an %C(cyan)%s %C(magenta)%d' --date=format:'%Y-%m-%d %H:%M'"
alias gitb='git branch --remote --sort=-committerdate --format "%(align:40) %(refname:lstrip=-1) %(end) %(align:41) %(committerdate:relative) %(end) %(committername)"'
# shellcheck disable=SC2142
# shellcheck disable=SC2154
alias gitprune='git fetch -p && for branch in `git branch -vv | grep ": gone]" | awk "{print $1}"`; do git branch -D $branch; done'
alias gitpb='git push -u origin $(git_current_branch)'

# java aliases
alias gcb='gradle clean build'
alias gwcb='./gradlew clean build'
alias mci='mvn clean install'
alias mcv='mvn clean verify'

# disk usage aliases - find disk space hogs
alias ducks='du -cks * | sort -rn | head'
alias duha='du -ha | sort -rh | head -n 20'

alias idea='/mnt/c/Program\ Files\ \(x86\)/JetBrains/IntelliJ\ IDEA\ Community\ Edition\ 2025.1.1.1/bin/idea64.exe'

# When you absolutely, positively got to kill every instance in docker.
killalldocker()
{
    docker rm -f $(docker ps -a -q)
}

echo "sourced my_aliases.sh"
