import 'package:flutter/material.dart';
import '../utils/common_appbar.dart';
import '../widgets/detailed_info_section.dart';

class AboutVillage extends StatelessWidget {
  const AboutVillage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar(context, 'About Village'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Basic Information',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade700,
                ),
              ),
              const SizedBox(height: 16),
              DetailedInfoSection(
                items: [
                  DetailedInfoItem(
                    title: 'Population',
                    value: '5,000',
                    icon: Icons.people,
                  ),
                  DetailedInfoItem(
                    title: 'Area',
                    value: '2.5 sq km',
                    icon: Icons.area_chart,
                  ),
                  DetailedInfoItem(
                    title: 'District',
                    value: 'Pratapgarh',
                    icon: Icons.location_city,
                  ),
                  DetailedInfoItem(
                    title: 'Block',
                    value: 'Pratappur',
                    icon: Icons.business,
                  ),
                  DetailedInfoItem(
                    title: 'State',
                    value: 'Uttar Pradesh',
                    icon: Icons.map,
                  ),
                  DetailedInfoItem(
                    title: 'PIN Code',
                    value: '230001',
                    icon: Icons.pin_drop,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
