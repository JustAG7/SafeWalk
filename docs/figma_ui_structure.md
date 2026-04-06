# SafeWalk Figma UI Structure

Source of truth: the latest Figma file at `https://www.figma.com/design/sPljZI13qWiBxgOnc6UPgo/WalkStack--Copy-?node-id=0-1`.

Note: fresh Figma MCP calls were rate-limited during scaffolding, so this document is based on the successful MCP frame inventory and root screenshot already retrieved earlier in this thread for the same file. It should be treated as the current Figma-derived route map for the initial code scaffold.

## Top-Level Product Areas

### 1. Entry And Auth
- Splash Screen
- Onboarding Slide 1: Safe Routes
- Onboarding Slide 2: Trip Sharing
- Onboarding Slide 3: SOS Protection
- Welcome Choice (Login / Signup)
- Login Screen
- Signup Screen

### 2. Permissions And Setup
- Location Permission
- Notification Permission
- Background Tracking Permission
- Call Permission
- Permission Success Confirmation
- Create Profile
- Add Avatar
- Add Trusted Contacts
- Edit Trusted Contact
- Set Home Address
- Add Work / School
- Setup Completed

### 3. Home And Planning
- Main Home Dashboard
- Quick Go Home Action
- Recent Destinations
- Safety Status Overview
- Smart City Alerts Feed
- Floating SOS Expanded
- Destination Search
- Destination Results
- Map Route Options
- Route Comparison Bottom Sheet
- Route Safety Score Details
- Route Recommendation AI
- Start Trip Confirmation

### 4. Live Trip
- Active Trip Main Screen
- Live Navigation
- Companion Mode Enabled
- Live Contact Tracking
- Check-in Prompt
- User Pressed "I'm Fine"
- Need Help Flow
- Trip Progress Update

### 5. Emergency
- SOS Hold Activation
- SOS Countdown
- Emergency Alert Sent
- Priority Contact Auto Call
- Nearby Safe Points
- Emergency Hotline

### 6. Companion
- Companion Mode Main
- Fake Call Incoming
- Active Fake Call
- Companion Chat / Voice Assist

### 7. Arrival And Post-Trip
- Arrival Success
- Notify Contacts
- Rate Route Safety
- Trip Summary Analytics

### 8. Safety Map And Reporting
- Safety Map Main
- Safe Points Nearby
- Incident Reports Heatmap
- Report New Incident
- Submit Report Confirmation

### 9. Settings
- Settings Dashboard
- Privacy Settings
- Accessibility Settings
- SOS Customization
- Notification Preferences

### 10. Empty And Error States
- No Internet Connectivity
- No Trusted Contacts Setup
- GPS Signal Lost
- Empty Trip History
- Permission Denied State
- Server Error / Maintenance

## Navigation Structure

### Entry Flow
`splash -> onboarding -> welcome -> login|signup`

### First-Time Setup Flow
`auth success -> permissions -> profile setup -> trusted contacts -> saved places -> setup completed -> home`

### Main App Shell
The design strongly suggests a persistent bottom navigation shell with these core destinations:
- Home
- Trips
- Contacts
- Map
- Settings

### Trip Planning Flow
`home -> destination search -> destination results -> route options -> route comparison / safety details / AI recommendation -> start trip confirmation -> active trip`

### Live Trip Flow
`active trip -> live navigation -> check-in prompt -> i'm fine | need help`

### Emergency Flow
`need help -> sos hold -> countdown -> alert sent -> priority call / nearby safe points / hotline`

### Companion Flow
`active trip -> companion mode -> fake call / chat / voice assist -> return to trip`

### Arrival Flow
`active trip -> arrival success -> notify contacts -> rate route -> trip summary`

### Safety Map Flow
`map -> safe points nearby | heatmap -> report incident -> report confirmation`

### Settings Flow
`settings -> privacy | accessibility | sos customization | notification preferences`

### System State Overlays
The design includes dedicated screens for recovery states:
- No internet
- No trusted contacts
- GPS lost
- Empty trip history
- Permission denied
- Server maintenance

## Scaffold Implications

### Route Groups
- `/entry/*`
- `/setup/*`
- `/app/home/*`
- `/app/planning/*`
- `/app/trip/*`
- `/app/companion/*`
- `/app/map/*`
- `/app/settings/*`
- `/system/*`

### Feature Modules
- `entry`
- `setup`
- `planning`
- `trip_live`
- `emergency`
- `companion`
- `post_trip`
- `safety_map`
- `settings`
- `system_states`

### Shared UI Needs
- App shell and bottom navigation
- Reusable page scaffold
- Route cards and safety score presentation
- Contact tiles and companion chips
- Floating SOS button
- Status pills, badges, and alert banners
- Empty/error state cards

### Shared Data Domains
- user profile
- trusted contacts
- saved places
- trip
- route option
- incident report
- safety point
- notification preferences
- privacy and accessibility settings
