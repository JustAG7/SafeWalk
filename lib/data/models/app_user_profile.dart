class AppUserProfile {
  const AppUserProfile({
    required this.id,
    required this.fullName,
    required this.email,
    this.avatarUrl,
    this.homeAddress,
    this.workAddress,
    this.schoolAddress,
    this.isSetupComplete = false,
  });

  final String id;
  final String fullName;
  final String email;
  final String? avatarUrl;
  final String? homeAddress;
  final String? workAddress;
  final String? schoolAddress;
  final bool isSetupComplete;

  Map<String, dynamic> toJson() => {
        'id': id,
        'full_name': fullName,
        'email': email,
        'avatar_url': avatarUrl,
        'home_address': homeAddress,
        'work_address': workAddress,
        'school_address': schoolAddress,
        'is_setup_complete': isSetupComplete,
      };
}

