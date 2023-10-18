# アプリケーション名
  medifc

# アプリケーション概要
  医療機関で処方された薬を一括で管理することができる。

# URL
  https://medific2.onrender.com

# テスト用アカウント
  ・Basic認証ID：admin

  ・Basic認証パスワード：2222

  ・メールアドレス：hoge@com

  ・パスワード：111111aa

# 利用方法
## お薬を登録
  1.最初にユーザー新規登録を行う

  2.登録ボタンから、処方された薬の内容（処方された日・病院名・薬名・飲むタイミング・個数・日数・備考）を入力する

  3.トップページに「処方された日／病院名」ごとで一覧表示される

## 一括管理
  病院や科に関係なく、すべての薬を一括で管理することができる。

# アプリケーションを開発した背景
  普段使用しているお薬手帳が薬局ごとに違っていたり、紙のためアプリに対応していなかったりと不便だったため、
  まとめて管理できれば便利なのではないかと考えた。

# 洗い出した要件

  [要件を定義したシート](https://docs.google.com/spreadsheets/d/1qCrQWnB8uR3N32EXNyA5WtwEWnLSYknKky1auSK-2Tw/edit#gid=982722306)


# 実装した機能についての画像やGIFおよびその説明
  1.ログインしなければ使用できないため、新規ページはログイン画面

  [![Image from Gyazo](https://i.gyazo.com/0bda2fefa363ee904d8ade17b31e8589.png)](https://gyazo.com/0bda2fefa363ee904d8ade17b31e8589)
  
  2.「新規登録」ボタンから新規登録ページへ遷移し、必要事項を入力して新規登録

  [![Image from Gyazo](https://i.gyazo.com/4139ef2c76e1fa478c6caa69fb63fcca.png)](https://gyazo.com/4139ef2c76e1fa478c6caa69fb63fcca)

  3.登録後、もしくはログイン後は一覧ページへ遷移し、登録済みの薬の「処方された日／病院名」ごとに、”処方された日”の降順で一覧表示される

  [![Image from Gyazo](https://i.gyazo.com/b68604e9934412517fdff84c3eb06bae.png)](https://gyazo.com/b68604e9934412517fdff84c3eb06bae)

  4.一覧ページの「登録」ボタンを押して、お薬登録ページへ遷移。薬の数に応じてフォームを増やすことができる

  [![Image from Gyazo](https://i.gyazo.com/26ced931548be95a9ae1b8b3536cd23c.gif)](https://gyazo.com/26ced931548be95a9ae1b8b3536cd23c)

  5.各項目を入力して保存すると、一覧ページへと遷移される

  [![Image from Gyazo](https://i.gyazo.com/20fb7ce92cb044602f82408ae4b278d2.gif)](https://gyazo.com/20fb7ce92cb044602f82408ae4b278d2)

  6.一覧ページの「処方された日／病院名」を選択すると、詳細ページへと遷移し、”病院名”から”処方された日”にもらった薬の詳細を見ることができる。

  情報を変更したい場合は、「編集」ボタンで編集ページへ

  [![Image from Gyazo](https://i.gyazo.com/c19487fa1ea6b413b5c91bd557ab7e83.gif)](https://gyazo.com/c19487fa1ea6b413b5c91bd557ab7e83)

  7.薬ごとに削除することができる(削除ミスを防ぐために2段階)

  [![Image from Gyazo](https://i.gyazo.com/0fd0a0b5606525e587938b3c29112482.gif)](https://gyazo.com/0fd0a0b5606525e587938b3c29112482)

  8.まとめて削除することもできる(削除ミスを防ぐために2段階)

  [![Image from Gyazo](https://i.gyazo.com/21151fb1de2de42b3a337308ed508216.gif)](https://gyazo.com/21151fb1de2de42b3a337308ed508216)



# 実装予定の機能
  Google Cloud Vision APIを利用した画像認識機能を実装中

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/b278cace1729a07eed31a85ad043b4ab.png)](https://gyazo.com/b278cace1729a07eed31a85ad043b4ab)

# 開発環境
  ・フロントエンド（Bootstrap）

  ・バックエンド

  ・インフラ

  ・テスト

  ・テキストエディタ

  ・タスク管理

# 工夫したポイント
  ・Formオブジェクトを使用して保存する際、複数の薬の情報を保存できるようにした

  ・登録時に薬の数に応じて、フォームを追加できる

  ・編集ページで薬ごとに削除することもできる
