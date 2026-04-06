class SupabaseEnv {
  const SupabaseEnv._();

  static const url = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://your-project-ref.supabase.co',
  );

  static const anonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: 'your-anon-key',
  );

  static bool get isConfigured =>
      !url.contains('your-project-ref') && anonKey != 'your-anon-key';
}

