# 第1部 Introduction

## 環境構築
[binder](https://mybinder.org)を使うなら不要。

### パッケージマネージャのインストール
必須ではないが，以下ではインストールされていることを前提に進めていく。入れたくなければ以下のソフトを手動でインストールすれば良い。

- [Windowsの場合](#Windowsの場合)
- [macOSの場合](#macOSの場合)
- [それ以外の場合](#それ以外の場合)


#### Windowsの場合
##### Powershell実行ポリシー変更
まずPowershellはセキュリティ上の利用により，デフォルトでは任意のスクリプト（自分で作成したものを含む）を実行することができない。しかしそれはあまりにも不便なので変更しておく。以下のコマンドによって，ダウンロードしたスクリプトのみ実行のために信頼できる発行元の署名が必要になる。
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```
他のポリシーにしたければ[ドキュメント](https://docs.microsoft.com/ja-JP/previous-versions//ee176961(v=technet.10))参照。
##### PackageManagementインストール(Windows10未満のみ)
[ここ](https://www.microsoft.com/en-us/download/details.aspx?id=50395)からインストーラを落として実行する。

ちなみに私はこの節の動作確認をしていないので，もしこれが動かなかったら[chocolatey](https://chocolatey.org)を使うことにする。

##### PackageManagementのセットアップ
まずChocolateyを利用可能にする。管理者権限でPowershellを起動して以下を実行する。
```powershell
Install-PackageProvider -Name "Chocolatey"
```

終わったらPowershellを一度閉じる。

パッケージのインストールはPowershell上で以下のように行う。
```powershell
Install-Package パッケージ名
```

#### macOSの場合
[公式](https://brew.sh/)にインストールのコマンドが書いてあるので，それを実行する。

パッケージのインストールは以下のように行う，
```bash
brew install パッケージ名
```

#### それ以外の場合
各自調べてください。ディストリビューションに付属しているものがあればそれを使っても良いし，[Linuxbrew](https://docs.brew.sh/Homebrew-on-Linux)というものもあるらしい。パッケージマネージャに依らず手動でインストールするのでも構わない。

### リポジトリのクローン
#### Gitのインストール
以下のコマンドでインストール済みか確認。
```bash
git --version
```
`command not found`とかが出たら要インストール。

```powershell
Install-Package git
```

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

```powershell
Install-Package PrependPath=1
```

```bash
brew install python3
```

インストールされたことを確認する。

```bash
python3 -V
```

#### Pipenvのインストール
次のコマンドでインストールできる。
```powershell
pip3 install pipenv
```
```bash
brew install pipenv
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

#### クリーナーのセットアップ
Jupyter Notebookのデータをバージョン管理しやすいように整形するツールをセットアップする。

TODO: 書く

## Jupyter Notebookの起動
```bash
pipenv run jupyter notebook
```
