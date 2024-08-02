import 'package:chatbot/componant/imgComponant.dart';
import 'package:chatbot/componant/message_componant.dart';
import 'package:chatbot/utils/colors.dart';
import 'package:chatbot/utils/images.dart';
import 'package:chatbot/utils/text.dart';
import 'package:chatbot/views/chatbot/ChatView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  TextEditingController _userInput = TextEditingController();

  static const apiKey = api2;

  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

  final List<Message> _messages = [];

  void sendMessage() async {
    final message = _userInput.text.trim();

    if (message.isEmpty) {
      // Show a snackbar to enter a question
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
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
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(appBar),
      ),
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 60),
          const imgComponant(width: 75, height: 75, img: robot),
          const SizedBox(height: 20),
          const Text(
            hello,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          const Text(
            whatInYourMind,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 75),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Messages(
                  isUser: message.isUser,
                  message: message.message,
                  date: DateFormat('HH:mm').format(message.date),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 15,
                  child: TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: _userInput,
                    decoration: InputDecoration(
                      hintText: "write your message here",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                IconButton(
                  padding: EdgeInsets.all(12),
                  iconSize: 30,
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(secondaryPrimaryColor),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    shape: WidgetStateProperty.all(CircleBorder()),
                  ),
                  onPressed: () {
                    sendMessage();
                    // Clear the text field after sending the message
                    _userInput.clear();
                  },
                  icon: Icon(Icons.send),
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
