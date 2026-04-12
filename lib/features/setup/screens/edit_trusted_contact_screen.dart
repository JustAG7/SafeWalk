import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';

class EditTrustedContactScreen extends StatefulWidget {
  const EditTrustedContactScreen({super.key});

  @override
  State<EditTrustedContactScreen> createState() => _EditTrustedContactScreenState();
}

class _EditTrustedContactScreenState extends State<EditTrustedContactScreen> {
  bool _notifyOnTripStart = true;
  bool _notifyOnArrival = true;
  bool _priority = true;

  void _save() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Trusted contact preferences updated.')),
    );
    context.go('/setup/contacts');
  }

  Future<void> _removeContact() async {
    final shouldRemove = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Sarah Miller?'),
        content: const Text(
          'She will stop receiving trip updates and emergency alerts in this safety flow.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Keep contact'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Remove'),
          ),
        ],
      ),
    );

    if (shouldRemove == true && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Contact removed from the setup flow.')),
      );
      context.go('/setup/contacts');
    }
  }

  void _showAvatarSheet() {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact image',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.trustNavy,
                    ),
              ),
              const SizedBox(height: 8),
              const Text(
                'This keeps the current portrait for now. In a future update this is where you would update the contact photo.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => context.go('/setup/contacts'),
                        icon: const Icon(Icons.arrow_back_rounded),
                      ),
                      Text(
                        'Edit Contact',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.trustNavy,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: _save,
                        child: const Text('SAVE'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 104,
                          height: 104,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.skyBlue, width: 3),
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400&q=80',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 4,
                          bottom: 2,
                          child: GestureDetector(
                            onTap: _showAvatarSheet,
                            child: Container(
                              width: 28,
                              height: 28,
                              decoration: const BoxDecoration(
                                color: AppColors.trustNavy,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.edit_rounded,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Sarah Miller',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.trustNavy,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'TRUSTED GUARDIAN',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: AppColors.textMuted,
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _PermissionBlock(
                    title: 'NOTIFICATION PERMISSIONS',
                    children: [
                      _ToggleRow(
                        title: 'Notify on Trip Start',
                        subtitle: 'Automatic alert when you begin a walk',
                        value: _notifyOnTripStart,
                        activeColor: AppColors.skyBlue,
                        onChanged: (value) =>
                            setState(() => _notifyOnTripStart = value),
                      ),
                      const SizedBox(height: 18),
                      _ToggleRow(
                        title: 'Notify on Arrival',
                        subtitle: 'Send confirmation once you reach destination',
                        value: _notifyOnArrival,
                        activeColor: AppColors.skyBlue,
                        onChanged: (value) =>
                            setState(() => _notifyOnArrival = value),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _PriorityBlock(
                    value: _priority,
                    onChanged: (value) => setState(() => _priority = value),
                  ),
                  const SizedBox(height: 22),
                  SizedBox(
                    height: 54,
                    child: OutlinedButton.icon(
                      onPressed: _removeContact,
                      icon: const Icon(
                        Icons.person_remove_alt_1_outlined,
                        color: AppColors.emergencyRed,
                      ),
                      label: const Text(
                        'Remove Contact',
                        style: TextStyle(color: AppColors.emergencyRed),
                      ),
                    ),
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

class _PermissionBlock extends StatelessWidget {
  const _PermissionBlock({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.textMuted,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.7,
                ),
          ),
          const SizedBox(height: 14),
          ...children,
        ],
      ),
    );
  }
}

class _PriorityBlock extends StatelessWidget {
  const _PriorityBlock({required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF4F4),
        borderRadius: BorderRadius.circular(24),
      ),
      child: _ToggleRow(
        title: 'Emergency Call Priority',
        subtitle: 'Sarah will be first in SOS rotation',
        value: value,
        activeColor: AppColors.emergencyRed,
        onChanged: onChanged,
      ),
    );
  }
}

class _ToggleRow extends StatelessWidget {
  const _ToggleRow({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.activeColor,
    required this.onChanged,
  });

  final String title;
  final String subtitle;
  final bool value;
  final Color activeColor;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.35,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: activeColor,
        ),
      ],
    );
  }
}
