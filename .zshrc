# If you come from bash you might have to change your $PATH.
export PATH="$HOME/bin:$HOME/pilot:/usr/local/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/jlouthan/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $HOME/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $HOME/.oh-my-zsh/plugins/*
# Custom plugins may be added to $HOME/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate $HOME/.zshrc"
# alias ohmyzsh="mate $HOME/.oh-my-zsh"

# Shortcuts
alias python="/usr/local/bin/python3"
alias vi="/usr/bin/vim"
alias pip="/usr/local/bin/pip3"
alias editzshrc="vi $HOME/.zshrc ; cp $HOME/.zshrc $HOME/bin ; source $HOME/.zshrc"
alias starttheo="cdtheo ; hugo server --buildFuture --buildDrafts"
alias starttheonodrafts="cdtheo ; hugo server --buildFuture"
alias purgereminders="/usr/bin/osascript /Users/jlouthan/bin/purge-all-completed-reminders.scpt"
alias pull-prayers="cd $HOME/Sites/theologic.us ; git pull ; cd $HOME/bin ; git pull ; cd $HOME/Sites/theologic.us"
alias wordcount='find . -name "*.md" -mtime -"$i" -type f -maxdepth 2 -exec awk 1 {} + | wc -w | awk "{ print \$1 }"'
alias todayscount='gfind . -maxdepth 1 -name "*.md" -daystart -ctime 0 -type f -exec awk 1 {} + | wc -w | awk "{ print \$1 }"'
alias archive_prayers='/usr/bin/find $HOME/Sites/prayers/pages -iname "$(date -j -v -1d +%F)*.adoc" -maxdepth 1'

# Change Dirs Shortcuts
alias cdclients="cd $HOME/Drive/Clients ;  ls -la ; pwd"
alias cdtheo="cd $HOME/Sites/theologic.us ; ls -la ; pwd"
alias cdtheomedia="cd $HOME/Sites/theologic.us/content/images ; ls -la ; pwd"
alias cdpaclife="cd $HOME/Drive/Clients/PacLife ; ls -la ; pwd"
alias cdplay="$HOME/Projects/Ansible/playbooks"
alias cdprayers="$HOME/Sites/prayers ; ls -la ; pwd"
alias cdceareplays="$HOME/SC2/CEA\ StarCraft\ Team\ Resources/CEA\ Replays"

# Ansible
alias play="ansible-playbook"
alias lint="ansible-lint"

export PATH="/opt/local/bin:/opt/local/sbin:/usr/local/opt/ruby/bin:$HOME/.gem/ruby/2.7.0/bin:$HOME/bin:$HOME/gems/bin:/usr/local/opt/python@3.9/libexec/bin:$HOME/Sites/prayers:$HOME/bin/gen_next:$HOME/Projects/PanaCEA/scripts:/opt/homebrew/bin:$PATH"
export MANPATH=/opt/local/share/man:$MANPATH
eval "$(rbenv init -)"
export GEM_HOME=$HOME/gems
