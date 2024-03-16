import 'package:anime_app/api/get_anime_by_ranking_type.dart';
import 'package:anime_app/core/screens/error_screen.dart';
import 'package:anime_app/widgets/loader.dart';
import 'package:anime_app/widgets/top_anime_image_slider.dart';
import 'package:flutter/material.dart';

class TopAnimesList extends StatefulWidget {
  const TopAnimesList({super.key});

  @override
  State<TopAnimesList> createState() => _TopAnimesListState();
}

class _TopAnimesListState extends State<TopAnimesList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAnimeByRankingType(rankingType: 'all', limit: 4),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }
        if (snapshot.data!=null) {
          return const TopAnimeImageSlider(animes: [],);
        }
        return ErrorScreen(error: snapshot.error.toString());
      },
    );
  }
}
