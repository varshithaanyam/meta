// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:smetasphere/auth/AuthPage.dart';
// import 'package:smetasphere/pages/ChatPage.dart';
// import 'package:smetasphere/pages/Chat_Services.dart';
// import 'package:smetasphere/pages/LikedPage.dart';
// import 'package:smetasphere/pages/accsettings.dart';
// import 'package:smetasphere/pages/chatdetail.dart';
// import 'package:smetasphere/pages/com.dart';
// import 'package:smetasphere/pages/createproduct.dart';
// import 'package:smetasphere/pages/guide.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';


// class FirestoreService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final User? _currentUser = FirebaseAuth.instance.currentUser;

//   // Add a post to the user's saved posts
//   Future<void> addLikedPost(Map<String, dynamic> post) async {
//     if (_currentUser != null) {
//       final docRef = _firestore.collection('users').doc(_currentUser!.uid);
//       await docRef.update({
//         'likedPosts': FieldValue.arrayUnion([post]),
//       }).catchError((error) {
//         // If the document doesn't exist, create it
//         if (error.toString().contains('NOT_FOUND')) {
//           docRef.set({'likedPosts': [post]});
//         }
//       });
//     }
//   }

//   // Remove a post from the user's saved posts
//   Future<void> removeLikedPost(Map<String, dynamic> post) async {
//     if (_currentUser != null) {
//       await _firestore.collection('users').doc(_currentUser!.uid).update({
//         'likedPosts': FieldValue.arrayRemove([post]),
//       });
//     }
//   }

//   // Fetch liked posts
//   Future<List<Map<String, dynamic>>> fetchLikedPosts() async {
//     if (_currentUser != null) {
//       final docSnapshot = await _firestore.collection('users').doc(_currentUser!.uid).get();
//       if (docSnapshot.exists) {
//         return List<Map<String, dynamic>>.from(docSnapshot['likedPosts'] ?? []);
//       }
//     }
//     return [];
//   }
// }

// // void main() async {
// //   runApp(const MetasphereApp());
// // }

// class MetasphereApp extends StatelessWidget {
//   const MetasphereApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {

//  const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }
// // final currentUser = FirebaseAuth.instance.currentUser!;
// // bool isLiked = false;
// class _HomePageState extends State<HomePage> {
// final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // Function to fetch posts from Firestore
//   Stream<QuerySnapshot> _fetchPosts() {
//     return _firestore.collection('posts').orderBy('timestamp', descending: true).snapshots();
//   }
  
//   int _currentImageIndex = 0;
//   int _currentNavIndex = 0;
//   String _selectedCategory = 'All';
//   final TextEditingController _searchController = TextEditingController();

//   final List<String> carouselImages = [
//     'assets/carousel 1.png',
//     'assets/the summere house[ clothing].png',
//     'assets/aadar[food,healthcare].jpg',
//     'assets/palmonas [accessory ].jpg',
//     'assets/thrillophilia [ travel, hospit].png',
//     'assets/upstox[financial services].png',
//   ];

//   final List<Map<String, dynamic>> posts = [
//     {
//       'companyName': 'TVF Entertainment',
//       'image': 'assets/tvf [entertaiment].png',
//       'description': 'TVF provides premium entertainment content and web series.',
//       'category': 'Entertainment',
//       'liked': false,
//     },
//     {
//       'companyName': 'Zenput',
//       'image': 'assets/Zenput [food].jpg',
//       'description': 'Zenput helps streamline food operations efficiently.',
//       'category': 'Food',
//       'liked': false,
//     },
//     {
//       'companyName': 'Tripoto',
//       'image': 'assets/Tripoto [ travel,hospi].jpg',
//       'description': 'Tripoto offers travel recommendations and trip planning.',
//       'category': 'Travel',
//       'liked': false,
//     },
//     {
//       'companyName': 'Palmonas Accessories',
//       'image': 'assets/palmonas [accessory ].jpg',
//       'description': 'Palmonas specializes in premium accessories.',
//       'category': 'Accessories',
//       'liked': false,
//     },
//   ];

//   final List<String> categories = ['All', 'Entertainment', 'Food', 'Travel', 'Accessories'];

//   void _filterPosts(String category) {
//     setState(() {
//       _selectedCategory = category;
//     });
//   }

//   List<Map<String, dynamic>> get filteredPosts {
//     if (_selectedCategory == 'All') {
//       return posts;
//     }
//     return posts.where((post) => post['category'] == _selectedCategory).toList();
//   }

  


// final FirestoreService _firestoreService = FirestoreService();

// // void _toggleLike(int index) async {
// //   final post = filteredPosts[index];

// //   setState(() {
// //     post['liked'] = !(post['liked'] ?? false);
// //   });

// //   if (post['liked'] == true) {
// //     await _firestoreService.addLikedPost(post);
// //   } else {
// //     await _firestoreService.removeLikedPost(post);
// //   }
// // }
// void _toggleLike(Map<String, dynamic> post) async {
//   // Update the Firestore post's liked state
//   final postId = post['id']; // Assuming the Firestore document ID is stored as 'id'
//   final isLiked = !(post['liked'] ?? false); // Toggle the liked status

//   await FirebaseFirestore.instance
//       .collection('posts')
//       .doc(postId)
//       .update({'liked': isLiked});

//   // No need to manually update the UI since Firestore listener will handle it
// }

// void _onTipsPressed(Map<String, dynamic> post) {
//   // Handle tips logic, for example:
//   print('Tips button pressed for post: ${post['companyName']}');
//   // Navigate to a Tips page or show a modal
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => Guide(post: post),
//     ),
//   );
// }



//   // void _onTipsPressed(int index) {
//   //   print('Tips button pressed for post: ${filteredPosts[index]['companyName']}');
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: 
//       Stack(
//         children: [
//           // Background Image
//           Positioned.fill(
//             child: Image.asset(
//               'assets/Untitled.png',
//               fit: BoxFit.cover,
//             ),
//           ),
//           // Content
//           SingleChildScrollView(
//             child: Column(
//               children: [
//                 // Row for Back Button, Notification Icon, and Search Bar
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Row(
//                       //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       //   children: [
//                       //     IconButton(
//                       //       icon: const Icon(Icons.arrow_back, color: Colors.deepPurple),
//                       //       onPressed: () {
//                       //         Navigator.pop(context);
//                       //       },
//                       //     ),
//                       //     IconButton(
//                       //       icon: const Icon(Icons.notifications, color: Colors.deepPurple),
//                       //       onPressed: () {},
//                       //     ),
//                       //     IconButton(
//                       //       icon: const Icon(Icons.favorite, color: Colors.deepPurple),
//                       //       onPressed: () {
//                       //         Navigator.push(context, MaterialPageRoute(builder: (context) => const LikedPage()));
//                       //       },
//                       //     ),
//                       //   ],
//                       // ),
//                       Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     IconButton(
//       icon: const Icon(Icons.arrow_back, color: Colors.deepPurple),
//       onPressed: () {
//         Navigator.pop(context);
//       },
//     ),
//     // Moved the notification icon next to the like icon
//     Row(
//       children: [
//         IconButton(
//           icon: const Icon(Icons.favorite, color: Colors.deepPurple),
//           onPressed: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => const LikedPage()));
//           },
//         ),
//         IconButton(
//           icon: const Icon(Icons.notifications, color: Colors.deepPurple),
//           onPressed: () {},
//         ),
//       ],
//     ),
//   ],
// ),

//                       Padding(
//                         padding: const EdgeInsets.only(top: 10),
//                         child: TextField(
//                           controller: _searchController,
//                           decoration: InputDecoration(
//                             hintText: 'Search...',
//                             filled: true,
//                             fillColor: Colors.white.withOpacity(0.7),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                               borderSide: BorderSide.none,
//                             ),
//                             prefixIcon: const Icon(Icons.search, color: Colors.deepPurple),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       // Filter Buttons Row
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children: categories.map((category) {
//                             return Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                               child: ElevatedButton(
//                                 onPressed: () => _filterPosts(category),
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: _selectedCategory == category
//                                       ? Colors.deepPurple
//                                       : Colors.grey[300],
//                                   foregroundColor:
//                                       _selectedCategory == category ? Colors.white : Colors.black,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(20.0),
//                                   ),
//                                 ),
//                                 child: Text(category),
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // Carousel Section
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(16.0),
//                     child: CarouselSlider(
//                       items: carouselImages.map((image) {
//                         return Image.asset(
//                           image,
//                           fit: BoxFit.cover,
//                           width: double.infinity,
//                         );
//                       }).toList(),
//                       options: CarouselOptions(
//                         height: 250.0,
//                         enlargeCenterPage: true,
//                         autoPlay: true,
//                         autoPlayInterval: const Duration(seconds: 2),
//                         onPageChanged: (index, reason) {
//                           setState(() {
//                             _currentImageIndex = index;
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Posts Section
//                  // Posts Section: Use StreamBuilder to dynamically load posts
//                 StreamBuilder<QuerySnapshot>(
//                   stream: _fetchPosts(),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasError) {
//                       return const Center(
//                         child: Text('Error loading posts'),
//                       );
//                     }

//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }

//                     // Fetch posts from snapshot
//                     final posts = snapshot.data!.docs;

//                     if (posts.isEmpty) {
//                       return const Center(child: Text('No posts available'));
//                     }

//                     return Column(
//                       children: posts.map((doc) {
//                         final post = doc.data() as Map<String, dynamic>;
//                 // ...filteredPosts.map((post) {
//                 //   int index = filteredPosts.indexOf(post);
//                   return Card(
//                     margin: const EdgeInsets.all(8.0),
//                     elevation: 3.0,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             post['companyName']??'Unknown',
//                             style: const TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         post['image']!=null
//                         ?Image.network(
//                           post['image'],
//                           fit: BoxFit.cover,
//                           width: double.infinity,
//                           height: 250,
//                         ):const SizedBox(),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             post['description'],
//                             style: const TextStyle(fontSize: 14),
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children:[
//                           //   LikeButton(isLiked: true, onTap: () {},),
//                             IconButton(
//                               icon: Icon(
//                                 Icons.favorite,
//                                 color: post['liked'] == true ? Colors.pink : Colors.grey,
//                               ),
//                               onPressed: () => _toggleLike(index),
//                             ),
                           
      
//                             IconButton(
//                               icon: const Icon(Icons.chat, color: Colors.green),
//                               onPressed: () {
//                                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
//                               },
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.lightbulb, color: Colors.purple),
//                               onPressed: () => _onTipsPressed(index),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   );
//                 }).toList(),
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentNavIndex,
//         onTap: (index) {
//           setState(() {
//             _currentNavIndex = index;
//           });

//           switch (index) {
//             case 0:
//               Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
//               break;
//             case 1:
//               Navigator.push(context, MaterialPageRoute(builder: (context) => accsettings()));
//               break;
//             case 2:
//               Navigator.push(context, MaterialPageRoute(builder: (context) => const Createproduct()));
//               break;
//             case 3:
//               Navigator.push(context, MaterialPageRoute(builder: (context) => Guide()));
//               break;
//             case 4:
//               Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
//               break;
//           }
//         },
//         selectedItemColor: Colors.indigo,
//         unselectedItemColor: Colors.grey,
//         showUnselectedLabels: true,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.create),
//             label: 'Create',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.lightbulb),
//             label: 'Tips',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.chat),
//             label: 'Chat',
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:smetasphere/pages/ChatPage.dart';
// import 'package:smetasphere/pages/LikedPage.dart';
// import 'package:smetasphere/pages/accsettings.dart';
// import 'package:smetasphere/pages/createproduct.dart';
// import 'package:smetasphere/pages/guide.dart';
// class FirestoreService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final User? _currentUser = FirebaseAuth.instance.currentUser;

//   Future<void> addLikedPost(Map<String, dynamic> post) async {
//     if (_currentUser != null) {
//       final docRef = _firestore.collection('users').doc(_currentUser!.uid);
//       await docRef.update({
//         'likedPosts': FieldValue.arrayUnion([post]),
//       }).catchError((error) {
//         if (error.toString().contains('NOT_FOUND')) {
//           docRef.set({'likedPosts': [post]});
//         }
//       });
//     }
//   }

//   Future<void> removeLikedPost(Map<String, dynamic> post) async {
//     if (_currentUser != null) {
//       await _firestore.collection('users').doc(_currentUser!.uid).update({
//         'likedPosts': FieldValue.arrayRemove([post]),
//       });
//     }
//   }
// }

// class MetasphereApp extends StatelessWidget {
//   const MetasphereApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirestoreService _firestoreService = FirestoreService();
//   final TextEditingController _searchController = TextEditingController();

//   String _selectedCategory = 'All';
//   int _currentNavIndex = 0;
//   final List<String> categories = ['All', 'Entertainment', 'Food', 'Travel', 'Accessories'];
//   final List<String> carouselImages = [
//     'assets/carousel1.png',
//     'assets/carousel2.png',
//     'assets/carousel3.png',
//     'assets/carousel4.png',
//   ];

//   Stream<QuerySnapshot> _fetchPosts() {
//     return _firestore.collection('posts').orderBy('timestamp', descending: true).snapshots();
//   }

//   void _filterPosts(String category) {
//     setState(() {
//       _selectedCategory = category;
//     });
//   }

//   void _toggleLike(Map<String, dynamic> post) async {
//     final postId = post['id'];
//     final isLiked = !(post['liked'] ?? false);
//     await _firestore.collection('posts').doc(postId).update({'liked': isLiked});
//   }

//   void _onTipsPressed(Map<String, dynamic> post) {
//     // Navigator.push(
//     //   context,
//     //   MaterialPageRoute(
//     //     builder: (context) => Guide(post: post),
//     //   ),
//     // );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Image.asset('assets/background.png', fit: BoxFit.cover),
//           ),
//           SingleChildScrollView(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.arrow_back, color: Colors.deepPurple),
//                             onPressed: () => Navigator.pop(context),
//                           ),
//                           Row(
//                             children: [
//                               IconButton(
//                                 icon: const Icon(Icons.favorite, color: Colors.deepPurple),
//                                 onPressed: () => Navigator.push(
//                                   context,
//                                   MaterialPageRoute(builder: (context) => const LikedPage()),
//                                 ),
//                               ),
//                               IconButton(
//                                 icon: const Icon(Icons.notifications, color: Colors.deepPurple),
//                                 onPressed: () {},
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       TextField(
//                         controller: _searchController,
//                         decoration: InputDecoration(
//                           hintText: 'Search...',
//                           filled: true,
//                           fillColor: Colors.white.withOpacity(0.7),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30.0),
//                             borderSide: BorderSide.none,
//                           ),
//                           prefixIcon: const Icon(Icons.search, color: Colors.deepPurple),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children: categories.map((category) {
//                             return Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                               child: ElevatedButton(
//                                 onPressed: () => _filterPosts(category),
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: _selectedCategory == category
//                                       ? Colors.deepPurple
//                                       : Colors.grey[300],
//                                   foregroundColor:
//                                       _selectedCategory == category ? Colors.white : Colors.black,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(20.0),
//                                   ),
//                                 ),
//                                 child: Text(category),
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(16.0),
//                     child: CarouselSlider(
//                       items: carouselImages.map((image) {
//                         return Image.asset(
//                           image,
//                           fit: BoxFit.cover,
//                           width: double.infinity,
//                         );
//                       }).toList(),
//                       options: CarouselOptions(
//                         height: 250.0,
//                         enlargeCenterPage: true,
//                         autoPlay: true,
//                         autoPlayInterval: const Duration(seconds: 2),
//                       ),
//                     ),
//                   ),
//                 ),
//                 StreamBuilder<QuerySnapshot>(
//                   stream: _fetchPosts(),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasError) {
//                       return const Center(child: Text('Error loading posts'));
//                     }
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const Center(child: CircularProgressIndicator());
//                     }
//                     final posts = snapshot.data!.docs;
//                     if (posts.isEmpty) {
//                       return const Center(child: Text('No posts available'));
//                     }
//                     return Column(
//                       children: posts.map((doc) {
//                         final post = doc.data() as Map<String, dynamic>;
//                         post['id'] = doc.id;
//                         return Card(
//                           margin: const EdgeInsets.all(8.0),
//                           elevation: 3.0,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   post['companyName'] ?? 'Unknown',
//                                   style: const TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                               post['image'] != null
//                                   ? Image.network(
//                                       post['image'],
//                                       fit: BoxFit.cover,
//                                       width: double.infinity,
//                                       height: 250,
//                                     )
//                                   : const SizedBox(),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   post['description'] ?? 'No description available.',
//                                   style: const TextStyle(fontSize: 14),
//                                 ),
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children: [
//                                   IconButton(
//                                     icon: Icon(
//                                       Icons.favorite,
//                                       color: post['liked'] == true ? Colors.pink : Colors.grey,
//                                     ),
//                                     onPressed: () => _toggleLike(post),
//                                   ),
//                                   IconButton(
//                                     icon: const Icon(Icons.chat, color: Colors.green),
//                                     onPressed: () => Navigator.push(
//                                       context,
//                                       MaterialPageRoute(builder: (context) => ChatPage()),
//                                     ),
//                                   ),
//                                   IconButton(
//                                     icon: const Icon(Icons.lightbulb, color: Colors.purple),
//                                     onPressed: () => _onTipsPressed(post),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         );
//                       }).toList(),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentNavIndex,
//         onTap: (index) {
//           setState(() {
//             _currentNavIndex = index;
//           });

//           switch (index) {
//             case 0:
//               break; // Already on Home
//             case 1:
//               Navigator.push(context, MaterialPageRoute(builder: (context) =>  accsettings()));
//               break;
//             case 2:
//               Navigator.push(context, MaterialPageRoute(builder: (context) => const Createproduct()));
//               break;
//             case 3:
//               Navigator.push(context, MaterialPageRoute(builder: (context) => Guide()));
//               break;
//             case 4:
//               Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
//               break;
//           }
//         },
//         selectedItemColor: Colors.indigo,
//         unselectedItemColor: Colors.grey,
//         showUnselectedLabels: true,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.add_circle_outline),
//             label: 'Create',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.info),
//             label: 'Guide',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.chat),
//             label: 'Chat',
//           ),
//         ],
//       ),
//     );
//   }
// }

// void main() {
//   runApp(const MetasphereApp());
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smetasphere/auth/AuthPage.dart';
import 'package:smetasphere/pages/ChatPage.dart';
import 'package:smetasphere/pages/Chat_Services.dart';
import 'package:smetasphere/pages/LikedPage.dart';
import 'package:smetasphere/pages/accsettings.dart';
import 'package:smetasphere/pages/com.dart';
import 'package:smetasphere/pages/createproduct.dart';
import 'package:smetasphere/pages/guide.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final User? _currentUser = FirebaseAuth.instance.currentUser;

  // Add a post to the user's saved posts
  Future<void> addLikedPost(Map<String, dynamic> post) async {
    if (_currentUser != null) {
      final docRef = _firestore.collection('users').doc(_currentUser!.uid);
      await docRef.update({
        'likedPosts': FieldValue.arrayUnion([post]),
      }).catchError((error) {
        // If the document doesn't exist, create it
        if (error.toString().contains('NOT_FOUND')) {
          docRef.set({'likedPosts': [post]});
        }
      });
    }
  }

  // Remove a post from the user's saved posts
  Future<void> removeLikedPost(Map<String, dynamic> post) async {
    if (_currentUser != null) {
      await _firestore.collection('users').doc(_currentUser!.uid).update({
        'likedPosts': FieldValue.arrayRemove([post]),
      });
    }
  }

  // Fetch liked posts
  Future<List<Map<String, dynamic>>> fetchLikedPosts() async {
    if (_currentUser != null) {
      final docSnapshot = await _firestore.collection('users').doc(_currentUser!.uid).get();
      if (docSnapshot.exists) {
        return List<Map<String, dynamic>>.from(docSnapshot['likedPosts'] ?? []);
      }
    }
    return [];
  }
}

// void main() async {
//   runApp(const MetasphereApp());
// }

class MetasphereApp extends StatelessWidget {
  const MetasphereApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

 const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
// final currentUser = FirebaseAuth.instance.currentUser!;
// bool isLiked = false;
class _HomePageState extends State<HomePage> {

  int _currentImageIndex = 0;
  int _currentNavIndex = 0;
  String _selectedCategory = 'All';
  final TextEditingController _searchController = TextEditingController();

  final List<String> carouselImages = [
    'assets/carousel 1.png',
    'assets/the summere house[ clothing].png',
    'assets/aadar[food,healthcare].jpg',
    'assets/palmonas [accessory ].jpg',
    'assets/thrillophilia [ travel, hospit].png',
    'assets/upstox[financial services].png',
  ];

  final List<Map<String, dynamic>> posts = [
    {
      'companyName': 'TVF Entertainment',
      'image': 'assets/tvf [entertaiment].png',
      'description': 'TVF provides premium entertainment content and web series.',
      'category': 'Entertainment',
      'liked': false,
    },
    {
      'companyName': 'Zenput',
      'image': 'assets/Zenput [food].jpg',
      'description': 'Zenput helps streamline food operations efficiently.',
      'category': 'Food',
      'liked': false,
    },
    {
      'companyName': 'Tripoto',
      'image': 'assets/Tripoto [ travel,hospi].jpg',
      'description': 'Tripoto offers travel recommendations and trip planning.',
      'category': 'Travel',
      'liked': false,
    },
    {
      'companyName': 'Palmonas Accessories',
      'image': 'assets/palmonas [accessory ].jpg',
      'description': 'Palmonas specializes in premium accessories.',
      'category': 'Accessories',
      'liked': false,
    },
  ];

  final List<String> categories = ['All', 'Entertainment', 'Food', 'Travel', 'Accessories'];

  void _filterPosts(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  List<Map<String, dynamic>> get filteredPosts {
    if (_selectedCategory == 'All') {
      return posts;
    }
    return posts.where((post) => post['category'] == _selectedCategory).toList();
  }

  // void _toggleLike(int index) {
  //   setState(() {
  //     filteredPosts[index]['liked'] = !(filteredPosts[index]['liked'] ?? false);
  //   });
  // }
  //final FirestoreService _firestoreService = FirestoreService();


final FirestoreService _firestoreService = FirestoreService();

void _toggleLike(int index) async {
  final post = filteredPosts[index];

  setState(() {
    post['liked'] = !(post['liked'] ?? false);
  });

  if (post['liked'] == true) {
    await _firestoreService.addLikedPost(post);
  } else {
    await _firestoreService.removeLikedPost(post);
  }
}



  void _onTipsPressed(int index) {
    print('Tips button pressed for post: ${filteredPosts[index]['companyName']}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/Untitled.png',
              fit: BoxFit.cover,
            ),
          ),
          // Content
          SingleChildScrollView(
            child: Column(
              children: [
                // Row for Back Button, Notification Icon, and Search Bar
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     IconButton(
                      //       icon: const Icon(Icons.arrow_back, color: Colors.deepPurple),
                      //       onPressed: () {
                      //         Navigator.pop(context);
                      //       },
                      //     ),
                      //     IconButton(
                      //       icon: const Icon(Icons.notifications, color: Colors.deepPurple),
                      //       onPressed: () {},
                      //     ),
                      //     IconButton(
                      //       icon: const Icon(Icons.favorite, color: Colors.deepPurple),
                      //       onPressed: () {
                      //         Navigator.push(context, MaterialPageRoute(builder: (context) => const LikedPage()));
                      //       },
                      //     ),
                      //   ],
                      // ),
                      Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.deepPurple),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    // Moved the notification icon next to the like icon
    Row(
      children: [
        IconButton(
          icon: const Icon(Icons.favorite, color: Colors.deepPurple),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const LikedPage()));
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.deepPurple),
          onPressed: () {},
        ),
      ],
    ),
  ],
),

                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.7),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: const Icon(Icons.search, color: Colors.deepPurple),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Filter Buttons Row
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: categories.map((category) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ElevatedButton(
                                onPressed: () => _filterPosts(category),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _selectedCategory == category
                                      ? Colors.deepPurple
                                      : Colors.grey[300],
                                  foregroundColor:
                                      _selectedCategory == category ? Colors.white : Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                child: Text(category),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                // Carousel Section
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: CarouselSlider(
                      items: carouselImages.map((image) {
                        return Image.asset(
                          image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 250.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 2),
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentImageIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                // Posts Section
                ...filteredPosts.map((post) {
                  int index = filteredPosts.indexOf(post);
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    elevation: 3.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            post['companyName'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Image.asset(
                          post['image'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 250,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            post['description'],
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:[
                          //   LikeButton(isLiked: true, onTap: () {},),
                            IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: post['liked'] == true ? Colors.pink : Colors.grey,
                              ),
                              onPressed: () => _toggleLike(index),
                            ),
                           
      
                            IconButton(
                              icon: const Icon(Icons.chat, color: Colors.green),
                              onPressed: () {
                               Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.lightbulb, color: Colors.purple),
                              onPressed: () => _onTipsPressed(index),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentNavIndex,
        onTap: (index) {
          setState(() {
            _currentNavIndex = index;
          });

          switch (index) {
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              break;
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (context) => accsettings()));
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Createproduct()));
              break;
            case 3:
              Navigator.push(context, MaterialPageRoute(builder: (context) => Guide()));
              break;
            case 4:
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
              break;
          }
        },
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Tips',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}

