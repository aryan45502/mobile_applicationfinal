import 'package:flutter/material.dart';

class CourtDetailPage extends StatelessWidget {
  final String courtName;
  final String courtImage;

  const CourtDetailPage({
    super.key,
    required this.courtName,
    required this.courtImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(courtName),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Image.asset(courtImage, width: double.infinity, height: 250, fit: BoxFit.cover),
          const SizedBox(height: 16),
          Text(
            courtName,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Booking functionality coming soon!')),
              );
            },
            child: const Text('Book Now'),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}