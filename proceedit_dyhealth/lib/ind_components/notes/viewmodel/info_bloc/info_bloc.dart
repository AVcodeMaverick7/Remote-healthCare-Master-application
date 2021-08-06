import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:proceedit_dyhealth/ind_components/notes/model/dto/info_item.dart';
import 'package:proceedit_dyhealth/ind_components/notes/model/repositories/note_repository.dart';
import 'bloc.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  final NoteRepository noteRepository;

  InfoBloc(this.noteRepository);

  @override
  InfoState get initialState => InfoLoadInProgress();

  @override
  Stream<InfoState> mapEventToState(
    InfoEvent event,
  ) async* {
    if (event is InfoGet) {
      yield* _mapInfoGetToState();
    }
  }

  Stream<InfoState> _mapInfoGetToState() async* {
    yield InfoLoadInProgress();
    try {
      final List<InfoItem> infoItems = await noteRepository.getInfo();
      final infoItem = infoItems[0];
      yield InfoLoadSuccess(infoItem);
    } catch (_) {
      yield InfoLoadFailure();
    }
  }
}
