// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../task_bloc.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState.initial()) {
    on<AddTaskEvent>((event, emit) {
      final newList = List<Task>.from(state.tasks);
      newList.add(Task(title: event.title));
      emit(state.copyWith(
        tasks: newList,
      ));
    });
  }
}
