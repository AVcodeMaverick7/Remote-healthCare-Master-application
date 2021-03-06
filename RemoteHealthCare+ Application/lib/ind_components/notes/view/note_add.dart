import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proceedit_dyhealth/ind_components/notes/viewmodel/note_bloc/bloc.dart';
import 'package:proceedit_dyhealth/ind_components/notes/model/dto/note.dart';
import 'package:proceedit_dyhealth/ind_components/notes/utils/note_mode.dart';
import 'package:proceedit_dyhealth/ind_components/notes/view/custom/button.dart';

class NoteAdd extends StatefulWidget {

  final NoteMode viewType;
  final Note note;

  const NoteAdd({Key key, this.viewType, this.note}) : super(key: key);

  @override
  _NoteAddState createState() => _NoteAddState();
}

class _NoteAddState extends State<NoteAdd> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  @override
  void didChangeDependencies() {
    if (widget.viewType == NoteMode.Edit) {
      _titleController.text = widget.note.title;
      _textController.text = widget.note.text;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final notesBloc = BlocProvider.of<NoteBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.viewType == NoteMode.Add ? "Add a note" : "Edit the note"
       ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: "Note title"
              ),
            ),
            Container(height: 16,),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: "Note text"
              ),
            ),
            Container(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  text: "Save",
                  onClick: () {
                    final _title = _titleController.text;
                    final _text = _textController.text;

                    if (widget?.viewType == NoteMode.Add) {
                      notesBloc.add(NoteCreate(Note(_title, _text)));
                    } else {
                      notesBloc.add(NoteUpdate(Note.withId(widget.note.id, _title, _text)));
                    }

                    Navigator.pop(context);
                  },
                ),
                CustomButton(
                  text: "Discard",
                  buttonColor: Colors.grey,
                  onClick: () {
                    Navigator.pop(context);
                  },
                ),
                if (widget.viewType == NoteMode.Edit)
                  CustomButton(
                    text: "Delete",
                    buttonColor: Colors.red,
                    onClick: () {
                      notesBloc.add(NoteDelete(widget.note.id));
                      Navigator.pop(context);
                    },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

