import 'package:flutter/material.dart';
import 'screens/premium_teaser_screen.dart'; // ← 自作画面をインポート！

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '脳トレ2.0',
      debugShowCheckedModeBanner: false,
      home: PremiumTeaserScreen(), // ← ここが肝心！！
    );
  } // ← このカッコが抜けてた
}     // ← そしてこの1行でクラスを閉じる
