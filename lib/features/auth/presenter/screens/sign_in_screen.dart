import 'package:cyclone_v1/features/auth/presenter/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Center the title text
        title: const Text(
          'Log In',
          style: TextStyle(color: Colors.black), // Change font color
        ),
        backgroundColor: Colors.transparent, // Make the AppBar transparent
        elevation: 0, 
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),// Remove the shadow
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset('assets/images/onboarding/cocylce.png'),
            ),
                        const SizedBox(height: 16),
            TextFormField(
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
              onTap: () {

              },
              
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
                    "Log In",
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
       Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
    },
    child: const Center(
      child: Text(
                  'Not a Member? Sign Up',
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
              label: const Text('Login with Google', style: TextStyle(color: Colors.black),),
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
              label: const Text('Login with Outlook', style: TextStyle(color: Colors.black),),
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
}
