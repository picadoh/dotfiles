# editor
alias vim='nvim'
alias vi='nvim'

# interactive search / open nvim 
alias fim='nvim $(fzf -m --preview="bat --color=always {}")'

# k8s
alias k='kubectl'

# docker
alias docker-compose='docker compose'
alias dtree="docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz images -t"
alias dins='docker inspect -f'

# localstack
alias awslocal='aws --endpoint-url http://localhost:4566'

# misc
alias wget='wget -c'
alias so='source ~/.zshrc'

# delta
if command -v delta > /dev/null; then
  alias diff='delta'
fi

