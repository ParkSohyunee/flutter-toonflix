import 'package:flutter/material.dart';
import 'package:flutter_toonflix/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;
  const Webtoon(
      {super.key, required this.title, required this.thumb, required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 사용자가 스크린을 tap하는 것을 감지
      onTap: () {
        // Navigator.push를 사용해서 사용자가 다른 페이지에 온 것과 같은 효과
        Navigator.push(
            context,
            // MaterialPageRoute - Stateless 위젯을 Route로 감싸서 다른 스크린으로 보이게 만드는 클래스
            MaterialPageRoute(
              builder: (context) =>
                  DetailScreen(title: title, thumb: thumb, id: id),
              fullscreenDialog: true,
            ));
      },
      child: Column(
        children: [
          // 두 화면 사이에 애니메이션을 주는 위젯 (tag로 연결)
          Hero(
            tag: id,
            child: Container(
              width: 230,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 15,
                        offset: const Offset(8, 8),
                        color: Colors.black.withOpacity(0.5)),
                  ]),
              child: Image.network(
                thumb,
                headers: const {
                  'Referer': 'https://comic.naver.com',
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 22),
          )
        ],
      ),
    );
  }
}
