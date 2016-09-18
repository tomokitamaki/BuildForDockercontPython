#!/bin/bash
yum install -y git gcc make bzip2-libs.x86_64 bzip2 bzip2-devel.x86_64 readline readline-devel.x86_64 openssl openssl-devel.x86_64 sqlite-devel.x86_64

git clone https://github.com/yyuu/pyenv.git ~/.pyenv
cat << 'EOF' >> .bash_profile 
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
EOF

source .bash_profile
pyenv install 3.5.2
pyenv local 3.5.2
