import 'package:cyclone_v1/features/auth/data/repo/firebase_auth_services.dart';
import 'package:cyclone_v1/features/auth/presenter/screens/sign_in_screen.dart';
import 'package:cyclone_v1/features/home/presenter/screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Center the title text
        title: const Text(
          'Enter Your Details',
          style: TextStyle(color: Colors.black), // Change font color
        ),
        backgroundColor: Colors.transparent, // Make the AppBar transparent
        elevation: 0, 
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {

          },
        ),// Remove the shadow
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // First Name and Last Name in a Row
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      contentPadding: const EdgeInsets.all(16.0),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      contentPadding: const EdgeInsets.all(16.0),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // School Email, Phone Number, and Password
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'School Email',
                contentPadding: const EdgeInsets.all(16.0),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                contentPadding: const EdgeInsets.all(16.0),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                contentPadding: const EdgeInsets.all(16.0),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 32),

            // Sign Up Button
           Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
              onTap: _signUp,
              child: Container(
                margin: const EdgeInsets.only(bottom: 30),
                width: 335,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFF398D1C),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontFamily: "HappyMonkey",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
),
                    ),
                  ),
                ),
              ),
              ),

              
  GestureDetector(
    onTap: () {
       Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
    },
    child: const Center(
      child: Text(
                  'Already a Member? Sign In',
                  style: TextStyle(
                    color: Color.fromARGB(255, 3, 49, 4), // Customize link text color
                    decoration: TextDecoration.underline, // Add underline to the link
                  ),
                ),
    ),
  ),

               const SizedBox(height: 16),


              const Row(
                            children: <Widget>[
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'OR',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),

            const SizedBox(height: 16),

            // Continue with Google
            ElevatedButton.icon(
              onPressed: () {
                // Implement Google sign-in logic here
              },
              icon: Image.asset('assets/images/google.png',
              height: 60,
              width: 33,
              ),
              label: const Text('Continue with Google', style: TextStyle(color: Colors.black),),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                shape: const RoundedRectangleBorder(), // Change button color
                shadowColor: Colors.black,
              ),
            ),

            const SizedBox(height: 16),
            // Continue with Outlook
            ElevatedButton.icon(
              onPressed: () {
                // Implement Outlook sign-in logic here
              },
              icon: Image.asset('assets/images/outlook.png',
              height: 60,
              width: 33,
              ),
              label: const Text('Continue with Outlook', style: TextStyle(color: Colors.black),),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Change button color
                shape: const RoundedRectangleBorder(), // Change button color
                shadowColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }



  void _signUp() async {
    String firstname = _firstNameController.text;
    String email = _emailController.text;
    String lastname = _lastNameController.text;
    String phonenumber = _phoneNumberController.text;
    String password = _passwordController.text;


    User? user = await _auth.signUpWithEmailAndPAssword(email, password);

    if (user != null) {
      // ignore: avoid_print
      print("User successfully crested");
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, const HomePage() as String);
    } else {
      // ignore: avoid_print
      print("An error occured signing up user");
    }


  }
}
