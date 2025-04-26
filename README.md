# example-packer-ec2

packer で EC2 の AMI を作成するサンプル。

[公式の tutorial][公式]

[公式]: https://developer.hashicorp.com/packer/tutorials/aws-get-started

## 認証

以下、2 つの環境変数を export しておく。

```shell
export AWS_ACCESS_KEY_ID=***
export AWS_SECRET_ACCESS_KEY=***
```

## 実行

以下で、ap-northeast-1 に `learn-packer-linux-aws-***`という AMI ができる。`***`は、コミットハッシュ。コミットハッシュを使うので、`make`はローカルツリーが clean でないと失敗する。

```shell
packer init .
make
```

## インスタンス作成

```shell
bin/create-instance.bash
```
