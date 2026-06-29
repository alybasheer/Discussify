import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:discussify/user/presentation/controller/user_cntrl.dart';
import 'package:discussify/user/presentation/widgets/user_list_widget.dart';
import 'package:discussify/user/presentation/widgets/bottom_action_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: UserListWidget(controller: controller),
      bottomNavigationBar: BottomActionBar(
        onCreateUserPressed: _showCreateUserDialog,
        onThoughtPressed: _showThoughtDialog,
      ),
    );
  }

  void _showCreateUserDialog() {
    Get.defaultDialog(
      title: 'Create User',
      content: CreateUserDialogContent(controller: controller),
      confirm: ElevatedButton(
        onPressed: Get.back,
        child: const Text('Close'),
      ),
    );
  }

  void _showThoughtDialog() {
    Get.snackbar(
      'Thought',
      'Thought feature coming soon!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

class CreateUserDialogContent extends StatefulWidget {
  final UserController controller;

  const CreateUserDialogContent({
    super.key,
    required this.controller,
  });

  @override
  State<CreateUserDialogContent> createState() =>
      _CreateUserDialogContentState();
}

class _CreateUserDialogContentState extends State<CreateUserDialogContent> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: fullNameController,
            decoration: InputDecoration(
              labelText: 'Full Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an email';
              }
              if (!GetUtils.isEmail(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.controller.createUser(
                  email: emailController.text,
                  fullName: fullNameController.text,
                );
                Get.back();
              }
            },
            child: const Text('Create User'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    fullNameController.dispose();
    super.dispose();
  }
}
