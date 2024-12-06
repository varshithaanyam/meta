import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignupPage({
    Key? key,
   required this.showLoginPage}): super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
   final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  
  
  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  Future Signup() async {
    if(passwordConfirmed()){
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(), 
      password: _passwordController.text.trim(),
      );
      
    }
    // firestore.collection("Users").doc(UserCredential.user!.uid).set(
    //   {
    //     'uid':UserCredential.user!.uid,
    //     'email':email,
    //   },
    // );
    
  }
  bool passwordConfirmed(){
    if(_passwordController.text.trim()==_confirmpasswordController.text.trim()){
      return true;
    }
    else{
      return false;
    }
    
  }
  
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
      
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
                  "Signup",
                  style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                  ),
                  const  SizedBox(height:50),
                    //email text field
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
                            controller: _confirmpasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border:InputBorder.none,
                              hintText: 'Confirm Password',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height:10),
                //login button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: Signup,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(color:Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                       ),
                      child: Center (
                        child: 
                        Text('Signup',
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
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text('Already a user?',style: TextStyle(
                      fontWeight: FontWeight.bold
                     ),),
                     GestureDetector(
                      onTap: widget.showLoginPage,
                       child: Text(' Login',style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                       ),
                       ),
                     ),
                   ],
                 ),
              ],
                ),
          ),
        ),
            ),
      ),
      );
  }
}
