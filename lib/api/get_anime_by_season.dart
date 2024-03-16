import 'dart:convert';

import 'package:anime_app/common/utils/utils.dart';
import 'package:anime_app/config/config.dart';
import 'package:anime_app/models/anime.dart';
import 'package:anime_app/models/anime_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Iterable<Anime>> getAnimeBySeason({required int limit}) async {
  final year = DateTime.now().year;
  final season = getCurrentSeason();
  final baseUrl =
      'https://api.myanimelist.net/v2/anime/season/$year/$season?limit=$limit';

  final response = await http
      .get(Uri.parse(baseUrl), headers: {'X-MAL-CLIENT-ID': clientId});
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    return AnimeInfo.fromJson(data).animes;
  } else {
    debugPrint("Error: ${response.statusCode}");
    debugPrint("Body: ${response.body}");
    throw Exception('Failed to get data');
  }
}
