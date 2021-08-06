import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proceedit_dyhealth/ind_components/notes/viewmodel/info_bloc/bloc.dart';
import 'package:proceedit_dyhealth/ind_components/notes/viewmodel/note_bloc/bloc.dart';

class InfoView extends StatefulWidget {
  @override
  _InfoViewState createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info'),
      ),
      body: BlocBuilder<InfoBloc, InfoState>(
        builder: (context, state) {
          if (state is InfoLoadSuccess) {
            final _infoItem = state.infoItem;
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _OrganizationText(_infoItem.organization),
                    _DescriptionText(_infoItem.text),
                  ],
                ),
              ),
            );
          } else if (state is InfoLoadInProgress) {
            return Center(child: CircularProgressIndicator());
          }
          else { return Container(); }
        }
      ),
    );
  }
}

class _OrganizationText extends StatelessWidget {
  final String _text;

  _OrganizationText(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(_text,
      style: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.bold
      ),
    );
  }
}

class _DescriptionText extends StatelessWidget {
  final String _text;

  _DescriptionText(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(_text,
      style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.normal
      ),
      textAlign: TextAlign.center,
    );
  }
}

