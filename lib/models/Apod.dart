class Apod_models{
  List <Apod_models> photos = [];

  factory Apod_models.fromJson(Map<dynamic, String> json){
    return Apod_models(
      imageUrl: json['url'],
      explanation: json['explanation'],
      title: json['title'],
      dateTime: json['date'],
    );
  }
  String dateTime;
  String explanation;
  String title;
  String imageUrl;

  Apod_models({this.dateTime, this.explanation, this.imageUrl, this.title});

}