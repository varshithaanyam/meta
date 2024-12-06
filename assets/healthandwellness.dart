import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HealthCarePage(),
    );
  }
}

class HealthCarePage extends StatefulWidget {
  @override
  _HealthCarePageState createState() => _HealthCarePageState();
}

class _HealthCarePageState extends State<HealthCarePage> {
  // Sample post data
  List<Map<String, dynamic>> postImages = [
    {
      'title': 'Health Tips for a Better Life',
      'liked': false,
      'bookmarked': false,
    },
  ];

  void _toggleLike(int index) {
    setState(() {
      postImages[index]['liked'] = !postImages[index]['liked'];
    });
  }

  void _toggleBookmark(int index) {
    setState(() {
      postImages[index]['bookmarked'] = !postImages[index]['bookmarked'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.deepPurple),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Health Care",
          style: TextStyle(color: Colors.deepPurple),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: [
          // Add your Card widget here
          Card(
            margin: const EdgeInsets.all(8.0),
            elevation: 3.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Replace with your image asset
                Image.asset(
                  'assets/1mg post1.jpg',
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
                        color: postImages[0]['liked'] ? Colors.pink : Colors.grey,
                      ),
                      onPressed: () => _toggleLike(0),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.bookmark,
                        color: postImages[0]['bookmarked'] ? Colors.yellow : Colors.grey,
                      ),
                      onPressed: () => _toggleBookmark(0),
                    ),
                    IconButton(
                      icon: const Icon(Icons.info, color: Colors.purple),
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder:(context) =>  mgDetails()) );
                        // Add functionality if needed
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.chat, color: Color.fromRGBO(67, 160, 71, 1)),
                      onPressed: () {
                        // Add functionality if needed
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
