import 'package:anime_app/models/anime.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TopAnimeImageSlider extends StatefulWidget {
  final Iterable<Anime> animes;
  const TopAnimeImageSlider({required this.animes, super.key});

  @override
  State<TopAnimeImageSlider> createState() => _TopAnimeImageSliderState();
}

class _TopAnimeImageSliderState extends State<TopAnimeImageSlider> {
  int _selectedPageIndex = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CarouselSlider.builder(
              carouselController: _carouselController,
              itemCount: widget.animes.length,
              itemBuilder: (context, index, realIndex) {
                final anime = widget.animes.elementAt(realIndex);
                return Text('data');
              },
              options: CarouselOptions(
                  enlargeFactor: 0.22,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _selectedPageIndex = index;
                    });
                  },
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.88,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  initialPage: _selectedPageIndex)),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
