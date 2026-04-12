import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/companion/companion.dart';
import '../../features/emergency/emergency.dart';
import '../../features/entry/login_entry_screen.dart';
import '../../features/entry/onboarding_screen.dart';
import '../../features/entry/signup_entry_screen.dart';
import '../../features/entry/splash_screen.dart';
import '../../features/entry/welcome_choice_screen.dart';
import '../../features/planning/screens/planning_overview_screens.dart' show MainHomeDashboardScreen, QuickGoHomeActionScreen, RecentDestinationsScreen, SafetyStatusOverviewScreen, SmartCityAlertsFeedScreen, TripsHubScreen;
import '../../features/planning/screens/route_planning_screens.dart';
import '../../features/setup/screens/add_avatar_screen.dart';
import '../../features/setup/screens/add_trusted_contact_screen.dart';
import '../../features/setup/screens/create_profile_screen.dart';
import '../../features/setup/screens/edit_trusted_contact_screen.dart';
import '../../features/setup/screens/home_address_setup_screen.dart';
import '../../features/setup/screens/permission_success_screen.dart';
import '../../features/setup/screens/permissions_setup_screen.dart';
import '../../features/setup/screens/school_address_setup_screen.dart';
import '../../features/setup/screens/setup_completed_screen.dart';
import '../../features/setup/screens/trusted_contacts_list_screen.dart';
import '../../features/setup/screens/work_address_setup_screen.dart';
import '../../features/post_trip/post_trip.dart';
import '../../features/safety_map/safety_map.dart';
import '../../features/settings/accessibility_settings_screen.dart';
import '../../features/settings/notification_preferences_screen.dart';
import '../../features/settings/privacy_settings_screen.dart';
import '../../features/settings/settings_dashboard_screen.dart';
import '../../features/settings/sos_customization_screen.dart';
import '../../features/system_states/system_states.dart';
import '../../features/trip_live/trip_live.dart';
import '../../shared/navigation/app_navigation_shell.dart';
import 'app_routes.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutePaths.splash,
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) => AppRoutePaths.splash,
      ),
      GoRoute(
        path: '/entry',
        redirect: (context, state) => AppRoutePaths.splash,
      ),
      GoRoute(
        path: AppRoutePaths.splash,
        name: AppRouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.onboarding,
        name: AppRouteNames.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.welcome,
        name: AppRouteNames.welcome,
        builder: (context, state) => const WelcomeChoiceScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.signIn,
        name: AppRouteNames.signIn,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.signUp,
        name: AppRouteNames.signUp,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.setupPermissions,
        name: AppRouteNames.setupPermissions,
        builder: (context, state) => const PermissionsSetupScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.setupNotifications,
        name: AppRouteNames.setupNotifications,
        builder: (context, state) => const NotificationPermissionScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.setupCallPermission,
        name: AppRouteNames.setupCallPermission,
        builder: (context, state) => const CallPermissionScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.setupBackgroundTracking,
        name: AppRouteNames.setupBackgroundTracking,
        builder: (context, state) => const BackgroundTrackingPermissionScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.permissionSuccess,
        name: AppRouteNames.permissionSuccess,
        builder: (context, state) => const PermissionSuccessScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.setupProfile,
        name: AppRouteNames.setupProfile,
        builder: (context, state) => const CreateProfileScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.setupAvatar,
        name: AppRouteNames.setupAvatar,
        builder: (context, state) => const AddAvatarScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.setupContacts,
        name: AppRouteNames.setupContacts,
        builder: (context, state) => const TrustedContactsListScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.setupContactAdd,
        name: AppRouteNames.setupContactAdd,
        builder: (context, state) => const AddTrustedContactScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.setupContactEdit,
        name: AppRouteNames.setupContactEdit,
        builder: (context, state) => const EditTrustedContactScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.setupHome,
        name: AppRouteNames.setupHome,
        builder: (context, state) => const HomeAddressSetupScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.setupWork,
        name: AppRouteNames.setupWork,
        builder: (context, state) => const WorkAddressSetupScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.setupSchool,
        name: AppRouteNames.setupSchool,
        builder: (context, state) => const SchoolAddressSetupScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.setupComplete,
        name: AppRouteNames.setupComplete,
        builder: (context, state) => const SetupCompletedScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            AppNavigationShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutePaths.home,
                name: AppRouteNames.home,
                builder: (context, state) => const MainHomeDashboardScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutePaths.trips,
                name: AppRouteNames.trips,
                builder: (context, state) => const TripsHubScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutePaths.contacts,
                name: AppRouteNames.contacts,
                builder: (context, state) => const TrustedContactsListScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutePaths.map,
                name: AppRouteNames.map,
                builder: (context, state) => const SafetyMapMainScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutePaths.settings,
                name: AppRouteNames.settings,
                builder: (context, state) => const SettingsDashboardScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutePaths.quickGoHome,
        name: AppRouteNames.quickGoHome,
        builder: (context, state) => const QuickGoHomeActionScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.recentDestinations,
        name: AppRouteNames.recentDestinations,
        builder: (context, state) => const RecentDestinationsScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.safetyStatus,
        name: AppRouteNames.safetyStatus,
        builder: (context, state) => const SafetyStatusOverviewScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.cityAlerts,
        name: AppRouteNames.cityAlerts,
        builder: (context, state) => const SmartCityAlertsFeedScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.destinationSearch,
        name: AppRouteNames.destinationSearch,
        builder: (context, state) => const DestinationSearchScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.destinationResults,
        name: AppRouteNames.destinationResults,
        builder: (context, state) => const DestinationResultsScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.routeOptions,
        name: AppRouteNames.routeOptions,
        builder: (context, state) => const MapRouteOptionsScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.routeComparison,
        name: AppRouteNames.routeComparison,
        builder: (context, state) => const RouteComparisonBottomSheetScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.routeSafetyDetails,
        name: AppRouteNames.routeSafetyDetails,
        builder: (context, state) => const RouteSafetyScoreDetailsScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.routeRecommendation,
        name: AppRouteNames.routeRecommendation,
        builder: (context, state) => const RouteRecommendationAiScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.startTripConfirmation,
        name: AppRouteNames.startTripConfirmation,
        builder: (context, state) => const StartTripConfirmationScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.activeTrip,
        name: AppRouteNames.activeTrip,
        builder: (context, state) => const ActiveTripMainScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.liveNavigation,
        name: AppRouteNames.liveNavigation,
        builder: (context, state) => const LiveNavigationScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.liveContactTracking,
        name: AppRouteNames.liveContactTracking,
        builder: (context, state) => const LiveContactTrackingScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.tripCheckIn,
        name: AppRouteNames.tripCheckIn,
        builder: (context, state) => const CheckInPromptScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.tripImFine,
        name: AppRouteNames.tripImFine,
        builder: (context, state) => const ImFineStateScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.tripNeedHelp,
        name: AppRouteNames.tripNeedHelp,
        builder: (context, state) => const NeedHelpFlowScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.tripProgress,
        name: AppRouteNames.tripProgress,
        builder: (context, state) => const TripProgressUpdateScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.floatingSos,
        name: AppRouteNames.floatingSos,
        builder: (context, state) => const FloatingSosExpandedScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.sosHold,
        name: AppRouteNames.sosHold,
        builder: (context, state) => const SosHoldActivationScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.sosCountdown,
        name: AppRouteNames.sosCountdown,
        builder: (context, state) => const SosCountdownScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.emergencyAlertSent,
        name: AppRouteNames.emergencyAlertSent,
        builder: (context, state) => const EmergencyAlertSentScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.priorityContactCall,
        name: AppRouteNames.priorityContactCall,
        builder: (context, state) => const PriorityContactAutoCallScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.emergencySafePoints,
        name: AppRouteNames.emergencySafePoints,
        builder: (context, state) => const NearbySafePointsScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.emergencyHotline,
        name: AppRouteNames.emergencyHotline,
        builder: (context, state) => const EmergencyHotlineScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.companionMain,
        name: AppRouteNames.companionMain,
        builder: (context, state) => const CompanionModeMainScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.fakeCallIncoming,
        name: AppRouteNames.fakeCallIncoming,
        builder: (context, state) => const FakeCallIncomingScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.activeFakeCall,
        name: AppRouteNames.activeFakeCall,
        builder: (context, state) => const ActiveFakeCallScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.companionChat,
        name: AppRouteNames.companionChat,
        builder: (context, state) => const CompanionChatVoiceAssistScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.arrivalSuccess,
        name: AppRouteNames.arrivalSuccess,
        builder: (context, state) => const ArrivalSuccessScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.notifyContacts,
        name: AppRouteNames.notifyContacts,
        builder: (context, state) => const NotifyContactsScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.rateRouteSafety,
        name: AppRouteNames.rateRouteSafety,
        builder: (context, state) => const RateRouteSafetyScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.tripSummary,
        name: AppRouteNames.tripSummary,
        builder: (context, state) => const TripSummaryAnalyticsScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.safetyMapMain,
        name: AppRouteNames.safetyMapMain,
        builder: (context, state) => const SafetyMapMainScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.safePointsNearby,
        name: AppRouteNames.safePointsNearby,
        builder: (context, state) => const SafePointsNearbyScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.incidentHeatmap,
        name: AppRouteNames.incidentHeatmap,
        builder: (context, state) => const IncidentReportsHeatmapScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.reportIncident,
        name: AppRouteNames.reportIncident,
        builder: (context, state) => const ReportNewIncidentScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.reportConfirmation,
        name: AppRouteNames.reportConfirmation,
        builder: (context, state) => const SubmitReportConfirmationScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.settingsDashboard,
        name: AppRouteNames.settingsDashboard,
        builder: (context, state) => const SettingsDashboardScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.privacySettings,
        name: AppRouteNames.privacySettings,
        builder: (context, state) => const PrivacySettingsScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.accessibilitySettings,
        name: AppRouteNames.accessibilitySettings,
        builder: (context, state) => const AccessibilitySettingsScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.sosCustomization,
        name: AppRouteNames.sosCustomization,
        builder: (context, state) => const SosCustomizationScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.notificationPreferences,
        name: AppRouteNames.notificationPreferences,
        builder: (context, state) => const NotificationPreferencesScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.noInternet,
        name: AppRouteNames.noInternet,
        builder: (context, state) => const NoInternetConnectivityScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.noTrustedContacts,
        name: AppRouteNames.noTrustedContacts,
        builder: (context, state) => const NoTrustedContactsScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.gpsLost,
        name: AppRouteNames.gpsLost,
        builder: (context, state) => const GpsSignalLostScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.emptyTripHistory,
        name: AppRouteNames.emptyTripHistory,
        builder: (context, state) => const EmptyTripHistoryScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.permissionDenied,
        name: AppRouteNames.permissionDenied,
        builder: (context, state) => const PermissionDeniedScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.serverMaintenance,
        name: AppRouteNames.serverMaintenance,
        builder: (context, state) => const ServerMaintenanceScreen(),
      ),
    ],
  );
});









