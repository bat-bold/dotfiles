#!/usr/bin/env fish

#install fisher; fish shell plugin manager; https://github.com/jorgebucaran/fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

#install `bass` for nvm
#fisher install edc/bass

#fisher install jorgebucaran/nvm.fish

#use node default
#set --universal nvm_default_version latest
