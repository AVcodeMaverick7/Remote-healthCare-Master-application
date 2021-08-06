import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:proceedit_dyhealth/ind_components/notes/model/dto/note.dart';
import 'package:proceedit_dyhealth/ind_components/notes/model/repositories/note_repository.dart';
import './bloc.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final NoteRepository noteRepository;

  NoteBloc({this.noteRepository});

  @override
  NoteState get initialState => NotesLoadInProgress();

  @override
  Stream<NoteState> mapEventToState(
    NoteEvent event,
  ) async* {
    if (event is NoteGet) {
      yield* _mapNoteGetToState();
    }
    else if (event is NoteCreate) {
      yield* _mapNoteAddToState(event);
    }
    else if (event is NoteUpdate) {
      yield* _mapNoteUpdateToState(event);
    }
    else if (event is NoteDelete) {
      yield* _mapNoteDeleteToState(event);
    }
    else if (event is NoteRestore) {
      yield* _mapNoteRestoreToState(event);
    }
  }

  Stream<NoteState> _mapNoteGetToState() async* {
    yield NotesLoadInProgress();
    try {
      final notes = await _getNotes();
      yield NotesLoadSuccess(notes);
    } catch (_) {
      yield NotesLoadFailure();
    }
  }

  Stream<NoteState> _mapNoteAddToState(NoteCreate event) async* {
    if (state is NotesLoadSuccess) {
      //final List<Note> updatedNotes = List.from((state as NotesLoadSuccess).notes)..add(event.note);
      final result = await this.noteRepository.createNote(event.note);
      final updatedNotes = await _getNotes();
      // todo: check the result here and either return NotesLoadSuccess, or NotesLoadFailure
      yield NotesLoadSuccess(updatedNotes);
    }


  }

  Stream<NoteState> _mapNoteUpdateToState(NoteUpdate event) async* {
    if (state is NotesLoadSuccess) {
     /* final List<Note> updatedNotes = (state as NotesLoadSuccess).notes.map((note) {
        return note.id == event.note.id ? event.note : note;
      }).toList(); */
      final result = await this.noteRepository.updateNote(event.note);
      final updatedNotes = await _getNotes();
      yield NotesLoadSuccess(updatedNotes);
    }
  }

  Stream<NoteState> _mapNoteDeleteToState(NoteDelete event) async* {
    if (state is NotesLoadSuccess) {
     /* final updatedNotes = (state as NotesLoadSuccess)
          .notes
          .where((note) => note.id != event.id)
          .toList(); */
      final result = await this.noteRepository.deleteNoteById(event.id);
      final updatedNotes = await _getNotes();
      yield NotesLoadSuccess(updatedNotes);
    }
  }

  Stream<NoteState> _mapNoteRestoreToState(NoteRestore event) async* {
    if (state is NotesLoadSuccess) {
      final result = await this.noteRepository.restoreNote(event.note);
      final updatedNotes = await _getNotes();
      yield NotesLoadSuccess(updatedNotes);
    }
  }

  Future<List<Note>> _getNotes() {
    return this.noteRepository.getNotes();
  }

  }
