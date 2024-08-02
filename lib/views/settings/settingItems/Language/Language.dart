import 'package:flutter/material.dart';
import 'package:chatbot/utils/colors.dart';
import 'package:chatbot/utils/text.dart';

import '../../../../componant/language_list_item.dart';
import '../../../../utils/data.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  int? selectedIndex;
  late List<String> filteredLanguageNames;
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    filteredLanguageNames = languageNames;
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text(AppLanguage),
        backgroundColor: primaryColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: double.infinity, // Set the desired width
              height: 45, // Set the desired height
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: search, // Assuming search is a string variable
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    filteredLanguageNames = languageNames
                        .where((language) => language
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredLanguageNames.length,
              itemBuilder: (context, index) {
                return LanguageListItem(
                  languageName: filteredLanguageNames[index],
                  languageImage: languageImages[index],
                  index: index,
                  isChecked: selectedIndex == index,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
