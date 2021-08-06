import 'package:equatable/equatable.dart';
import 'package:proceedit_dyhealth/ind_components/notes/model/dto/info_item.dart';

abstract class InfoState extends Equatable {
  const InfoState();
  @override
  List<Object> get props => [];
}

class InfoLoadInProgress extends InfoState {}

class InfoLoadSuccess extends InfoState {
  final InfoItem infoItem;

  const InfoLoadSuccess(this.infoItem);

  @override
  List<Object> get props => [infoItem];
}

class InfoLoadFailure extends InfoState {}