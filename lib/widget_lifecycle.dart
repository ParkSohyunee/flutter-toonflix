import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool showTitle = false;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.red),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text('No Title'),
              IconButton(
                  onPressed: toggleTitle,
                  icon: const Icon(Icons.remove_red_eye_outlined))
            ],
          ),
        ),
      ),
    );
  }
}

// _AppState 위젯에서 분리
// stateless 위젯에서 theme의 값에 접근 - context
class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  // 부모 요소에 의존하는 데이터를 초기화 해야하는 경우, API 구독
  // initState 메소드가 언제나 build 메소드보다 먼저 호출된다는 점
  @override
  void initState() {
    super.initState();
    print('initState');
  }

  @override
  void dispose() {
    // 위젯이 스크린에서 제거될 때 호출되는 메소드
    // API 업데이트 또는 이벤트 리스너로부터 구독 취소 또는 form의 리스터로부터 벗어나는 등
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    // context에는 위젯 트리 정보가 담겨있음 - 부모 요소에 접근
    return Text(
      'My Large Title',
      style: TextStyle(
          fontSize: 30, color: Theme.of(context).textTheme.titleLarge?.color),
    );
  }
}
