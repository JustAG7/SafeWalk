import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/page_scaffold.dart';
import '../mock/setup_mock_data.dart';
import '../models/setup_contact.dart';

class TrustedContactsListScreen extends StatefulWidget {
  const TrustedContactsListScreen({super.key});

  @override
  State<TrustedContactsListScreen> createState() =>
      _TrustedContactsListScreenState();
}

class _TrustedContactsListScreenState extends State<TrustedContactsListScreen> {
  late final TextEditingController _searchController;
  late final Set<String> _selectedIds;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _selectedIds = kSetupSuggestedContacts
        .where((contact) => contact.initiallySelected)
        .map((contact) => contact.id)
        .toSet();
    _searchController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<SetupContact> get _filteredContacts {
    final query = _searchController.text.trim().toLowerCase();
    if (query.isEmpty) return kSetupSuggestedContacts;
    return kSetupSuggestedContacts.where((contact) {
      return contact.name.toLowerCase().contains(query) ||
          contact.meta.toLowerCase().contains(query) ||
          contact.relationship.toLowerCase().contains(query);
    }).toList();
  }

  void _toggleContact(SetupContact contact) {
    final alreadySelected = _selectedIds.contains(contact.id);
    if (!alreadySelected && _selectedIds.length >= 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You can add up to 5 trusted contacts.')),
      );
      return;
    }

    setState(() {
      if (alreadySelected) {
        _selectedIds.remove(contact.id);
      } else {
        _selectedIds.add(contact.id);
      }
    });
  }

  void _showSelectionSheet() {
    final selectedContacts = kSetupSuggestedContacts
        .where((contact) => _selectedIds.contains(contact.id))
        .toList();
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
                'Guardian setup',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.trustNavy,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                '${selectedContacts.length} contact${selectedContacts.length == 1 ? '' : 's'} selected for your guardian circle.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
              const SizedBox(height: 16),
              for (final contact in selectedContacts)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundColor: contact.avatarColor,
                    child: Text(
                      contact.initials,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColors.trustNavy,
                      ),
                    ),
                  ),
                  title: Text(contact.name),
                  subtitle: Text(contact.relationship),
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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => context.go('/setup/avatar'),
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                  const Spacer(),
                  Text(
                    'SafeWalk',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.trustNavy,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'STEP 3 OF 4',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: AppColors.textMuted,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.7,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Trusted Contacts',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.trustNavy,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Add up to 5 people who should be notified if you need help.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 18),
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search contacts...',
                  prefixIcon: const Icon(Icons.search_rounded),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(color: AppColors.outlineVariant),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(color: AppColors.outlineVariant),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    'Added guardians (${_selectedIds.length}/5)',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: AppColors.textMuted,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: _selectedIds.isEmpty ? null : _showSelectionSheet,
                    child: const Text('Review'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              if (_selectedIds.isNotEmpty)
                SizedBox(
                  height: 58,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: kSetupSuggestedContacts
                        .where((contact) => _selectedIds.contains(contact.id))
                        .length,
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      final selectedContacts = kSetupSuggestedContacts
                          .where((item) => _selectedIds.contains(item.id))
                          .toList();
                      final contact = selectedContacts[index];
                      return _GuardianChip(contact: contact);
                    },
                  ),
                ),
              if (_selectedIds.isNotEmpty) const SizedBox(height: 14),
              Expanded(
                child: _filteredContacts.isEmpty
                    ? const _EmptySearchState()
                    : ListView.separated(
                        itemCount: _filteredContacts.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final contact = _filteredContacts[index];
                          final selected = _selectedIds.contains(contact.id);
                          return _ContactTile(
                            contact: contact,
                            selected: selected,
                            onToggle: () => _toggleContact(contact),
                            onEdit: selected
                                ? () => context.go('/setup/contacts/edit')
                                : null,
                          );
                        },
                      ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => context.go('/setup/contacts/add'),
                      child: const Text('Add manually'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton(
                      onPressed: _selectedIds.isEmpty
                          ? null
                          : () => context.go('/setup/address/home'),
                      child: const Text('Next'),
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () => context.go('/setup/address/home'),
                child: const Text('Skip for now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  const _ContactTile({
    required this.contact,
    required this.selected,
    required this.onToggle,
    this.onEdit,
  });

  final SetupContact contact;
  final bool selected;
  final VoidCallback onToggle;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFEAF4FF) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: selected
              ? AppColors.skyBlue.withValues(alpha: 0.3)
              : AppColors.outlineVariant,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: contact.avatarColor,
            child: Text(
              contact.initials,
              style: const TextStyle(
                color: AppColors.trustNavy,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        contact.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (!contact.isOnline)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceAlt,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: const Text(
                          'Offline',
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(contact.meta, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          if (selected) ...[
            IconButton(
              onPressed: onEdit,
              icon: const Icon(Icons.edit_outlined, color: AppColors.trustNavy),
            ),
            IconButton(
              onPressed: onToggle,
              icon: const Icon(Icons.check_circle, color: AppColors.safeGreen),
            ),
          ] else
            FilledButton(onPressed: onToggle, child: const Text('Add')),
        ],
      ),
    );
  }
}

class _GuardianChip extends StatelessWidget {
  const _GuardianChip({required this.contact});

  final SetupContact contact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: contact.avatarColor,
            child: Text(
              contact.initials,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.trustNavy,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(contact.name, style: Theme.of(context).textTheme.labelMedium),
        ],
      ),
    );
  }
}

class _EmptySearchState extends StatelessWidget {
  const _EmptySearchState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.search_off_rounded,
            size: 36,
            color: AppColors.textMuted,
          ),
          const SizedBox(height: 12),
          Text(
            'No contacts matched that search.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
          ),
        ],
      ),
    );
  }
}

