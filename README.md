# Gamiis
ゲーム好きの人のためのコミュニケーションサービスです<br>
URL: <a href="http://gamiis.tk/" target="_blank">http://gamiis.tk/</a>

<img width="1250" alt="スクリーンショット 2021-05-25 9 52 05" src="https://user-images.githubusercontent.com/63100083/119423738-f02c7700-bd3e-11eb-8fbd-a4e82f8f1068.png">
# 機能
- ユーザ登録
- ログイン
- グループ作成
- グループ参加
- チャット投稿
- チャットタブと募集タブ
- グループ検索
- チャット検索
- ユーザプロフィール
- グループ情報
## チャットを見る
![view_chat](https://user-images.githubusercontent.com/63100083/119423207-b6a73c00-bd3d-11eb-828e-050f705d484d.gif)
## チャットを入力する
![post_chat](https://user-images.githubusercontent.com/63100083/119423529-6f6d7b00-bd3e-11eb-99de-9901835df815.gif)
## 検索する
![search](https://user-images.githubusercontent.com/63100083/119423626-a3e13700-bd3e-11eb-87b9-43d4d0a39cfb.gif)
## プロフィールを見る
![profile](https://user-images.githubusercontent.com/63100083/119423630-a6dc2780-bd3e-11eb-9214-97de5d751649.gif)

# 使用技術
- Rails 6
- Ruby 2.7.2
- BootStrap

## gem
- webpacker
- sorcery (認証機能)
- carrierwave (画像アップロード)
- mini_magick (画像リサイズ)
- kaminari (ページネーション)
- ransack (検索機能)

## 開発環境構築
- docker
- docker-compose
- mysql
## 本番環境
- AWS
  - EC2
  - VPC
  - Route53
- MariaDB
- Unicorn
- Nginx
## 本番環境の構成
![AWS-gamiis drawio](https://user-images.githubusercontent.com/63100083/119424766-09362780-bd41-11eb-8a26-64f1c2c883ce.png)
