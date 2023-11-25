import 'package:bloc/bloc.dart';
import 'package:flutter_app_new/model/example_list.dart';
import 'package:flutter_app_new/pages/favorite/resources/favorite_repository.dart';
import 'package:meta/meta.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteRepository _repository = FavoriteRepository();
  FavoriteBloc() : super(FavoriteInitial()) {
    on<FetchedListEvent>(_repository.getListData);
  }
}
