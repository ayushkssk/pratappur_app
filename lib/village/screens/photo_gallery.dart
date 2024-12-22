import 'package:flutter/material.dart';
import '../utils/common_appbar.dart';

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Photo Gallery'),
          backgroundColor: Colors.green,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Schools'),
              Tab(text: 'Temples'),
              Tab(text: 'Streets'),
              Tab(text: 'Functions'),
              Tab(text: 'Festivals'),
              Tab(text: 'Others'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildPhotoGrid(context, 'schools', [
              'primary_school.jpg',
              'middle_school.jpg',
              'high_school.jpg',
              'school_function.jpg',
              'school_sports.jpg',
              'school_cultural.jpg',
            ]),
            _buildPhotoGrid(context, 'temples', [
              'shiv_mandir.jpg',
              'hanuman_mandir.jpg',
              'durga_mandir.jpg',
              'temple_aarti.jpg',
              'temple_festival.jpg',
              'temple_decoration.jpg',
            ]),
            _buildPhotoGrid(context, 'streets', [
              'main_road.jpg',
              'market_street.jpg',
              'village_path.jpg',
              'street_lights.jpg',
              'road_construction.jpg',
              'street_cleaning.jpg',
            ]),
            _buildPhotoGrid(context, 'functions', [
              'gram_sabha.jpg',
              'village_meeting.jpg',
              'cultural_program.jpg',
              'sports_event.jpg',
              'award_ceremony.jpg',
              'community_lunch.jpg',
            ]),
            _buildPhotoGrid(context, 'festivals', [
              'diwali.jpg',
              'holi.jpg',
              'chhath.jpg',
              'durga_puja.jpg',
              'navratri.jpg',
              'ramnavami.jpg',
            ]),
            _buildPhotoGrid(context, 'others', [
              'village_aerial.jpg',
              'farming.jpg',
              'village_pond.jpg',
              'sunset.jpg',
              'village_life.jpg',
              'nature.jpg',
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoGrid(BuildContext context, String category, List<String> photos) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _showPhotoDetail(context, photos[index], category),
          child: Hero(
            tag: photos[index],
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/$category/${photos[index]}',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Icon(Icons.image, size: 40, color: Colors.grey),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showPhotoDetail(BuildContext context, String photo, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhotoDetailScreen(photo: photo, category: category),
      ),
    );
  }
}

class PhotoDetailScreen extends StatelessWidget {
  final String photo;
  final String category;

  const PhotoDetailScreen({
    super.key,
    required this.photo,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.white),
            onPressed: () {
              // Implement share functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.download, color: Colors.white),
            onPressed: () {
              // Implement download functionality
            },
          ),
        ],
      ),
      body: Center(
        child: Hero(
          tag: photo,
          child: InteractiveViewer(
            minScale: 0.5,
            maxScale: 4.0,
            child: Image.asset(
              'assets/images/$category/$photo',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(
                    Icons.image_not_supported,
                    size: 64,
                    color: Colors.white54,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
