import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final Color maroonColor = Color(0xFF800000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'WedPlan',
          style: TextStyle(
            color: maroonColor,
            fontFamily: 'Cursive',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Categories Section
            Container(
              height: 80,
              margin: EdgeInsets.only(top: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildCategoryIcon(Icons.event, 'Decoration'),
                  _buildCategoryIcon(Icons.photo_camera, 'Photography'),
                  _buildCategoryIcon(Icons.location_city, 'Venues'),
                  _buildCategoryIcon(Icons.brush, 'Makeup'),
                ],
              ),
            ),

            // Featured Venue Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    Image.network(
                      'https://via.placeholder.com/400x200',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 16,
                      left: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Crystal Palace Events',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow, size: 16),
                              SizedBox(width: 4),
                              Text(
                                '4.9 Premium Venue',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // List of Services
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildServiceCard(
                    'Emma\'s Photography',
                    '4.7 (128 reviews)',
                    'From \$1,200',
                    'https://via.placeholder.com/150',
                  ),
                  _buildServiceCard(
                    'Glam by Sarah',
                    '4.9 (95 reviews)',
                    'From \$300',
                    'https://via.placeholder.com/150',
                  ),
                  _buildServiceCard(
                    'Elegant Bridal',
                    '4.8 (156 reviews)',
                    'From \$2,000',
                    'https://via.placeholder.com/150',
                  ),
                  _buildServiceCard(
                    'Sweet Delights',
                    '4.6 (82 reviews)',
                    'From \$450',
                    'https://via.placeholder.com/150',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: maroonColor,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Widget _buildCategoryIcon(IconData icon, String label) {
  //   return Padding(
  //     padding: const EdgeInsets.only(right: 12.0),
  //     child: Column(
  //       children: [
  //         CircleAvatar(
  //           radius: 30,
  //           backgroundColor: Colors.grey[200],
  //           child: Icon(icon, size: 28, color: Colors.black),
  //         ),
  //         SizedBox(height: 8),
  //         Text(
  //           label,
  //           style: TextStyle(fontSize: 12),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildServiceCard(
      String title, String rating, String price, String imageUrl) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Image.network(
              imageUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    rating,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    price,
                    style: TextStyle(
                      color: maroonColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
