import 'package:nimebox/models/models.dart';

class LoadNews {}

class SetNews {
  final NewsModel news;
  SetNews({this.news});
}

class SetLoading {
  final bool isLoading;
  SetLoading({this.isLoading});
}

class SetError {
  final String error;
  SetError({this.error});
}
