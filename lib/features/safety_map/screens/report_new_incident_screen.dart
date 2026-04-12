import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';
import '../mock/safety_map_mock_data.dart';

class ReportNewIncidentScreen extends StatefulWidget {
  const ReportNewIncidentScreen({super.key});

  @override
  State<ReportNewIncidentScreen> createState() => _ReportNewIncidentScreenState();
}

class _ReportNewIncidentScreenState extends State<ReportNewIncidentScreen> {
  final TextEditingController _descriptionController = TextEditingController();
  String _selectedIncidentType = 'suspicious';
  bool _includePhoto = true;
  String _selectedLocation = 'Valencia St & 16th St, San Francisco';

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  void _showLocationPicker() {
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
                'Choose incident location',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.trustNavy,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 10),
              for (final suggestion in kSafetyMapSearchSuggestions)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.place_outlined),
                  title: Text(suggestion),
                  onTap: () {
                    setState(() => _selectedLocation = suggestion);
                    Navigator.of(context).pop();
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    context.go('/safety-map/report-confirmation');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => context.go('/safety-map/main'),
                    icon: const Icon(Icons.close_rounded, color: AppColors.trustNavy),
                  ),
                  Expanded(
                    child: Text(
                      'SAFEWALK',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: AppColors.trustNavy,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: _showLocationPicker,
                    child: const Text('Location'),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 10),
                  children: [
                    Text(
                      'SAFETY REPORTING',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: AppColors.skyBlue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Report New Incident',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: AppColors.trustNavy,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Help keep the community safe by sharing real-time updates. Your report contributes to our collective safety map.',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'TYPE OF INCIDENT',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: AppColors.textMuted,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        for (final option in kReportIncidentTypes)
                          _IncidentType(
                            text: option.label,
                            icon: option.icon ?? Icons.info_outline,
                            active: _selectedIncidentType == option.id,
                            onTap: () => setState(() => _selectedIncidentType = option.id),
                          ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'LOCATION',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: AppColors.textMuted,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: _showLocationPicker,
                      borderRadius: BorderRadius.circular(24),
                      child: Container(
                        height: 138,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE6EBF3),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Center(
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: Color(0xFFEAF1FD),
                            child: Icon(Icons.place_outlined, color: AppColors.skyBlue),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            _selectedLocation,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: AppColors.trustNavy,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: _showLocationPicker,
                          child: const Text('CHANGE'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'DESCRIPTION',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: AppColors.textMuted,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: TextField(
                        controller: _descriptionController,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          hintText: 'Tell us more about what you see...',
                          border: InputBorder.none,
                          isCollapsed: true,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'ADD PHOTOS',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: AppColors.textMuted,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        _UploadTile(
                          active: _includePhoto,
                          onTap: () => setState(() => _includePhoto = !_includePhoto),
                        ),
                        const SizedBox(width: 12),
                        const _PreviewTile(),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  onPressed: _submit,
                  child: const Text('Submit Report'),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Reports are shared anonymously by default',
                style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textMuted),
              ),
              const SizedBox(height: 8),
              const _BottomBar(activeIndex: 1),
            ],
          ),
        ),
      ),
    );
  }
}

class _IncidentType extends StatelessWidget {
  const _IncidentType({
    required this.text,
    required this.icon,
    required this.active,
    required this.onTap,
  });

  final String text;
  final IconData icon;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Ink(
          width: 140,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            color: active ? const Color(0xFFEAF1FD) : Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: active ? AppColors.skyBlue : const Color(0xFFE1E8F2),
            ),
          ),
          child: Column(
            children: [
              Icon(icon, color: active ? AppColors.skyBlue : AppColors.textSecondary),
              const SizedBox(height: 8),
              Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppColors.trustNavy,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UploadTile extends StatelessWidget {
  const _UploadTile({required this.active, required this.onTap});

  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Ink(
          width: 78,
          height: 78,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: active ? AppColors.skyBlue : const Color(0xFFDDE5F0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                active ? Icons.check_circle_rounded : Icons.add_a_photo_outlined,
                color: active ? AppColors.safeGreen : AppColors.textMuted,
              ),
              const SizedBox(height: 6),
              Text(
                active ? 'Attached' : 'Upload',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColors.textMuted,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PreviewTile extends StatelessWidget {
  const _PreviewTile();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 78,
      height: 78,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          colors: [Color(0xFF161A20), Color(0xFF3B342A)],
        ),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.activeIndex});

  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    final items = const [
      ('HOME', Icons.home_filled, '/home'),
      ('MAP', Icons.map_outlined, '/safety-map/main'),
      ('TRIPS', Icons.route_outlined, '/trips'),
      ('SETTINGS', Icons.settings_outlined, '/settings/dashboard'),
    ];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (var i = 0; i < items.length; i++)
            InkWell(
              onTap: () => context.go(items[i].$3),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: activeIndex == i
                          ? AppColors.trustNavy
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      items[i].$2,
                      size: 18,
                      color: activeIndex == i ? Colors.white : AppColors.textMuted,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    items[i].$1,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: activeIndex == i
                              ? AppColors.trustNavy
                              : AppColors.textMuted,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
