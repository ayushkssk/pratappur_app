import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/common_appbar.dart';

class TalentCorner extends StatelessWidget {
  const TalentCorner({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, 'Talent Corner'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'प्रतिभा कॉर्नर / Talent Corner',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'हमारे गाँव के प्रतिभाशाली कलाकार / Our Village\'s Talented Artists',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),

              // YouTubers Section
              _buildCreatorSection(
                'यूट्यूब चैनल्स / YouTube Channels',
                [
                  CreatorProfile(
                    name: 'राहुल कुमार / Rahul Kumar',
                    handle: '@rahulkumar',
                    description: 'गाँव की संस्कृति और परंपराओं पर वीडियो बनाते हैं। मेरे चैनल पर विभिन्न त्योहारों और रीति-रिवाजों की जानकारी मिलेगी।',
                    subscribers: '10K',
                    platform: SocialPlatform.youtube,
                    url: 'https://youtube.com/@rahulkumar',
                  ),
                  CreatorProfile(
                    name: 'अमित यादव / Amit Yadav',
                    handle: '@amityadavvlogs',
                    description: 'किसानी और खेती-बाड़ी से जुड़े वीडियो। नई तकनीकों और फसलों की जानकारी।',
                    subscribers: '5K',
                    platform: SocialPlatform.youtube,
                    url: 'https://youtube.com/@amityadavvlogs',
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Instagram Section
              _buildCreatorSection(
                'इंस्टाग्राम क्रिएटर्स / Instagram Creators',
                [
                  CreatorProfile(
                    name: 'प्रिया सिंह / Priya Singh',
                    handle: '@priyasingh.official',
                    description: 'लोक नृत्य और गीत। बिहार की कला और संस्कृति को बढ़ावा देने का प्रयास।',
                    subscribers: '15K',
                    platform: SocialPlatform.instagram,
                    url: 'https://instagram.com/priyasingh.official',
                  ),
                  CreatorProfile(
                    name: 'रोहित कुमार / Rohit Kumar',
                    handle: '@rohit.photography',
                    description: 'गाँव के दृश्यों की फोटोग्राफी। प्रकृति और ग्रामीण जीवन की झलक।',
                    subscribers: '8K',
                    platform: SocialPlatform.instagram,
                    url: 'https://instagram.com/rohit.photography',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement creator profile submission
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Coming Soon: Submit your creator profile'),
            ),
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildCreatorSection(String title, List<CreatorProfile> creators) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 16),
        ...creators.map((creator) => _buildCreatorCard(creator)).toList(),
      ],
    );
  }

  Widget _buildCreatorCard(CreatorProfile creator) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: creator.platform == SocialPlatform.youtube 
                      ? Colors.red.shade50 
                      : Colors.pink.shade50,
                  child: Icon(
                    creator.platform == SocialPlatform.youtube
                        ? Icons.play_circle_filled
                        : Icons.camera_alt,
                    size: 30,
                    color: creator.platform == SocialPlatform.youtube 
                        ? Colors.red 
                        : Colors.pink,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        creator.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            creator.platform == SocialPlatform.youtube
                                ? Icons.play_circle_filled
                                : Icons.camera_alt,
                            size: 16,
                            color: creator.platform == SocialPlatform.youtube 
                                ? Colors.red 
                                : Colors.pink,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            creator.handle,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${creator.subscribers} Followers',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    TextButton(
                      onPressed: () => _launchUrl(creator.url),
                      child: Text(
                        creator.platform == SocialPlatform.youtube
                            ? 'Subscribe'
                            : 'Follow',
                        style: const TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              creator.description,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

enum SocialPlatform {
  youtube,
  instagram,
}

class CreatorProfile {
  final String name;
  final String handle;
  final String description;
  final String subscribers;
  final SocialPlatform platform;
  final String url;

  CreatorProfile({
    required this.name,
    required this.handle,
    required this.description,
    required this.subscribers,
    required this.platform,
    required this.url,
  });
}
