class TodoModel {
  final String title;
  bool isDone;

  TodoModel({required this.title, this.isDone = false});
  factory TodoModel.fromJson(Map todo) {
    return TodoModel(title: todo['title'], isDone: todo['is_done'] ?? false);
  }
  Map toJson() {
    return {"title": title, "is_done": isDone};
  }
}
