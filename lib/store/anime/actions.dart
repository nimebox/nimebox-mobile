import 'package:nimebox/models/models.dart';

class LoadAnime {
  final String title;
  LoadAnime(this.title);
}

class SetAnime {
  final AnimeModel anime;
  SetAnime({this.anime});
}

class SetLoading {
  final bool isLoading;
  SetLoading({this.isLoading});
}

class SetError {
  final String error;
  SetError({this.error});
}
