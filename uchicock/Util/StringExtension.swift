//
//  StringExtension.swift
//  uchicock
//
//  Created by Kou Kinyo on 2016/04/27.
//  Copyright © 2016年 Kou. All rights reserved.
//

import UIKit

extension String {
    func katakana() -> String {
        var str = ""
        for c in unicodeScalars {
            if c.value >= 0x3041 && c.value <= 0x3096 {
                if let u = UnicodeScalar(c.value+96){
                    str += "\(u)"
                }
            } else {
                str += "\(c)"
            }
        }
        return str
    }
    
    func hiragana() -> String {
        var str = ""
        for c in unicodeScalars {
            if c.value >= 0x30A1 && c.value <= 0x30F6 {
                if let u = UnicodeScalar(c.value-96){
                    str += "\(u)"
                }
            } else {
                str += "\(c)"
            }
        }
        return str
    }
    
    func withoutSpace() -> String{
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func withoutSpaceAndMiddleDot() -> String{
        // 半角スペース、全角スペース、中黒は取り除く
        let passedUnicodeScalars = self.unicodeScalars.filter { [0x0020,0x3000,0x30FB].contains($0.value) == false }
        return String(String.UnicodeScalarView(passedUnicodeScalars)).withoutSpace()
    }
    
    func katakanaLowercasedForSearch() -> String{
        var convertedString = ""

        let passedUnicodeScalars = self.withoutSpaceAndMiddleDot().unicodeScalars

        for unicodeScalar in passedUnicodeScalars {
            var convertedUnicodeScalar = unicodeScalar

            // ひらがなはカタカナに変換
            if unicodeScalar.value >= 0x3041 && unicodeScalar.value <= 0x3096 {
                if let katakana = UnicodeScalar(unicodeScalar.value+96){
                    convertedUnicodeScalar = katakana
                }
            }
            
            switch convertedUnicodeScalar.value {
            case 0x30A1, 0x30A3, 0x30A5, 0x30A7, 0x30A9, 0x30C3, 0x30E3, 0x30E5, 0x30E7, 0x30EE:
                // 「ァィゥェォッャュョヮ」を「アイウエオツヤユヨワ」に変換
                if let u = UnicodeScalar(convertedUnicodeScalar.value+1){
                    convertedUnicodeScalar = u
                }
            case 0x30F4:
                // 「ヴ」を「ウ」に変換
                convertedUnicodeScalar = UnicodeScalar("ウ")
            case 0x30F5, 0x30F6:
                // 「ヵヶ」を「カ」に変換
                convertedUnicodeScalar = UnicodeScalar("カ")
            case 0x30AC, 0x30AE, 0x30B0, 0x30B2, 0x30B4, 0x30B6, 0x30B8, 0x30BA, 0x30BC, 0x30BE,
                 0x30C0, 0x30C2, 0x30C5, 0x30C7, 0x30C9, 0x30D0, 0x30D3, 0x30D6, 0x30D9, 0x30DC:
                // 濁音（ガギグゲゴザジズゼゾダヂヅデドバビブベボ）を清音（カキクケコサシスセソタチツテトハヒフヘホ）に変換
                if let u = UnicodeScalar(convertedUnicodeScalar.value-1){
                    convertedUnicodeScalar = u
                }
            case 0x30D1, 0x30D4, 0x30D7, 0x30DA, 0x30DD:
                // 半濁音（パピプペポ）を清音（ハヒフヘホ）に変換
                if let u = UnicodeScalar(convertedUnicodeScalar.value-2){
                    convertedUnicodeScalar = u
                }
            default:
                break
            }

            convertedString += "\(convertedUnicodeScalar)"
        }
        
        return convertedString.lowercased()
    }
    
    func categoryNumber() -> Int {
        switch self{
        case "ウォッカ": return 0
        case "テキーラ": return 0
        case "ジン": return 0
        case "ドライジン": return 0
        case "ブランデー": return 0
        case "チェリーブランデー": return 0
        case "ラム": return 0
        case "ホワイトラム": return 0
        case "ダークラム": return 0
        case "ゴールドラム": return 0
        case "ウィスキー": return 0
        case "ウイスキー": return 0
        case "バーボンウィスキー": return 0
        case "バーボンウイスキー": return 0
        case "アイリッシュウィスキー": return 0
        case "アイリッシュウイスキー": return 0
        case "スコッチウィスキー": return 0
        case "スコッチウイスキー": return 0
        case "カナディアンウィスキー": return 0
        case "カナディアンウイスキー": return 0
        case "アメリカンウィスキー": return 0
        case "アメリカンウイスキー": return 0
        case "テネシーウィスキー": return 0
        case "テネシーウイスキー": return 0
        case "ライウィスキー": return 0
        case "ライウイスキー": return 0
        case "ジャパニーズウィスキー": return 0
        case "ジャパニーズウイスキー": return 0
        case "アマレット": return 0
        case "オレンジキュラソー": return 0
        case "ブルーキュラソー": return 0
        case "ホワイトキュラソー": return 0
        case "コアントロー": return 0
        case "カルーア": return 0
        case "カンパリ": return 0
        case "クレームドカカオ": return 0
        case "クレームドカカオホワイト": return 0
        case "クレームドカシス": return 0
        case "クレームドフランボワーズ": return 0
        case "クレームドアプリコット": return 0
        case "ディタ": return 0
        case "ドライベルモット": return 0
        case "スイートベルモット": return 0
        case "ピーチツリー": return 0
        case "ベイリーズ": return 0
        case "マンゴヤン": return 0
        case "ミドリ": return 0
        case "ペパーミント": return 0
        case "ホワイトペパーミント": return 0
        case "マリブ": return 0
        case "ティフィン": return 0
        case "パッソア": return 0
        case "アンゴスチュラビターズ": return 0
        case "ビール": return 0
        case "赤ワイン": return 0
        case "白ワイン": return 0
        case "ワイン": return 0
        case "シャンパン": return 0
        case "スパークリングワイン": return 0
        case "紹興酒": return 0
        case "日本酒": return 0
            
        case "アップルジュース": return 1
        case "オレンジジュース": return 1
        case "グレープジュース": return 1
        case "グレープフルーツジュース": return 1
        case "トマトジュース": return 1
        case "パイナップルジュース": return 1
        case "ライムジュース": return 1
        case "クランベリージュース": return 1
        case "レモンジュース": return 1
        case "コーラ": return 1
        case "コカコーラ": return 1
        case "ジンジャエール": return 1
        case "ソーダ": return 1
        case "トニックウォーター": return 1
        case "ミネラルウォーター": return 1
        case "ウーロン茶": return 1
        case "烏龍茶": return 1
        case "牛乳": return 1
        case "ミルク": return 1
        case "レモネード": return 1
        case "アイスコーヒー": return 1
        case "ホットコーヒー": return 1
        case "ピーチネクター": return 1

        default: return 2
        }
    }
    
    func cocktailStyleNumber() -> Int {
        switch self{
        case "アイスブレーカー": return 0
        case "アクア": return 0
        case "アップタウン": return 0
        case "アフターミッドナイト": return 0
        case "アプリコットコラーダ": return 0
        case "アマレットジンジャー": return 0
        case "アメリカーノ": return 0
        case "アメリカンレモネード": return 0
        case "アンバサダー": return 0
        case "イタリアンサーファー": return 0
        case "イタリアンスクリュードライバー": return 0
        case "ウィスキーサワー": return 0
        case "ウィスキーフロート": return 0
        case "ウイニングラン": return 0
        case "ウォッカアップル": return 0
        case "ウォッカリッキー": return 0
        case "エッグビール": return 0
        case "エメラルドクーラー": return 0
        case "エメラルドミスト": return 0
        case "エルディアブロ": return 0
        case "エルドラド": return 0
        case "オールドファッションド": return 0
        case "オペレーター": return 0
        case "オレンジフィズ": return 0
        case "カーディナル": return 0
        case "カカオフィズ": return 0
        case "カサブランカ": return 0
        case "カシスオレンジ": return 0
        case "カミカゼ": return 0
        case "カリフォルニアレモネード": return 0
        case "カリモーチョ": return 0
        case "カルーアソーダ": return 0
        case "カルーアミルク": return 0
        case "ガルフストリーム": return 0
        case "カンパリオレンジ": return 0
        case "カンパリソーダ": return 0
        case "カンパリビア": return 0
        case "キールインペリアル": return 0
        case "キールロワイヤル": return 0
        case "キティ": return 0
        case "キューバリバー": return 0
        case "キューバンスクリュー": return 0
        case "クイーンズペッグ": return 0
        case "クラーラ": return 0
        case "クラウドバスター": return 0
        case "クリーミードライバー": return 0
        case "グリーンアイズ": return 0
        case "グリーンスパイダー": return 0
        case "クリス": return 0
        case "ケープコッダー": return 0
        case "ケーブルグラム": return 0
        case "コークハイ": return 0
        case "ゴールデンフレンド": return 0
        case "ゴッドファーザー": return 0
        case "ゴッドマザー": return 0
        case "サマーデライト": return 0
        case "サムライロック": return 0
        case "サラトガクーラー": return 0
        case "サンセットピーチ": return 0
        case "シーブリーズ": return 0
        case "シカゴ": return 0
        case "シャーリーテンプル": return 0
        case "ジャマイカンミュール": return 0
        case "シャンディガフ": return 0
        case "シャンパンカクテル": return 0
        case "シャンパンブルース": return 0
        case "ジョンコリンズ": return 0
        case "ジンアンドビターズ": return 0
        case "シンガポールスリング": return 0
        case "ジンデイジー": return 0
        case "ジントニック": return 0
        case "ジンバック": return 0
        case "ジンフィズ": return 0
        case "ジンリッキー": return 0
        case "スクリュードライバー": return 0
        case "スコーピオン": return 0
        case "ストーンフェンス": return 0
        case "ストローハット": return 0
        case "スプモーニ": return 0
        case "スプリッツァー": return 0
        case "セックスオンザビーチ": return 0
        case "ソルクバーノ": return 0
        case "ソルティドッグ": return 0
        case "ソルティブル": return 0
        case "ソルトリック": return 0
        case "ダージリンクーラー": return 0
        case "ダイヤモンドフィズ": return 0
        case "チチ": return 0
        case "チャイナカシス": return 0
        case "チャイナグリーン": return 0
        case "チャイナブルー": return 0
        case "チャロネロ": return 0
        case "ディーゼル": return 0
        case "ディタモーニ": return 0
        case "ティフィンカシスティー": return 0
        case "ティフィンタイガー": return 0
        case "ティフィンミルク": return 0
        case "ティフィンモヒート": return 0
        case "ティントデベラーノ": return 0
        case "テキーラサンストローク": return 0
        case "テキーラサンセット": return 0
        case "テキーラサンライズ": return 0
        case "テキサスフィズ": return 0
        case "デザートヒーラー": return 0
        case "ドッグズノーズ": return 0
        case "ドラゴンウォーター": return 0
        case "ドラゴンフライ": return 0
        case "ドランブイトニック": return 0
        case "ネグローニ": return 0
        case "パープルパッション": return 0
        case "ハイボール": return 0
        case "パッシモーニ": return 0
        case "パッションオレンジ": return 0
        case "パディ": return 0
        case "パナシェ": return 0
        case "ビアスプリッツァー": return 0
        case "ビアモーニ": return 0
        case "ビショップ": return 0
        case "ビターオレンジ": return 0
        case "ピニャコラーダ": return 0
        case "ファジーネーブル": return 0
        case "ブラックルシアン": return 0
        case "ブラックレイン": return 0
        case "ブラックローズ": return 0
        case "ブラッディメアリー": return 0
        case "ブランデーサワー": return 0
        case "ブルーコラーダ": return 0
        case "ブルーハワイ": return 0
        case "ブルーラグーン": return 0
        case "ブルドッグ": return 0
        case "フレンチ75": return 0
        case "フレンチエメラルド": return 0
        case "フレンチカクタス": return 0
        case "フレンチコネクション": return 0
        case "ベイブリーズ": return 0
        case "ベイリーズミルク": return 0
        case "ベリーニ": return 0
        case "ボイラーメーカー": return 0
        case "ホーセズネック": return 0
        case "ボストンクーラー": return 0
        case "ボッチボール": return 0
        case "ホワイトルシアン": return 0
        case "ポンセデレオン": return 0
        case "ポンピエ": return 0
        case "マイタイ": return 0
        case "マザグラン": return 0
        case "マタドール": return 0
        case "マドラス": return 0
        case "マミーテイラー": return 0
        case "マヤ": return 0
        case "マリブコーク": return 0
        case "マリブサーフ": return 0
        case "マリブパイン": return 0
        case "マリブビーチ": return 0
        case "マリブミルク": return 0
        case "マンゴヤンオレンジ": return 0
        case "マンゴヤンミルク": return 0
        case "マンドビル": return 0
        case "ミドリミルク": return 0
        case "ミモザ": return 0
        case "ミルクセーキ": return 0
        case "ミントジュレップ": return 0
        case "ミントビア": return 0
        case "メキシカンミュール": return 0
        case "メロンボール": return 0
        case "モスコミュール": return 0
        case "モヒート": return 0
        case "モンキーズポウ": return 0
        case "モンキーミックス": return 0
        case "ライトオンディタ": return 0
        case "ラスティネイル": return 0
        case "ラテンラバー": return 0
        case "ラムコリンズ": return 0
        case "ラムジュレップ": return 0
        case "ランチボックス": return 0
        case "ルシアンネイル": return 0
        case "レゲエパンチ": return 0
        case "レッドアイ": return 0
        case "レッドバード": return 0
        case "ロックローモンド": return 0
        case "ロングアイランドアイスティー": return 0
        case "ワインクーラー": return 0
        case "香港フィズ": return 0
        case "照葉樹林": return 0
        case "上海ハイボール": return 0
            
        case "アースクエイク": return 1
        case "アイデアル": return 1
        case "アイリッシュローズ": return 1
        case "アカプルコ": return 1
        case "アディオスアミーゴス": return 1
        case "アドニス": return 1
        case "アナウンサー": return 1
        case "アフィニティ": return 1
        case "アブサンエッグ": return 1
        case "アモーレ": return 1
        case "アラウンドザワールド": return 1
        case "アラワク": return 1
        case "アルフィー": return 1
        case "アレキサンダー": return 1
        case "アロハ": return 1
        case "アンシェリダン": return 1
        case "イーストインディア": return 1
        case "イエスアンドノー": return 1
        case "イエローフェロー": return 1
        case "インクストリート": return 1
        case "ウィリースミス": return 1
        case "エックスワイジー": return 1
        case "エム45": return 1
        case "エルプレジデンテ": return 1
        case "エンジェルキッス": return 1
        case "エンジェルズデライト": return 1
        case "オーガズム": return 1
        case "オーキッド": return 1
        case "オープンハートリーフ": return 1
        case "オールドクロック": return 1
        case "オールドパル": return 1
        case "オリエンタル": return 1
        case "オリンピック": return 1
        case "オレンジブルーム": return 1
        case "オレンジブロッサム": return 1
        case "カウボーイ": return 1
        case "カジノ": return 1
        case "カリブ": return 1
        case "キール": return 1
        case "キッスインザダーク": return 1
        case "キッスオブファイア": return 1
        case "ギムレット": return 1
        case "キャメロンズキック": return 1
        case "キングスバレー": return 1
        case "ギンザストリート": return 1
        case "クイーンエリザベス": return 1
        case "クールバナナ": return 1
        case "クラシック": return 1
        case "グラスホッパー": return 1
        case "グリーンシー": return 1
        case "グリーンフィールズ": return 1
        case "クローバークラブ": return 1
        case "ケリーブルー": return 1
        case "ケンタッキー": return 1
        case "ゴーリキーパーク": return 1
        case "コザック": return 1
        case "コスモポリタン": return 1
        case "コモドール": return 1
        case "コルクスクリュー": return 1
        case "コルコバード": return 1
        case "コンチータ": return 1
        case "サイドカー": return 1
        case "ザザ": return 1
        case "サンチャゴ": return 1
        case "シクラメン": return 1
        case "シルクストッキングス": return 1
        case "シルバーウィング": return 1
        case "ジンアンドイット": return 1
        case "シンデレラ": return 1
        case "ズーム": return 1
        case "スカイダイビング": return 1
        case "スティンガー": return 1
        case "スパイダーキッス": return 1
        case "スペシャルラフ": return 1
        case "スモーキーマティーニ": return 1
        case "スリーミラーズ": return 1
        case "スレッジハンマー": return 1
        case "セブンスヘブン": return 1
        case "ソウルキッス": return 1
        case "ダーティーマザー": return 1
        case "ダイキリ": return 1
        case "タンゴ": return 1
        case "チェリーブロッサム": return 1
        case "チャーチル": return 1
        case "テキーラマンハッタン": return 1
        case "デビル": return 1
        case "トロイカ": return 1
        case "ドローレス": return 1
        case "ナデシコ": return 1
        case "ニューヨーク": return 1
        case "ネバダ": return 1
        case "ハーバード": return 1
        case "バーバラ": return 1
        case "バーバリーコースト": return 1
        case "バーボネラ": return 1
        case "パールハーバー": return 1
        case "ハイライフ": return 1
        case "バカラ": return 1
        case "パナマ": return 1
        case "ハニーサックル": return 1
        case "ハバナピーチ": return 1 // v2.2以前のレシピ誤植対応
        case "ハバナビーチ": return 1
        case "パラダイス": return 1
        case "バラライカ": return 1
        case "ハリケーン": return 1
        case "パリジャン": return 1
        case "バレンシア": return 1
        case "ハワイアン": return 1
        case "ハンター": return 1
        case "ビーズキッス": return 1
        case "ビーズニーズ": return 1
        case "ピカドール": return 1
        case "ビトウィーンザシーツ": return 1
        case "ピンクジン": return 1
        case "ピンクレディ": return 1
        case "フィフスアベニュー": return 1
        case "プッシーフット": return 1
        case "プラチナブロンド": return 1
        case "ブラックホーク": return 1
        case "ブラッドアンドサンド": return 1
        case "ブラッドトランスフュージョン": return 1
        case "フラミンゴレディ": return 1
        case "プランターズカクテル": return 1
        case "ブリザード": return 1
        case "プリンセスメアリー": return 1
        case "ブルートリップ": return 1
        case "ブルーマルガリータ": return 1
        case "ブルーマンデー": return 1
        case "ブルームーン": return 1
        case "ブレインヘモレージ": return 1
        case "ブロードウェイサースト": return 1
        case "プロポーズ": return 1
        case "フロリダ": return 1
        case "ブロンクス": return 1
        case "ブロンクスゴールド": return 1
        case "ヘアオブザドッグ": return 1
        case "ホールインワン": return 1
        case "ホノルル": return 1
        case "ポロネーズ": return 1
        case "ホワイトウェイ": return 1
        case "ホワイトスパイダー": return 1
        case "ホワイトスワン": return 1
        case "ホワイトレディ": return 1
        case "ホワイトローズ": return 1
        case "マイアミ": return 1
        case "マイアミビーチ": return 1
        case "マイトウキョウ": return 1
        case "マグノリアブロッサム": return 1
        case "マジックトレース": return 1
        case "マティーニ": return 1
        case "マリリンモンロー": return 1
        case "マルガリータ": return 1
        case "マンハッタン": return 1
        case "ミッドナイトカウボーイ": return 1
        case "ミリオネア": return 1
        case "ミリオンダラー": return 1
        case "ムーランルージュ": return 1
        case "ムーングロー": return 1
        case "メアリーピックフォード": return 1
        case "メキシカン": return 1
        case "メリーウィドウ": return 1
        case "ユニオンジャック": return 1
        case "ラストキッス": return 1
        case "リトルデビル": return 1
        case "リトルプリンセス": return 1
        case "ルシアン": return 1
        case "ロージーディーコン": return 1
        case "ロードランナー": return 1
        case "ロサンゼルス": return 1
        case "ロブロイ": return 1
        case "ワードエイト": return 1
        case "ワンモアフォーザロード": return 1
        case "青い珊瑚礁": return 1
        case "雪国": return 1
            
        case "アイリッシュコーヒー": return 2
        case "グロッグ": return 2
        case "トムアンドジェリー": return 2
        case "ホットイタリアン": return 2
        case "ホットウィスキートディ": return 2
        case "ホットカンパリ": return 2
        case "ホットドラム": return 2

        default: return 3
        }
    }
    
    func cocktailStrengthNumber() -> Int {
        switch self{
        case "アイスブレーカー": return 4
        case "アクア": return 4
        case "アップタウン": return 4
        case "アフターミッドナイト": return 4
        case "アプリコットコラーダ": return 4
        case "アマレットジンジャー": return 4
        case "アメリカーノ": return 4
        case "アメリカンレモネード": return 4
        case "アンバサダー": return 4
        case "イタリアンサーファー": return 4
        case "イタリアンスクリュードライバー": return 4
        case "ウィスキーサワー": return 4
        case "ウィスキーフロート": return 4
        case "ウイニングラン": return 4
        case "ウォッカアップル": return 4
        case "ウォッカリッキー": return 4
        case "エッグビール": return 4
        case "エメラルドクーラー": return 4
        case "エメラルドミスト": return 4
        case "エルディアブロ": return 4
        case "エルドラド": return 4
        case "オールドファッションド": return 4
        case "オペレーター": return 4
        case "オレンジフィズ": return 4
        case "カーディナル": return 4
        case "カカオフィズ": return 4
        case "カサブランカ": return 4
        case "カシスオレンジ": return 4
        case "カミカゼ": return 4
        case "カリフォルニアレモネード": return 4
        case "カリモーチョ": return 4
        case "カルーアソーダ": return 4
        case "カルーアミルク": return 4
        case "ガルフストリーム": return 4
        case "カンパリオレンジ": return 4
        case "カンパリソーダ": return 4
        case "カンパリビア": return 4
        case "キールインペリアル": return 4
        case "キールロワイヤル": return 4
        case "キティ": return 4
        case "キューバリバー": return 4
        case "キューバンスクリュー": return 4
        case "クイーンズペッグ": return 4
        case "クラーラ": return 4
        case "クラウドバスター": return 4
        case "クリーミードライバー": return 4
        case "グリーンアイズ": return 4
        case "グリーンスパイダー": return 4
        case "クリス": return 4
        case "ケープコッダー": return 4
        case "ケーブルグラム": return 4
        case "コークハイ": return 4
        case "ゴールデンフレンド": return 4
        case "ゴッドファーザー": return 4
        case "ゴッドマザー": return 4
        case "サマーデライト": return 4
        case "サムライロック": return 4
        case "サラトガクーラー": return 4
        case "サンセットピーチ": return 4
        case "シーブリーズ": return 4
        case "シカゴ": return 4
        case "シャーリーテンプル": return 4
        case "ジャマイカンミュール": return 4
        case "シャンディガフ": return 4
        case "シャンパンカクテル": return 4
        case "シャンパンブルース": return 4
        case "ジョンコリンズ": return 4
        case "ジンアンドビターズ": return 4
        case "シンガポールスリング": return 4
        case "ジンデイジー": return 4
        case "ジントニック": return 4
        case "ジンバック": return 4
        case "ジンフィズ": return 4
        case "ジンリッキー": return 4
        case "スクリュードライバー": return 4
        case "スコーピオン": return 4
        case "ストーンフェンス": return 4
        case "ストローハット": return 4
        case "スプモーニ": return 4
        case "スプリッツァー": return 4
        case "セックスオンザビーチ": return 4
        case "ソルクバーノ": return 4
        case "ソルティドッグ": return 4
        case "ソルティブル": return 4
        case "ソルトリック": return 4
        case "ダージリンクーラー": return 4
        case "ダイヤモンドフィズ": return 4
        case "チチ": return 4
        case "チャイナカシス": return 4
        case "チャイナグリーン": return 4
        case "チャイナブルー": return 4
        case "チャロネロ": return 4
        case "ディーゼル": return 4
        case "ディタモーニ": return 4
        case "ティフィンカシスティー": return 4
        case "ティフィンタイガー": return 4
        case "ティフィンミルク": return 4
        case "ティフィンモヒート": return 4
        case "ティントデベラーノ": return 4
        case "テキーラサンストローク": return 4
        case "テキーラサンセット": return 4
        case "テキーラサンライズ": return 4
        case "テキサスフィズ": return 4
        case "デザートヒーラー": return 4
        case "ドッグズノーズ": return 4
        case "ドラゴンウォーター": return 4
        case "ドラゴンフライ": return 4
        case "ドランブイトニック": return 4
        case "ネグローニ": return 4
        case "パープルパッション": return 4
        case "ハイボール": return 4
        case "パッシモーニ": return 4
        case "パッションオレンジ": return 4
        case "パディ": return 4
        case "パナシェ": return 4
        case "ビアスプリッツァー": return 4
        case "ビアモーニ": return 4
        case "ビショップ": return 4
        case "ビターオレンジ": return 4
        case "ピニャコラーダ": return 4
        case "ファジーネーブル": return 4
        case "ブラックルシアン": return 4
        case "ブラックレイン": return 4
        case "ブラックローズ": return 4
        case "ブラッディメアリー": return 4
        case "ブランデーサワー": return 4
        case "ブルーコラーダ": return 4
        case "ブルーハワイ": return 4
        case "ブルーラグーン": return 4
        case "ブルドッグ": return 4
        case "フレンチ75": return 4
        case "フレンチエメラルド": return 4
        case "フレンチカクタス": return 4
        case "フレンチコネクション": return 4
        case "ベイブリーズ": return 4
        case "ベイリーズミルク": return 4
        case "ベリーニ": return 4
        case "ボイラーメーカー": return 4
        case "ホーセズネック": return 4
        case "ボストンクーラー": return 4
        case "ボッチボール": return 4
        case "ホワイトルシアン": return 4
        case "ポンセデレオン": return 4
        case "ポンピエ": return 4
        case "マイタイ": return 4
        case "マザグラン": return 4
        case "マタドール": return 4
        case "マドラス": return 4
        case "マミーテイラー": return 4
        case "マヤ": return 4
        case "マリブコーク": return 4
        case "マリブサーフ": return 4
        case "マリブパイン": return 4
        case "マリブビーチ": return 4
        case "マリブミルク": return 4
        case "マンゴヤンオレンジ": return 4
        case "マンゴヤンミルク": return 4
        case "マンドビル": return 4
        case "ミドリミルク": return 4
        case "ミモザ": return 4
        case "ミルクセーキ": return 4
        case "ミントジュレップ": return 4
        case "ミントビア": return 4
        case "メキシカンミュール": return 4
        case "メロンボール": return 4
        case "モスコミュール": return 4
        case "モヒート": return 4
        case "モンキーズポウ": return 4
        case "モンキーミックス": return 4
        case "ライトオンディタ": return 4
        case "ラスティネイル": return 4
        case "ラテンラバー": return 4
        case "ラムコリンズ": return 4
        case "ラムジュレップ": return 4
        case "ランチボックス": return 4
        case "ルシアンネイル": return 4
        case "レゲエパンチ": return 4
        case "レッドアイ": return 4
        case "レッドバード": return 4
        case "ロックローモンド": return 4
        case "ロングアイランドアイスティー": return 4
        case "ワインクーラー": return 4
        case "香港フィズ": return 4
        case "照葉樹林": return 4
        case "上海ハイボール": return 4
            
        case "アースクエイク": return 4
        case "アイデアル": return 4
        case "アイリッシュローズ": return 4
        case "アカプルコ": return 4
        case "アディオスアミーゴス": return 4
        case "アドニス": return 4
        case "アナウンサー": return 4
        case "アフィニティ": return 4
        case "アブサンエッグ": return 4
        case "アモーレ": return 4
        case "アラウンドザワールド": return 4
        case "アラワク": return 4
        case "アルフィー": return 4
        case "アレキサンダー": return 4
        case "アロハ": return 4
        case "アンシェリダン": return 4
        case "イーストインディア": return 4
        case "イエスアンドノー": return 4
        case "イエローフェロー": return 4
        case "インクストリート": return 4
        case "ウィリースミス": return 4
        case "エックスワイジー": return 4
        case "エム45": return 4
        case "エルプレジデンテ": return 4
        case "エンジェルキッス": return 4
        case "エンジェルズデライト": return 4
        case "オーガズム": return 4
        case "オーキッド": return 4
        case "オープンハートリーフ": return 4
        case "オールドクロック": return 4
        case "オールドパル": return 4
        case "オリエンタル": return 4
        case "オリンピック": return 4
        case "オレンジブルーム": return 4
        case "オレンジブロッサム": return 4
        case "カウボーイ": return 4
        case "カジノ": return 4
        case "カリブ": return 4
        case "キール": return 4
        case "キッスインザダーク": return 4
        case "キッスオブファイア": return 4
        case "ギムレット": return 4
        case "キャメロンズキック": return 4
        case "キングスバレー": return 4
        case "ギンザストリート": return 4
        case "クイーンエリザベス": return 4
        case "クールバナナ": return 4
        case "クラシック": return 4
        case "グラスホッパー": return 4
        case "グリーンシー": return 4
        case "グリーンフィールズ": return 4
        case "クローバークラブ": return 4
        case "ケリーブルー": return 4
        case "ケンタッキー": return 4
        case "ゴーリキーパーク": return 4
        case "コザック": return 4
        case "コスモポリタン": return 4
        case "コモドール": return 4
        case "コルクスクリュー": return 4
        case "コルコバード": return 4
        case "コンチータ": return 4
        case "サイドカー": return 4
        case "ザザ": return 4
        case "サンチャゴ": return 4
        case "シクラメン": return 4
        case "シルクストッキングス": return 4
        case "シルバーウィング": return 4
        case "ジンアンドイット": return 4
        case "シンデレラ": return 4
        case "ズーム": return 4
        case "スカイダイビング": return 4
        case "スティンガー": return 4
        case "スパイダーキッス": return 4
        case "スペシャルラフ": return 4
        case "スモーキーマティーニ": return 4
        case "スリーミラーズ": return 4
        case "スレッジハンマー": return 4
        case "セブンスヘブン": return 4
        case "ソウルキッス": return 4
        case "ダーティーマザー": return 4
        case "ダイキリ": return 4
        case "タンゴ": return 4
        case "チェリーブロッサム": return 4
        case "チャーチル": return 4
        case "テキーラマンハッタン": return 4
        case "デビル": return 4
        case "トロイカ": return 4
        case "ドローレス": return 4
        case "ナデシコ": return 4
        case "ニューヨーク": return 4
        case "ネバダ": return 4
        case "ハーバード": return 4
        case "バーバラ": return 4
        case "バーバリーコースト": return 4
        case "バーボネラ": return 4
        case "パールハーバー": return 4
        case "ハイライフ": return 4
        case "バカラ": return 4
        case "パナマ": return 4
        case "ハニーサックル": return 4
        case "ハバナピーチ": return 4 // v2.2以前のレシピ誤植対応
        case "ハバナビーチ": return 4
        case "パラダイス": return 4
        case "バラライカ": return 4
        case "ハリケーン": return 4
        case "パリジャン": return 4
        case "バレンシア": return 4
        case "ハワイアン": return 4
        case "ハンター": return 4
        case "ビーズキッス": return 4
        case "ビーズニーズ": return 4
        case "ピカドール": return 4
        case "ビトウィーンザシーツ": return 4
        case "ピンクジン": return 4
        case "ピンクレディ": return 4
        case "フィフスアベニュー": return 4
        case "プッシーフット": return 4
        case "プラチナブロンド": return 4
        case "ブラックホーク": return 4
        case "ブラッドアンドサンド": return 4
        case "ブラッドトランスフュージョン": return 4
        case "フラミンゴレディ": return 4
        case "プランターズカクテル": return 4
        case "ブリザード": return 4
        case "プリンセスメアリー": return 4
        case "ブルートリップ": return 4
        case "ブルーマルガリータ": return 4
        case "ブルーマンデー": return 4
        case "ブルームーン": return 4
        case "ブレインヘモレージ": return 4
        case "ブロードウェイサースト": return 4
        case "プロポーズ": return 4
        case "フロリダ": return 4
        case "ブロンクス": return 4
        case "ブロンクスゴールド": return 4
        case "ヘアオブザドッグ": return 4
        case "ホールインワン": return 4
        case "ホノルル": return 4
        case "ポロネーズ": return 4
        case "ホワイトウェイ": return 4
        case "ホワイトスパイダー": return 4
        case "ホワイトスワン": return 4
        case "ホワイトレディ": return 4
        case "ホワイトローズ": return 4
        case "マイアミ": return 4
        case "マイアミビーチ": return 4
        case "マイトウキョウ": return 4
        case "マグノリアブロッサム": return 4
        case "マジックトレース": return 4
        case "マティーニ": return 4
        case "マリリンモンロー": return 4
        case "マルガリータ": return 4
        case "マンハッタン": return 4
        case "ミッドナイトカウボーイ": return 4
        case "ミリオネア": return 4
        case "ミリオンダラー": return 4
        case "ムーランルージュ": return 4
        case "ムーングロー": return 4
        case "メアリーピックフォード": return 4
        case "メキシカン": return 4
        case "メリーウィドウ": return 4
        case "ユニオンジャック": return 4
        case "ラストキッス": return 4
        case "リトルデビル": return 4
        case "リトルプリンセス": return 4
        case "ルシアン": return 4
        case "ロージーディーコン": return 4
        case "ロードランナー": return 4
        case "ロサンゼルス": return 4
        case "ロブロイ": return 4
        case "ワードエイト": return 4
        case "ワンモアフォーザロード": return 4
        case "青い珊瑚礁": return 4
        case "雪国": return 4
            
        case "アイリッシュコーヒー": return 4
        case "グロッグ": return 4
        case "トムアンドジェリー": return 4
        case "ホットイタリアン": return 4
        case "ホットウィスキートディ": return 4
        case "ホットカンパリ": return 4
        case "ホットドラム": return 4

        default: return 4
        }
    }
}
