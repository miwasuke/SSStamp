# SSStamp

## Syusseki Syussya Stamp
出席とか出社時に押してスタンプを貯めるアプリ

# ファイル構造
```
SSStamp
 ├ terraform/
 └ html/
```
# 開発
## terraform
terraformディレクトリに移動し、修正
```shell
cd terraform
terraform init
terraform plan
terraform apply
```

## html
awscliのためのアクセスキーはよしなに
```shell
cd html
aws s3 sync . s3://miwasuke-ssstamp
```
