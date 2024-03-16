
import 'package:anime_app/widgets/top_animes_widget.dart';
import 'package:flutter/material.dart';

class AnimeScreen extends StatefulWidget {
  const AnimeScreen({super.key});

  @override
  State<AnimeScreen> createState() => _AnimeScreenState();
}

class _AnimeScreenState extends State<AnimeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anime World'),
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.search))]
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              TopAnimesList(),
            ],
          ),
        ),

    );
  }
}