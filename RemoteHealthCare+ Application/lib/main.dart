import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proceedit_dyhealth/main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proceedit_dyhealth/ind_components/notes/utils/material_color.dart';
import 'package:proceedit_dyhealth/ind_components/notes/viewmodel/info_bloc/bloc.dart';
import 'package:proceedit_dyhealth/ind_components/notes/viewmodel/note_bloc/bloc.dart';
import 'package:proceedit_dyhealth/ind_components/notes/model/repositories/note_repository.dart';
// import 'package:proceedit_dyhealth/ind_components/news_viewer/src/blocs/stories/stories_provider.dart';
// import 'package:proceedit_dyhealth/ind_components/news_viewer/src/blocs/comments/comments_provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final proceeditPrimaryColor = createMaterialColor(Color(0xFF2C7192));

  @override
  Widget build(BuildContext context) {
    final _noteRepository = NoteRepository();
    return MultiBlocProvider(
        providers: [
      BlocProvider(
        create: (context) { return NoteBloc(
            noteRepository: _noteRepository
        )
          ..add(NoteGet())
        ;},
      ),
      BlocProvider(
        create: (context) {
          return InfoBloc(_noteRepository);
        },
      )
    ],
    // child: CommentsProvider(
    //   child: StoriesProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Remote HealthCare +',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MainScreen(),
        ),
      // ),
    // ),
    );
  }
}



