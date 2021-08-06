import 'package:equatable/equatable.dart';
import 'package:proceedit_dyhealth/ind_components/notes/model/dto/note.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class NoteGet extends NoteEvent {}

class NoteCreate extends NoteEvent {
  final Note note;
  const NoteCreate(this.note);

  @override
  List<Object> get props => [note];
}

class NoteUpdate extends NoteEvent {
  final Note note;
  const NoteUpdate(this.note);

  @override
  List<Object> get props => [note];
}

class NoteDelete extends NoteEvent {
  final int id;
  const NoteDelete(this.id);

  @override
  List<Object> get props => [id];
}

class NoteRestore extends NoteEvent {
  final Note note;
  const NoteRestore(this.note);

  @override
  List<Object> get props => [note];
}