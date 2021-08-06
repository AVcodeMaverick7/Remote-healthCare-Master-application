import 'package:equatable/equatable.dart';
import 'package:proceedit_dyhealth/ind_components/notes/model/dto/note.dart';

abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object> get props => [];
}

class NotesLoadInProgress extends NoteState {}

class NotesLoadSuccess extends NoteState {
  final List<Note> notes;

  const NotesLoadSuccess([this.notes = const []]);

  @override
  List<Object> get props => [notes];
}

class NotesLoadFailure extends NoteState {}
