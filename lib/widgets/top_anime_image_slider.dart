import 'package:anime_app/constants/app_colors.dart';
import 'package:anime_app/models/anime.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
      height: 260,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CarouselSlider.builder(
              carouselController: _carouselController,
              itemCount: widget.animes.length,
              itemBuilder: (context, index, realIndex) {
                return TopAnimePicture(
                  anime: widget.animes.elementAt(index),
                );
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
          AnimatedSmoothIndicator(
            activeIndex: _selectedPageIndex,
            count: widget.animes.length,
            effect: CustomizableEffect(
                dotDecoration: DotDecoration(
                    borderRadius: BorderRadius.circular(8),
                    width: 28,
                    height: 8,
                    color: Theme.of(context).primaryColor),
                activeDotDecoration: DotDecoration(
                    rotationAngle: 180,
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.blueColor,
                    width: 28,
                    height: 8)),
          )
        ],
      ),
    );
  }
}

class TopAnimePicture extends StatelessWidget {
  const TopAnimePicture({required this.anime, super.key});
  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.white,
      child: ClipRect(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(
            anime.node.mainPicture.medium,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
