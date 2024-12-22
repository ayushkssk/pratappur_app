import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/language_provider.dart';
import '../utils/village_appbar.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final isHindi = languageProvider.isHindi;

    final List<Map<String, dynamic>> categories = [
      {
        'title': isHindi ? 'शिक्षा' : 'Education',
        'images': List<String>.generate(
          15, 
          (index) => 'assets/images/middle_school/middleschool$index.png'
        ),
      },
      {
        'title': isHindi ? 'मंदिर' : 'Temples',
        'images': List<String>.generate(
          5, 
          (index) => 'assets/images/temple/temple$index.png'
        ),
      },
      {
        'title': isHindi ? 'गाँव की गलियाँ' : 'Village Streets',
        'images': List<String>.generate(
          5, 
          (index) => 'assets/images/streets/street$index.png'
        ),
      },
      {
        'title': isHindi ? 'त्योहार' : 'Festivals',
        'images': List<String>.generate(
          5, 
          (index) => 'assets/images/festivals/festival$index.png'
        ),
      },
    ];

    return Scaffold(
      appBar: villageAppBar(context),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  category['title'] as String,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (category['images'] as List<String>).length,
                  itemBuilder: (context, imageIndex) {
                    final images = category['images'] as List<String>;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          images[imageIndex],
                          width: 300,
                          height: 200,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 300,
                              height: 200,
                              color: Colors.grey[300],
                              child: const Center(
                                child: Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                  size: 48,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
