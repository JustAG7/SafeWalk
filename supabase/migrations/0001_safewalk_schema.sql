create extension if not exists "pgcrypto";

create table if not exists public.profiles (
  id uuid primary key,
  full_name text not null default '',
  email text not null default '',
  avatar_url text,
  home_address text,
  work_address text,
  school_address text,
  is_setup_complete boolean not null default false,
  created_at timestamptz not null default now()
);

create table if not exists public.app_preferences (
  user_id uuid primary key references public.profiles(id) on delete cascade,
  auto_share_trips boolean not null default true,
  store_trip_history boolean not null default true,
  high_contrast_enabled boolean not null default false,
  large_touch_targets boolean not null default true,
  haptic_feedback_enabled boolean not null default true,
  sos_hold_seconds integer not null default 3,
  check_in_interval_minutes integer not null default 15,
  community_alerts_enabled boolean not null default true,
  trip_alerts_enabled boolean not null default true,
  updated_at timestamptz not null default now()
);

create table if not exists public.trusted_contacts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  name text not null,
  phone_number text not null,
  relationship text not null,
  is_priority boolean not null default false,
  can_view_trips boolean not null default true,
  created_at timestamptz not null default now()
);

create table if not exists public.saved_places (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  label text not null,
  address text not null,
  latitude double precision not null,
  longitude double precision not null,
  created_at timestamptz not null default now()
);

create table if not exists public.trips (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  origin_label text not null,
  destination_label text not null,
  status text not null default 'planned',
  started_at timestamptz not null default now(),
  arrived_at timestamptz,
  selected_route_id uuid
);

create table if not exists public.route_options (
  id uuid primary key default gen_random_uuid(),
  trip_id uuid not null references public.trips(id) on delete cascade,
  label text not null,
  duration_minutes integer not null,
  distance_meters integer not null,
  safety_score integer not null,
  safe_points_count integer not null default 0,
  is_recommended boolean not null default false
);

alter table public.trips
  add constraint trips_selected_route_fk
  foreign key (selected_route_id)
  references public.route_options(id)
  on delete set null;

create table if not exists public.safety_points (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  type text not null,
  address text not null,
  latitude double precision not null,
  longitude double precision not null,
  is_open boolean not null default false,
  created_at timestamptz not null default now()
);

create table if not exists public.incident_reports (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  category text not null,
  severity integer not null,
  latitude double precision not null,
  longitude double precision not null,
  description text,
  photo_url text,
  created_at timestamptz not null default now()
);
