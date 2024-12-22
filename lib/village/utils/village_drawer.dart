import 'package:flutter/material.dart';
import '../screens/about_village.dart';
import '../screens/important_contacts.dart';
import '../screens/news_notices.dart';
import '../screens/photo_gallery.dart';
import '../screens/government_schemes.dart';
import '../screens/grievance_portal.dart';
import '../screens/emergency_services.dart';

class VillageDrawer extends StatelessWidget {
  const VillageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/pappbar.png',
                  height: 80,
                  color: Colors.white,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Pratappur Village',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('About Village'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutVillage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_phone),
            title: const Text('Important Contacts'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ImportantContacts()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.newspaper),
            title: const Text('News & Notices'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NewsNotices()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Photo Gallery'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PhotoGallery()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.policy),
            title: const Text('Government Schemes'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GovernmentSchemes()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.report_problem),
            title: const Text('Grievance Portal'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GrievancePortal()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.emergency, color: Colors.red),
            title: const Text('Emergency Services'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EmergencyServices()),
              );
            },
          ),
        ],
      ),
    );
  }
}
