class WebtoonModel {
  final String title, thumb, id;

  // 콜론을 사용해서 argument와 property를 일대일로 초기화하는 생성자 생성
  // 즉, WebtoonModel 프로퍼티를 json의 프로퍼티로 초기화
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
