# Dart入門03 – 演算子と制御構文

目的：演算子と分岐・反復の基本を DartPad で理解し、簡単なロジックを書けるようになる。

前提：第1回（main/print）・第2回（変数・型・Null安全）の内容を把握していること。

---

## セクション1：演算子の基礎
- 算術演算子：`+`, `-`, `*`, `/`, `~/`（整数除算）, `%`
- 比較演算子：`<`, `<=`, `>`, `>=`, `==`, `!=`
- 論理演算子：`&&`, `||`, `!`
- 代入の拡張：`+=`, `-=`, `*=`, `/=`
- 三項演算子：`condition ? valueIfTrue : valueIfFalse`

ポイント：
- `~/` は小数点以下切り捨ての整数除算であることを実演。
- `==` は値の同値比較、`identical()` は同一性比較（紹介のみ）。

## セクション2：条件分岐
- `if` / `else` の基本と入れ子構造
- `switch` の使い方（enum を例に）
  - `case` と `default`、到達しない分岐に注意
  - Dart 3 のパターンマッチは軽く言及（詳細は後続回）

## セクション3：反復処理
- `for`（インデックス） / `for-in`（コレクションの反復）
- `while` / `do-while`
- `break` / `continue` の挙動

推奨スタイル：
- 変数は基本的に明示的な型を使う（堅牢性のため）。
- `var` はローカルで型が明確に推論される場合に限定して使用。
- `dynamic` は型安全性を下げるため原則避ける。

---

## デモ／ハンズオン
1. 算術・比較の結果を `print` で確認
2. `if/else` と 三項演算子でメッセージ切り替え
3. `switch`（enum）でカテゴリ分け
4. `for-in` と `while` で合計値を計算、`break`/`continue` を観察

```dart
void main() {
  // 演算子
  final a = 7, b = 3;
  print('a+b=${a + b}, a/b=${a / b}, a~/b=${a ~/ b}, a%b=${a % b}');
  print('a>b=${a > b}, a==b=${a == b}');
  print('logic: ${(a > 0) && (b > 0)}');

  // 条件分岐
  final score = 82;
  final grade = score >= 90 ? 'A' : (score >= 80 ? 'B' : 'C');
  print('grade=$grade');

  enum Category { food, tech, other }
  const cat = Category.tech;
  switch (cat) {
    case Category.food:
      print('Food');
    case Category.tech:
      print('Tech');
    case Category.other:
      print('Other');
  }

  // 反復
  final nums = [1, 2, 3, 4, 5];
  var sum = 0; // ローカルで推論が明確な var の使用例
  for (final n in nums) {
    if (n == 4) continue; // 4 はスキップ
    sum += n;
  }
  print('sum=$sum');

  var i = 0;
  while (i < 3) {
    print('i=$i');
    i++;
  }
}
```

---

## まとめ
- 今日のポイント：演算子の使い方、if/switch、for/while の基礎、break/continue
- 次回予告：関数とパラメータ（位置・名前付き・デフォルト・required）