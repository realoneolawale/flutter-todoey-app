import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';

// object will be provided throughout the app
class TaskData extends ChangeNotifier {
  // _task is private
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy egg'),
  ];

  // List<Task> get tasks {}
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  // getter
  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTasktitle) {
    final task = Task(name: newTasktitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
