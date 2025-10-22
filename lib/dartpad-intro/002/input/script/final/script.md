# Dart入門02 – 変数・型・定数・Null安全（台本）

## 導入（30–45秒）
- 今日のゴールは「DartPadで値を扱えるようになる」こと。変数・型・定数の考え方と、初心者がつまずきやすいNull安全を直感的に理解します。
- 実務で重要なポイントだけをテンポよく押さえます。すべてブラウザで実行できます。

## 本編

### 1) 変数と型の基本（3分）
- 代表的な型：int（整数）/ double（小数）/ num（数）/ String（文字列）/ bool（true/false）。
- 宣言の仕方：基本は「型指定」で堅牢に。var は初期化から型が明確に推論できるローカル変数に限定して使う。dynamic は原則避ける（型安全が弱くなり、誤りが実行時まで潜む）。
- 文字列の式展開："Hello $name"、複雑な式は "${...}"。

```dart
void main() {
  int count = 1;
  var price = 2.5; // double に推論（以後 price に文字列は代入不可）
  String name = 'Dart';
  bool enabled = true;
  print('count=$count, price=$price, name=$name, enabled=$enabled');
  
  // 型安全の例：下行は型不一致でコンパイルエラー
  // count = '1';
}
```

### 2) 定数と不変（3分）
- final：一度だけ代入できる（実行時に値が決まる）。
- const：コンパイル時に決まる不変値（リテラルや不変オブジェクト）。
- 使い分け：まず final、明らかな不変値は const。

```dart
void main() {
  final today = DateTime.now();
  const maxItems = 10;
  print('today=$today, maxItems=$maxItems');
}
```

- 再代入の例：final/const は再代入できないことを実際に試す（エラー表示を見てみる）。

### 3) Null安全入門（3分）
- Nullable と 非Nullable：String は必ず値がある、String? は null も取りうる。
- 安全なアクセス：?. で null かもしれない対象にアクセス、?? でデフォルト値を指定。
- 非Null断言：! は最終手段。初心者は「なるべく使わない」を原則に。

```dart
void main() {
  String? nickname; // null の可能性あり
  print('nickname length: ${nickname?.length ?? 0}');
}
```

## デモ（2分）
- DartPadで上記コードを順に貼り付け→Run→Consoleで出力確認。
- 失敗時のヒント：セミコロン忘れ、変数名のスペル、型の不一致。エラーメッセージを落ち着いて読む習慣をつける。

## まとめ（30秒）
- 今日のポイント：型と var、final/const の直感、Null 安全（?、?.、??）。
- 次回予告：制御構文（if/else、switch、for/while、三項）でロジックを組み立てます。
- 行動喚起：DartPadで自分のプロフィール文字列を作ってみる、数値計算を1つ追加してみる、出力を工夫して遊んでみましょう。