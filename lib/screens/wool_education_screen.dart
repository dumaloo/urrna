import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:video_player/video_player.dart';

class WoolEducationScreen extends StatelessWidget {
  WoolEducationScreen({Key? key}) : super(key: key);

  final List<Article> articles = [
    Article(
      title: 'Governmental schemes for wool development',
      description: 'Click For Description',
      content:
          """The Scheme for Pashmina Wool Development is designed to make a meaningful
intervention given the potential of this area to produce Pashmina of fine quality. During the
12th plan a special package with total financial provision of Rs.41.21 Crore has accordingly
been introduced with the following objectives:
 To provide the necessary inputs for breed improvement, training, health care and
nutritional supplement for qualitative and quantitative improvement in Pashmina
wool production;
 To provide health care & nutritional supplement for the Pashmina goat.
 To increase Pashmina goat population by distribution of male and female goats as
foundation stock in non-traditional areas.
 Establishment of Multi-purpose Extension Centers for nomads on migratory
routes
 Establishment of Pasture Farms for grazing of Pashmina goats during severe cold
period especially on migratory routes.
 Undertake Research & Development work for development of Pashmina wool.
To increase the income from Pashmina wool of the goat breeders and sustain their
interest in this activity as a reliable means of livelihood.
To strengthen existing breeding farms and develop fodder farm/banks.
To strengthen existing Pashmina Dehairing Plant at Leh.
To increase Pashmina population growth rate from present 2% per annum (in last
10 years) to 5% per annum with Pashmina population of 3 Lakhs at the end of 12th
Plan.
To increase Pashmina fiber growth rate which is nearly 2% annually to 10% with
total Pashmina fiber production of 65.0 Ton at the end of 12th Plan. """,
    ),
    Article(
      title: 'Have a Birthing Kit Ready',
      description: 'Click For Description',
      content: """
When you are breeding sheep, prepare a birthing kit. An easy to carry plastic bin is a good container for the supplies you might need. Many books on sheep breeding and care will have an all-inclusive list of items to have on hand. Here is a good start.

Scissors for trimming the umbilical cord.

Flashlights

Obstetrical lubricant

Betadine – Used for cleaning Ewe if you must help with delivery.

Iodine – for dipping the end of the lamb’s umbilical cord

Old towels

Umbilical clamps or dental floss for tying off umbilical cords

Newborn nasal syringe

Rope to aid in pulling a lamb that is stuck

Molasses or Nutri-drench product to revive the exhausted ewe

Thermometer

In addition to the above, having a baby bottle and extra nipples is a great time saver, if the lamb can’t nurse or the ewe becomes ill. Pritchard style teats are commonly used, although we have used regular human baby nipples too.

Milk replacer and frozen colostrum, just in case.

Feeding tube and syringe""",
    ),
    Article(
      title: 'India Wool Sector',
      description: 'Click For Description',
      content:
          """Amid the rising demand of import of wool, shepherds in Uttarakhand will get a batch of lambs through crossbreeding of sheep indigenous to the region with Australian Merino sheep by the end of the year.

Australian Merino sheep are known to have the softest and finest wool used for apparels.
The main trigger for import was the deteriorating quality and quantity of carpet and apparel grades wool, largely due to inbreeding.
Key Points
About:
India is the seventh-largest producer of wool and accounts for nearly 2 to 3% of total world production.
India has the third largest sheep population in the world with over 64 million sheep. The annual wool production is in the range of 43-46 million kg.
Due to the insufficient domestic production, India depends on imports for raw wool, particularly on Australia and New Zealand.
This wool is then used to prepare products like carpets, yarn, fabrics and garments for the domestic market and for exporting, especially to the United States and Europe.
Rajasthan is the largest wool producer and is known for its superior carpet grade Chokla and Magra wool.
Carpet grade is rougher than apparel grade and accounts for 85% of India’s production.
Apparel grade wool accounts for less than 5% of production and coarse grade fit for making rough blankets accounts for the rest.
Significance:
The wool textile industry provides employment to 2.7 million workers - 1.2 million in the organised sector, 1.2 million in sheep rearing and farming, and 0.3 million weavers in the carpet sector.
Challenges:
Fall in use of Indigenous Wool:
In the 10 years till 2020, wool consumption by the country’s processing units increased by 50%, but the use of indigenous wool fell to almost 10% of the total current sales in Bikaner (Rajasthan).
""",
    ),
  ];

  final List<String> videoUrls = [
    'https://www.youtube.com/watch?v=53KoRxxr1jc', // Replace with your video URLs
    'https://www.youtube.com/watch?v=q2mH-PM5S4E',
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
                autoPlayInterval: const Duration(seconds: 4),
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
            SizedBox(
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
            backgroundColor: Colors.blue.shade800,
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

  const VideoPlayerWidget({super.key, required this.videoUrl});

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
            child: SizedBox(
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
              child: const Card(
                child: SizedBox(
                  width: 300, // Set the desired width for each video item
                  child: Center(
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
