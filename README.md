# CaféCierge (カフェシェルジュ)

## サイト概要

### サイトテーマ
女性が行きたくなるような、おしゃれなカフェに特化した情報共有サイト

### テーマを選んだ理由
　初めてデートをする際にまずぶつかる壁は「デートのプラン決め」です。特に、相手とまだあまり親しくない場合にはデートのプランを立てることも難しいものです。  
　デートのプランは男性側が全て決めてしまう場合や、ふたりで話し合いながら決めていく場合があります。どちらにしても、デートプランはデートが上手くいくかどうかを左右する重要なポイントの1つです。  
　普段からおしゃれなカフェを探している方はもちろん、「初デートでどこに行けば良いのか分からない」という方の助けにもなると考え、このテーマにしました。  

### ターゲットユーザー
- まだ知らないおしゃれなカフェに行きたくなった方
- おすすめのカフェを誰かに紹介したくなった方
- 映える写真を撮ることが好きな方
- 女性をリードしてあげたい方

### 主な利用シーン
- 近くにあるおしゃれなカフェを調べたい時
- 自分の知っているおしゃれなカフェを誰かに共有したい時
- 見つけたカフェの評価をしたい時
- おしゃれなカフェの写真を眺めたくなった時
- パートナーとのデートプランを考える時

## 機能一覧（予定）
- ゲストログイン機能
- 会員登録・ログイン機能
- カフェの投稿・編集・削除機能
- 投稿検索機能（キーワード・タグ）
- カフェのレビュー・評価機能
- コメント機能
- フォロー機能
- お気に入り機能
- 地図表示機能（Google Maps API）
- 管理者用ダッシュボード（Active Admin）

## 設計書
設計書は後ほど作成予定です。

## 開発環境
- OS：Linux (CentOS)
- 言語：HTML, CSS, JavaScript, Ruby, SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用予定のGem
- Devise: ユーザー認証機能
- Simple Form: フォームの作成とカスタマイズ
- Acts As Taggable On: タグ機能
- Ransack: 検索機能
- Pundit: ユーザー権限管理
- Active Admin: 管理者用ダッシュボード
- Geocoder, Mapbox.js: 地図表示機能
- Followable: フォロー機能
- Acts As Favoritor: お気に入り機能
- Ahoy: アナリティクス機能
- Social Share Button: ソーシャルメディア連携
- ActiveJob, Twilio: 非同期処理・通知機能

## プロジェクトのセットアップ
1. リポジトリをクローンします。
    ```bash
    git clone https://github.com/yourusername/CafeCierge.git
    ```
2. ディレクトリに移動します。
    ```bash
    cd CafeCierge
    ```
3. 必要なGemをインストールします。
    ```bash
    bundle install
    ```
4. データベースをセットアップします。
    ```bash
    rails db:create db:migrate
    ```
5. サーバーを起動します。
    ```bash
    rails server
    ```

## 開発に関するメモ
- 各機能の詳細な実装手順や設計の詳細については、今後の開発過程で追記予定です。
- 開発中のフィードバックは随時受け付けています。GitHub Issuesにてご報告ください。