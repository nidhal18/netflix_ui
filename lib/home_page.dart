import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_ui/model/list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Hero Banner
        Stack(
          children: [
            Image.network(
              'https://i.pinimg.com/originals/2c/88/e3/2c88e3c60539a9a74b20d29150f07fb6.png',
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Featured Show',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {},
                    child: const Text('Watch Now'),
                  ),
                ],
              ),
            ),
          ],
        ),
        // Movie Carousels for Each Category
        for (var category in categories) _buildCarousel(category),

        // Movie carousels
        _buildCarousel('Popular on Netflix'),
        _buildCarousel('Trending Now'),
        _buildCarousel('Top Picks for You'),
        _buildCarousel('Recently Added'),
      ],
    );
  }

  Widget _buildCarousel(String title) {
    final random = Random(); // Create a Random object

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10, // Number of items in the carousel
            itemBuilder: (context, index) {
              // Pick a random poster for each item
              final randomPoster =
                  moviePosters[random.nextInt(moviePosters.length)];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    randomPoster, // Use random poster
                    width: 100,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
