class TodoModel {
  int? id;
  String? title;
  String? description;
  String? time;
  int? favorite;
  int? completed;

  TodoModel({
    this.id,
    this.title,
    this.description,
    this.time,
    this.favorite,
    this.completed,
  });

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    time = json['time'];
    favorite = json['favorite'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'time': time,
      'favorite': favorite,
      'completed': completed,
    };
  }
}
