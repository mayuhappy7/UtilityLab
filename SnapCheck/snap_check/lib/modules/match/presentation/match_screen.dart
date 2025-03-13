import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snap_check/modules/match/controller/match_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchScreen extends ConsumerStatefulWidget {
  const MatchScreen({super.key});

  @override
  ConsumerState<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends ConsumerState<MatchScreen> {
  int currentIndex = 0;
  double similarityThreshold = 15000;

  @override
  Widget build(BuildContext context) {
    final matchState = ref.watch(matchControllerProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        shadowColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: const Text(
          '图片对比',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ElevatedButton(
              onPressed: () async {
                await ref.read(matchControllerProvider.notifier).matchImages();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('匹配完成')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                minimumSize: const Size(60, 32),
              ),
              child: const Text(
                '开始匹配',
                style: TextStyle(fontSize: 13),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 添加滑动条控制区域
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        '最小相似度：',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        similarityThreshold.toStringAsFixed(0),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.blue,
                      inactiveTrackColor: Colors.blue.withOpacity(0.2),
                      thumbColor: Colors.blue,
                      overlayColor: Colors.blue.withOpacity(0.2),
                      valueIndicatorColor: Colors.blue,
                      showValueIndicator: ShowValueIndicator.always,
                    ),
                    child: Slider(
                      value: 20000 - similarityThreshold,
                      min: 0,
                      max: 20000,
                      divisions: 10,
                      label: similarityThreshold.toStringAsFixed(0),
                      onChanged: (value) {
                        setState(() {
                          similarityThreshold = 20000 - value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            // 上部分：源图片区域
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // 控制按钮行
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (currentIndex > 0) {
                                currentIndex--;
                              } else {
                                currentIndex = matchState.length - 1;
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('上一组'),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (currentIndex < matchState.length - 1) {
                                currentIndex++;
                              } else {
                                currentIndex = 0;
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('下一组'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // 源图片显示
                    if (matchState.isNotEmpty)
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: FutureBuilder<Uint8List>(
                                  future: ref
                                      .read(matchControllerProvider.notifier)
                                      .getImage(
                                        '${matchState[currentIndex].imageMatchs[0].img1Dir}/${matchState[currentIndex].imageMatchs[0].img1Name}',
                                      ),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                    if (snapshot.hasError) {
                                      return const Center(
                                          child: Icon(Icons.error_outline));
                                    }
                                    if (!snapshot.hasData) {
                                      return const Center(child: Text('无图片数据'));
                                    }
                                    return Image.memory(
                                      snapshot.data!,
                                      fit: BoxFit.contain,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            // 下部分：匹配图片列表
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          '匹配结果',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (matchState.isNotEmpty)
                          Text(
                            '(${currentIndex + 1}/${matchState.length}组 - ${matchState[currentIndex].imageMatchs.where((match) => match.matchScore > similarityThreshold).length}张匹配)',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: matchState.isEmpty
                          ? const Center(child: Text('点击"开始匹配"开始图片匹配'))
                          : GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: 0.85,
                              ),
                              itemCount: matchState[currentIndex]
                                  .imageMatchs
                                  .where((match) =>
                                      match.matchScore >= similarityThreshold)
                                  .length,
                              itemBuilder: (context, index) {
                                final filteredMatches = matchState[currentIndex]
                                    .imageMatchs
                                    .where((match) =>
                                        match.matchScore >= similarityThreshold)
                                    .toList();
                                final match = filteredMatches[index];
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                        child: FutureBuilder<Uint8List>(
                                          future: ref
                                              .read(matchControllerProvider
                                                  .notifier)
                                              .getImage(
                                                '${match.img2Dir}/${match.img2Name}',
                                              ),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return const Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            }
                                            if (snapshot.hasError) {
                                              return const Center(
                                                  child: Icon(
                                                      Icons.error_outline));
                                            }
                                            if (!snapshot.hasData) {
                                              return const Center(
                                                  child: Text('无图片数据'));
                                            }
                                            return Image.memory(
                                              snapshot.data!,
                                              fit: BoxFit.contain,
                                            );
                                          },
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.vertical(
                                            bottom: Radius.circular(16),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 4),
                                            Text(
                                              '相似度: ${match.matchScore}',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
