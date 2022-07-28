import 'package:flutter/widgets.dart';
import 'package:kt_dart/collection.dart';
import 'package:provider/provider.dart';

import 'todo_item_presentation_classes.dart';

extension FormTodosX on BuildContext {
  KtList<TodoItemPrimitive> get todos =>
      Provider.of<Todos>(this, listen: false).value;
  set todos(KtList<TodoItemPrimitive> value) =>
      Provider.of<Todos>(this, listen: false).value = value;
}
