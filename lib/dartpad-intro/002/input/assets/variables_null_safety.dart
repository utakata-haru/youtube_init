// DartPadで貼り付けて実行できます
void main() {
  // 型とvarの例
  int count = 1;
  var price = 2.5; // double に推論
  String name = 'Dart';
  bool enabled = true;
  print('count=$count, price=$price, name=$name, enabled=$enabled');

  // final と const
  final today = DateTime.now();
  const maxItems = 10;
  print('today=$today, maxItems=$maxItems');

  // Null安全：?（nullable）、?.（安全アクセス）、??（デフォルト値）
  String? nickname; // まだ値がない（null）
  print('nickname length: ${nickname?.length ?? 0}');

  // 参考：! は非Null断言（最終手段）。
  // nickname! で null を許さないと宣言するが、null の場合は実行時エラーになるため初心者は避ける。
}