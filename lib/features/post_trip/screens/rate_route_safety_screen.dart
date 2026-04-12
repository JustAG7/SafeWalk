import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';
import '../mock/post_trip_mock_data.dart';

class RateRouteSafetyScreen extends StatefulWidget {
  const RateRouteSafetyScreen({super.key});

  @override
  State<RateRouteSafetyScreen> createState() => _RateRouteSafetyScreenState();
}

class _RateRouteSafetyScreenState extends State<RateRouteSafetyScreen> {
  int _rating = 3;
  final Set<String> _selectedTags = {'Well Lit', 'Safe Path'};
  final TextEditingController _notesController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    setState(() => _isSubmitting = true);
    await Future<void>.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;
    setState(() => _isSubmitting = false);

    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Feedback submitted',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.trustNavy,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Saved $_rating/5 with ${_selectedTags.length} route tags for this trip.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.45,
                    ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    this.context.go('/post-trip/trip-summary');
                  },
                  child: const Text('Open Trip Summary'),
                ),
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
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => context.go('/post-trip/notify-contacts'),
                    icon: const Icon(Icons.close_rounded, color: AppColors.trustNavy),
                  ),
                  Expanded(
                    child: Text(
                      'SafeWalk',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: AppColors.trustNavy,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 14,
                    backgroundColor: Color(0xFFEAD3B8),
                    child: Icon(Icons.person, size: 14, color: AppColors.trustNavy),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 12),
                  children: [
                    Container(
                      height: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF5D6C7D), Color(0xFF102B45)],
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.route_outlined,
                          color: Colors.white70,
                          size: 40,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'How was your route?',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: AppColors.trustNavy,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Your feedback helps Guardian AI improve safety paths for everyone.',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (var i = 1; i <= 5; i++) ...[
                                InkWell(
                                  onTap: () => setState(() => _rating = i),
                                  borderRadius: BorderRadius.circular(999),
                                  child: Icon(
                                    i <= _rating
                                        ? Icons.star_rounded
                                        : Icons.star_outline_rounded,
                                    color: i <= _rating
                                        ? AppColors.trustNavy
                                        : const Color(0xFFB8C6D8),
                                    size: 34,
                                  ),
                                ),
                                if (i != 5) const SizedBox(width: 6),
                              ],
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Rating: $_rating/5',
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: AppColors.textMuted,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'ROUTE DETAILS',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: AppColors.textMuted,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        for (final tag in kPostTripRouteTags)
                          _Tag(
                            text: tag,
                            selected: _selectedTags.contains(tag),
                            onTap: () => setState(() {
                              if (_selectedTags.contains(tag)) {
                                _selectedTags.remove(tag);
                              } else {
                                _selectedTags.add(tag);
                              }
                            }),
                          ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'ANYTHING ELSE WE SHOULD KNOW?',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: AppColors.textMuted,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: TextField(
                        controller: _notesController,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          hintText: 'Type your experience here...',
                          border: InputBorder.none,
                          isCollapsed: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  onPressed: _isSubmitting ? null : _submit,
                  child: _isSubmitting
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Submit Feedback'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({required this.text, this.selected = false, this.onTap});

  final String text;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.trustNavy : const Color(0xFFEFF3FB),
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: selected ? Colors.white : AppColors.textSecondary,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
      ),
    );
  }
}
