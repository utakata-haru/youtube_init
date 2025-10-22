# Dart入門03 – 演算子と制御構文

こんにちは。今回は「演算子と制御構文」を DartPad で実演しながら学びます。第1回・第2回で触れた「main/print」「変数・型・Null安全」を前提に、今日からロジックを書けるようにしていきましょう。

---

## 1. 演算子の基礎（5分）
Dart の代表的な演算子を、短いコードで一気に確認します。
- 算術：`+ - * / ~/ %`（`~/` は整数除算）
- 比較：`< <= > >= == !=`
- 論理：`&& || !`
- 代入の拡張：`+= -= *= /=`
- 三項演算子：`condition ? A : B`

実演ポイント：
- `/` と `~/` の違いを具体例で確認
- `==` は値の同値比較。オブジェクトの同一性は `identical()`（紹介のみ）

```dart
void main() {
  final a = 7, b = 3;
  print('a+b=${a + b}, a/b=${a / b}, a~/b=${a ~/ b}, a%b=${a % b}');
  print('a>b=${a > b}, a==b=${a == b}');
  print('logic: ${(a > 0) && (b > 0)}');
}
```

---

## 2. 条件分岐（7分）
分岐はプログラムの「意思決定」。`if/else` と `switch` を押さえます。
- `if/else`：読みやすさを重視し、深いネストは早期 return 等で回避
- 三項演算子：単純な二択に有効、過度な入れ子は避ける
- `switch`：enum と組み合わせると表現力と安全性が上がる

```dart
void main() {
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
}
```

---

## 3. 反復処理（8分）
コレクションを扱う頻度は高いので、反復は必修です。
- `for`（インデックス）／`for-in`（コレクション）
- `while`／`do-while`
- `break` と `continue`

スタイルの指針：
- 変数は基本「明示的な型」を推奨（堅牢性・保守性のため）
- `var` はローカルで型が明確に推論される場合のみ使用
- `dynamic` は原則避ける（型安全性が下がるため）

```dart
void main() {
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

## ハンズオン（5分）
DartPad に以下を貼り付けて動かします。各セクションの出力を観察し、値が変わるタイミング・条件を説明できるようにしましょう。

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

## まとめ（2分）
- 今日の到達点：演算子の使い方、`if/switch`、`for/while` の基礎、`break/continue`
- 型の指針：明示的な型を優先し、`var` はローカルの明確な推論に限定、`dynamic` は避ける
- 次回予告：関数とパラメータ（位置・名前付き・デフォルト・`required`）