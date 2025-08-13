import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntershipApp extends StatefulWidget {
  const IntershipApp({super.key});

  @override
  State<IntershipApp> createState() => _IntershipAppState();
}

class _IntershipAppState extends State<IntershipApp> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenHeight * 0.003),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child:
                Text('Intership App',
                style: TextStyle(
                fontSize: screenWidth * 0.07, 
                fontWeight: FontWeight.bold, 
                color: const Color.fromARGB(232, 255, 255, 255),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

          SizedBox(height: screenHeight * 0.02),

          Center(
            child: Text(
              'Welcome to the Intership App! \n Our platform connects students with internship opportunities across various industries.',
              style: TextStyle(fontSize: screenWidth * 0.030, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: screenHeight * 0.60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(height: screenHeight * 0.055),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Text(
                    'Which department are you looking for an internship in?',
                    style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: screenHeight * 0.007),
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: TextField(
                    maxLength: 64,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'[0-9]'))
                    ],
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.business_rounded),
                      contentPadding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                      hintText: 'Search department...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)
                      ),
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.010),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Text(
                    'Which country are you looking for an internship in?',
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: screenHeight * 0.007),
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: TextField(
                    maxLength: 57,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'[0-9]'))
                    ],
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on_rounded),
                      contentPadding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                      hintText: 'Search country...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)
                      ),
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.010),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Text(
                    'Which city are you looking for an internship in?',
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: screenHeight * 0.007),
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: TextField(
                    maxLength: 168,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'[0-9]'))
                    ],
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_city_rounded),
                      contentPadding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                      hintText: 'Search city...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)
                      ),
                    ),
                  ),
                ),
              
                SizedBox(height: screenHeight * 0.010),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Text(
                    'Which language are you looking for an internship in?',
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: screenHeight * 0.007),
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: TextField(
                    maxLength: 46,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'[0-9]'))
                    ],
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.language_rounded),
                      contentPadding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                      hintText: 'Search language...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)
                      ),
                    ),
                  ),
                ),
              
                SizedBox(height: screenHeight * 0.010)

              ],
            )
          ),
          Center(
            child: Text(
              'Explore various internship opportunities.',
              style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
          ),
          
          SizedBox(height: screenHeight * 0.02),
          Center(
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06, vertical: screenHeight * 0.02),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
              ),
              onPressed: null, 
              child: Text(
                'Seach Internships',
                style: 
                  TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.05, 
                    color: const Color.fromARGB(232, 255, 255, 255),
                ),
              ),
            ),
          ),
        
          BottomAppBar(
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.021),
              child: Text(
                '© 2025 Intership App. All rights reserved.',
                style: TextStyle(fontSize: screenWidth * 0.03),
              ),
            ),
          ),
        
        ],
      ),
    );
  }
}