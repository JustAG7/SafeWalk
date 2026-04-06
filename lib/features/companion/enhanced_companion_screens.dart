import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../shared/widgets/page_scaffold.dart';

class CompanionModeMainScreen extends StatelessWidget {
  const CompanionModeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
              child: Row(children: [Text('Guardian Active', style: theme.textTheme.titleSmall?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const Spacer(), const CircleAvatar(radius: 14, backgroundColor: Color(0xFFEAD3B8), child: Icon(Icons.person, size: 14, color: AppColors.trustNavy))]),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
                children: [
                  Align(child: Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: const Color(0xFFEAF1FD), borderRadius: BorderRadius.circular(999)), child: Text('Guardian Listening', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.skyBlue, fontWeight: FontWeight.w700)))),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), boxShadow: [BoxShadow(color: AppColors.safeGreen.withOpacity(0.08), blurRadius: 24, offset: const Offset(0, 12))]),
                    child: Column(children: [
                      Container(width: 150, height: 150, decoration: const BoxDecoration(shape: BoxShape.circle, gradient: RadialGradient(colors: [Color(0x33A6F2D2), Color(0x00FFFFFF)])), child: const Center(child: Icon(Icons.mic_none_rounded, size: 42, color: AppColors.safeGreen))),
                      const SizedBox(height: 14),
                      Text('Companion Mode Active', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700, color: AppColors.trustNavy)),
                      const SizedBox(height: 10),
                      Text('Guardian is listening for keywords. Your virtual companion is standing by to assist if any tension is detected.', textAlign: TextAlign.center, style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary, height: 1.45)),
                      const SizedBox(height: 16),
                      Wrap(spacing: 10, runSpacing: 10, alignment: WrapAlignment.center, children: const [
                        _PromptChip(text: 'Help me'),
                        _PromptChip(text: 'Call for backup'),
                        _PromptChip(text: 'I feel unsafe'),
                      ]),
                    ]),
                  ),
                  const SizedBox(height: 18),
                  Row(children: [Expanded(child: _CompanionActionCard(title: 'Fake Call', icon: Icons.call_outlined, filled: false, onTap: '/companion/fake-call-incoming')), const SizedBox(width: 12), Expanded(child: _CompanionActionCard(title: 'Chat with Guardian', icon: Icons.chat_bubble_outline_rounded, filled: true, onTap: '/companion/chat-voice-assist'))]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CompanionChatVoiceAssistScreen extends StatelessWidget {
  const CompanionChatVoiceAssistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
              child: Row(children: [IconButton(onPressed: () => context.go('/companion/main'), icon: const Icon(Icons.arrow_back_rounded, color: AppColors.trustNavy)), Text('Chat with Guardian', style: theme.textTheme.titleMedium?.copyWith(color: AppColors.trustNavy, fontWeight: FontWeight.w700)), const Spacer(), const CircleAvatar(radius: 14, backgroundColor: Color(0xFFEAD3B8), child: Icon(Icons.person, size: 14, color: AppColors.trustNavy))]),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
                children: [
                  const _ChatBubble(text: 'I am here with you. Keep moving along the verified route.', incoming: true),
                  const SizedBox(height: 10),
                  const _ChatBubble(text: 'Street lighting looks stable ahead. Two guardians are still watching live.', incoming: true),
                  const SizedBox(height: 10),
                  const _ChatBubble(text: 'Can you stay with me until I reach the next corner?', incoming: false),
                  const SizedBox(height: 10),
                  const _ChatBubble(text: 'Yes. If you want, I can also trigger a fake call or notify your contacts.', incoming: true),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
              child: Row(children: [Expanded(child: Container(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22)), child: const Text('Type a message...', style: TextStyle(color: AppColors.textMuted)))), const SizedBox(width: 12), FilledButton(onPressed: () => context.go('/trip-live/contact-tracking'), child: const Icon(Icons.send_rounded))]),
            ),
          ],
        ),
      ),
    );
  }
}

class _PromptChip extends StatelessWidget {
  const _PromptChip({required this.text});
  final String text;
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), decoration: BoxDecoration(color: const Color(0xFFEFF3FB), borderRadius: BorderRadius.circular(999)), child: Text(text, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.textSecondary, fontWeight: FontWeight.w700)));
}

class _CompanionActionCard extends StatelessWidget {
  const _CompanionActionCard({required this.title, required this.icon, required this.filled, required this.onTap});
  final String title;
  final IconData icon;
  final bool filled;
  final String onTap;
  @override
  Widget build(BuildContext context) {
    final bg = filled ? AppColors.trustNavy : Colors.white;
    final fg = filled ? Colors.white : AppColors.trustNavy;
    return Material(color: bg, borderRadius: BorderRadius.circular(24), child: InkWell(onTap: () => context.go(onTap), borderRadius: BorderRadius.circular(24), child: Padding(padding: const EdgeInsets.all(18), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(icon, color: fg), const SizedBox(height: 32), Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: fg, fontWeight: FontWeight.w700))]))));
  }
}

class _ChatBubble extends StatelessWidget {
  const _ChatBubble({required this.text, required this.incoming});
  final String text;
  final bool incoming;
  @override
  Widget build(BuildContext context) => Align(alignment: incoming ? Alignment.centerLeft : Alignment.centerRight, child: Container(margin: const EdgeInsets.symmetric(vertical: 2), padding: const EdgeInsets.all(14), constraints: const BoxConstraints(maxWidth: 280), decoration: BoxDecoration(color: incoming ? Colors.white : const Color(0xFFEAF1FD), borderRadius: BorderRadius.circular(22)), child: Text(text, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.trustNavy, height: 1.4))));
}

class FakeCallIncomingScreen extends StatelessWidget {
  const FakeCallIncomingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      safeArea: false,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2A180F), Color(0xFF0B111A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 22),
            child: Column(
              children: [
                Text(
                  'SafeWalk Secure Line',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: Colors.white54,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
                const Spacer(),
                Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const RadialGradient(
                      colors: [Color(0x66FFFFFF), Color(0x11FFFFFF)],
                    ),
                    border: Border.all(color: Colors.white.withOpacity(0.08)),
                  ),
                  child: const Center(
                    child: CircleAvatar(
                      radius: 68,
                      backgroundColor: Color(0xFFEAD3B8),
                      child: Icon(Icons.person, size: 72, color: AppColors.trustNavy),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Dad',
                  style: theme.textTheme.displaySmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'mobile',
                  style: theme.textTheme.titleMedium?.copyWith(color: Colors.white70),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    _IncomingAction(icon: Icons.access_time_rounded, label: 'Remind Me'),
                    _IncomingAction(icon: Icons.message_outlined, label: 'Message'),
                  ],
                ),
                const SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _CallDecisionButton(
                      icon: Icons.call_end_rounded,
                      label: 'Decline',
                      color: const Color(0xFFCF2525),
                      onTap: () => context.go('/companion/main'),
                    ),
                    _CallDecisionButton(
                      icon: Icons.call_rounded,
                      label: 'Accept',
                      color: const Color(0xFF4BD58B),
                      onTap: () => context.go('/companion/active-fake-call'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ActiveFakeCallScreen extends StatelessWidget {
  const ActiveFakeCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageScaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
              child: Row(
                children: [
                  Text(
                    'SafeWalk',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: AppColors.trustNavy,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 14,
                    backgroundColor: Color(0xFFEAD3B8),
                    child: Icon(Icons.person, size: 14, color: AppColors.trustNavy),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8FAF1),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        'Live Protection Active',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: AppColors.safeGreen,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Center(
                    child: CircleAvatar(
                      radius: 56,
                      backgroundColor: Color(0xFFEAD3B8),
                      child: Icon(Icons.person, size: 62, color: AppColors.trustNavy),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'Dad',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: AppColors.trustNavy,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'mobile',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleMedium?.copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '00:42',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineLarge?.copyWith(
                      color: AppColors.trustNavy,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Wrap(
                    spacing: 18,
                    runSpacing: 18,
                    alignment: WrapAlignment.center,
                    children: [
                      _CallControl(icon: Icons.mic_off_outlined, label: 'Mute'),
                      _CallControl(icon: Icons.dialpad_rounded, label: 'Keypad'),
                      _CallControl(icon: Icons.volume_up_outlined, label: 'Speaker'),
                      _CallControl(icon: Icons.add_rounded, label: 'Add'),
                      _CallControl(icon: Icons.videocam_outlined, label: 'Video'),
                      _CallControl(icon: Icons.contacts_outlined, label: 'Contacts'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: _CallDecisionButton(
                      icon: Icons.call_end_rounded,
                      label: '',
                      color: const Color(0xFFCF2525),
                      large: true,
                      onTap: () => context.go('/companion/main'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF1F1),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 18,
                          backgroundColor: Color(0xFFFFD8D8),
                          child: Icon(Icons.sos_outlined, color: AppColors.emergencyRed),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Guardian Protocol',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: AppColors.emergencyRed,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Double-tap volume buttons to trigger actual SOS alert silently.',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: AppColors.trustNavy,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.info_outline_rounded, color: AppColors.textMuted, size: 18),
                      ],
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

class _IncomingAction extends StatelessWidget {
  const _IncomingAction({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.14),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Colors.white70,
                fontWeight: FontWeight.w700,
              ),
        ),
      ],
    );
  }
}

class _CallDecisionButton extends StatelessWidget {
  const _CallDecisionButton({required this.icon, required this.label, required this.color, required this.onTap, this.large = false});

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;
  final bool large;

  @override
  Widget build(BuildContext context) {
    final size = large ? 64.0 : 58.0;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Icon(icon, color: Colors.white, size: large ? 30 : 26),
          ),
          if (label.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ],
      ),
    );
  }
}

class _CallControl extends StatelessWidget {
  const _CallControl({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 82,
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F6FB),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.trustNavy),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}

