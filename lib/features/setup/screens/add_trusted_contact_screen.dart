import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/setup_screen_frame.dart';

class AddTrustedContactScreen extends StatefulWidget {
  const AddTrustedContactScreen({super.key});

  @override
  State<AddTrustedContactScreen> createState() => _AddTrustedContactScreenState();
}

class _AddTrustedContactScreenState extends State<AddTrustedContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  String? _relationship = 'Friend';
  bool _isSaving = false;

  static const _relationships = [
    'Family',
    'Friend',
    'Partner',
    'Coworker',
    'Roommate',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);
    await Future<void>.delayed(const Duration(milliseconds: 550));
    if (!mounted) return;
    setState(() => _isSaving = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${_nameController.text} added to trusted contacts.')),
    );
    context.go('/setup/contacts');
  }

  Future<void> _cancel() async {
    final shouldLeave = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Discard this contact?'),
        content: const Text('Your draft contact will be lost if you leave now.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Keep editing'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Discard'),
          ),
        ],
      ),
    );
    if (shouldLeave == true && mounted) {
      context.go('/setup/contacts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SetupScreenFrame(
      stepLabel: 'Add contact',
      title: 'Add a trusted contact',
      subtitle:
          'Capture the information SafeWalk needs to share trips and alert this person if needed.',
      icon: Icons.person_add_alt_1_outlined,
      primaryLabel: _isSaving ? 'Saving...' : 'Save contact',
      onPrimaryPressed: _isSaving ? null : _save,
      secondaryLabel: 'Cancel',
      onSecondaryPressed: _cancel,
      footer: Text(
        'This creates a contact for your guardian list. No alerts will be sent from this screen.',
        style: Theme.of(context).textTheme.bodySmall,
        textAlign: TextAlign.center,
      ),
      children: [
        SetupCard(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _ContactField(
                  controller: _nameController,
                  label: 'Name',
                  hint: 'Full name',
                  validator: (value) {
                    if (value == null || value.trim().length < 2) {
                      return 'Enter a valid name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                _ContactField(
                  controller: _phoneController,
                  label: 'Phone',
                  hint: '+66 000 000 000',
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.trim().length < 10) {
                      return 'Enter a phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: _relationship,
                  items: _relationships
                      .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                      .toList(),
                  decoration: const InputDecoration(labelText: 'Relationship'),
                  onChanged: (value) => setState(() => _relationship = value),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ContactField extends StatelessWidget {
  const _ContactField({
    required this.controller,
    required this.label,
    required this.hint,
    this.keyboardType,
    this.validator,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
    );
  }
}
