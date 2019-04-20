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
Install-Package python
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
Jupyter Notebookのデータには実行番号や出力結果などが含まれており，バージョン管理で非本質的な差分が生じる。これを取り除くため，`git add`時などに不要な情報を削除した上でステージに乗せるよう設定する。

`git add`によってローカルのファイルが変化することはないが，リポジトリには整形された状態で載っているため，checkoutなどをすると整形されたものが復元されることに注意。

GUIクライアントによってはこのfilterを無視する場合があるので，CUIで`git add`することを勧める。

##### jqのインストール
`.ipynb`ファイルの中身はJSONなので，jqというJSON整形ツールを用いて整形する。

```powershell
Install-Package jq
```

```bash
brew install jq
```

##### gitの設定変更
`.gitconfig`に整形ツールの設定が書かれている。これを`.git/config`に読み込ませる必要があるが，その設定をするスクリプトを用意したのでそれを実行すれば良い。

```powershell
./gitsetup.ps1
```

```bash
bash gitsetup.sh
```

念の為書いておくと，これらのスクリプトは`.git/config`に以下の文字列を追記するものである。
```
[include]
	path="../.gitconfig"
```

## Jupyter Notebookの起動
```bash
pipenv run jupyter notebook
```
