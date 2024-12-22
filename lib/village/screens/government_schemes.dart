import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/common_appbar.dart';

class GovernmentSchemes extends StatelessWidget {
  const GovernmentSchemes({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, 'Government Schemes'),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSchemeCategory(
            'Agriculture Schemes',
            [
              SchemeInfo(
                'PM Kisan Samman Nidhi',
                'Direct income support of ₹6000 per year to farmer families',
                'https://pmkisan.gov.in/',
                Icons.agriculture,
              ),
              SchemeInfo(
                'Kisan Credit Card',
                'Credit facility for farmers with flexible repayment options',
                'https://www.india.gov.in/spotlight/kisan-credit-card-kcc',
                Icons.credit_card,
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildSchemeCategory(
            'Housing Schemes',
            [
              SchemeInfo(
                'Pradhan Mantri Awaas Yojana - Gramin',
                'Housing for rural poor with financial assistance up to ₹1.20 lakh',
                'https://pmayg.nic.in/',
                Icons.home,
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildSchemeCategory(
            'Social Security Schemes',
            [
              SchemeInfo(
                'PM Jan Dhan Yojana',
                'Banking services for every household',
                'https://www.pmjdy.gov.in/',
                Icons.account_balance,
              ),
              SchemeInfo(
                'Ayushman Bharat',
                'Health insurance coverage up to ₹5 lakh per family per year',
                'https://pmjay.gov.in/',
                Icons.health_and_safety,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Open form to apply for schemes
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Coming soon: Online application form'),
            ),
          );
        },
        backgroundColor: Colors.green,
        icon: const Icon(Icons.edit_document),
        label: const Text('Apply Now'),
      ),
    );
  }

  Widget _buildSchemeCategory(String title, List<SchemeInfo> schemes) {
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
        const SizedBox(height: 10),
        ...schemes.map((scheme) => _buildSchemeCard(scheme)).toList(),
      ],
    );
  }

  Widget _buildSchemeCard(SchemeInfo scheme) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ExpansionTile(
        leading: Icon(scheme.icon, color: Colors.green),
        title: Text(
          scheme.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  scheme.description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _launchURL(scheme.websiteUrl),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    'Learn More & Apply',
                    style: TextStyle(color: Colors.white),
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

class SchemeInfo {
  final String name;
  final String description;
  final String websiteUrl;
  final IconData icon;

  SchemeInfo(this.name, this.description, this.websiteUrl, this.icon);
}
