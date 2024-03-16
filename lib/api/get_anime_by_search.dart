import 'dart:convert';

import 'package:anime_app/config/config.dart';
import 'package:anime_app/models/anime.dart';
import 'package:anime_app/models/anime_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Iterable<Anime>> getAnimeBySearch({required query}) async {
  final baseUrl = 'https://api.myanimelist.net/v2/anime?q=$query&limit=10';
  final response = await http
      .get(Uri.parse(baseUrl), headers: {'X-MAL-CLIENT-ID': clientId});
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    AnimeInfo animeInfo = AnimeInfo.fromJson(data);
    return animeInfo.animes;
  } else {
    debugPrint('Error: ${response.statusCode}');
    debugPrint('Body: ${response.body} ');
    throw Exception('Failed to get data');
  }
}
