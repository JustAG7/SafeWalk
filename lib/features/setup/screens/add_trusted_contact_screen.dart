import 'package:flutter/material.dart';

import '../widgets/setup_screen_frame.dart';

class AddTrustedContactScreen extends StatelessWidget {
  const AddTrustedContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SetupScreenFrame(
      stepLabel: 'Add contact',
      title: 'Add a trusted contact',
      subtitle:
          'Capture the information SafeWalk needs to share trips and alert this person if needed.',
      icon: Icons.person_add_alt_1_outlined,
      primaryLabel: 'Save contact',
      onPrimaryPressed: () {},
      secondaryLabel: 'Cancel',
      onSecondaryPressed: () {},
      children: const [
        SetupCard(
          child: Column(
            children: [
              _ContactField(label: 'Name', hint: 'Full name'),
              SizedBox(height: 12),
              _ContactField(label: 'Phone', hint: '+66 000 000 000'),
              SizedBox(height: 12),
              _ContactField(label: 'Relationship', hint: 'Family, friend, partner'),
            ],
          ),
        ),
      ],
    );
  }
}

class _ContactField extends StatelessWidget {
  const _ContactField({required this.label, required this.hint});

  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: false,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
    );
  }
}
