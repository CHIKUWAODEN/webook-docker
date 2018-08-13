# webook-docker

webook playground

## setup

webook-docker リポジトリを clone したのち、そのリポジトリルートディレクトリで webook プロジェクトを book というフォルダ名で配置してください。
たとえば、Github 上に your/book という Webook リポジトリを作成した場合は次のようになります。

```
$ git clone https://github.com/CHIKUWAODEN/webook-docker
$ cd path/to/clone
$ git clone http://github.com/your/book ./book
```

あるいは、次のように直接 webook create してもかまいません。
その場合は、先に Docker コンテナを起動して、その環境にセットアップされている webook コマンドを使うのが簡単です。

```
$ git clone https://github.com/CHIKUWAODEN/webook-docker
$ cd path/to/webook-docker
$ mkdir book
$ make shell
> cd /webook-docker/book
> webook create ./
```


## Makefile の各ターゲットの解説


shell

docker コンテナ上でシェルを起動します。
/bin/bash が起動します


## 開発者向けの情報

### 開発環境としての webook-docker

webook-docker は Webook がインストールされた Docker コンテナを提供するのが目的ですが、Webook の開発にも利用することができます。
`make run` でコンテナを起動するとき、book ディレクトリをボリュームとしてコンテナにマウントしますので、ここに Webook のリポジトリを於けば良いだけです。

webook や webook のサンプルが webook-docker の Git サブモジュールとして設定されていますので、
`git submodule init && git submodule update` することで簡単に利用できます。


### Webook のビルド方法


```
cd /webook-docker/book/webook 
rake build
sudo rake install:local
```

注意点として、変更をコミットしたあとでないとビルドをしても正しく反映されません。
先にコミットをした上でビルド及びインストールをするようにしましょう。