import 'package:http/http.dart' as http;

class ApiService {
  // 노마드 코딩에서 제공하는 API
  final String baseUrl = 'https://webtoon-crawler.nomadcoders.workers.dev';
  final String today = "today";

  void getTodayToons() async {
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url); // Future type -> Response type
    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    throw Error();
  }
}
