import 'package:flutter/material.dart';

typedef MyValidator = String? Function(String?);

class MyCustomTextField extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final bool obscureText;
  final bool showIcon;
  final TextInputType keyboardType;
  final MyValidator validator;
  final TextEditingController controller;

  const MyCustomTextField({
    required this.icon,
    required this.hintText,
    required this.validator,
    required this.controller,
    this.obscureText = false,
    this.showIcon = true,
    this.keyboardType = TextInputType.text,
  });

  @override
  _MyCustomTextFieldState createState() => _MyCustomTextFieldState();
}

class _MyCustomTextFieldState extends State<MyCustomTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
    _obscureText = widget.obscureText;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      focusNode: _focusNode,
      obscureText: _obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 0.02,
            color: _isFocused ? Color(0xFF49919D) : Colors.grey,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: widget.showIcon
            ? Icon(
                widget.icon,
                color: _isFocused ? Colors.blue : Colors.grey,
              )
            : null,
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
              )
            : null,
      ),
    );
  }
}
