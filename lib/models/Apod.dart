class ApodModels{

  factory ApodModels.fromJson(Map<dynamic, dynamic> json){
    return ApodModels(
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

  ApodModels({this.dateTime, this.explanation, this.imageUrl, this.title});

}