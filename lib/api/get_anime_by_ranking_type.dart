import 'dart:convert';

import 'package:anime_app/config/config.dart';
import 'package:anime_app/models/anime.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Iterable<Anime>> getAnimeByRankingType(
    {required String rankingType, required int limit}) async {
  final baseUrl =
      'https://api.myanimelist.net/v2/anime/ranking?ranking_type=$rankingType&limit=$limit';
  final response = await http
      .get(Uri.parse(baseUrl), headers: {'X-MAL-CLIENT-ID': clientId});
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    List<dynamic> animeNodeList = data['data'];
    final animes = animeNodeList
        .where((animenode) => animenode['node']['main_picture'] != null)
        .map((anime) => Anime.fromJson(anime));
    return animes;
  } else {
    debugPrint("Error: ${response.statusCode}");
    debugPrint("Error: ${response.body}");
    throw Exception('Failed to get data');
  }
}
