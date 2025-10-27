import 'package:flutter/material.dart';
import '../models/user_data.dart';
import '../widgets/form_fields.dart';
import '../widgets/result_dialog.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();

}
class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController= TextEditingController();
  String _selectedGender = 'Male';


  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }


  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final userData = UserData.fromControllers(
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        gender: _selectedGender,
      );
      ResultDialog.show(context, userData);
    }
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'please enter your name';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'please enter your email';
    }
    if (!value.contains('@')) {
      return 'please enter your valid email';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'please enter your phone number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Registration Form'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextFormField(
                  controller: _nameController,
                  labelText: 'Full Name',
                  prefixIcon: Icons.person,
                  validator: _validateName)
  ],
    )

    )
    )
    );
  }
}