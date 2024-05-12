import 'dart:convert';
import 'package:flutter_toonflix/model/webtoon_episode_model.dart';
import 'package:flutter_toonflix/model/webtoon_model.dart';
import 'package:flutter_toonflix/model/webtoon_detail_model.dart';
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

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id'); // url을 만들고,
    final response = await http.get(url); // url로 request 요청을 보내고,

    // 요청이 성공하면,
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body); // String을 json으로 변환해서,
      // WebtoonDetailModel 인스턴스로 초기화
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> webtoonEpisodesInstance = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        webtoonEpisodesInstance.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return webtoonEpisodesInstance;
    }
    throw Error();
  }
}
