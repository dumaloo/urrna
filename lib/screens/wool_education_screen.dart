import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:video_player/video_player.dart';

class WoolEducationScreen extends StatelessWidget {
  WoolEducationScreen({Key? key}) : super(key: key);

  final List<Article> articles = [
    Article(
      title: 'The Science behind the wool industry',
      description: 'Description for Article 1',
      content:
      """Introduction to Wool Production and Demand Sheep and wool production occurs in a number of areas
  of the world. The production method, however, has been
  considered somewhat diverse. Wool production can collectively be the production of keratin fibers from a range of animals. This can include the production of cashmere, alpaca,
  mohair, angora, yak, elk, and camel fiber. Fiber characteristics from sheep wool can vary depending on the sheep breed,
  its age, the environmental grazing conditions, local market
  requirements, and export opportunities for the country
  of origin.
  On an international scale, wool production is a small trade
  (Textile Exchange, 2019). The inception of manmade fibers in
  the 1880s has seen considerable shrinkage in the textile market
  share of wool. Wool production represents about 1% of the
  global supply of textile fibers (Table 1). Apparel wool from
  sheep contributes about half of that amount. The contribution
  of wool has fallen by about half over the past 20 yr as wool
  production has declined, and the production of manmade fibers has nearly doubled (IWTO, 2019).
  Similarly, as wool production has decreased, there has
  been a reduction in demand for woolen fabrics in the last
  two decades (IWTO, 2019). Traditionally, apparel wool
  was used either as outer knitwear or as woven suiting attire. Research indicates that there is a trend away from these
  markets due to:
  • Increasing casualization of the workforce;
  • Limited trans-seasonal clothing options;
  • Attitudes on discretionary spending during unfavorable economic conditions. Casualization of workforce Data show a consistent decreasing demand trend for woven suiting fabrics (IWTO, 2019). This is consistent with trend of the casualization of work wear and the importance of comfort and loungewear. This has been further compounded by recent requirements for employees to work from home due to recent COVID-19 pandemic restrictions.""",
    ),
    Article(
      title: 'Value and use of wool',
      description: 'Description for Article 2',
      content:
      """ Wool has a number of physical properties that determine (a) its commercial value as a textile
fibre, (b) the ease with which it can be processed into yarn, and (c) the products into which it
can be converted. These properties will vary for wools obtained from different
• Parts of the body of a sheep
• Individual sheep in the same flock
• Strains of sheep within a breed
• Ages of sheep within a breed
• Breeds
• Environments (i.e. climate, terrain, pasture etc.)
• Farming properties
• Shearing regimes (timing, frequency, preparation procedures)
• Geographic regions
• Seasons of the year
This list emphasises the fact that wool is a highly variable, natural, textile fibre. The following
sections outline the properties of wool that are significant for its use as a major textile fibre. """,
    ),
    Article(
      title: 'Learn about wool',
      description: 'Description for Article 3',
      content: """ This unit helps students explore the properties of
Australia’s most iconic natural fibre — wool.
Some students may have experience with wool through
clothing or home furnishing, such as blankets. However
many Foundation year students may not be aware of the
source of wool textiles (sheep), the range of uses and the
unique properties of wool, which make it an ideal textile
for a wide range of uses.
This unit of work aims to determine students’ prior
knowledge of the properties of wool, increase their
appreciation for these properties and raise their
awareness of how the properties of materials influence
their end use.
In this unit of work, students will have the opportunity to
develop skills in sorting and grouping materials on the
basis of observable properties, such as texture and feel,
flammability and water absorption.
Students also will investigate the different forms of
clothing used for different activities and explore how
the unique properties of wool make it suitable for a wide
range of clothing products.
This unit of work also starts the process of students
recognising that observation is an important part
of exploring and investigating the things, while
allowing them to share observations with others and
communicating their experiences.
A class science journal is used to record the students’
learning journey and provides for meaningful
literacy modelling. It is used to review and organise
observations and ideas, and can include images and
student contributions.
Hands-on experiences and sharing observations with
others are key ways to create meaningful, shared
understandings, while individually students draw their
observations and identify wants and needs in a roleplay game.
Cross-curriculum priority:
Sustainability
Early lessons about the interdependence of animals,
plants and people.
Links with the Australian Curriculum
This Properties of wool unit links to all three strands
of the Australian Curriculum: Science — Science
understanding, Science as a human endeavour and
Science inquiry skills.
The table below outlines the sub-strands covered in this
un""",
    ),
  ];

  final List<String> videoUrls = [
    'https://www.youtube.com/watch?v=g3KNu7AkaIo', // Replace with your video URLs
    'https://www.youtube.com/watch?v=9dl6bYR8IuE',
    'https://www.youtube.com/watch?v=B9Jex1a5Cks',
    // Add more video URLs here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Wool Education'),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Articles',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
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
            const SizedBox(
                height: 20), // Add spacing between article and video sections
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Videos',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 400,
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0), // Add vertical padding
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.center, // Align videos to the left
                      children: videoUrls.map((videoUrl) {
                        return Padding(
                          padding: const EdgeInsets.all(
                              8.0), // Add padding around each video
                          child: VideoPlayerWidget(videoUrl: videoUrl),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            // Center(
            //   child: ElevatedButton(
            //     onPressed: () {
            //       _navigateToSecondScreen(context);
            //     },
            //     child: const Text('Go to Second Screen'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // void _navigateToSecondScreen(BuildContext context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) =>
  //           const QualityAssuranceScreen(), // Replace with the name of your second screen
  //     ),
  //   );
  // }

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: Text(
                    article.content,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pop(); // Return to the previous screen
                  },
                  child: const Text('Go Back'),
                ),
              ],
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

class VideoPlayerWidget extends StatelessWidget {
  final String videoUrl;

  VideoPlayerWidget({required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    if (videoUrl.contains('youtube.com') || videoUrl.contains('youtube')) {
      // For YouTube videos
      final videoId = YoutubePlayer.convertUrlToId(videoUrl);
      return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: YoutubePlayerController(
            initialVideoId: videoId!,
            flags: const YoutubePlayerFlags(autoPlay: false),
          ),
        ),
        builder: (context, player) {
          return Card(
            child: Container(
              width: 300, // Set the desired width for each video item
              child: player,
            ),
          );
        },
      );
    } else {
      // For other online videos (e.g., using video_player package)
      final controller = VideoPlayerController.network(videoUrl);
      return FutureBuilder(
        future: controller.initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Scaffold(
                      appBar: AppBar(
                        title: const Text('Video Player'),
                        backgroundColor: Colors.purple,
                      ),
                      body: Center(
                        child: AspectRatio(
                          aspectRatio: controller.value.aspectRatio,
                          child: VideoPlayer(controller),
                        ),
                      ),
                    ),
                  ),
                );
                controller.play();
              },
              child: Card(
                child: Container(
                  width: 300, // Set the desired width for each video item
                  child: const Center(
                    child: Text(
                      'Other Video Thumbnail',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      );
    }
  }
}

// ... (rest of your code)
