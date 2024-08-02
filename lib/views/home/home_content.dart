import 'package:chatbot/componant/message_componant.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';

import '../../componant/imgComponant.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../../utils/text.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final TextEditingController _userInput = TextEditingController();

  static const apiKey = api2;

  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

  final List<Message> _messages = [];

  void sendMessage() async {
    final message = _userInput.text.trim();

    if (message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a question.'),
        ),
      );
      return;
    }

    setState(() {
      _messages
          .add(Message(isUser: true, message: message, date: DateTime.now()));
    });

    final content = [Content.text(message)];
    final response = await model.generateContent(content);

    setState(() {
      _messages.add(Message(
          isUser: false, message: response.text ?? "", date: DateTime.now()));
    });

    // Clear the text field after sending the message
    _userInput.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const imgComponant(
                      width: double.infinity, height: 200, img: onboarding),
                  const SizedBox(height: 20),
                  const Text(
                    hello,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    whatInYourMind,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  ..._messages.map((message) {
                    return Messages(
                      isUser: message.isUser,
                      message: message.message,
                      date: DateFormat('HH:mm').format(message.date),
                    );
                  }).toList(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 15,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: _userInput,
                    decoration: InputDecoration(
                      hintText: "write your message here",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  padding: const EdgeInsets.all(12),
                  iconSize: 30,
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(secondaryPrimaryColor),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    shape: WidgetStateProperty.all(const CircleBorder()),
                  ),
                  onPressed: () {
                    sendMessage();
                    // Clear the text field after sending the message
                    _userInput.clear();
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final bool isUser;
  final String message;
  final DateTime date;

  Message({required this.isUser, required this.message, required this.date});
}
