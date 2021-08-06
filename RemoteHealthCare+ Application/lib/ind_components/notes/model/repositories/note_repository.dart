import 'package:proceedit_dyhealth/ind_components/notes/model/api/api_client.dart';
import 'package:proceedit_dyhealth/ind_components/notes/model/database/note_dao.dart';
import 'package:proceedit_dyhealth/ind_components/notes/model/dto/note.dart';
import 'package:dio/dio.dart';

class NoteRepository {
  final noteDao = NoteDao();
  static final dio = Dio();
  final client  = ApiClient(dio);

  Future getNotes() => noteDao.getNotes();
  Future createNote(Note note) => noteDao.createNote(note);
  Future updateNote(Note note) => noteDao.updateNote(note);
  Future deleteNoteById(int id) => noteDao.deleteNote(id);
  Future restoreNote(Note note) => noteDao.restoreNote(note);

  Future getInfo() => client.getInfo();

}