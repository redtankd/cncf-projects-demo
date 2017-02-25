if status --is-interactive
    alias cdl='cd /usr/local/'
    alias cdlb='cd /usr/local/bin'
    alias cdo='cd ~/opt/'
    alias cdd='cd ~/dev'
    alias cdg='cd ~/dev/git/'
    alias cdgg='cd ~/dev/git/github'
    alias cdt='cd ~/tmp'

    alias psg='ps -ef|grep'

    # pcre2 is required
    alias ifa="ifconfig -a"
    alias ifad="ifconfig | pcre2grep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

    alias ns='netstat -an -p tcp'
    alias nr='netstat -rn -f inet'

    alias g='git'

    alias d='docker'
    alias dps='docker ps'
    alias dx='docker exec -it'
    alias dm='docker-machine'

    alias c='cargo'
    alias rdoc='rustup doc'
    alias rbook='rustup doc --book'
    alias rstd='rustup doc --std'
end
