import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../utils/common_appbar.dart';
import './about_village.dart';
import './photo_gallery.dart';
import './news_notices.dart';
import './important_contacts.dart';
import './grievance_portal.dart';
import './government_schemes.dart';
import './talent_corner.dart';
import './emergency_services.dart';

class VillageDashboard extends StatefulWidget {
  const VillageDashboard({super.key});

  @override
  State<VillageDashboard> createState() => _VillageDashboardState();
}

class _VillageDashboardState extends State<VillageDashboard> {
  final List<String> imageList = [
    'assets/images/village1.png',
    'assets/images/village2.png',
    'assets/images/village3.png',
  ];
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, 'Pratappur', showBackButton: false),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green.shade700,
                image: const DecorationImage(
                  image: AssetImage('assets/images/village_header.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/village_logo.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Pratappur',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(
              icon: Icons.info,
              title: 'About Village',
              onTap: () => _navigateTo(const AboutVillage()),
            ),
            _buildDrawerItem(
              icon: Icons.photo_library,
              title: 'Photo Gallery',
              onTap: () => _navigateTo(const PhotoGallery()),
            ),
            _buildDrawerItem(
              icon: Icons.newspaper,
              title: 'News & Notices',
              onTap: () => _navigateTo(const NewsNotices()),
            ),
            _buildDrawerItem(
              icon: Icons.contact_phone,
              title: 'Important Contacts',
              onTap: () => _navigateTo(const ImportantContacts()),
            ),
            _buildDrawerItem(
              icon: Icons.report_problem,
              title: 'Grievance Portal',
              onTap: () => _navigateTo(const GrievancePortal()),
            ),
            _buildDrawerItem(
              icon: Icons.policy,
              title: 'Government Schemes',
              onTap: () => _navigateTo(const GovernmentSchemes()),
            ),
            _buildDrawerItem(
              icon: Icons.star,
              title: 'Talent Corner',
              onTap: () => _navigateTo(const TalentCorner()),
            ),
            _buildDrawerItem(
              icon: Icons.emergency,
              title: 'Emergency Services',
              onTap: () => _navigateTo(const EmergencyServices()),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Slider
            CarouselSlider(
              options: CarouselOptions(
                height: 220.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16/9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                viewportFraction: 0.92,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentImageIndex = index;
                  });
                },
              ),
              items: imageList.map((item) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Stack(
                    children: [
                      Image.asset(
                        item,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.4),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )).toList(),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageList.asMap().entries.map((entry) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green.withOpacity(
                      _currentImageIndex == entry.key ? 0.9 : 0.3,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            // Welcome Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Welcome to Pratappur Village',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Discover our beautiful village and its services',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey.shade600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            // Grid Menu
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: [
                  _buildDashboardItem(
                    context,
                    'About Village',
                    Icons.info,
                    const AboutVillage(),
                  ),
                  _buildDashboardItem(
                    context,
                    'Photo Gallery',
                    Icons.photo_library,
                    const PhotoGallery(),
                  ),
                  _buildDashboardItem(
                    context,
                    'News & Notices',
                    Icons.newspaper,
                    const NewsNotices(),
                  ),
                  _buildDashboardItem(
                    context,
                    'Important Contacts',
                    Icons.contact_phone,
                    const ImportantContacts(),
                  ),
                  _buildDashboardItem(
                    context,
                    'Grievance Portal',
                    Icons.report_problem,
                    const GrievancePortal(),
                  ),
                  _buildDashboardItem(
                    context,
                    'Government Schemes',
                    Icons.policy,
                    const GovernmentSchemes(),
                  ),
                  _buildDashboardItem(
                    context,
                    'Talent Corner',
                    Icons.star,
                    const TalentCorner(),
                  ),
                  _buildDashboardItem(
                    context,
                    'Emergency Services',
                    Icons.emergency,
                    const EmergencyServices(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(title),
      onTap: onTap,
    );
  }

  void _navigateTo(Widget screen) {
    Navigator.pop(context); // Close drawer
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  Widget _buildDashboardItem(
    BuildContext context,
    String title,
    IconData icon,
    Widget destination,
  ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => destination,
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.green.shade50,
                  Colors.white,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 48.0,
                  color: Colors.green.shade700,
                ),
                const SizedBox(height: 12.0),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900,
                    letterSpacing: 0.5,
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
