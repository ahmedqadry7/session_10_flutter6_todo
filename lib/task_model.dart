class TaskModel {
  String title;
  String description;
  bool isDone;
  int date;
  String id;

  TaskModel({
    this.id = "",
    this.isDone = false,
    required this.date,
    required this.description,
    required this.title,
  });

  //coming from dataBase converted to Model
  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          date: json['date'],
          description: json['description'],
          title: json['title'],
          id: json['id'],
          isDone: json['isDone'],
        );

  // TaskModel fromJson(Map<String, dynamic> json) {
  //   return TaskModel(
  //     date: json['date'],
  //     description: json['description'],
  //     title: json['title'],
  //     id: json['id'],
  //     isDone: json['isDone'],
  //   );
  // }

  //transefers to dataBase converted to Map
  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "title": title,
      "isDone": isDone,
      "date": date,
      "id": id,
    };
  }
}
