import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../SpecialWidgets/SpecialWidgets.dart';

class IntershipApp extends StatefulWidget {
  const IntershipApp({super.key});

  @override
  State<IntershipApp> createState() => _IntershipAppState();
}

class _IntershipAppState extends State<IntershipApp> {
  bool isSearchResults = false;
  bool isLoading = false;
  List<String> searchResults = [];

  final departmentController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final languageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            child: Text(
              'Intership App',
              style: TextStyle(
                fontSize: screenWidth * 0.07,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(232, 255, 255, 255),
              ),
            ),
          ),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : isSearchResults
              ? Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: searchResults.length,
                        itemBuilder: (_, index) => Card(
                          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.01),
                          elevation: 3,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          child: ListTile(
                            leading: Icon(Icons.work, color: Colors.blueAccent),
                            title: Text(searchResults[index]),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: screenWidth * 0.7,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.grey[300],
                            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
                          ),
                          onPressed: () {
                            setState(() {
                              isSearchResults = false;
                              searchResults.clear();
                            });
                          },
                          child: Text(
                            '← Back to Search',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.05,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                  ],
                )
              : Column(
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
                          buildLabel('Which department are you looking for an internship in?', screenWidth),
                          buildTextField(departmentController, Icons.business_rounded, screenWidth, screenHeight, 64),
                          buildLabel('Which country are you looking for an internship in?', screenWidth),
                          buildTextField(countryController, Icons.location_on_rounded, screenWidth, screenHeight, 57),
                          buildLabel('Which city are you looking for an internship in?', screenWidth),
                          buildTextField(cityController, Icons.location_city_rounded, screenWidth, screenHeight, 168),
                          buildLabel('Which language are you looking for an internship in?', screenWidth),
                          buildTextField(languageController, Icons.language_rounded, screenWidth, screenHeight, 46),
                        ],
                      ),
                    ),
                    Center(
                      child: Text(
                        'Explore various internship opportunities.',
                        style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: screenWidth * 0.7,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
                          ),
                          onPressed: () {
                            if (departmentController.text.isEmpty ||
                                countryController.text.isEmpty ||
                                cityController.text.isEmpty ||
                                languageController.text.isEmpty) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    title: Text('Missing Information'),
                                    content: Text('Please fill in all fields before searching.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.of(context).pop(),
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              setState(() {
                                isLoading = true;
                              });

                              Future.delayed(Duration(seconds: 5), () {
                                setState(() {
                                  isLoading = false;
                                  isSearchResults = true;
                                  searchResults = [
                                    'Internship 1 in ${departmentController.text}, ${countryController.text}, ${cityController.text}, ${languageController.text}',
                                    'Internship 2 in ${departmentController.text}, ${countryController.text}, ${cityController.text}, ${languageController.text}',
                                  ];
                                });
                              });
                            }
                          },
                          child: Text(
                            'Search Internships',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.05,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.021),
          child: Text(
            '© 2025 Intership App. All rights reserved.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: screenWidth * 0.03),
          ),
        ),
      ),
    );
  }
}
