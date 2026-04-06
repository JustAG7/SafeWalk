import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/widgets/page_scaffold.dart';

class TrustedContactsListScreen extends StatelessWidget {
  const TrustedContactsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Trusted Contacts',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16),
              const ListTile(title: Text('Sarah Jenkins'), subtitle: Text('Mobile guardian')),
              const ListTile(title: Text('David Miller'), subtitle: Text('Work guardian')),
              const Spacer(),
              FilledButton(
                onPressed: () => context.go('/setup/address/home'),
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
