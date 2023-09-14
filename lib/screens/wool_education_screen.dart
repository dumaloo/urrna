import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sih_wool_app/screens/video_player.dart';

class WoolEducationScreen extends StatelessWidget {
  WoolEducationScreen({Key? key}) : super(key: key);

  final List<Article> articles = [
    Article(
      title: 'Article 1',
      description: 'Description for Article 1',
      content: 'This is the content of Article 1.',
    ),
    Article(
      title: 'Article 2',
      description: 'Description for Article 2',
      content: 'This is the content of Article 2.',
    ),
    Article(
      title: 'Article 3',
      description: 'Description for Article 3',
      content: 'This is the content of Article 3.',
    ),
  ];

  final List<String> videoUrls = [
    'https://www.youtube.com/watch?v=B9hsWOCXb_o', // Replace with your video URLs
    'https://example.com/video2.mp4',
    // Add more video URLs here...
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: articles.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return InkWell(
              onTap: () {
                _openFullArticle(context, articles[index]);
              },
              child: Card(
                child: ListTile(
                  title: Text(articles[index].title),
                  subtitle: Text(articles[index].description),
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 200,
            aspectRatio: 16 / 9,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
          ),
        ),
        const SizedBox(height: 20), // Add spacing between article and video sections
        const Text(
          'Videos',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          height: 200, // Set the desired height for the video section
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: videoUrls.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: VideoPlayerWidget(videoUrl: videoUrls[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  void _openFullArticle(BuildContext context, Article article) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(article.title),
            backgroundColor: Colors.purple,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Text(
                article.content,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Article {
  final String title;
  final String description;
  final String content;

  Article({
    required this.title,
    required this.description,
    required this.content,
  });
}
