// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smetasphere/main.dart';
import 'package:smetasphere/pages/ChatPage.dart';
// import 'package:flutter_application_1/create.dart';
// import 'package:flutter_application_1/health.dart';
// import 'package:flutter_application_1/1mgdetails.dart';
// import 'package:flutter_application_1/signup.dart';

void main() async {
  runApp(const MetasphereApp());
}

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

class _HomePageState extends State<HomePage> {
  // ignore: unused_field
  int _currentImageIndex = 0;
  int _currentNavIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  final List<String> carouselImages = [
    'assets/carousel 1.png',
    'assets/inc42[entertainment].png',
    'assets/upstox[financial services].png',
    'assets/thrillophilia [ travel, hospit].png',
    'assets/spring [food,healthcare].png',
    'assets/eatoes [ food].jpg',
  
  ];

  final List<Map<String, dynamic>> postImages = [
    {'url': 'https://via.placeholder.com/400x200?text=Post1', 'title': 'Post 1', 'liked': false, 'bookmarked': false},
  ];

  final List<IconData> navIcons = [
    Icons.home,
    Icons.person,
    Icons.chat,
    Icons.create,
    Icons.lightbulb,
  ];

  void _onBottomNavTap(int index) {
    setState(() {
      _currentNavIndex = index;
    });
  }

  void _toggleLike(int index) {
    setState(() {
      postImages[index]['liked'] = !(postImages[index]['liked'] ?? false);
    });
  }

  void _toggleBookmark(int index) {
    setState(() {
      postImages[index]['bookmarked'] = !(postImages[index]['bookmarked'] ?? false);
    });
  }

  void _onFilter1Pressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  
    print('Health & Wellness pressed');
  }

  void _onFilter2Pressed() {
    // Implement filter 2 logic here
    print('Financial services] pressed');
  }

  void _onFilter3Pressed() {
    // Implement filter 3 logic here
    print('Food pressed');
  }
  void _onFilter4Pressed() {
    // Implement filter 3 logic here
    print('Accessories pressed');
  }
  void _onFilter5Pressed() {
    // Implement filter 3 logic here
    print('Real Estate pressed');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                      // Back Button and Notification Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back, color: Colors.deepPurple),
                            onPressed: () {
                              // Handle back navigation
                              Navigator.pop(context);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.notifications, color: Colors.deepPurple),
                            onPressed: () {
                              // Handle notification button press
                            },
                          ),
                        ],
                      ),
                      // Search Bar
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
                      // Filter Buttons below the search bar
                      Padding(
  padding: const EdgeInsets.only(top: 10),
  child: SingleChildScrollView(
    scrollDirection: Axis.horizontal, // Enable horizontal scrolling
    child: Row(
      children: [
        ElevatedButton(
          onPressed: _onFilter1Pressed,
          child: const Text(
            'Health & Wellness',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        SizedBox(width: 10), // Add spacing between buttons
        ElevatedButton(
          onPressed: _onFilter2Pressed,
          child: const Text(
            'Financial services',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        SizedBox(width: 10), // Add spacing between buttons
        ElevatedButton(
          onPressed: _onFilter3Pressed,
          child: const Text(
            'Food & Beverage',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        SizedBox(width: 10), // Add spacing between buttons
        ElevatedButton(
          onPressed: _onFilter4Pressed,
          child: const Text(
            'Accessories',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        SizedBox(width: 10), // Add spacing between buttons
        ElevatedButton(
          onPressed: _onFilter5Pressed,
          child: const Text(
            'Real Estate',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
      ],
    ),
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
                // Posts Section (only one post displayed)
                Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 3.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/flexpay[ financial services].png', 
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 250,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          postImages[0]['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: postImages[0]['liked'] == true ? Colors.pink : Colors.grey,
                            ),
                            onPressed: () => _toggleLike(0), // Update for the first post
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.bookmark,
                              color: postImages[0]['bookmarked'] == true ? Colors.yellow : Colors.grey,
                            ),
                            onPressed: () => _toggleBookmark(0), // Update for the first post
                          ),
                          IconButton(
                            icon: const Icon(Icons.info, color: Colors.purple),
                            onPressed: () {
                              // Navigator.push(context, MaterialPageRoute(builder:(context) =>  mgDetails()) );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.chat, color: Color.fromRGBO(67, 160, 71, 1)),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 3.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/car2.png', 
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 250,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          postImages[0]['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: postImages[0]['liked'] == true ? Colors.pink : Colors.grey,
                            ),
                            onPressed: () => _toggleLike(0), // Update for the first post
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.bookmark,
                              color: postImages[0]['bookmarked'] == true ? Colors.yellow : Colors.grey,
                            ),
                            onPressed: () => _toggleBookmark(0), // Update for the first post
                          ),
                          IconButton(
                            icon: const Icon(Icons.info, color: Colors.purple),
                            onPressed: () {
                              // Navigator.push(context, MaterialPageRoute(builder:(context) =>  mgDetails()) );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.chat, color: Color.fromRGBO(67, 160, 71, 1)),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 3.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/palmonas [accessory ].jpg', 
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 250,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          postImages[0]['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: postImages[0]['liked'] == true ? Colors.pink : Colors.grey,
                            ),
                            onPressed: () => _toggleLike(0), // Update for the first post
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.bookmark,
                              color: postImages[0]['bookmarked'] == true ? Colors.yellow : Colors.grey,
                            ),
                            onPressed: () => _toggleBookmark(0), // Update for the first post
                          ),
                          IconButton(
                            icon: const Icon(Icons.info, color: Colors.purple),
                            onPressed: () {
                              // Navigator.push(context, MaterialPageRoute(builder:(context) =>  mgDetails()) );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.chat, color: Color.fromRGBO(67, 160, 71, 1)),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                 Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 3.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/eatoes [ food].jpg', 
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 250,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          postImages[0]['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: postImages[0]['liked'] == true ? Colors.pink : Colors.grey,
                            ),
                            onPressed: () => _toggleLike(0), // Update for the first post
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.bookmark,
                              color: postImages[0]['bookmarked'] == true ? Colors.yellow : Colors.grey,
                            ),
                            onPressed: () => _toggleBookmark(0), // Update for the first post
                          ),
                          IconButton(
                            icon: const Icon(Icons.info, color: Colors.purple),
                            onPressed: () {
                              // Navigator.push(context, MaterialPageRoute(builder:(context) =>  mgDetails()) );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.chat, color: Color.fromRGBO(67, 160, 71, 1)),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                 Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 3.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/renew [ sustainbility].png', 
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 250,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          postImages[0]['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: postImages[0]['liked'] == true ? Colors.pink : Colors.grey,
                            ),
                            onPressed: () => _toggleLike(0), // Update for the first post
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.bookmark,
                              color: postImages[0]['bookmarked'] == true ? Colors.yellow : Colors.grey,
                            ),
                            onPressed: () => _toggleBookmark(0), // Update for the first post
                          ),
                          IconButton(
                            icon: const Icon(Icons.info, color: Colors.purple),
                            onPressed: () {
                              // Navigator.push(context, MaterialPageRoute(builder:(context) =>  mgDetails()) );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.chat, color: Color.fromRGBO(67, 160, 71, 1)),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Add more posts if needed...
              ],
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
  currentIndex: _currentNavIndex,
  onTap: (index) {
    setState(() {
      _currentNavIndex = index;
    });

          switch (index) {
            case 0:
              // Navigator.push(context, MaterialPageRoute(builder: (context) => accsettings()));
              break;
            case 1:
              // Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
              break;
            case 2:
              // Navigator.push(context, MaterialPageRoute(builder: (context) => Saved()));
              break;
            case 3:
              // Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePage()));
              break;
            case 4:
              // Navigator.push(context, MaterialPageRoute(builder: (context) => Guide()));
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
            icon: Icon(Icons.save),
            label: 'saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Tips',
          ),
        ],
      ),
    );
  }
}