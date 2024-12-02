import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String userType = 'Student';
  bool agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        title: Text('Sign up'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        userType = 'Student';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Add rounded corners
                      ),
                      backgroundColor: userType == 'Student'
                          ? Colors.indigo
                          : const Color.fromARGB(255, 255, 255, 255),
                      foregroundColor:
                          userType == 'Student' ? Colors.white : Colors.black,
                    ),
                    child: Text('As Student'),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        userType = 'Instructor';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Add rounded corners
                      ),
                      backgroundColor: userType == 'Instructor'
                          ? Colors.indigo
                          : const Color.fromARGB(255, 255, 255, 255),
                      foregroundColor: userType == 'Instructor'
                          ? Colors.white
                          : Colors.black,
                    ),
                    child: Text('As Instructor'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Mohammed Aref',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: '3aref@gmail.com',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone',
                prefix: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text('US'),
                ),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Date of Birth',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: () {
                // Show date picker
              },
            ),
            SizedBox(height: 16),
            DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(),
              ),
              items: ['Male', 'Female', 'Other']
                  .map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      ))
                  .toList(),
              onChanged: (value) {},
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'CV',
                hintText: 'Attach your file here',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.attach_file),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.visibility),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.visibility),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: agreeToTerms,
                  onChanged: (value) {
                    setState(() {
                      agreeToTerms = value!;
                    });
                  },
                ),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: 'Agree with ',
                      children: [
                        TextSpan(
                          text: 'terms & Conditions',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: agreeToTerms ? () {} : null,
              child: Center(child: Text('Sign up')),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () {},
                child: Text('Already have an account? Sign in'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
