# Dart入門02 – 変数・型・定数・Null安全

- 目的：DartPad上で基本的な値の扱い（変数・定数・代表的な型）とNull安全の直感的な使い方を身につける
- 前提：第1回のDartPad操作（main/print）が分かる

## セクション1：変数と型の基本
- 代表的な型：int / double / num / String / bool
- 宣言の仕方：基本は型指定で堅牢に。var は「初期化から型が明確に推論できるローカル変数」に限定。dynamic は原則使わない。
- 文字列の結合・式展開（"Hello $name"）
- なぜ型指定が推奨？：
  - コンパイル時に誤りを検出できて安全（例：int に String を代入するとエラー）
  - 読みやすさと保守性が上がる（API 境界で意図が明確）
  - var でも推論された型に固定されるため、型安全は維持される（dynamic とは異なる）

## セクション2：定数と不変
- final（実行時に決まる一度きりの代入）
- const（コンパイル時定数、リテラルや不変オブジェクト）
- 使い分けの直感：まずfinal、明らかな不変値はconst

## セクション3：Null安全入門
- Nullable（?）と非Nullableの違い
- 安全なアクセス（?.）、デフォルト値（??）
- 非Null断言（!）は最後の手段（初心者は基本的に使わない）

## デモ／ハンズオン手順
1. 変数を宣言してprintで値を確認
2. final/constの違いを体験（再代入のエラーを確認）
3. Nullableな変数を扱い、?. と ?? を使って安全に表示

```dart
void main() {
  // 型とvarの例
  int count = 1;
  var price = 2.5; // 推論されて double（以後 price に文字列は代入不可）
  String name = 'Dart';
  bool enabled = true;
  print('count=$count, price=$price, name=$name, enabled=$enabled');

  // 型安全の例：下行は型不一致でコンパイルエラー
  // count = '1';

  // final と const
  final today = DateTime.now();
  const maxItems = 10; // リテラルはconstにできる
  print('today=$today, maxItems=$maxItems');

  // Null安全：?（nullable）、?.（安全アクセス）、??（デフォルト）
  String? nickname; // まだ値がない（null）
  print('nickname length: ${nickname?.length ?? 0}');
}
```

## まとめ
- 今日のポイント：型とvar、final/constの直感、Null安全の基本（?、?.、??）
- 次回予告：制御構文（if/else、switch、for/while、三項）