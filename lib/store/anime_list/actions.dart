import 'package:nimebox/models/models.dart';

class LoadAnimeList {}

class SetAnimeList {
  final AnimeListModel animeList;
  SetAnimeList({this.animeList});
}

class SetLoading {
  final bool isLoading;
  SetLoading({this.isLoading});
}

class SetError {
  final String error;
  SetError({this.error});
}
