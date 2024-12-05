
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';  // Required for Firestore
// ignore: unused_import
import 'package:smetasphere/pages/home_page.dart';

// class Createproduct extends StatefulWidget {
//   const Createproduct({Key? key}) : super(key: key);

//   @override
//   State<Createproduct> createState() => _CreateproductState();
//}

// class _CreateproductState extends State<Createproduct> {
//   final _pnameController = TextEditingController();
//   final _descController = TextEditingController();
//   final _priceController = TextEditingController();
//   final _catController = TextEditingController();

//   @override
//   void dispose() {
//     _pnameController.dispose();
//     _descController.dispose();
//     _priceController.dispose();
//     _catController.dispose();
//     super.dispose();
//   }

//   Future<void> postProduct() async {
//     // Check if fields are not empty
//     if (_pnameController.text.trim().isEmpty ||
//         _descController.text.trim().isEmpty ||
//         _priceController.text.trim().isEmpty ||
//         _catController.text.trim().isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please fill all fields')),
//       );
//       return;
//     }

//     try {
//       // Collecting product data
//       Map<String, dynamic> productData = {
//         "product_name": _pnameController.text.trim(),
//         "description": _descController.text.trim(),
//         "price": double.tryParse(_priceController.text.trim()) ?? 0.0,
//         "category": _catController.text.trim(),
//         "timestamp": FieldValue.serverTimestamp(),  // Automatically sets the time
//       };

//       // Storing product data in Firestore
//       await FirebaseFirestore.instance.collection('products').add(productData);

//       // Show success message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Product added successfully!')),
//       );

//       // Clear the text fields
//       _pnameController.clear();
//       _descController.clear();
//       _priceController.clear();
//       _catController.clear();

//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to add product: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.indigo),
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage())); // Navigates back to the previous screen
//           },
//         ),
//         title: const Text(
//           'Metasphere',
//           style: TextStyle(
//             color: Color.fromRGBO(26, 35, 126, 1),
//             fontWeight: FontWeight.bold,
//             fontSize: 29.0,
//           ),
//         ),
//         backgroundColor: Colors.white,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Image or file selection section (static placeholder here)
//             SizedBox(
//               height: MediaQuery.of(context).size.height / 4,
//               child: Row(
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.arrow_back_ios),
//                     onPressed: () {
//                       // Navigate to previous advertisement
//                     },
//                   ),
//                   Expanded(
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 16.0),
//                       decoration: BoxDecoration(
//                         color: Colors.grey[300], 
//                         borderRadius: BorderRadius.circular(10.0), 
//                       ),
//                       child: const Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.add,
//                               color: Colors.black,
//                               size: 30,
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               'Add Image or File',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.arrow_forward_ios),
//                     onPressed: () {
//                       // Navigate to next advertisement
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16), // Added SizedBox for spacing

//             // Product Form Inputs
//             Expanded(
//               child: ListView(
//                 children: [
//                   buildTextField(_pnameController, "Start-Up Name"),
//                   buildTextField(_descController, "Description"),
//                   buildTextField(_priceController, "Price"),
//                   buildTextField(_catController, "Category"),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16), // Added SizedBox for spacing

//             // Bottom Navigation for posting the product
//             bottomNavigationBar(),
//           ],
//         ),
//       ),
//     );
//   }

//   // Widget to create a text input field for the form
//   Widget buildTextField(TextEditingController controller, String hintText) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: hintText,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           filled: true,
//           fillColor: Colors.grey[200],
//         ),
//       ),
//     );
//   }

//   // Bottom navigation bar with the post button
//   Widget bottomNavigationBar() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             onPressed: postProduct,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Color.fromRGBO(26, 35, 126, 1),
//               padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//             ),
//             child: const Text(
//               'Post Product',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// class Createproduct extends StatefulWidget {
//   final Function(Map<String, dynamic>) onPostCreated;

//   const Createproduct({Key? key, required this.onPostCreated}) : super(key: key);

//   @override
//   State<Createproduct> createState() => _CreateproductState();
// }

// class _CreateproductState extends State<Createproduct> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _categoryController = TextEditingController();
//   final TextEditingController _imageUrlController = TextEditingController();

//   void _submitPost() {
//     if (_nameController.text.isNotEmpty &&
//         _descriptionController.text.isNotEmpty &&
//         _categoryController.text.isNotEmpty &&
//         _imageUrlController.text.isNotEmpty) {
//       final newPost = {
//         'companyName': _nameController.text,
//         'description': _descriptionController.text,
//         'category': _categoryController.text,
//         'image': _imageUrlController.text,
//         'liked': false,
//       };

//       // Use the callback to update the HomePage
//       widget.onPostCreated(newPost);

//       // Navigate back to the HomePage
//       Navigator.pop(context);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please fill in all fields')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Create Post')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: const InputDecoration(labelText: 'Company Name'),
//             ),
//             TextField(
//               controller: _descriptionController,
//               decoration: const InputDecoration(labelText: 'Description'),
//             ),
//             TextField(
//               controller: _categoryController,
//               decoration: const InputDecoration(labelText: 'Category'),
//             ),
//             TextField(
//               controller: _imageUrlController,
//               decoration: const InputDecoration(labelText: 'Image URL'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _submitPost,
//               child: const Text('Post'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//cod ethat is usedd last(while running)
class Createproduct extends StatefulWidget {
  const Createproduct({Key? key}) : super(key: key);

  @override
  State<Createproduct> createState() => _CreateproductState();
}

class _CreateproductState extends State<Createproduct> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _submitPost() async {
    if (_nameController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _categoryController.text.isNotEmpty &&
        _imageUrlController.text.isNotEmpty) {
      // Create a new post object
      final newPost = {
        'companyName': _nameController.text,
        'description': _descriptionController.text,
        'category': _categoryController.text,
        'image': _imageUrlController.text,
        'liked': false,
        'timestamp': FieldValue.serverTimestamp(),
      };

      // Save the post to Firestore
      await _firestore.collection('products').add(newPost);

      // Show confirmation and navigate back
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Post added successfully!')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Company Name'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _categoryController,
              decoration: const InputDecoration(labelText: 'Category'),
            ),
            TextField(
              controller: _imageUrlController,
              decoration: const InputDecoration(labelText: 'Image URL'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitPost,
              child: const Text('Post'),
            ),
          ],
        ),
      ),
    );
  }
}

