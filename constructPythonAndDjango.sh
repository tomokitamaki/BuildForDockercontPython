#!/bin/bash
#ホームディレクトリに移動
cd ~/



# pyenvでpythonをインストールする際に必要なものをインストール
yum install -y git gcc make bzip2-libs.x86_64 bzip2 bzip2-devel.x86_64 readline readline-devel.x86_64 openssl openssl-devel.x86_64 sqlite-devel.x86_64

# pyenvを取得
git clone https://github.com/yyuu/pyenv.git ~/.pyenv

# pyenvに必要な設定を.bash_profileに書き込む
cat << 'EOF' >> .bash_profile 
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
EOF

# 変更を反映させるために、.bash_profileを再読み込み
source .bash_profile

# pyenvを使ってpython3.5.2をインストール
pyenv install 3.5.2
pyenv local 3.5.2
python --version | grep "Python 3.5.2"
if [ "$?" -eq 0 ]
then
    :
else
    echo "pythonのバージョンが3.5.2ではありません"
    exit 1
fi

pip install --upgrade pip

if [ "$?" -eq 0 ]
then
    :
else
    echo "pipのインストールが失敗しました"
    exit 1
fi

pip install Django

if [ "$?" -eq 0 ]
then
    :
else
    echo "Djangoのインストールが失敗しました。"
    exit 1
fi

echo "引き続き、Djangoチュートリアルのプロジェクトを作成するから進めてください"
echo "https://docs.djangoproject.com/ja/1.10/intro/tutorial01/#creating-a-project"
