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
  int _counter = 0;
  List<int> numbers = [];

  void onClicked() {
    // 데이터를 변경하고 UI에 반영하려면 setState - flutter에게 build 메소드를 다시 실행
    // flutter에서 상태(state)는 많이 사용하지 않음 (참고)
    setState(() {
      _counter++;
      numbers.add(numbers.length);
    });

    // 아래 처럼 작성할 수도 있음, 하지만 setState안에 작성하는 것이 일반적 (참고)
    // numbers.add(numbers.length);
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'click count',
                style: TextStyle(fontSize: 30),
              ),
              for (var n in numbers) Text('$n'),
              Text(
                '$_counter',
                style: const TextStyle(fontSize: 30),
              ),
              IconButton(
                onPressed: onClicked,
                icon: const Icon(Icons.add_box_rounded),
                iconSize: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
