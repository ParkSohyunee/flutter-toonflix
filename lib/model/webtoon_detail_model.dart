class WebtoonDetailModel {
  final String title, about, genere, age, thumb;

  WebtoonDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        about = json['about'],
        genere = json['genere'],
        age = json['age'],
        thumb = json['thumb'];
}
