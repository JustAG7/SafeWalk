import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';

class DestinationSearchScreen extends StatefulWidget {
  const DestinationSearchScreen({super.key});

  @override
  State<DestinationSearchScreen> createState() => _DestinationSearchScreenState();
}

class _DestinationSearchScreenState extends State<DestinationSearchScreen> {
  final TextEditingController _controller = TextEditingController(
    text: 'North Broadway Pathway',
  );
  String _selectedQuickPick = 'Partner House';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _PlanningPage(
      title: 'SafeWalk',
      leading: const Icon(Icons.menu_rounded, color: AppColors.trustNavy),
      trailing: const CircleAvatar(
        radius: 16,
        backgroundColor: Color(0xFFEAD3B8),
        child: Icon(Icons.person, size: 16, color: AppColors.trustNavy),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Destination Search',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.trustNavy,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Search for a destination and SafeWalk will rank routes by visibility, guardian coverage, and local activity.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.45,
                ),
          ),
          const SizedBox(height: 18),
          _SearchField(controller: _controller),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (final label in const ['Home', 'Partner House', 'Library', 'Coffee'])
                _QuickPickChip(
                  label: label,
                  selected: _selectedQuickPick == label,
                  onTap: () => setState(() {
                    _selectedQuickPick = label;
                    _controller.text = switch (label) {
                      'Home' => '422 Willow Creek, San Francisco',
                      'Partner House' => 'North Broadway Pathway',
                      'Library' => 'City Library West Entrance',
                      _ => 'Blue Bottle Coffee, Chelsea',
                    };
                  }),
                ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LIVE SAFETY PREVIEW',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.skyBlue,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Expanded(
                      child: _InlineMetric(
                        title: 'Coverage',
                        value: '12 guardians',
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _InlineMetric(
                        title: 'Visibility',
                        value: 'High',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 56,
            child: FilledButton(
              onPressed: () => context.go('/planning/results'),
              child: const Text('See Secure Results'),
            ),
          ),
        ],
      ),
    );
  }
}

class DestinationResultsScreen extends StatefulWidget {
  const DestinationResultsScreen({super.key});

  @override
  State<DestinationResultsScreen> createState() => _DestinationResultsScreenState();
}

class _DestinationResultsScreenState extends State<DestinationResultsScreen> {
  String _filter = 'Safety First';

  static const _items = [
    _DestinationResult(
      title: 'Sentinel Hub North',
      subtitle: '4521 Oak Street, Financial District',
      score: '9.2',
      tag: 'ELITE SAFETY',
      meta: '0.8 miles • High Patrol',
      featured: true,
    ),
    _DestinationResult(
      title: 'Blue Horizon Point',
      subtitle: '892 Maritime Blvd, Pier 9',
      score: '8.7',
      tag: 'SAFE ZONE',
      meta: '1.2 miles • Well-lit passage',
    ),
    _DestinationResult(
      title: 'The Commons Park',
      subtitle: 'Caution • Low Light',
      score: '6.4',
      tag: 'CAUTION',
      meta: '14 active guardians nearby',
    ),
    _DestinationResult(
      title: 'Civic Plaza East',
      subtitle: '1200 Government Way',
      score: '9.5',
      tag: '24/7 SECURITY',
      meta: 'Staffed • Elite corridor',
    ),
  ];

  List<_DestinationResult> get _filteredItems {
    return switch (_filter) {
      'Distance' => [..._items]..sort((a, b) => a.meta.compareTo(b.meta)),
      'Elite Only' => _items.where((item) => double.parse(item.score) >= 9).toList(),
      _ => [..._items]..sort((a, b) => double.parse(b.score).compareTo(double.parse(a.score))),
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return _PlanningPage(
      title: 'SafeWalk',
      leading: const Icon(Icons.menu_rounded, color: AppColors.trustNavy),
      trailing: const CircleAvatar(
        radius: 16,
        backgroundColor: Color(0xFFEAD3B8),
        child: Icon(Icons.person, size: 16, color: AppColors.trustNavy),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Destination results',
            style: theme.textTheme.headlineMedium?.copyWith(
              color: AppColors.trustNavy,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Found secure locations near your route.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final label in const ['Safety First', 'Distance', 'Elite Only'])
                _FilterPill(
                  label: label,
                  active: _filter == label,
                  onTap: () => setState(() => _filter = label),
                ),
            ],
          ),
          const SizedBox(height: 16),
          for (final item in _filteredItems) ...[
            _DestinationResultCard(
              item: item,
              onTap: () => context.go('/planning/route-options'),
            ),
            const SizedBox(height: 12),
          ],
        ],
      ),
      bottomBar: const _PlanningBottomBar(activeIndex: 1),
    );
  }
}

class MapRouteOptionsScreen extends StatefulWidget {
  const MapRouteOptionsScreen({super.key});

  @override
  State<MapRouteOptionsScreen> createState() => _MapRouteOptionsScreenState();
}

class _MapRouteOptionsScreenState extends State<MapRouteOptionsScreen> {
  String _mode = 'Active Guardian';

  void _showModeSheet() {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) {
        final options = const ['Active Guardian', 'Low Stimulation', 'Fastest Safe'];
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Route mode',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.trustNavy,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Switch how SafeWalk weighs visibility, speed, and guardian coverage.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 18),
                for (final option in options) ...[
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(option),
                    trailing: _mode == option ? const Icon(Icons.check_circle, color: AppColors.safeGreen) : null,
                    onTap: () {
                      setState(() => _mode = option);
                      Navigator.of(sheetContext).pop();
                    },
                  ),
                  if (option != options.last) const Divider(height: 1),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  void _showSimpleFeedback(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      safeArea: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF1A2837), Color(0xFF0C1724)],
                ),
              ),
              child: CustomPaint(painter: _PlanningMapPainter()),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                  child: Row(
                    children: [
                      const Icon(Icons.menu_rounded, color: Colors.white),
                      const SizedBox(width: 12),
                      Text(
                        'SafeWalk',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      const CircleAvatar(
                        radius: 16,
                        backgroundColor: Color(0xFFEAD3B8),
                        child: Icon(Icons.person, size: 16, color: AppColors.trustNavy),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      _MapModePill(label: 'Safety Mode', value: _mode, onTap: _showModeSheet),
                      const Spacer(),
                      _MapIconButton(icon: Icons.layers_outlined, onTap: () => _showSimpleFeedback('Map layers preview updated.')),
                      const SizedBox(width: 10),
                      _MapIconButton(icon: Icons.gps_fixed_rounded, onTap: () => _showSimpleFeedback('Centered on your current position.')),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Expanded(
                            child: _RouteMetricCard(
                              title: 'RECOMMENDED',
                              value: 'The Guardian Route',
                              subtitle: 'Enhanced lighting & community presence',
                            ),
                          ),
                          SizedBox(width: 12),
                          _CompactMetric(value: '12', label: 'min'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: FilledButton(
                          onPressed: () => context.go('/planning/route-comparison'),
                          child: const Text('Start SafeWalk'),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          const Icon(Icons.place_outlined, color: AppColors.textMuted, size: 18),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'To: Julian’s Apartment • ETA 10:42 PM',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: _PlanningBottomBar(activeIndex: 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class StartTripConfirmationScreen extends StatefulWidget {
  const StartTripConfirmationScreen({super.key});

  @override
  State<StartTripConfirmationScreen> createState() => _StartTripConfirmationScreenState();
}

class _StartTripConfirmationScreenState extends State<StartTripConfirmationScreen> {
  bool _quietMonitoring = false;
  bool _fullAlertMode = true;
  final Set<String> _selectedGuardians = {'Sarah J.', 'Marcus K.', 'Lina R.'};

  void _showGuardianDetail(String name) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Guardian detail', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              Text(name, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              Text('This guardian is assigned to route monitoring, ETA checks, and arrival verification for this trip.', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary, height: 1.45)),
            ],
          ),
        ),
      ),
    );
  }

  void _showGuardianSheet() {
    final draftSelection = {..._selectedGuardians};

    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) => StatefulBuilder(
        builder: (sheetContext, setSheetState) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Guardian roster', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                Text('Choose who should actively monitor this trip.', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary, height: 1.45)),
                const SizedBox(height: 18),
                for (final guardian in const ['Sarah J.', 'Marcus K.', 'Lina R.']) ...[
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    value: draftSelection.contains(guardian),
                    activeColor: AppColors.safeGreen,
                    secondary: const CircleAvatar(child: Icon(Icons.person_outline)),
                    title: Text(guardian),
                    onChanged: (value) {
                      setSheetState(() {
                        if (value ?? false) {
                          draftSelection.add(guardian);
                        } else if (draftSelection.length > 1) {
                          draftSelection.remove(guardian);
                        }
                      });
                    },
                  ),
                  if (guardian != 'Lina R.') const Divider(height: 1),
                ],
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      setState(() {
                        _selectedGuardians
                          ..clear()
                          ..addAll(draftSelection);
                      });
                      Navigator.of(sheetContext).pop();
                    },
                    child: const Text('Save Guardian List'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showStartTripSheet() {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ready to start', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              Text('${_selectedGuardians.length} guardians are assigned. Quiet monitoring is ${_quietMonitoring ? 'on' : 'off'} and full alert mode is ${_fullAlertMode ? 'enabled' : 'off'}.', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary, height: 1.45)),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    Navigator.of(sheetContext).pop();
                    context.go('/trip-live');
                  },
                  child: const Text('Start Trip Now'),
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

    return _PlanningPage(
      title: 'Trip Confirmation',
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: const Icon(Icons.arrow_back_rounded, color: AppColors.trustNavy),
      ),
      trailing: const CircleAvatar(
        radius: 16,
        backgroundColor: Color(0xFFEAD3B8),
        child: Icon(Icons.person, size: 16, color: AppColors.trustNavy),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DESTINATION',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: AppColors.textMuted,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'North End District,\nApartment 4B',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: AppColors.trustNavy,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                const _SoftBadge(icon: Icons.schedule_rounded, text: 'Estimated arrival 12:45 AM (18 min walk)'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Expanded(child: _StatCard(title: 'Safety Score', value: '9.8/10', subtitle: 'Guardian route selected')),
              SizedBox(width: 12),
              Expanded(child: _StatCard(title: 'Visibility', value: 'High', subtitle: 'Well-lit streets')),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 132,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                colors: [Color(0xFF173149), Color(0xFF0B1728)],
              ),
            ),
            child: CustomPaint(painter: _ScanGridPainter()),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                'ACTIVE GUARDIANS',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: AppColors.textMuted,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: _showGuardianSheet,
                child: const Text('EDIT LIST'),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (final guardian in _selectedGuardians)
                _GuardianAvatar(
                  name: guardian,
                  onTap: () => _showGuardianDetail(guardian),
                ),
            ],
          ),
          const SizedBox(height: 16),
          _ToggleOptionCard(
            title: 'Quiet Monitoring',
            subtitle: 'Silent tracking and soft-only alerts.',
            value: _quietMonitoring,
            onChanged: (value) => setState(() => _quietMonitoring = value),
          ),
          const SizedBox(height: 12),
          _ToggleOptionCard(
            title: 'Full Alert Mode',
            subtitle: 'Live stream data to your guardians.',
            value: _fullAlertMode,
            onChanged: (value) => setState(() => _fullAlertMode = value),
            emphasize: true,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: FilledButton(
              onPressed: _showStartTripSheet,
              child: const Text('Initiate Guardian'),
            ),
          ),
        ],
      ),
      bottomBar: const _PlanningBottomBar(activeIndex: 1),
    );
  }
}

class _PlanningPage extends StatelessWidget {
  const _PlanningPage({
    required this.title,
    required this.child,
    this.leading,
    this.trailing,
    this.bottomBar,
  });

  final String title;
  final Widget child;
  final Widget? leading;
  final Widget? trailing;
  final Widget? bottomBar;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                children: [
                  Row(
                    children: [
                      SizedBox(width: 40, child: Align(alignment: Alignment.centerLeft, child: leading ?? const SizedBox())),
                      Expanded(
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.trustNavy,
                          ),
                        ),
                      ),
                      SizedBox(width: 40, child: Align(alignment: Alignment.centerRight, child: trailing ?? const SizedBox())),
                    ],
                  ),
                  const SizedBox(height: 20),
                  child,
                ],
              ),
            ),
            if (bottomBar != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                child: bottomBar!,
              ),
          ],
        ),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.search_rounded, color: AppColors.textMuted),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Enter destination, building, or place',
                border: InputBorder.none,
              ),
            ),
          ),
          const Icon(Icons.mic_none_rounded, color: AppColors.textMuted),
        ],
      ),
    );
  }
}

class _QuickPickChip extends StatelessWidget {
  const _QuickPickChip({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.trustNavy : Colors.white,
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: selected ? Colors.white : AppColors.trustNavy,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class _InlineMetric extends StatelessWidget {
  const _InlineMetric({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F6FB),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          Text(value, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class _FilterPill extends StatelessWidget {
  const _FilterPill({required this.label, required this.active, required this.onTap});

  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: active ? AppColors.trustNavy : Colors.white,
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: active ? Colors.white : AppColors.trustNavy,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class _DestinationResult {
  const _DestinationResult({required this.title, required this.subtitle, required this.score, required this.tag, required this.meta, this.featured = false});

  final String title;
  final String subtitle;
  final String score;
  final String tag;
  final String meta;
  final bool featured;
}

class _DestinationResultCard extends StatelessWidget {
  const _DestinationResultCard({required this.item, required this.onTap});

  final _DestinationResult item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: item.featured ? 128 : 92,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: LinearGradient(
                    colors: item.featured ? const [Color(0xFF2D708B), Color(0xFF183A4D)] : const [Color(0xFFEAF1FD), Color(0xFFD9E4F4)],
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.title, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 4),
                        Text(item.subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)),
                        const SizedBox(height: 8),
                        Text(item.meta, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textMuted)),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(color: const Color(0xFFEAF7EF), borderRadius: BorderRadius.circular(999)),
                        child: Text(item.tag, style: const TextStyle(color: AppColors.safeGreen, fontWeight: FontWeight.w700, fontSize: 10)),
                      ),
                      const SizedBox(height: 10),
                      Text(item.score, style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: AppColors.safeGreen, fontWeight: FontWeight.w800)),
                      Text('SCORE', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Align(alignment: Alignment.centerRight, child: FilledButton(onPressed: onTap, child: const Text('Directions'))),
            ],
          ),
        ),
      ),
    );
  }
}
class RouteComparisonBottomSheetScreen extends StatefulWidget {
  const RouteComparisonBottomSheetScreen({super.key});

  @override
  State<RouteComparisonBottomSheetScreen> createState() => _RouteComparisonBottomSheetScreenState();
}

class _RouteComparisonBottomSheetScreenState extends State<RouteComparisonBottomSheetScreen> {
  String _selectedRoute = 'The Guardian';
  final Set<String> _alertContacts = {'Sarah J.', 'Marcus K.'};

  void _showContactSheet(ThemeData theme) {
    final draftSelection = {..._alertContacts};

    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) => StatefulBuilder(
        builder: (sheetContext, setSheetState) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Alert contacts', style: theme.textTheme.titleLarge?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                Text('Choose who should be notified before you commit to this route.', style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary, height: 1.45)),
                const SizedBox(height: 18),
                for (final contact in const ['Sarah J.', 'Marcus K.', 'Lina R.']) ...[
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    value: draftSelection.contains(contact),
                    activeColor: AppColors.safeGreen,
                    secondary: const CircleAvatar(child: Icon(Icons.person_outline)),
                    title: Text(contact),
                    onChanged: (value) {
                      setSheetState(() {
                        if (value ?? false) {
                          draftSelection.add(contact);
                        } else {
                          draftSelection.remove(contact);
                        }
                      });
                    },
                  ),
                  if (contact != 'Lina R.') const Divider(height: 1),
                ],
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      setState(() {
                        _alertContacts
                          ..clear()
                          ..addAll(draftSelection);
                      });
                      Navigator.of(sheetContext).pop();
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(content: Text('${_alertContacts.length} contact(s) will be alerted for this route.')),
                        );
                    },
                    child: const Text('Save Alert List'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _continueWithRoute() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text('$_selectedRoute is ready with ${_alertContacts.length} alert contact(s).')),
      );
    context.go('/planning/route-safety-details');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      safeArea: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF11283A), Color(0xFF0A1420)],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => context.pop(),
                        icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
                      ),
                      Text(
                        'SafeWalk',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      const CircleAvatar(
                        radius: 16,
                        backgroundColor: Color(0xFFEAD3B8),
                        child: Icon(Icons.person, size: 16, color: AppColors.trustNavy),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(20, 14, 20, 22),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        child: Container(
                          width: 46,
                          height: 4,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD6DFEA),
                            borderRadius: BorderRadius.circular(999),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Choose your path',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: AppColors.textMuted,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Route Comparison',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: AppColors.trustNavy,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _ComparisonOptionCard(
                        title: 'The Guardian',
                        subtitle: '+2 mins • High security',
                        score: '98% safe',
                        primary: _selectedRoute == 'The Guardian',
                        tags: const ['Lighting Premium', 'Patrols Frequent'],
                        onTap: () => setState(() => _selectedRoute = 'The Guardian'),
                      ),
                      const SizedBox(height: 14),
                      _ComparisonOptionCard(
                        title: 'Shortest',
                        subtitle: '-1 min • Express Way',
                        score: '82% safe',
                        primary: _selectedRoute == 'Shortest',
                        tags: const ['Recent incidents', 'Moderate visibility'],
                        onTap: () => setState(() => _selectedRoute = 'Shortest'),
                      ),
                      const SizedBox(height: 14),
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.verified_user_outlined, color: AppColors.skyBlue),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                '${_alertContacts.length} contacts will be notified when you lock this route.',
                                style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: TextButton.icon(
                          onPressed: () => _showContactSheet(theme),
                          icon: const Icon(Icons.notifications_active_outlined, size: 18),
                          label: const Text('Alert Contacts'),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: FilledButton(
                          onPressed: _continueWithRoute,
                          child: Text('Continue with $_selectedRoute'),
                        ),
                      ),
                    ],
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

class RouteSafetyScoreDetailsScreen extends StatefulWidget {
  const RouteSafetyScoreDetailsScreen({super.key});

  @override
  State<RouteSafetyScoreDetailsScreen> createState() => _RouteSafetyScoreDetailsScreenState();
}

class _RouteSafetyScoreDetailsScreenState extends State<RouteSafetyScoreDetailsScreen> {
  String _selectedIndicator = 'Smart Lighting';

  void _showIndicatorDetail(BuildContext context, ThemeData theme, String title, String detail) {
    setState(() => _selectedIndicator = title);
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: theme.textTheme.titleLarge?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              Text(detail, style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary, height: 1.45)),
            ],
          ),
        ),
      ),
    );
  }

  void _showMapPreview(ThemeData theme) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Live route preview', style: theme.textTheme.titleLarge?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              Text('This monitored segment is currently backed by active guardian coverage and smart-light infrastructure.', style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary, height: 1.45)),
              const SizedBox(height: 16),
              Container(
                height: 160,
                decoration: BoxDecoration(
                  color: const Color(0xFF174563),
                  borderRadius: BorderRadius.circular(26),
                ),
                child: CustomPaint(painter: _MiniMapPainter()),
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
      backgroundColor: const Color(0xFF0D2B45),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 10, 18, 20),
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
                ),
                Text(
                  'SafeWalk',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                const CircleAvatar(
                  radius: 16,
                  backgroundColor: Color(0xFFEAD3B8),
                  child: Icon(Icons.person, size: 16, color: AppColors.trustNavy),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'CURRENT ROUTE ANALYSIS',
              style: theme.textTheme.labelSmall?.copyWith(
                color: Colors.white70,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'North Broadway\nPathway',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      height: 1.0,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '94',
                      style: theme.textTheme.displaySmall?.copyWith(
                        color: const Color(0xFF5BE39D),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'SAFETY SCORE',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: const Color(0xFF5BE39D),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Material(
              color: const Color(0xFF174563),
              borderRadius: BorderRadius.circular(26),
              child: InkWell(
                onTap: () => _showMapPreview(theme),
                borderRadius: BorderRadius.circular(26),
                child: SizedBox(
                  height: 160,
                  child: Stack(
                    children: [
                      Positioned.fill(child: CustomPaint(painter: _MiniMapPainter())),
                      const Positioned(
                        left: 18,
                        right: 18,
                        bottom: 14,
                        child: _LiveBadge(text: 'Live route monitoring active'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            _SafetyIndicatorRow(
              title: 'Smart Lighting',
              subtitle: 'Lux levels and dynamic coverage',
              value: 0.88,
              highlighted: _selectedIndicator == 'Smart Lighting',
              onTap: () => _showIndicatorDetail(context, theme, 'Smart Lighting', 'Street-light density is above baseline and dynamic lighting sensors are online across this corridor.'),
            ),
            const SizedBox(height: 12),
            _SafetyIndicatorRow(
              title: 'Verified Foot Traffic',
              subtitle: 'Real-time density analytics',
              value: 0.92,
              highlighted: _selectedIndicator == 'Verified Foot Traffic',
              onTap: () => _showIndicatorDetail(context, theme, 'Verified Foot Traffic', 'Crowd density is stable and movement patterns match expected evening commuter flow.'),
            ),
            const SizedBox(height: 12),
            _SafetyIndicatorRow(
              title: 'Guardian Coverage',
              subtitle: 'Local responder proximity',
              value: 0.89,
              highlighted: _selectedIndicator == 'Guardian Coverage',
              onTap: () => _showIndicatorDetail(context, theme, 'Guardian Coverage', 'Multiple verified guardians and responders remain within fast reach of this route.'),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFF103754),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Guardian Network Insight',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'This route is monitored by 12 verified guardians and features upgraded sensor-active smart lighting.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white70,
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: FilledButton(
                      onPressed: () => context.go('/planning/route-recommendation'),
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.trustNavy,
                      ),
                      child: const Text('Start Protected Walk'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () => context.go('/planning/route-comparison'),
                      child: const Text('Compare routes again'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RouteRecommendationAiScreen extends StatefulWidget {
  const RouteRecommendationAiScreen({super.key});

  @override
  State<RouteRecommendationAiScreen> createState() => _RouteRecommendationAiScreenState();
}

class _RouteRecommendationAiScreenState extends State<RouteRecommendationAiScreen> {
  String _selectedBackupRoute = 'Balanced';

  void _showAlternativeRoutes(ThemeData theme) {
    final options = <String, String>{
      'Shortest': '82% safe • 13 min',
      'Balanced': '90% safe • 15 min',
      'Guardian+': '98% safe • 16 min',
    };

    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) => StatefulBuilder(
        builder: (sheetContext, setSheetState) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Alternative routes', style: theme.textTheme.titleLarge?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                Text('SafeWalk ranked these backups if conditions change while you are walking.', style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary, height: 1.45)),
                const SizedBox(height: 18),
                for (final entry in options.entries) ...[
                  RadioListTile<String>(
                    contentPadding: EdgeInsets.zero,
                    activeColor: AppColors.trustNavy,
                    value: entry.key,
                    groupValue: _selectedBackupRoute,
                    title: Text(entry.key),
                    subtitle: Text(entry.value),
                    onChanged: (value) => setSheetState(() => _selectedBackupRoute = value ?? _selectedBackupRoute),
                  ),
                  if (entry.key != options.keys.last) const Divider(height: 1),
                ],
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      setState(() {});
                      Navigator.of(sheetContext).pop();
                    },
                    child: const Text('Keep Backup Route'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _confirmRecommendation() {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Guardian route locked in'),
        content: Text('Primary route is protected, with $_selectedBackupRoute saved as your fallback.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Review Again'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.go('/planning/start-confirmation');
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return _PlanningPage(
      title: 'SafeWalk',
      leading: const Icon(Icons.menu_rounded, color: AppColors.trustNavy),
      trailing: const CircleAvatar(
        radius: 16,
        backgroundColor: Color(0xFFEAD3B8),
        child: Icon(Icons.person, size: 16, color: AppColors.trustNavy),
      ),
      child: Column(
        children: [
          Container(
            width: 190,
            height: 190,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [Color(0xFF8AF2CD), Color(0xFF2587E3), Color(0xFF123E68)],
              ),
            ),
            child: Center(
              child: Container(
                width: 74,
                height: 74,
                decoration: const BoxDecoration(
                  color: Color(0x33FFFFFF),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 30),
              ),
            ),
          ),
          const SizedBox(height: 22),
          Text(
            'Route Recommendation',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: AppColors.trustNavy,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                Text(
                  'I’ve optimized your path for maximum visibility. This route adds 2 minutes but avoids 3 low-light corridors.',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    Expanded(child: _RecommendationMetric(title: 'SAFETY SCORE', value: '98%')),
                    SizedBox(width: 12),
                    Expanded(child: _RecommendationMetric(title: 'ETA', value: '14m')),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Container(
            height: 124,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                colors: [Color(0xFF173149), Color(0xFF0B1728)],
              ),
            ),
            child: CustomPaint(painter: _ScanGridPainter()),
          ),
          const SizedBox(height: 14),
          const Row(
            children: [
              Expanded(child: _FeaturePill(label: 'Verified Path')),
              SizedBox(width: 10),
              Expanded(child: _FeaturePill(label: 'Well-Lit')),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(Icons.alt_route_rounded, color: AppColors.skyBlue),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Fallback route: $_selectedBackupRoute',
                    style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: FilledButton(
              onPressed: _confirmRecommendation,
              child: const Text('Start Safe Trip'),
            ),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () => _showAlternativeRoutes(theme),
            child: const Text('Review Alternative Routes'),
          ),
        ],
      ),
      bottomBar: const _PlanningBottomBar(activeIndex: 1),
    );
  }
}
class _MapModePill extends StatelessWidget {
  const _MapModePill({required this.label, required this.value, this.onTap});

  final String label;
  final String value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(value, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
                  const SizedBox(width: 6),
                  const Icon(Icons.keyboard_arrow_down_rounded, size: 18, color: AppColors.textMuted),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MapIconButton extends StatelessWidget {
  const _MapIconButton({required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 44,
          height: 44,
          child: Icon(icon, color: AppColors.trustNavy),
        ),
      ),
    );
  }
}

class _RouteMetricCard extends StatelessWidget {
  const _RouteMetricCard({required this.title, required this.value, required this.subtitle});

  final String title;
  final String value;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: const Color(0xFFF4F7FB), borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.safeGreen, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Text(value, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)),
        ],
      ),
    );
  }
}

class _CompactMetric extends StatelessWidget {
  const _CompactMetric({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 86,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: const Color(0xFFF4F7FB), borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Text(value, style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
          Text(label, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class _ComparisonOptionCard extends StatelessWidget {
  const _ComparisonOptionCard({required this.title, required this.subtitle, required this.score, required this.onTap, required this.tags, this.primary = false});

  final String title;
  final String subtitle;
  final String score;
  final List<String> tags;
  final bool primary;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: primary ? const Color(0xFFEAF1FD) : Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(child: Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700))),
              Text(score, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.safeGreen, fontWeight: FontWeight.w700)),
            ],
          ),
          const SizedBox(height: 6),
          Text(subtitle, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary)),
          const SizedBox(height: 12),
          Wrap(spacing: 8, runSpacing: 8, children: [for (final tag in tags) _TagChip(text: tag)]),
          const SizedBox(height: 14),
          FilledButton(
            onPressed: onTap,
            style: FilledButton.styleFrom(backgroundColor: primary ? AppColors.trustNavy : const Color(0xFFEAF1FD), foregroundColor: primary ? Colors.white : AppColors.trustNavy),
            child: Text(primary ? 'Select Guardian' : 'Select Shortest'),
          ),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Text(text, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
    );
  }
}

class _LiveBadge extends StatelessWidget {
  const _LiveBadge({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(color: const Color(0xAA0E2538), borderRadius: BorderRadius.circular(999)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.radio_button_checked_rounded, size: 12, color: Color(0xFF5BE39D)),
          const SizedBox(width: 8),
          Text(text, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class _SafetyIndicatorRow extends StatelessWidget {
  const _SafetyIndicatorRow({required this.title, required this.subtitle, required this.value, this.onTap, this.highlighted = false});

  final String title;
  final String subtitle;
  final double value;
  final VoidCallback? onTap;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: highlighted ? const Color(0xFF184465) : const Color(0xFF123754),
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w700)),
              const SizedBox(height: 4),
              Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white70)),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: LinearProgressIndicator(value: value, minHeight: 8, backgroundColor: Colors.white10, color: const Color(0xFF5BE39D)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RecommendationMetric extends StatelessWidget {
  const _RecommendationMetric({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: const Color(0xFFF4F7FB), borderRadius: BorderRadius.circular(18)),
      child: Column(
        children: [
          Text(title, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          Text(value, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class _FeaturePill extends StatelessWidget {
  const _FeaturePill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.verified_outlined, size: 16, color: AppColors.skyBlue),
          const SizedBox(width: 8),
          Text(label, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class _SoftBadge extends StatelessWidget {
  const _SoftBadge({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(color: const Color(0xFFF1F5FA), borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.skyBlue),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w600))),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.title, required this.value, required this.subtitle});

  final String title;
  final String value;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          Text(value, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)),
        ],
      ),
    );
  }
}

class _GuardianAvatar extends StatelessWidget {
  const _GuardianAvatar({required this.name, this.onTap});

  final String name;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(radius: 24, backgroundColor: Color(0xFFEAD3B8), child: Icon(Icons.person, color: AppColors.trustNavy)),
            const SizedBox(height: 6),
            Text(name, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}

class _ToggleOptionCard extends StatelessWidget {
  const _ToggleOptionCard({required this.title, required this.subtitle, required this.value, required this.onChanged, this.emphasize = false});

  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: emphasize ? AppColors.trustNavy : Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: emphasize ? Colors.white : AppColors.trustNavy, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: emphasize ? Colors.white70 : AppColors.textSecondary)),
              ],
            ),
          ),
          Switch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}

class _PlanningBottomBar extends StatelessWidget {
  const _PlanningBottomBar({required this.activeIndex});

  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    final items = const [('HOME', Icons.home_filled, '/home'), ('MAP', Icons.map_outlined, '/planning/recent-destinations'), ('TRIPS', Icons.route_outlined, '/trips'), ('SETTINGS', Icons.settings_outlined, '/settings/dashboard')];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (var i = 0; i < items.length; i++)
            InkWell(
              onTap: () => context.go(items[i].$3),
              borderRadius: BorderRadius.circular(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(width: 34, height: 34, decoration: BoxDecoration(color: activeIndex == i ? AppColors.trustNavy : Colors.transparent, borderRadius: BorderRadius.circular(12)), child: Icon(items[i].$2, size: 18, color: activeIndex == i ? Colors.white : AppColors.textMuted)),
                  const SizedBox(height: 4),
                  Text(items[i].$1, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: activeIndex == i ? AppColors.trustNavy : AppColors.textMuted, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _PlanningMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final grid = Paint()..color = Colors.white.withOpacity(0.08)..style = PaintingStyle.stroke..strokeWidth = 1;
    for (double x = 0; x < size.width; x += 28) { canvas.drawLine(Offset(x, 0), Offset(x, size.height), grid); }
    for (double y = 0; y < size.height; y += 28) { canvas.drawLine(Offset(0, y), Offset(size.width, y), grid); }

    final route = Paint()..color = const Color(0xFF1E66F5)..strokeWidth = 4..strokeCap = StrokeCap.round;
    final safe = Paint()..color = const Color(0xFF5BE39D)..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width * 0.35, size.height * 0.8)
      ..quadraticBezierTo(size.width * 0.42, size.height * 0.58, size.width * 0.48, size.height * 0.42)
      ..quadraticBezierTo(size.width * 0.58, size.height * 0.2, size.width * 0.72, size.height * 0.1);
    canvas.drawPath(path, route);
    canvas.drawCircle(Offset(size.width * 0.35, size.height * 0.8), 7, safe);
    canvas.drawCircle(Offset(size.width * 0.72, size.height * 0.1), 6, Paint()..color = const Color(0xFFFF5A5A));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _MiniMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final grid = Paint()..color = Colors.white.withOpacity(0.07)..style = PaintingStyle.stroke..strokeWidth = 1;
    for (double x = 0; x < size.width; x += 26) { canvas.drawLine(Offset(x, 0), Offset(x, size.height), grid); }
    for (double y = 0; y < size.height; y += 26) { canvas.drawLine(Offset(0, y), Offset(size.width, y), grid); }

    final route = Paint()..color = const Color(0xFF56C7FF)..strokeWidth = 4..strokeCap = StrokeCap.round;
    final path = Path()
      ..moveTo(size.width * 0.2, size.height * 0.75)
      ..quadraticBezierTo(size.width * 0.38, size.height * 0.56, size.width * 0.46, size.height * 0.46)
      ..quadraticBezierTo(size.width * 0.62, size.height * 0.28, size.width * 0.78, size.height * 0.16);
    canvas.drawPath(path, route);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ScanGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final line = Paint()..color = const Color(0x553FD0FF)..style = PaintingStyle.stroke..strokeWidth = 1;
    for (double x = 0; x < size.width; x += 22) { canvas.drawLine(Offset(x, 0), Offset(x, size.height), line); }
    for (double y = 0; y < size.height; y += 22) { canvas.drawLine(Offset(0, y), Offset(size.width, y), line); }

    final glow = Paint()..color = const Color(0xFF3FD0FF)..strokeWidth = 3..strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(size.width * 0.16, size.height * 0.78), Offset(size.width * 0.78, size.height * 0.3), glow);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

