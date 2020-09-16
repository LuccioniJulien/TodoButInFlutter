class Todo {
  int id;
  final String title;
  bool isDone;

  Todo(this.title);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone,
    };
  }
}
