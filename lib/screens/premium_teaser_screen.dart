import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class PremiumTeaserScreen extends StatefulWidget {
  @override
  _PremiumTeaserScreenState createState() => _PremiumTeaserScreenState();
}

class _PremiumTeaserScreenState extends State<PremiumTeaserScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _playBGM();
    _startAutoSlide();
  }

  void _playBGM() async {
    await _audioPlayer.play(AssetSource('audio/premium_theme.mp3'));
  }

  void _startAutoSlide() {
    Future.delayed(Duration(seconds: 3), () {
      if (_currentPage < 2) {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
        _startAutoSlide();
      }
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              _buildIntroPage(),
              _buildGameHighlightPage(),
              _buildClosingPage(),
            ],
          ),
          Positioned(
            bottom: 40,
            right: 20,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('閉じる'),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildIntroPage() {
    return Container(
      color: Colors.black,
      child: Center(
        child: Text(
          'この先に広がる知の世界…\\n少しだけご覧いただきましょう',
          style: TextStyle(color: Colors.white, fontSize: 22),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildGameHighlightPage() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.indigo.shade900, Colors.amber.shade700],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.stars, size: 80, color: Colors.white),
            SizedBox(height: 20),
            Text(
              '五目並べ Lv5\\n教授との真剣勝負！',
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClosingPage() {
    return Container(
      color: Colors.black87,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'あなたも挑戦しませんか？',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // プレミアム案内ページへ遷移する処理（今は空）
              },
              child: Text('プレミアムにアップグレード'),
            ),
          ],
        ),
      ),
    );
  }
}
