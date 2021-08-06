import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proceedit_dyhealth/ind_components/notes/model/dto/note.dart';
import 'package:proceedit_dyhealth/ind_components/notes/view/info.dart';
import 'package:proceedit_dyhealth/ind_components/notes/viewmodel/info_bloc/bloc.dart';
import 'package:proceedit_dyhealth/ind_components/notes/viewmodel/note_bloc/bloc.dart';
import 'package:proceedit_dyhealth/ind_components/notes/utils/note_mode.dart';
import 'package:proceedit_dyhealth/ind_components/notes/view/note_add.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    final notesBloc = BlocProvider.of<NoteBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Proceedit Notes"),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              _navigateToInfo(context);
            },
          )
        ],
      ),
      body: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          if (state is NotesLoadSuccess) {
            final notes = state.notes;
            return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _navigateToNoteAdd(
                        context, NoteMode.Edit, note: notes[index]);
                  },
                  child: Dismissible(
                    key: Key(notes[index].title+notes[index].text+notes[index].id.toString()),
                    onDismissed: (direction) {
                      final noteCopy = Note.clone(notes[index]);
                      notesBloc.add(NoteDelete(notes[index].id));
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("${noteCopy.title} removed"),
                        action: SnackBarAction(
                          label: "UNDO",
                          onPressed: () {
                            notesBloc.add(NoteRestore(noteCopy));
                          },
                        ),
                      ));
                    },
                    direction: DismissDirection.endToStart,
                    secondaryBackground: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 32.0),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          )
                        ]
                      ),
                      color: Colors.red,
                    ),
                    background: Container(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Card(
                          elevation: 1.0,
                          margin: const EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 30.0, bottom: 30.0, left: 10.0, right: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _NoteTitle(notes[index].title),
                                _NoteContent(notes[index].text)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is NotesLoadInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { _navigateToNoteAdd(context, NoteMode.Add); },
        child: Icon(Icons.add),
      ),
    );
  }

  _navigateToNoteAdd(BuildContext context, NoteMode viewType, {note}) {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => NoteAdd(viewType: viewType, note: note,)
    ));
  }

  _navigateToInfo(BuildContext context) {
    final infoBloc = BlocProvider.of<InfoBloc>(context);
    infoBloc.add(InfoGet());
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => InfoView()
    ));
  }
}

class _NoteTitle extends StatelessWidget {

  final String _title;
  _NoteTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    );
  }
}

class _NoteContent extends StatelessWidget {

  final String _text;
  _NoteContent(this._text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        _text,
        style: TextStyle(
          color: Colors.grey.shade700,
        ),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}


