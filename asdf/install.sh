export ASDF_DIR="$HOME/.asdf"
. "$ASDF_DIR/asdf.sh"

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest
asdf local nodejs latest

asdf plugin-add kubectl https://github.com/asdf-community/asdf-kubectl.git
asdf install kubectl latest
asdf global kubectl latest
asdf local kubectl latest

asdf plugin-add dapr-cli  https://github.com/mindovermiles262/asdf-dapr-cli.git
asdf install dapr-cli latest
asdf global dapr-cli latest
asdf local dapr-cli latest

asdf plugin-add age  https://github.com/threkk/asdf-age.git
asdf install age latest
asdf global age latest
asdf local age latest


asdf plugin add https://github.com/MetricMike/asdf-awscli.git
asdf install awscli latest
asdf global awscli latest
asdf local awscli latest

asdf plugin add golang  https://github.com/asdf-community/asdf-golang.git
asdf install golang latest
asdf global golang latest
asdf local golang latest

asdf plugin add helm  https://github.com/Antiarchitect/asdf-helm.git
asdf install helm latest
asdf global helm latest
asdf local helm latest

asdf plugin add jq https://github.com/lsanwick/asdf-jq.git
asdf install jq latest
asdf global jq latest
asdf local jq latest

asdf plugin-add k9s https://github.com/looztra/asdf-k9s
asdf install k9s latest
asdf global k9s latest
asdf local k9s latest

asdf plugin add kubectx
asdf install kubectx latest
asdf global kubectx latest
asdf local kubectx latest

asdf plugin add krew https://github.com/bjw-s/asdf-krew.git
asdf install krew latest
asdf global krew latest
asdf local krew latest

asdf plugin-add tmux https://github.com/aphecetche/asdf-tmux.git
asdf install tmux latest
asdf global tmux latest
asdf local tmux latest

asdf plugin-add github-cli https://github.com/bartlomiejdanek/asdf-github-cli.git
asdf install github-cli latest
asdf global github-cli latest
asdf local github-cli latest
