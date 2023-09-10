class Todo {
  String? id;
  String? todoText;
  late bool isDone;

  Todo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<Todo> todoList() {
    return [
      Todo(id: '01', todoText: "Gym", isDone: true),
      Todo(id: '02', todoText: "Buy milk", isDone: true),
      Todo(id: '03', todoText: "Home work"),
      Todo(id: '04', todoText: "Walk "),
      Todo(id: '05', todoText: "Reading book"),
      Todo(id: '06', todoText: "College meeting"),
      Todo(id: '07', todoText: "Dinner with Shraddha Kapoor"),
    ];
  }
}
