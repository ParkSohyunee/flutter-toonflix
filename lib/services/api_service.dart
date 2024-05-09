import 'dart:convert';
import 'package:flutter_toonflix/model/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // 노마드 코딩에서 제공하는 API
  static const String baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodayToons() async {
    List<WebtoonModel> webtoonInstances = [];

    // API 요청
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url); // Future type -> Response type

    if (response.statusCode == 200) {
      // Response를 Json으로 받기
      final List<dynamic> webtoons = jsonDecode(response.body); // dynamic type
      for (var webtoon in webtoons) {
        // final toon = WebtoonModel.fromJson(webtoon);
        // print(toon.title);

        // Json에 있는 각 아이템을 WebtoonModel 인스턴스로 만들기
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
