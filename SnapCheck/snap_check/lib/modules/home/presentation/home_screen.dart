import 'package:flutter/material.dart';
import 'package:snap_check/modules/match/presentation/match_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF5F7FA), Color(0xFFE4E9F2)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '图片检测助手',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                    const SizedBox(height: 40),
                    ...List.generate(
                      2,
                      (index) => AnimatedBuilder(
                        animation: Tween(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                            parent: ModalRoute.of(context)?.animation ??
                                const AlwaysStoppedAnimation(1),
                            curve: Interval(index * 0.1, 0.5 + index * 0.1,
                                curve: Curves.easeOut),
                          ),
                        ),
                        builder: (context, child) => FadeTransition(
                          opacity: Tween(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                              parent: ModalRoute.of(context)?.animation ??
                                  const AlwaysStoppedAnimation(1),
                              curve: Interval(index * 0.1, 0.5 + index * 0.1,
                                  curve: Curves.easeOut),
                            ),
                          ),
                          child: child,
                        ),
                        child: _buildFeatureSection(
                          icon: [Icons.image_search, Icons.compare][index],
                          title: ['图片上传', '相似度对比'][index],
                          description: [
                            '支持多种格式图片上传，快速导入待比对图片',
                            '智能分析图片相似度，精确计算匹配程度'
                          ][index],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    _buildGetStartedButton(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureSection({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 28, color: Colors.blue),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D3748),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF718096),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGetStartedButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // TODO: 导航到图片检测页面
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MatchScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 2,
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '开始使用',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward_rounded, size: 20),
          ],
        ),
      ),
    );
  }
}
