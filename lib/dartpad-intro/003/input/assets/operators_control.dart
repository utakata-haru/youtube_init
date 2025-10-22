// DartPad 実行用：演算子と制御構文の基本
enum Category { food, tech, other }
void main() {
  // 演算子
  final a = 7, b = 3;
  print('a+b=${a + b}, a-b=${a - b}, a*b=${a * b}');
  print('a/b=${a / b}, a~/b=${a ~/ b}, a%b=${a % b}');
  print('比較: a>b=${a > b}, a==b=${a == b}, a!=b=${a != b}');
  print('論理: ${(a > 0) && (b > 0)}, ${(a > 0) || (b < 0)}, ${!(a > 0)}');

  // 条件分岐
  final score = 82;
  final grade = score >= 90 ? 'A' : (score >= 80 ? 'B' : 'C');
  print('grade=$grade');

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
  do {
    print('do-while i=$i');
    i++;
  } while (i < 2);

  // break の例
  for (var j = 0; j < 5; j++) {
    if (j == 3) {
      print('break at j=$j');
      break;
    }
  }
}