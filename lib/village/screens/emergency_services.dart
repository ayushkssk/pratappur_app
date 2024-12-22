import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/common_appbar.dart';

class EmergencyServices extends StatelessWidget {
  const EmergencyServices({super.key});

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $launchUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, 'Emergency Services'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _EmergencyHeader(),
            const SizedBox(height: 24),
            _buildEmergencySection(
              'Medical Emergency',
              [
                EmergencyContact('Ambulance', '102', Icons.emergency),
                EmergencyContact('Primary Health Center', 'XXX-XXXX-XXX', Icons.local_hospital),
                EmergencyContact('Village Health Worker', 'XXX-XXXX-XXX', Icons.health_and_safety),
              ],
              Colors.red,
            ),
            _buildEmergencySection(
              'Law & Order',
              [
                EmergencyContact('Police', '100', Icons.local_police),
                EmergencyContact('Women Helpline', '1091', Icons.woman),
                EmergencyContact('Child Helpline', '1098', Icons.child_care),
              ],
              Colors.blue,
            ),
            _buildEmergencySection(
              'Disaster Management',
              [
                EmergencyContact('Fire Brigade', '101', Icons.fire_truck),
                EmergencyContact('Disaster Management', '108', Icons.warning),
                EmergencyContact('Flood Control', 'XXX-XXXX-XXX', Icons.water),
              ],
              Colors.orange,
            ),
            _buildEmergencySection(
              'Other Services',
              [
                EmergencyContact('Electricity Emergency', 'XXX-XXXX-XXX', Icons.electric_bolt),
                EmergencyContact('Animal Care', 'XXX-XXXX-XXX', Icons.pets),
                EmergencyContact('Village Head', 'XXX-XXXX-XXX', Icons.person),
              ],
              Colors.green,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _makePhoneCall('112'),
        backgroundColor: Colors.red,
        child: const Icon(Icons.emergency),
      ),
    );
  }

  Widget _buildEmergencySection(
    String title,
    List<EmergencyContact> contacts,
    Color color,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 12),
        ...contacts.map((contact) => _buildEmergencyCard(contact, color)).toList(),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildEmergencyCard(EmergencyContact contact, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(contact.icon, color: color),
        title: Text(contact.name),
        subtitle: Text(contact.number),
        trailing: IconButton(
          icon: const Icon(Icons.phone),
          color: color,
          onPressed: () => _makePhoneCall(contact.number),
        ),
      ),
    );
  }
}

class _EmergencyHeader extends StatelessWidget {
  const _EmergencyHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Row(
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: Colors.red.shade700,
            size: 32,
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Emergency Numbers',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Tap on the phone icon to directly call emergency services',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EmergencyContact {
  final String name;
  final String number;
  final IconData icon;

  EmergencyContact(this.name, this.number, this.icon);
}
