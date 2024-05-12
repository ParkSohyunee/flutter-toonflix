class WebtoonDetailModel {
  final String title, about, genere, age;

  WebtoonDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        about = json['about'],
        genere = json['genere'],
        age = json['age'];
}
