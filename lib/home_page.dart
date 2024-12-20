// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   final Color maroonColor = Color(0xFF800000);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text(
//           'WedPlan',
//           style: TextStyle(
//             color: maroonColor,
//             fontFamily: 'Cursive',
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView( // Wrap the content to make it scrollable
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Welcome to WedPlan',
//                 style: TextStyle(
//                   color: maroonColor,
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'Plan your perfect wedding with ease. Explore the best venues, photographers, and services tailored for your dream day.',
//                 style: TextStyle(
//                   color: Colors.grey[700],
//                   fontSize: 16,
//                 ),
//               ),
//               SizedBox(height: 32),
//               _buildField('Venue'),
//               SizedBox(height: 16),
//               _buildField('Photographer'),
//               SizedBox(height: 16),
//               _buildField('Makeup Artist'),
//               SizedBox(height: 16),
//               _buildField('Caterer'),
//               SizedBox(height: 16),
//               _buildField('Other Services'),
//               SizedBox(height: 32),
//               Center(
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: maroonColor,
//                     padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   onPressed: () {},
//                   child: Text(
//                     'Get Started',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: maroonColor,
//         unselectedItemColor: Colors.grey,
//         currentIndex: 0,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.bookmark),
//             label: 'Bookings',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Saved',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.message),
//             label: 'Messages',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildField(String label) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey[300]!),
//         borderRadius: BorderRadius.circular(8),
//         color: Colors.grey[100],
//       ),
//       child: Text(
//         label,
//         style: TextStyle(
//           color: Colors.grey[700],
//           fontSize: 16,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _currentIndex = 0;

//   final List<Widget> _pages = [
//     const Center(child: Text('Welcome to Home Page')),
//     const Center(child: Text('Your Bookings')),
//     const Center(child: Text('Saved Items')),
//     const Center(child: Text('Messages')),
//     const Center(child: Text('Your Profile')),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('WedPlan'),
//         centerTitle: true,
//       ),
//       body: _pages[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         selectedItemColor: Theme.of(context).primaryColor,
//         unselectedItemColor: Colors.grey,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.bookmark), label: 'Bookings'),
//           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Saved'),
//           BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const WedPlanApp());
// }

// class WedPlanApp extends StatelessWidget {
//   const WedPlanApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: const Color(0xFF800000), // Maroon
//         scaffoldBackgroundColor: Colors.white,
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Color(0xFF800000),
//           foregroundColor: Colors.white,
//           elevation: 0,
//         ),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: const Color(0xFF800000),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             textStyle: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//       home: const HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   void navigateToPage(BuildContext context, String title) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => GenericPage(title: title),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'WedPlan',
//           style: TextStyle(fontFamily: 'Cursive', fontSize: 24),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.search),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: const Icon(Icons.notifications),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 8),
//               // Categories
//               SizedBox(
//                 height: 80,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     GestureDetector(
//                       onTap: () =>
//                           navigateToPage(context, 'Welcome to Decoration'),
//                       child: const CategoryItem(
//                           icon: Icons.event, label: 'Decoration'),
//                     ),
//                     GestureDetector(
//                       onTap: () =>
//                           navigateToPage(context, 'Welcome to Photography'),
//                       child: const CategoryItem(
//                           icon: Icons.photo_camera, label: 'Photography'),
//                     ),
//                     GestureDetector(
//                       onTap: () => navigateToPage(context, 'Welcome to Venues'),
//                       child: const CategoryItem(
//                           icon: Icons.location_city, label: 'Venues'),
//                     ),
//                     GestureDetector(
//                       onTap: () => navigateToPage(context, 'Welcome to Makeup'),
//                       child: const CategoryItem(
//                           icon: Icons.brush, label: 'Makeup'),
//                     ),
//                     GestureDetector(
//                       onTap: () =>
//                           navigateToPage(context, 'Welcome to Catering'),
//                       child: const CategoryItem(
//                           icon: Icons.food_bank, label: 'Catering'),
//                     ),
//                     GestureDetector(
//                       onTap: () => navigateToPage(context, 'Welcome to Music'),
//                       child: const CategoryItem(
//                           icon: Icons.music_note, label: 'Music'),
//                     ),
//                     GestureDetector(
//                       onTap: () => navigateToPage(context, 'Welcome to Gifts'),
//                       child: const CategoryItem(
//                           icon: Icons.card_giftcard, label: 'Gifts'),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 8),
//               // Featured Card
//               const FeaturedCard(),
//               const SizedBox(height: 8),
//               // Grid Items
//               const Text(
//                 'Popular Services',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               GridView(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 3 / 4,
//                   mainAxisSpacing: 8,
//                   crossAxisSpacing: 8,
//                 ),
//                 children: const [
//                   ServiceCard(
//                     image: 'assets/images/photo.jpg',
//                     title: "Emma's Photography",
//                     rating: 4.7,
//                     reviews: 128,
//                     price: 'From \$1,200',
//                   ),
//                   ServiceCard(
//                     image: 'assets/images/makeup.jpg',
//                     title: 'Glam by Sarah',
//                     rating: 4.9,
//                     reviews: 95,
//                     price: 'From \$300',
//                   ),
//                   ServiceCard(
//                     image: 'assets/images/venue.jpg',
//                     title: 'Elegant Bridal',
//                     rating: 4.8,
//                     reviews: 156,
//                     price: 'From \$500',
//                   ),
//                   ServiceCard(
//                     image: 'assets/images/cake.jpg',
//                     title: 'Sweet Delights',
//                     rating: 4.6,
//                     reviews: 82,
//                     price: 'From \$300',
//                   ),
//                   ServiceCard(
//                     image: 'assets/images/catering.jpeg',
//                     title: 'Royal Catering',
//                     rating: 4.9,
//                     reviews: 102,
//                     price: 'From \$2,000',
//                   ),
//                   ServiceCard(
//                     image: 'assets/images/music.jpg',
//                     title: 'Melodic Moments',
//                     rating: 4.5,
//                     reviews: 78,
//                     price: 'From \$800',
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class GenericPage extends StatelessWidget {
//   final String title;

//   const GenericPage({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: Center(
//         child: Text(
//           title,
//           style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }

// // Category Item Widget
// class CategoryItem extends StatelessWidget {
//   final IconData icon;
//   final String label;

//   const CategoryItem({super.key, required this.icon, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CircleAvatar(
//             backgroundColor: const Color(0xFF800000),
//             radius: 24,
//             child: Icon(icon, color: Colors.white, size: 20),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             label,
//             style: const TextStyle(fontSize: 10),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Featured Card Widget
// class FeaturedCard extends StatelessWidget {
//   const FeaturedCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 150,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         image: const DecorationImage(
//           image: AssetImage(
//               'assets/images/venuefeatured.jpg'), // Replace with actual image
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           gradient: LinearGradient(
//             colors: [
//               Colors.black.withOpacity(0.5),
//               Colors.transparent,
//             ],
//             begin: Alignment.bottomCenter,
//             end: Alignment.topCenter,
//           ),
//         ),
//         child: const Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Crystal Palace Events',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 2),
//               Text(
//                 '⭐ 4.9 · Premium Venue',
//                 style: TextStyle(color: Colors.white, fontSize: 12),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Service Card Widget
// class ServiceCard extends StatelessWidget {
//   final String image;
//   final String title;
//   final double rating;
//   final int reviews;
//   final String price;

//   const ServiceCard({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.rating,
//     required this.reviews,
//     required this.price,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: ClipRRect(
//               borderRadius:
//                   const BorderRadius.vertical(top: Radius.circular(12)),
//               child: Image.asset(
//                 image, // Replace with actual image
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                       fontWeight: FontWeight.bold, fontSize: 12),
//                 ),
//                 const SizedBox(height: 2),
//                 Text(
//                   '⭐ $rating ($reviews reviews)',
//                   style: const TextStyle(fontSize: 10, color: Colors.grey),
//                 ),
//                 const SizedBox(height: 2),
//                 Text(
//                   price,
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Theme.of(context).primaryColor,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const WedPlanApp());
// }

// class WedPlanApp extends StatelessWidget {
//   const WedPlanApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: const Color(0xFF800000), // Maroon
//         scaffoldBackgroundColor: Colors.white,
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Color(0xFF800000),
//           foregroundColor: Colors.white,
//           elevation: 0,
//         ),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: const Color(0xFF800000),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             textStyle: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//       home: const HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   void navigateToPage(BuildContext context, String title) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => GenericPage(title: title),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'WedPlan',
//           style: TextStyle(fontFamily: 'Cursive', fontSize: 24),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.search),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: const Icon(Icons.notifications),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 8),
//               // Categories
//               SizedBox(
//                 height: 80,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     GestureDetector(
//                       onTap: () => navigateToPage(context, 'Decoration'),
//                       child: const CategoryItem(
//                           icon: Icons.event, label: 'Decoration'),
//                     ),
//                     GestureDetector(
//                       onTap: () => navigateToPage(context, 'Photography'),
//                       child: const CategoryItem(
//                           icon: Icons.photo_camera, label: 'Photography'),
//                     ),
//                     GestureDetector(
//                       onTap: () => navigateToPage(context, 'Venues'),
//                       child: const CategoryItem(
//                           icon: Icons.location_city, label: 'Venues'),
//                     ),
//                     GestureDetector(
//                       onTap: () => navigateToPage(context, 'Makeup'),
//                       child: const CategoryItem(
//                           icon: Icons.brush, label: 'Makeup'),
//                     ),
//                     GestureDetector(
//                       onTap: () => navigateToPage(context, 'Catering'),
//                       child: const CategoryItem(
//                           icon: Icons.food_bank, label: 'Catering'),
//                     ),
//                     GestureDetector(
//                       onTap: () => navigateToPage(context, 'Music'),
//                       child: const CategoryItem(
//                           icon: Icons.music_note, label: 'Music'),
//                     ),
//                     GestureDetector(
//                       onTap: () => navigateToPage(context, 'Gifts'),
//                       child: const CategoryItem(
//                           icon: Icons.card_giftcard, label: 'Gifts'),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 8),
//               // Featured Card
//               const FeaturedCard(),
//               const SizedBox(height: 8),
//               // Grid Items
//               const Text(
//                 'Popular Services',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               GridView(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 3 / 4,
//                   mainAxisSpacing: 8,
//                   crossAxisSpacing: 8,
//                 ),
//                 children: const [
//                   ServiceCard(
//                     image: 'assets/images/photo.jpg',
//                     title: "Emma's Photography",
//                     rating: 4.7,
//                     reviews: 128,
//                     price: 'From \$1,200',
//                   ),
//                   ServiceCard(
//                     image: 'assets/images/makeup.jpg',
//                     title: 'Glam by Sarah',
//                     rating: 4.9,
//                     reviews: 95,
//                     price: 'From \$300',
//                   ),
//                   ServiceCard(
//                     image: 'assets/images/venue.jpg',
//                     title: 'Elegant Bridal',
//                     rating: 4.8,
//                     reviews: 156,
//                     price: 'From \$500',
//                   ),
//                   ServiceCard(
//                     image: 'assets/images/cake.jpg',
//                     title: 'Sweet Delights',
//                     rating: 4.6,
//                     reviews: 82,
//                     price: 'From \$300',
//                   ),
//                   ServiceCard(
//                     image: 'assets/images/catering.jpeg',
//                     title: 'Royal Catering',
//                     rating: 4.9,
//                     reviews: 102,
//                     price: 'From \$2,000',
//                   ),
//                   ServiceCard(
//                     image: 'assets/images/music.jpg',
//                     title: 'Melodic Moments',
//                     rating: 4.5,
//                     reviews: 78,
//                     price: 'From \$800',
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class GenericPage extends StatefulWidget {
//   final String title;

//   const GenericPage({super.key, required this.title});

//   @override
//   _GenericPageState createState() => _GenericPageState();
// }

// class _GenericPageState extends State<GenericPage> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final pages = [
//       Center(
//         child: Text(
//           'This is ${widget.title} Page',
//           style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       ),
//       const Center(
//         child: Text(
//           'This is Settings Page',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       ),
//       const Center(
//         child: Text(
//           'This is Help Page',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       ),
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: const Color(0xFF800000),
//         unselectedItemColor: Colors.grey,
//         selectedFontSize: 12,
//         unselectedFontSize: 12,
//         type: BottomNavigationBarType.fixed,
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.info),
//             label: 'Info',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.help),
//             label: 'Help',
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Category Item Widget
// class CategoryItem extends StatelessWidget {
//   final IconData icon;
//   final String label;

//   const CategoryItem({super.key, required this.icon, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CircleAvatar(
//             backgroundColor: const Color(0xFF800000),
//             radius: 24,
//             child: Icon(icon, color: Colors.white, size: 20),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             label,
//             style: const TextStyle(fontSize: 10),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Featured Card Widget
// class FeaturedCard extends StatelessWidget {
//   const FeaturedCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 150,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         image: const DecorationImage(
//           image: AssetImage(
//               'assets/images/venuefeatured.jpg'), // Replace with actual image
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           gradient: LinearGradient(
//             colors: [
//               Colors.black.withOpacity(0.5),
//               Colors.transparent,
//             ],
//             begin: Alignment.bottomCenter,
//             end: Alignment.topCenter,
//           ),
//         ),
//         child: const Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Crystal Palace Events',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 2),
//               Text(
//                 '⭐ 4.9 · Premium Venue',
//                 style: TextStyle(color: Colors.white, fontSize: 12),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Service Card Widget
// class ServiceCard extends StatelessWidget {
//   final String image;
//   final String title;
//   final double rating;
//   final int reviews;
//   final String price;

//   const ServiceCard({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.rating,
//     required this.reviews,
//     required this.price,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: ClipRRect(
//               borderRadius:
//                   const BorderRadius.vertical(top: Radius.circular(12)),
//               child: Image.asset(
//                 image, // Replace with actual image
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                       fontWeight: FontWeight.bold, fontSize: 12),
//                 ),
//                 const SizedBox(height: 2),
//                 Text(
//                   '⭐ $rating ($reviews reviews)',
//                   style: const TextStyle(fontSize: 10, color: Colors.grey),
//                 ),
//                 const SizedBox(height: 2),
//                 Text(
//                   price,
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Theme.of(context).primaryColor,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(const WedPlanApp());
}

class WedPlanApp extends StatelessWidget {
  const WedPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF800000), // Maroon
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF800000),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF800000),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(),
    const Center(child: Text('Bookings Page', style: TextStyle(fontSize: 20))),
    const Center(child: Text('Saved Page', style: TextStyle(fontSize: 20))),
    const Center(child: Text('Messages Page', style: TextStyle(fontSize: 20))),
    const Center(child: Text('Profile Page', style: TextStyle(fontSize: 20))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WedPlan',
          style: TextStyle(fontFamily: 'Cursive', fontSize: 24),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF800000),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
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
      body: _pages[_currentIndex],
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // Categories
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryItem(icon: Icons.event, label: 'Decoration'),
                  CategoryItem(icon: Icons.photo_camera, label: 'Photography'),
                  CategoryItem(icon: Icons.location_city, label: 'Venues'),
                  CategoryItem(icon: Icons.brush, label: 'Makeup'),
                  CategoryItem(icon: Icons.food_bank, label: 'Catering'),
                  CategoryItem(icon: Icons.music_note, label: 'Music'),
                  CategoryItem(icon: Icons.card_giftcard, label: 'Gifts'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Featured Card
            const FeaturedCard(),
            const SizedBox(height: 16),
            // Grid Items
            const Text(
              'Popular Services',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 4,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              children: const [
                ServiceCard(
                  image: 'assets/images/photo.jpg',
                  title: "Emma's Photography",
                  rating: 4.7,
                  reviews: 128,
                  price: 'From \$1,200',
                ),
                ServiceCard(
                  image: 'assets/images/makeup.jpg',
                  title: 'Glam by Sarah',
                  rating: 4.9,
                  reviews: 95,
                  price: 'From \$300',
                ),
                ServiceCard(
                  image: 'assets/images/venue.jpg',
                  title: 'Elegant Bridal',
                  rating: 4.8,
                  reviews: 156,
                  price: 'From \$500',
                ),
                ServiceCard(
                  image: 'assets/images/cake.jpg',
                  title: 'Sweet Delights',
                  rating: 4.6,
                  reviews: 82,
                  price: 'From \$300',
                ),
                ServiceCard(
                  image: 'assets/images/catering.jpeg',
                  title: 'Royal Catering',
                  rating: 4.9,
                  reviews: 102,
                  price: 'From \$2,000',
                ),
                ServiceCard(
                  image: 'assets/images/music.jpg',
                  title: 'Melodic Moments',
                  rating: 4.5,
                  reviews: 78,
                  price: 'From \$800',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Category Item Widget
class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFF800000),
            radius: 30,
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

// Featured Card Widget
class FeaturedCard extends StatelessWidget {
  const FeaturedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: AssetImage(
              'assets/images/venuefeatured.jpg'), // Replace with actual image
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.5),
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
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
              SizedBox(height: 4),
              Text(
                '⭐ 4.9 · Premium Venue',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Service Card Widget
class ServiceCard extends StatelessWidget {
  final String image;
  final String title;
  final double rating;
  final int reviews;
  final String price;

  const ServiceCard({
    super.key,
    required this.image,
    required this.title,
    required this.rating,
    required this.reviews,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                image, // Replace with actual image
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  '⭐ $rating ($reviews reviews)',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
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
