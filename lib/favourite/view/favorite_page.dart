import 'package:flutter/material.dart';
import 'package:flutter_app_new/favourite/data/model/example_list.dart';
import 'package:flutter_app_new/favourite/data/repository/favorite_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart'; // Импорт Dio
import 'package:flutter_app_new/favourite/data/repository/favorite_repository.dart'; // Импорт FavoriteRepository
import 'package:flutter_app_new/favourite/domain/favourite_repository.dart'; // Импорт FavouriteRepository
import 'package:flutter_app_new/favourite/view/bloc/favorite_bloc.dart'; // Импорт FavoriteBloc

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late FavoriteBloc favoriteBloc;
  List<ExampleList> exampleList = [];

  @override
  void initState() {
    final ApiService apiService = ApiService(Dio()); // Инициализация ApiService с Dio
    final FavoriteRepository favoriteRepository = FavoriteRepositoryImpl(apiService); // Инициализация репозитория

    favoriteBloc = FavoriteBloc(favoriteRepository); // Передача репозитория в блок
    favoriteBloc.add(FetchedListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Избранное",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.pink,
      ),
      body: BlocBuilder(
        bloc: favoriteBloc,
        builder: (context, state) {
          if (state is LoadingListState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          }
          if (state is LoadedListState) {
            exampleList = state.exampleList;
            return buildBody();
          }
          if (state is FailureProfileState) {
            return const Center(
              child: Text("Ошибка"),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget buildBody() {
    List<Widget> children = [];
    for (var item in exampleList) {
      children.add(
        Stack(
          children: [
            Card(
              elevation: 3,
              margin: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.white,
              child: ListTile(
                leading: const Icon(
                  Icons.favorite,
                  color: Colors.blue,
                ),
                title: Text(
                  item.title.toString(),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Center(
      child: SingleChildScrollView(
        child: Column(children: children),
      ),
    );
  }
}
