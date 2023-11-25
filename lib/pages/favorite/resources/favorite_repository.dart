import 'dart:convert';

import 'package:flutter_app_new/model/example_list.dart';
import 'package:flutter_app_new/pages/favorite/bloc/favorite_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class FavoriteRepository {
  Future<void> getListData(
      FetchedListEvent event, Emitter<FavoriteState> emit) async {
    emit(LoadingListState());
    try {
      final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      );
      if (response.statusCode == 200) {
        final List<ExampleList> exampleList =
            (json.decode(response.body) as List)
                .map((data) => ExampleList.fromJson(data))
                .toList();

        emit(LoadedListState(exampleList));
      }
    } catch (_) {
      emit(FailureProfileState());
    }
  }
}
