import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'dart:convert';
import '../SpecialWidgets/SpecialWidgets.dart';

class IntershipApp extends StatefulWidget {
  const IntershipApp({super.key});

  @override
  State<IntershipApp> createState() => _IntershipAppState();
}

class _IntershipAppState extends State<IntershipApp> {

  bool isSearchResults = false;
  bool isLoading = false;
  List<Map<String, dynamic>> searchResults = [];

  final departmentController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final languageController = TextEditingController();

  Future<void> searchJobs() async {
    final response = await http.get(
      Uri.parse(
        'https://jsearch.p.rapidapi.com/search?query=${departmentController.text}%20in%20${cityController.text},%20${countryController.text}&employment_types=INTERN&date_posted=month&num_pages=1',
      ),
      headers: {
        'X-RapidAPI-Key': 'YOUR_API_KEY_HERE',
        'X-RapidAPI-Host': 'jsearch.p.rapidapi.com',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final jobs = data['data'];

      setState(() {
        isLoading = false;
        isSearchResults = true;
        searchResults = List<Map<String, dynamic>>.from(jobs);  
        });

    } else {
      setState(() {
        isLoading = false;
      });

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Error'),
          content: Text('Could not fetch jobs. Status code: ${response.statusCode}'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text('OK')),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
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
                          child: Theme (
                            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                            leading: Icon(Icons.work_rounded, color: Colors.blueAccent),
                            title: buildResultExpansion(searchResults[index]['job_title'], screenWidth),
                            subtitle: buildResultExpansion(searchResults[index]['job_title'], screenWidth * 0.85),
                            children: [
                              buildResultExpansion('Publisher: ${searchResults[index]['job_publisher']}', screenWidth),
                              TextButton(
                                onPressed: () async {
                                  final link = searchResults[index]['job_apply_link'];

                                  if (link == null || link.toString().isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Application link not found')),
                                    );
                                  return;
                                  }

                                  final successUrlLink = link.toString();
                                  final succes = await launchUrlString(successUrlLink, mode: LaunchMode.externalApplication);
                                  if (!succes) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Application link not found')),
                                    );
                                  }
                                },
                                child: buildResultExpansion("Apply", screenWidth),
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.blueAccent,
                                    foregroundColor: Color.fromARGB(232, 255, 255, 255),
                                    textStyle: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                              ),
                              
                            ]
                          ),
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
                    SizedBox(height: screenHeight * 0.0045),
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
                          buildLabel('Which country are you looking for an internship in? (de,us,fr...)(Default = us)', screenWidth),
                          buildTextField(countryController, Icons.location_on_rounded, screenWidth, screenHeight, 57),
                          buildLabel('Which city are you looking for an internship in?(Optional)', screenWidth),
                          buildTextField(cityController, Icons.location_city_rounded, screenWidth, screenHeight, 168),
                          buildLabel('Which language are you looking for an internship in?(en,de,fr...)(Default = en)', screenWidth),
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
                          onPressed: () async {
                            if (departmentController.text.isEmpty) {
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

                              await searchJobs();

                              setState(() {
                                isLoading = false;
                                isSearchResults = true;
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
