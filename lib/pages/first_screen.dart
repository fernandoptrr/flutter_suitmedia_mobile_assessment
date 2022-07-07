import 'package:flutter/material.dart';
import 'package:flutter_suitmedia_mobile_assessment/components/custom_button.dart';
import 'package:flutter_suitmedia_mobile_assessment/components/custom_text_field.dart';
import 'package:flutter_suitmedia_mobile_assessment/pages/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  static const nameRoute = '/';

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _palindromeController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _palindromeController.dispose();
    super.dispose();
  }

  bool _isPanlindrome(String word) {
    // for (int i = 0; i < word.length ~/ 2; i++) {
    //   if (word[i] != word[word.length - i - 1]) return false;
    // }
    // return true;
    for (int i = word.length - 1, j = 0; i >= word.length ~/ 2; i--, j++) {
      if (word[i] != word[j]) return false;
    }
    return true;
  }

  Future<void> _showPalindromeResultDialog(bool isPalindrome) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isPalindrome ? 'isPalindrome' : 'not palindrome'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    foregroundImage: AssetImage("assets/images/ic_photo.png"),
                    radius: 58,
                  ),
                  const SizedBox(height: 58),
                  CustomTextField(
                    controller: _nameController,
                    hintText: "Name",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Name cannot be empty.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 22),
                  CustomTextField(
                      controller: _palindromeController,
                      hintText: "Palindrome"),
                  const SizedBox(height: 45),
                  CustomButton(
                    hintText: "CHECK",
                    onTapped: () {
                      if (_palindromeController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Palindrome cannot be empty'),
                            duration: Duration(milliseconds: 1200),
                          ),
                        );
                      } else {
                        _showPalindromeResultDialog(
                            _isPanlindrome(_palindromeController.text));
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomButton(
                    hintText: "NEXT",
                    onTapped: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, SecondPage.nameRoute,
                            arguments: _nameController.text);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Please enter your name'),
                              duration: Duration(milliseconds: 1200)),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
