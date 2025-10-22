# Dart入門01 – DartPadでHello Dart

- 目的：10分でブラウザだけでDartを実行し、main/printの基本を理解する
- 前提：PC操作ができる、ブラウザが使える（DartPad利用）

## セクション1：Dartとは
- Flutterの土台となる言語（モバイル/デスクトップ/ウェブ開発）
- シンプルな文法＋強力な非同期モデル
- Null安全で安心（Dart 3）

## セクション2：DartPadの使い方
- アクセス：DartPad（エディタ、Runボタン、Console、Reset）
- コード編集→Runで実行→Consoleに出力を確認
- よくある躓き：セミコロン忘れ、全角文字に注意

## セクション3：最小コード
- main関数の役割
- printで出力
- コメントの書き方（//、/* */）

## デモ／ハンズオン手順
1. DartPadを開く
2. 既存コードを消して次のコードを貼り付け
3. Runを押す→Consoleに「Hello, Dart」が表示される

```dart
void main() {
  print('Hello, Dart');
}
```

## まとめ
- 今日のポイント：DartPadの基本UI、main/print、実行の流れ
- 次回予告：変数・型・定数・Null安全