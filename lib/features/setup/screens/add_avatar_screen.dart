import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../mock/setup_mock_data.dart';
import '../models/avatar_option.dart';
import '../../../shared/widgets/page_scaffold.dart';

class AddAvatarScreen extends StatefulWidget {
  const AddAvatarScreen({super.key});

  @override
  State<AddAvatarScreen> createState() => _AddAvatarScreenState();
}

class _AddAvatarScreenState extends State<AddAvatarScreen> {
  AvatarOption? _selectedAvatar;
  bool _isSubmitting = false;

  Future<void> _pickAvatar(AvatarOption option) async {
    setState(() => _selectedAvatar = option);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${option.title} selected for demo mode.')),
    );
  }

  Future<void> _continue() async {
    if (_selectedAvatar == null) {
      final shouldSkip = await showModalBottomSheet<bool>(
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
                  'Skip photo for now?',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.trustNavy,
                      ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'You can still move on using a placeholder avatar and update it later from settings.',
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('Keep editing'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('Skip'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
      if (shouldSkip != true || !mounted) return;
      context.go('/setup/contacts');
      return;
    }

    setState(() => _isSubmitting = true);
    await Future<void>.delayed(const Duration(milliseconds: 450));
    if (!mounted) return;
    setState(() => _isSubmitting = false);
    context.go('/setup/contacts');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 430,
                    minHeight: constraints.maxHeight,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => context.go('/setup/profile'),
                        icon: const Icon(Icons.arrow_back_rounded),
                      ),
                      const Spacer(),
                      Text(
                        'STEP 2 OF 4',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: AppColors.textMuted,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const _MiniProgress(active: 2, total: 4),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'Add your photo',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.trustNavy,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'This helps your guardians and emergency services identify you quickly.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 34),
                  Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          width: 170,
                          height: 170,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _selectedAvatar?.color.withValues(alpha: 0.15),
                            border: Border.all(
                              color: _selectedAvatar == null
                                  ? AppColors.outline
                                  : _selectedAvatar!.color,
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            _selectedAvatar?.icon ?? Icons.person_outline_rounded,
                            size: 58,
                            color: _selectedAvatar?.color ?? AppColors.textMuted,
                          ),
                        ),
                        Positioned(
                          right: 8,
                          bottom: 8,
                          child: GestureDetector(
                            onTap: () => _pickAvatar(kSetupAvatarOptions.first),
                            child: Container(
                              width: 46,
                              height: 46,
                              decoration: BoxDecoration(
                                color: AppColors.trustNavy,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.trustNavy.withValues(alpha: 0.2),
                                    blurRadius: 16,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  for (final option in kSetupAvatarOptions) ...[
                    _AvatarActionTile(
                      option: option,
                      selected: _selectedAvatar?.id == option.id,
                      onTap: () => _pickAvatar(option),
                    ),
                    if (option != kSetupAvatarOptions.last)
                      const SizedBox(height: 12),
                  ],
                  const SizedBox(height: 26),
                  SizedBox(
                    height: 54,
                    child: FilledButton(
                      onPressed: _isSubmitting ? null : _continue,
                      child: _isSubmitting
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(_selectedAvatar == null ? 'Continue' : 'Use ${_selectedAvatar!.title}'),
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextButton(
                    onPressed: () => context.go('/setup/contacts'),
                    child: const Text('Skip for now'),
                  ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _AvatarActionTile extends StatelessWidget {
  const _AvatarActionTile({
    required this.option,
    required this.selected,
    required this.onTap,
  });

  final AvatarOption option;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Ink(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: selected ? option.color : AppColors.outlineVariant,
              width: selected ? 1.5 : 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: option.color.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(option.icon, color: option.color),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      option.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      option.subtitle,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
              Icon(
                selected ? Icons.check_circle_rounded : Icons.arrow_forward_ios_rounded,
                size: selected ? 20 : 16,
                color: selected ? option.color : AppColors.textMuted,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MiniProgress extends StatelessWidget {
  const _MiniProgress({required this.active, required this.total});

  final int active;
  final int total;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 52,
      child: Row(
        children: List.generate(total, (index) {
          return Expanded(
            child: Container(
              height: 4,
              margin: EdgeInsets.only(right: index == total - 1 ? 0 : 4),
              decoration: BoxDecoration(
                color: index < active ? AppColors.skyBlue : AppColors.outlineVariant,
                borderRadius: BorderRadius.circular(999),
              ),
            ),
          );
        }),
      ),
    );
  }
}

