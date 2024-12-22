import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/common_appbar.dart';

class ImportantContacts extends StatelessWidget {
  const ImportantContacts({super.key});

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  Future<void> _openMap(String address) async {
    final Uri launchUri = Uri.parse('https://www.google.com/maps/place/Post+Office+Pratappur/@25.4795062,84.7226335,437m/data=!3m1!1e3!4m6!3m5!1s0x398d597b7e6aec21:0x188176fdd7894b61!8m2!3d25.4795062!4d84.723533!16s%2Fg%2F11bwp5skm0?entry=ttu&g_ep=EgoyMDI0MTIxMS4wIKXMDSoASAFQAw%3D%3D');
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, 'Important Contacts'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'महत्वपूर्ण संपर्क / Important Contacts',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 24),

              // Post Office Section
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                      child: Image.asset(
                        'assets/images/post_office.png',
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'डाकघर / Post Office',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          _buildContactItem(
                            'पता / Address',
                            'FPHF+RC3, Pratappur, Jalpura Tapa, Bihar 802352',
                            Icons.location_on,
                            onTap: () => _openMap('Post Office Pratappur'),
                          ),
                          _buildContactItem(
                            'फ़ोन / Phone',
                            '+91 XXXXX XXXXX',
                            Icons.phone,
                            onTap: () => _makePhoneCall('+91XXXXXXXXXX'),
                          ),
                          _buildContactItem(
                            'समय / Timing',
                            'सोमवार - शनिवार: सुबह 9:00 - शाम 5:00',
                            Icons.access_time,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Emergency Contacts
              const Text(
                'आपातकालीन संपर्क / Emergency Contacts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildEmergencyContact(
                        'पुलिस / Police',
                        '100',
                        Icons.local_police,
                      ),
                      _buildEmergencyContact(
                        'एम्बुलेंस / Ambulance',
                        '108',
                        Icons.medical_services,
                      ),
                      _buildEmergencyContact(
                        'फायर स्टेशन / Fire Station',
                        '101',
                        Icons.fire_truck,
                      ),
                      _buildEmergencyContact(
                        'महिला हेल्पलाइन / Women Helpline',
                        '1091',
                        Icons.woman,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactItem(String title, String content, IconData icon, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, color: Colors.green),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    content,
                    style: TextStyle(
                      fontSize: 16,
                      color: onTap != null ? Colors.blue : Colors.black,
                      decoration: onTap != null ? TextDecoration.underline : null,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyContact(String title, String number, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.red),
      title: Text(title),
      subtitle: Text(number),
      trailing: IconButton(
        icon: const Icon(Icons.phone, color: Colors.green),
        onPressed: () => _makePhoneCall(number),
      ),
    );
  }
}
