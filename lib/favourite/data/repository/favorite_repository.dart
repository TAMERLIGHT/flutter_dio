import 'package:flutter_app_new/favourite/data/model/example_list.dart';
import 'package:flutter_app_new/favourite/domain/favourite_repository.dart';
import 'package:flutter_app_new/favourite/view/bloc/favorite_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'favorite_api.dart';

class FavoriteRepositoryImpl extends FavoriteRepository {
  final ApiService _apiService;

  FavoriteRepositoryImpl(this._apiService);

  @override
  Future<void> getListData(
      FetchedListEvent event, Emitter<FavoriteState> emit) async {
    emit(LoadingListState());
    try {
      final List<dynamic> response = await _apiService.getPosts();
      final List<ExampleList> exampleList = response
          .map((data) => ExampleList.fromJson(data))
          .toList();

      emit(LoadedListState(exampleList));
    } catch (_) {
      emit(FailureProfileState());
    }
  }
}
