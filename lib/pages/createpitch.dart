import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CreatePage(),
  ));
}

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  File? _selectedImage;
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  String? _selectedCategory;

  final List<String> _categories = [
    "Health & Wellness",
    "Travel & Hospitality",
    "Education",
    "Technology",
    "Food & Beverage",
    "Financial Services",
    "Sustainability",
    "Real Estate",
    "Entertainment"
  ];

  final Color _textColor = Colors.black;
  final Color _hintColor = Colors.grey;
  final Color _dropdownBorderColor = Colors.deepPurple;
  final Color _buttonTextColor = Colors.white;
  final Color _appBarTitleColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  // Request permissions for external storage
  Future<void> _requestPermissions() async {
    PermissionStatus status = await Permission.photos.request();
    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Storage permission is required to select an image.')),
      );
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _submitProduct() {
    String name = _productNameController.text.trim();
    String description = _descriptionController.text.trim();
    String price = _priceController.text.trim();

    if (name.isEmpty || description.isEmpty || price.isEmpty || _selectedCategory == null || _selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields and select an image.')),
      );
      return;
    }

    // Handle product submission logic
    print('Details Submitted: $name, $description, $price, $_selectedCategory');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Pitch", style: TextStyle(color: Colors.deepPurple)),
        backgroundColor: _appBarTitleColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _selectedImage != null
                    ? Image.file(_selectedImage!, fit: BoxFit.cover)
                    : Center(child: Text('Tap to select an image')),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _productNameController,
              decoration: InputDecoration(
                labelText: "Startup Name",
                labelStyle: TextStyle(color: _textColor),
                hintText: "Enter Startup name",
                hintStyle: TextStyle(color: _hintColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: "Description",
                labelStyle: TextStyle(color: _textColor),
                hintText: "Enter Startup description",
                hintStyle: TextStyle(color: _hintColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Price",
                labelStyle: TextStyle(color: _textColor),
                hintText: "Enter price",
                hintStyle: TextStyle(color: _hintColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Category",
                labelStyle: TextStyle(color: _textColor),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: _dropdownBorderColor),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              value: _selectedCategory,
              items: _categories.map((category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category, style: TextStyle(color: _textColor)),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _submitProduct,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  fixedSize: Size(150, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text("Submit", style: TextStyle(color: _buttonTextColor)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
