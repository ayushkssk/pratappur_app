import 'package:flutter/material.dart';

class DetailedInfoSection extends StatelessWidget {
  final List<DetailedInfoItem> items;

  const DetailedInfoSection({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                leading: Icon(item.icon ?? Icons.info, color: Colors.green),
                title: Text(
                  item.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(item.value),
                onTap: () {
                  // Copy to clipboard functionality can be added here
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class DetailedInfoItem {
  final String title;
  final String value;
  final IconData? icon;

  DetailedInfoItem({
    required this.title,
    required this.value,
    this.icon,
  });
}
