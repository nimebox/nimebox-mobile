import 'dart:async';
import 'package:cookie_jar/cookie_jar.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nimebox/api/api.dart';
import 'package:flutter/services.dart' show rootBundle;

class ApiClient {
  Dio client;
  ApiSecrets _secrets;

  ApiClient() {
    var _client = Dio();
    _client.cookieJar = CookieJar();
    this.client = _client;
  }

  /// Fetch news data
  Future<NewsResponse> fetchNews() async {
    try {
      if (_secrets == null) {
        _secrets = await loadSecrets();
      }
      var newsResponse = await this.client.get('${_secrets.baseUrl}/v1/news',
          options: Options(
              connectTimeout: 15000,
              headers: {'Authorization': 'Bearer ${_secrets.token}'}));

      NewsResponse response = serializers.deserializeWith(
          NewsResponse.serializer, newsResponse.data);

      return response;
    } catch (error) {
      throw error;
    }
  }

  /// Fetch data for anime list with optional [provider]
  Future<AnimeListResponse> fetchAnimeList({String provider = 'senpai'}) async {
    try {
      if (_secrets == null) {
        _secrets = await loadSecrets();
      }
      var animeListResponse = await this.client.get(
          '${_secrets.baseUrl}/v1/anime?provider=$provider',
          options: Options(
              connectTimeout: 15000,
              headers: {'Authorization': 'Bearer ${_secrets.token}'}));

      AnimeListResponse response = serializers.deserializeWith(
          AnimeListResponse.serializer, animeListResponse.data);

      return response;
    } catch (error) {
      throw error;
    }
  }

  /// Fetch data for given anime [title] with optional [provider]
  Future<AnimeResponse> fetchAnime(String title,
      {String provider = 'senpai'}) async {
    try {
      if (_secrets == null) {
        _secrets = await loadSecrets();
      }
      var animeResponse = await this.client.get(
          '${_secrets.baseUrl}/v1/anime/$title?provider=$provider',
          options: Options(
              connectTimeout: 15000,
              headers: {'Authorization': 'Bearer ${_secrets.token}'}));

      AnimeResponse response = serializers.deserializeWith(
          AnimeResponse.serializer, animeResponse.data);

      return response;
    } catch (error) {
      throw error;
    }
  }
}

class ApiSecrets {
  final String baseUrl;
  final String token;
  ApiSecrets({this.baseUrl, this.token});
}

Future<ApiSecrets> loadSecrets() async {
  var rawJson = await rootBundle.loadString('assets/secrets.json');
  var decoded = json.decode(rawJson);
  return ApiSecrets(baseUrl: decoded["baseUrl"], token: decoded["token"]);
}
