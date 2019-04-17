# 第1部 Introduction

## 環境構築
[binder](https://mybinder.org)を使うなら不要。

### リポジトリのクローン
#### Gitのインストール
以下のコマンドでインストール済みか確認。
```bash
git --version
```
`command not found`とかが出たら要インストール。 [公式](https://git-scm.com/downloads)から環境にあったものをインストールする。パッケージマネージャを使っても良い。

Note: Mac使いはパッケージマネージャ[brew](https://brew.sh/index_ja)をインストールしておくと何かと便利なので，この機会に入れるも良し。brewをインストールしたら，Gitは以下のコマンド一発でインストールできる。
```bash
brew install git
```

### リポジトリのクローン
ターミナルで適当なディレクトリに移動した上で，以下のコマンドを実行。
```bash
git clone https://github.com/tsg-ut/sig-nlp-2019.git
cd sig-nlp-2019
```

### Jupyter Notebookのセットアップ

#### Python3のインストール
OSによってはプリインストールされている。ターミナルで以下を入力して，バージョンを確認する。
```bash
python3 -V
```
`Python 3.x.x`のような表示がされた場合，以下の操作は不要。`command not found`等は要インストール。

パッケージマネージャにPython3があればそれを使ってもいいし，[公式](https://www.python.org/downloads/)や[Anaconda](https://www.anaconda.com/distribution/), [Miniconda](https://docs.conda.io/en/latest/miniconda.html)などからインストールしても良い。必ずPython**3**系をインストールすること。

インストールされたことを確認する。

```bash
python3 -V
```

#### Pipenvのインストール
次のコマンドでインストールできる。
```bash
pip3 install --user pipenv
```
次のコマンドでインストール済みであることを確認する。
```bash
pipenv --version
```

#### Jupyter Notebookのインストール
本来は`pipenv install jupyter`などとするところであるが，第1部で使うパッケージの一覧を`Pipfile`に書いておいたので，これを用いて一気にインストールする。

```bash
pipenv install --three
```

## Jupyter Notebookの起動
```bash
pipenv run jupyter notebook
```
