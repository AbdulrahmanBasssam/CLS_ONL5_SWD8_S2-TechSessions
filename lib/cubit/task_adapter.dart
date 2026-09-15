import 'package:hive_flutter/hive_flutter.dart';

import 'task.dart';

class TaskAdapter extends TypeAdapter<Task> {
  // different type id for each type adapter
  @override
  final int typeId = 0;

  @override
  Task read(BinaryReader reader) {
    return Task(
      id: reader.readString(),
      title: reader.readString(),
      description: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.description);
  }
}
