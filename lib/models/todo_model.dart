class TodoModelMain {
  int? createdAt;
  String? todoName;
  String? details;
  String? id;

  TodoModelMain({this.createdAt, this.todoName, this.details, this.id});

  TodoModelMain.fromJson(Map<String, dynamic> json) {
    createdAt = json["createdAt"];
    todoName = json["todoName"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["createdAt"] = createdAt;
    data["todoName"] = todoName;
    data["id"] = id;
    return data;
  }
}
