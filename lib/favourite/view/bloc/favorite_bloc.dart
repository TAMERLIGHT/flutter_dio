import 'package:bloc/bloc.dart';
import 'package:flutter_app_new/favourite/data/model/example_list.dart';
import 'package:flutter_app_new/favourite/domain/favourite_repository.dart';
import 'package:meta/meta.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteRepository _repository;

  FavoriteBloc(this._repository) : super(FavoriteInitial()) {
    on<FetchedListEvent>(_handleFetchedListEvent);
  }

  void _handleFetchedListEvent(
      FetchedListEvent event, Emitter<FavoriteState> emit) {
    _repository.getListData(event, emit);
  }
}
