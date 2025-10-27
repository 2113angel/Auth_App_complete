import 'package:flutter/material.dart';
import '../models/user_data.dart';

class ResultDialog extends StatelessWidget {
  final UserData userData;

  const ResultDialog({
    Key? key,
    required this.userData,
  }) : super (key: key);


  static void show(BuildContext context, userData) {
    showDialog(
      context: context,
      builder: (BuildContext context) => ResultDialog(userData: userData),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Form Submitted Successfully'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: userData.toMap().entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8), // fixed syntax here
            child: Text('${entry.key}: ${entry.value}'),
          );
        }).toList(), // convert Iterable to List
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Ok'),
        ),
      ],
    );
  }
}