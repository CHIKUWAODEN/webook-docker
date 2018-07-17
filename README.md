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

あるいは、次のように直接 webook reate してもかまいません。
その場合は、先に Docker コンテナを起動して、その環境にセットアップされている webook コマンドを使うのが簡単です。

```
$ git clone https://github.com/CHIKUWAODEN/webook-docker
$ cd path/to/clone
$ mkdir book
$ docker run -v ./book:/webook webook
$ docker exec -t webook /sh
> cd /webook
> webook create ./
```


## Makefile の各ターゲットの解説
