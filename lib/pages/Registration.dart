// ignore_for_file: use_key_in_widget_constructors

/*import 'package:flutter/material.dart';
// import 'package:metasphere/ProductDetails.dart';
// import 'package:metasphere/home.dart';
import 'package:smetasphere/pages/home_page.dart';
// import 'package:rough_code/main.dart';
// import 'package:rough_code/productdetails.dart';



class Registration extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  const Registration({
    Key? key,
   }): super(key: key);

  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
   final _comnameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _panController = TextEditingController();
  final _cinController = TextEditingController();
@override
void dispose(){
  _fnameController.dispose();
    _lnameController.dispose();
    _comnameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _panController.dispose();
    _cinController.dispose();
    super.dispose();
}
Future Registration() async{

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color.fromRGBO(26, 35, 126, 1)),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder:(context) => const HomePage()) );
          },
        ),
         
        backgroundColor: Colors.white,
      ),
      body:
      Container( decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Untitled.png'), // Path to your image
            fit: BoxFit.cover, // Makes the image cover the entire screen
          ),
        ),
        child: SafeArea(
          
          child: 
        SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //metasphere
               
                const Text(
                  "Metasphere",
                  style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                  ),
                    const SizedBox(height:10),
               
                   const Text(
                  "Registration",
                  style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                  ),
                  const  SizedBox(height:50),
                    //email text field
                    
                    //confirm password 
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.indigo[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _fnameController,
                           // obscureText: true,
                            decoration: InputDecoration(
                              border:InputBorder.none,
                              hintText: 'First Name',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height:10),Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                     
                      child: Container(
                        
                        decoration: BoxDecoration(
                          color: Colors.indigo[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                             controller: _lnameController,
                            decoration: InputDecoration(
                              border:InputBorder.none,
                              hintText: 'Last Name',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height:10),
                //password textfield
                Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.indigo[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _panController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border:InputBorder.none,
                              hintText: 'PAN',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height:10),
                //login button
                Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.indigo[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _comnameController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border:InputBorder.none,
                              hintText: 'Company Name',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height:10),Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                     
                      child: Container(
                        
                        decoration: BoxDecoration(
                          color: Colors.indigo[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                             controller: _mobileController,
                            decoration: InputDecoration(
                              border:InputBorder.none,
                              hintText: 'Mobile Number',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height:10),
                //password textfield
                Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.indigo[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _emailController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border:InputBorder.none,
                              hintText: 'E-mail',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height:10),
                    Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 25),
                     
                      child: Container(
                        
                        decoration: BoxDecoration(
                          color: Colors.indigo[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                             controller: _emailController,
                            decoration: InputDecoration(
                              border:InputBorder.none,
                              hintText: 'Email',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height:10),
                //password textfield
                Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.indigo[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border:InputBorder.none,
                              hintText: 'Password',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height:10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: Registration,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(color:Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                       ),
                      child: Center (
                        child: 
                        Text('Register',
                        style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        ),
                        )
                       
                    ),
                         
                ),
                  )
                ),
                 const SizedBox(height:25),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: Registration,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(color:Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                       ),
                      child: Center (
                        child: 
                        Text('Register',
                        style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        ),
                        )
                       
                    ),
                         
                                  ),
                  )
                ),
                 const SizedBox(height:25),              ],
                ),
          ),
        ),
            ),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:smetasphere/pages/home_page.dart';


class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _comnameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _panController = TextEditingController();
  final _cinController = TextEditingController();

  @override
  void dispose() {
    _fnameController.dispose();
    _lnameController.dispose();
    _comnameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _panController.dispose();
    _cinController.dispose();
    super.dispose();
  }

Future<void> registerUser() async {
  try {
    // Collecting user details
    Map<String, String> userData = {
      "first_name": _fnameController.text.trim(),
      "last_name": _lnameController.text.trim(),
      "company_name": _comnameController.text.trim(),
      "mobile_number": _mobileController.text.trim(),
      "email": _emailController.text.trim(),
      "password": _passwordController.text.trim(),
      "pan": _panController.text.trim(),
      "cin": _cinController.text.trim(),
    };

    // Storing user data in Firestore
    await FirebaseFirestore.instance.collection('registrations').add(userData);

    // Navigating to Home Page or showing a success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Registration Successful!')),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  } catch (e) {
    print("Error: $e");  // Print error in the console
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Registration Failed: $e')),
    );
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color.fromRGBO(26, 35, 126, 1)),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Untitled.png'), // Path to your image
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Metasphere",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Registration",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(height: 50),
                  buildTextField(_fnameController, "First Name"),
                  buildTextField(_lnameController, "Last Name"),
                  buildTextField(_panController, "PAN"),
                  buildTextField(_comnameController, "Company Name"),
                  buildTextField(_mobileController, "Mobile Number"),
                  buildTextField(_emailController, "E-mail"),
                  buildTextField(_passwordController, "Password", isPassword: true),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: registerUser,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String hintText, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo[200],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
            ),
          ),
        ),
      ),
    );
  }
}
