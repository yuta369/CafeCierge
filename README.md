# <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Telegram-Animated-Emojis/main/Food%20and%20Drink/Hot%20Beverage.webp" alt="Hot Beverage" width="50" height="50" /> *CaféCierge* (カフェシェルジュ)

![CafeCierge_logo](https://github.com/user-attachments/assets/a502fd55-1c16-4283-a1ef-15f8d2215066)

　**CaféCierge** は、**おしゃれなカフェに特化した情報共有**ができるレビューサイトです。  
　ユーザーがカフェの情報を投稿し、レビューや評価を行うことで、**素敵なカフェを探す手助け**をします。  
　デートプランを立てる際にも便利な情報が満載です。

---

## サイト概要

### サイトテーマ

　**CaféCierge** は、女性が行きたくなるような**おしゃれなカフェに特化した情報**を提供します。

　ユーザーがカフェの詳細情報、写真、レビューを共有できるプラットフォームです。

　カフェ好きのコミュニティが集まり、**素敵な場所を見つける手助け**をします。

### テーマを選んだ理由

　初めてデートをする際にまずぶつかる壁は「デートのプラン決め」です。特に、相手とまだあまり親しくない場合にはデートのプランを立てることも難しいものです。

　デートのプランは男性側が全て決めてしまう場合や、ふたりで話し合いながら決めていく場合があります。どちらにしても、デートプランはデートが上手くいくかどうかを左右する重要なポイントの1つです。

　**普段からおしゃれなカフェを探している方**はもちろん、**「初デートでどこに行けば良いのか分からない」という方の助けにもなる**と考え、このテーマにしました。

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

---

## 特徴

- **カフェ投稿機能** : ユーザーはカフェの情報を投稿し、他のユーザーと**共有**できます。

- **レビュー機能** : カフェのレビューや評価を投稿し、他のユーザーの**参考**にすることができます。

- **お気に入り機能** : お気に入りのカフェを保存しておき、後で簡単に**アクセス**できます。

- **フォロー機能** : 他のユーザーをフォローして、そのユーザーが投稿したカフェ情報を簡単に**チェック**できます。

- **検索機能** : キーワードやタグを使って、目的のカフェを素早く**見つける**ことができます。

---

## 設計書

- **ER図**

![CaféCierge-ER図 drawio](https://github.com/user-attachments/assets/83967e35-5c29-45a3-b8f9-3e0c27807cd6)

- **画面遷移図 (UI Flows)**

![CaféCierge-画面遷移図 (UI Flows) drawio](https://github.com/user-attachments/assets/bd6770b9-65d8-4b5d-ad3c-49564ca0fe4d)

- **テーブル定義書** :
[CaféCierge-テーブル定義書](https://docs.google.com/spreadsheets/d/1ynMGy2rI1ryb7Q6F0g69Un9DROBkSgzD/edit?usp=sharing&ouid=103542130713378992441&rtpof=true&sd=true)

- **アプリケーション詳細設計書** :
[CaféCierge-アプリケーション詳細設計書](https://docs.google.com/spreadsheets/d/1NcVHX4IVRChopYptHGUYnVcK7jLINyXEccnKRFFazJA/edit?usp=sharing)

　**※** 設計書は、開発しながら随時**修正中**です。  そのため、**最新の情報ではない**可能性があります。

---

## 開発環境

- **OS** ：Linux (Amazon Linux 2)

- **IDE** ：Cloud9 (AWS)

---

## 使用技術

- **フロントエンド** : HTML 5 / CSS 3 / JavaScript (ES6) / Bootstrap 5

- **バックエンド** : Ruby (ver. 3.1.2p20) / Ruby on Rails (ver. 6.1.7.8)

- **データベース** : SQL (SQLight 3)

- **認証** : Devise

- **画像アップロード** : Active Storage

- **その他ライブラリ** : Raty.js (レビューの星評価) / Acts As Taggable On (タグ付け機能)

---

## プロジェクトのセットアップ

1. リポジトリをクローンします。

   ```bash
   git clone https://github.com/yuta369/CafeCierge.git
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

---

## 今後の追加を予定している機能

- **地図表示機能**
　カフェの場所を視覚的に把握できるようにすることで、ユーザーが訪れる際の**利便性を向上**させます。

- **カフェの予約機能**
　おしゃれなカフェの予約を簡単に行えるようにすることで、ユーザーが実際に訪れる際の**手間を省き**ます。

- **プッシュ通知機能**
　新しいレビューやコメント、フォロワーの投稿などに対する通知をリアルタイムで受け取ることで、ユーザーの**アクティブ率を高め**ます。

- **ソーシャルメディア連携**
　投稿を簡単にソーシャルメディアでシェアできるようにすることで、サイトの認知度を高め、**新規ユーザーを獲得**しやすくなります。

- **アナリティクス機能（管理者）**
　サイトの利用状況やユーザーの行動を分析できるようにすることで運営改善のための**データを提供**します。

---

## 開発に関するメモ

- 各機能の詳細な実装手順や設計の詳細については、今後の開発過程で追記予定です。

- 開発中のフィードバックは随時受け付けています。GitHub Issuesにてご報告ください。

---

## 使用素材について

　使用している画像は、全て OpenAI の画像生成AI「 DALL・E 3 」で作成したものです。

　**※** 「架空の店舗・団体・素材であることを前提」としたサイトです。  
　**※**  ただし、本番環境でユーザー様が投稿した画像に関しては、この限りではありません。