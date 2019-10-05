## うちカク！
* おうちカクテルライフを気軽に楽しめるようにするアプリです

#### 主な機能
* レシピ管理
	* レシピ一覧
	* 表示レシピの絞り込み、並べ替え
	* レシピ登録、編集
	* 作るのに必要な材料一覧
	* 作るのに足りない材料の表示
	* 複数の材料を全て使うレシピの逆引き
	* レシピのSNSへの投稿
	* レシピ名をSafariで検索
	* レシピ写真登録時の画像フィルター
* 材料管理
	* 材料一覧
	* 材料登録、編集
	* 在庫の切り替え
	* おすすめ材料の表示
	* その材料を使うレシピ一覧
	* 材料のリマインダー/カレンダーへの登録
	* 特定の材料をAmazon.co.jpで探す
* アルバム
	* 登録されている写真だけを一覧で表示
	* 並べ順を名前順、もしくはシャッフルして表示
	* 表示レシピの絞り込み

#### アプリダウンロード
* App Store： https://appsto.re/jp/l7pCbb

#### バージョン履歴
###### 2019-10-07 v6.3
* iPadに対応しました
* テーマカラーのわかりやすく選べるように改良しました。「うちカク！」のテーマカラーは25種類。ダークモードどころではありません。
* 今回よりiOS 12以降をサポート対象としました。iOS 11をお使いの方は是非iOS 12以降へアップデートをお願いします。
* 初期の準備画面を追加
* アプリ起動時に使われていない画像を削除する処理を追加

###### 2019-10-02 v6.2
* iOS 13への対応
* よりスムーズにスクロールできるように改良しました！

###### 2019-09-01 v6.1
* アプリをさらに使いやすく改良しました
* フレームワークの内製化（MJRefresh, M13Checkbox, ProgressHUD）

###### 2019-07-08 v6.0
* カクテルの「ロング」「ショート」の情報を追加しました！
* レシピ検索機能を大幅に強化しました！より柔軟に並べ替え、絞り込みができ、目当てのレシピを探しやすくなりました。
* 「おすすめ材料」機能を追加しました！持っていない材料のうち、入手すると多くのレシピを作れるようになるものを表示いたします。
* 紫色のテーマを3種追加しました！
* レシピの不足材料数の更新処理を必要な時だけに実施
* 「スタイル」「技法」についてモーダルでTipsを表示
* 検索（レシピ一覧、逆引き）、絞り込み（アルバム）、リマインダー（レシピ詳細、材料詳細）、復元プレビュー、レシピ材料編集、Tips、おすすめ材料をモーダルで表示
* UITextView, UITextField, UINavigationBar, UISearchBar, UILabelなどをサブクラス化することで「共有」時のTextField、SearchBar、BarButtonItemの色が引きずられる問題を修正
* 全体的に丸みを帯びたデザインに変更


###### 2019-06-17 v5.4
* リファクタリング、処理の効率化など
* フレームワークの内製化（ImageViewer, Introduction, EmptyData）
* アルバムのレシピ名の背景をグラデーションに変更
* レシピ詳細画面で全てのセルにリマインダーが表示されるバグを修正
* その他細かい改良

###### 2019-06-03 v5.3
* フォトライブラリから写真を選択するとき、切り取りの位置がずれる問題を修正しました
* 一部の画面を見やすく改良しました
* フレームワークの内製化（Chameleon Framework）

###### 2019-03-29 v5.2.2
* Swift 5, iOS 12.2対応

###### 2019-02-05 v5.2.1
* 小さな不具合を修正しました

###### 2019-02-04 v5.2
* 一部画面を使いやすく改良しました。（レシピ詳細画面、材料詳細画面、逆引き検索画面）
* あわせてテーマカラーも見やすいように修正を加えました。
* 対象バージョンをiOS 11以上に変更

###### 2018-09-26 v5.1
* レシピの作った回数を記録できるようになりました！レシピ一覧画面では作った回数順に並べ替えもできます
* レシピ一覧画面で技法で絞り込みできるようになりました！
* 一部UIを修正しました

###### 2018-04-05 v5.0
リリース2周年記念！
* サンプルレシピを45種追加し、合計365種になりました！「いろいろ」メニューの「サンプルレシピを復元する」から追加できます。（新しくアプリをダウンロードする場合は初回起動時に自動追加されるため、この操作は不要です）
* 主に黒を基調としたテーマカラーを新たに9種類追加しました！iPhone Xの画面上部の切り欠きが気になる方に特にオススメです。
* 写真フィルター機能を追加しました！レシピの写真登録時に自動的にフィルターが起動します。カクテルの写真をよりオシャレにしてみよう！
* 特定の一部の材料に「Amazon.co.jpで探す」ボタンを追加しました。材料が足りない時の購入が簡単になりました。
* 材料の分量を入力しやすくしました。
* 一部UIを使いやすく修正しました。

###### 2017-12-20 v4.3
* サンプルレシピを60種追加し、合計320種になりました！「いろいろ」メニューの「サンプルレシピを復元する」から追加できます。（新しくアプリをダウンロードする場合は初回起動時に自動追加されるため、この操作は不要です）
* レシピの数が増えて探しにくくなったので、レシピ一覧の表示順に「閲覧順」を追加しました！レシピを表示した日時を自動で記録し、最近どのレシピを見たのかわかりやすくなりました。
* レシピ名、材料名、およびメモをコピーできるようになりました
* 編集画面を開いたあとすぐにキャンセルした場合はアラートウィンドウを表示しないようにしました
* 細かいUIの修正

###### 2017-06-17 v4.2
* サンプルレシピを60種追加し、合計260種になりました！「いろいろ」メニューの「サンプルレシピを復元する」から追加できます。（新しくアプリをダウンロードする場合は初回起動時に自動追加されるため、この操作は不要です）
* アルバム画面にてレシピ名の表示/非表示の切り替えができるようになりました！
* アプリの起動時間が早くなりました！

###### 2017-04-17 v4.1
* レシピが増えて探すのが大変になってきたので、材料から逆引きする機能を追加しました！3つまで材料名を指定して、それらを全て使うレシピを検索できます
* 材料のカテゴリ分けができるようになりました！「アルコール」「ノンアルコール」「その他」の3つのカテゴリから目当ての材料を探しやすくなります。（自前で追加した材料は自動で「その他」カテゴリに入るので、適切なカテゴリに編集してください）
* レシピのお気に入りは「星1つ」〜「星3つ」の3段階でしたが、「星無し」を新たに追加して4段階に変更しました。
* テーマカラーを新たに5種類追加しました！
* アルバム画面表示時のレスポンス速度が向上しました
* 保存する画像のサイズ上限を追加
* バグの修正

###### 2017-04-05 v4.0
リリース1周年記念！
* テーマカラーを選択できるようになりました。気分に合わせてアプリの着せ替えをしてみては？
* サンプルレシピを50種追加しました！「いろいろ」メニューの「サンプルレシピを復元する」から追加できます。（新しくアプリをダウンロードする場合は初回起動時に自動追加されるため、この操作は不要です）
* 日本語の名前順の表示方法を変更し、わかりやすくなりました。
* 操作性の向上
* バグの修正

###### 2016-11-11 v3.2
* 一部サンプルレシピの誤植を修正しました

###### 2016-10-21 v3.1
* サンプルレシピを40種追加しました！レシピ一覧画面左上の復元ボタンから追加できます。（新しくアプリをダウンロードする場合は初回起動時に自動で追加されるため、この操作は不要です）

###### 2016-09-17 v3.0
* iOS 10に対応しました！（パーミッションの説明文を追加）
* 一覧画面の検索バーは画面の上の方にあるのでタップしにくかったのですが、下に引っ張ることで検索できるようになりました。レシピ、材料数が多い場合はぜひ検索をご活用下さい

###### 2016-08-05 v2.3
* 「この材料を使うレシピ」は名前順でしか表示できませんでしたが、つくれる順でも並べ替えできるようになりました！
* 写真がなかった場合の表示画像を変更しました
* レシピや材料の新規追加時に名前に自動的にフォーカスが当たるように変更しました
* アルバム画面の読み込みパフォーマンスを改善しました!
* 一部サンプルレシピの誤植を修正しました
* その他、一部UIを使いやすく改良しました
* Realmのバージョンを1.0.1にアップデートしました

###### 2016-07-01 v2.2
* 「夏なお酒」を中心にサンプルレシピを40種追加しました！レシピ一覧画面左上の復元ボタンから追加できます。（新しくアプリをダウンロードする場合は初回起動時に自動で追加されるため、この操作は不要です）
* 一部サンプルレシピの誤植を修正しました
* レシピ詳細画面の材料を左へスワイプすることで、直接リマインダー登録へ飛べるようになりました
* レシピ編集画面でも写真をタップすることでプレビューできるようになりました。写真選びがイマイチだと感じた場合の確認にお使いください。
* アルバム画面表示時のレスポンス速度が向上しました。
*  アクセス許可がない場合、直接設定アプリを開くボタンを追加

###### 2016-06-10 v2.1
* サンプルレシピを一度削除すると戻せませんでしたが、復元できるようになりました！レシピ一覧の左上のボタンから復元できます。
* アルバム画面で下に引っ張るとシャッフルできるようになりました。画面右上のボタンに指を伸ばす必要はもうありません。
* 検索結果がキーボードに隠れないように修正しました。
* アプリの使い方の説明画面を追加しました。
* レシピ写真の表示方法を改良しました。
* その他、一部のUIを使いやすく改良しました。

###### 2016-05-20 v2.0
* 新機能として「アルバム」画面を追加！レシピ名すらない、登録されている写真だけを一覧にして表示します。カクテルの写真をコレクションとして眺めたり、写真から直感でカクテルを選んだりするのにお使いいただけます。並べ順をシャッフルして表示することも可能です。
* 日本語のひらがな/カタカナ、英語の大文字/小文字に関係なく検索できるようになりました！
* 入力の途中でもリアルタイムに検索結果が反映されるようになりました。
* 一部のUIを変更しました（材料一覧の操作がしやすくなりました！）

###### 2016-05-06 v1.2
* レシピをSafariで検索できるようになりました。本アプリのサンプルレシピにカクテルの詳細な作り方を掲載していないため、より詳しい情報を知りたい場合にぜひご活用ください。また、自作レシピと同じ名前のカクテルが既に存在していないかどうか、チェックするためにもお使いいただけます。
* 材料を本アプリからリマインダー/カレンダーに登録できるようになりました。材料の買い忘れ防止にお役立てください。
* レシピ一覧、材料一覧で左へスワイプすることで、それぞれの編集画面に直接移動できるようになりました。
* レシピ画像をクリップボードに保存された画像からペーストできるようになりました。
* その他、細かい修正

###### 2016-04-19 v1.1
* レシピをSNSへ投稿できるようになりました。自作レシピを写真とともにシェアできます。（Facebookへの投稿は規約により、本文をユーザ自身が入力する必要があります）
* アプリから撮ったカクテルの写真をカメラロールに保存できず不便でしたが、保存できるようになりました。
* カクテル画像を登録していない場合、レシピ詳細画面でデフォルトの「NO PHOTO」画像が表示されるのはイケてなかったため、表示しないようにしました。合わせて、カクテル画像が登録されている場合の表示サイズの調整も行いました。
* レシピ数、材料数を各所から確認できるようになりました。
* 「この材料を使うレシピ」にもカクテル画像が表示されるようになりました。
* 一部の入力欄がキーボードに隠れてしまう問題を解消しました。
* その他、細かい見た目の調整

###### 2016-04-05 v1.0
* 初回リリース
