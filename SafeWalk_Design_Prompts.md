# SafeWalk — Design & Presentation Prompts

## Part A: UI/UX Design Prompt (Mobile App — Figma / AI Image Generator)

Use this prompt with Figma AI, Midjourney, or any UI design tool to generate consistent, high-quality mobile screens for SafeWalk.

---

### PROMPT: SafeWalk Mobile App UI Design

```
Design a mobile app UI for "SafeWalk" — a personal safety companion app that helps people walking alone at night by offering safer route suggestions, real-time trip sharing with trusted contacts, and one-tap emergency SOS.

TARGET DEVICE: iPhone 15 Pro frame (393 × 852 pt) and Android equivalent

---

DESIGN THEME & VISUAL IDENTITY

Brand Personality: Calm, trustworthy, protective — like a reassuring friend, not a panic button.

Color Palette:
- Primary: Deep Navy #1B3A5C (headers, app bar, trust signals)
- Secondary: Soft Sky Blue #3B82F6 (interactive elements, links, route highlights)
- Accent — Safe: Emerald Green #10B981 (safe indicators, arrival confirmation, "I'm fine" button)
- Accent — Alert: Warm Amber #F59E0B (moderate warnings, route caution labels)
- Accent — Emergency: Crimson Red #EF4444 (SOS button ONLY — never used casually elsewhere)
- Background: Off-White #F8FAFC (main bg), Cool Gray #F1F5F9 (card bg)
- Text: Charcoal #1E293B (body), Slate #64748B (secondary/muted)
- Surface: White #FFFFFF (cards, bottom sheet, modals)

Typography:
- Headlines: Inter Bold or SF Pro Display Bold, 20–28pt
- Body: Inter Regular or SF Pro Text Regular, 14–16pt
- Captions/Labels: Inter Medium, 12pt
- SOS Button Label: Inter Black, 24pt
- All text must meet WCAG AA contrast (4.5:1 minimum)

Iconography:
- Rounded, 2px stroke, Lucide or Phosphor icon style
- Safety icons: shield, route, phone, bell, map-pin, users, alert-triangle
- Always pair icons with text labels (no icon-only buttons for critical actions)

Corner Radius: 12px for cards, 16px for modals/bottom sheets, 50% for avatars, full-round for SOS button

Shadows: Subtle — 0 2px 8px rgba(0,0,0,0.06) for cards; 0 4px 16px rgba(0,0,0,0.12) for modals

Spacing: 8px grid system; 16px screen padding; 12px between list items

---

SCREEN LIST (design each as a separate frame):

1. SPLASH SCREEN
   - SafeWalk logo (shield + walking figure icon) centered
   - Deep navy background, white logo
   - Tagline: "You're never walking alone."

2. ONBOARDING (3 slides)
   - Slide 1: Illustration of person walking at night with phone glowing → "Find safer routes"
   - Slide 2: Illustration of map with dotted line shared to 2 contacts → "Share your journey instantly"
   - Slide 3: Illustration of SOS pulse with shield → "Help is one tap away"
   - Bottom: dot indicators + "Get Started" button (Sky Blue, full width)

3. SIGN UP / LOGIN
   - Clean form: email, password
   - Social login buttons (Google, Apple)
   - Phone OTP option
   - Bottom link: "Already have an account? Log in"

4. PERMISSION REQUEST SCREENS
   - Location permission (illustration + explanation of why it's needed)
   - Notification permission
   - Phone call permission (for SOS auto-dial)
   - Each screen: illustration + 1-sentence explanation + "Allow" button + "Skip for now" text link

5. ADD TRUSTED CONTACTS
   - Header: "Who should know when you're walking?"
   - Contact cards: name, phone, relationship tag (Friend/Family/Partner)
   - "Add Contact" button with + icon
   - Star icon to mark priority contact
   - Minimum 2 contacts required indicator

6. SAVE HOME ADDRESS
   - Map with search bar at top
   - Pin drop on map
   - Address card at bottom with "Save as Home" button
   - Optional: "Add Work" and "Add School" secondary actions

7. HOME SCREEN
   - Top: greeting "Good evening, Ha" + safety status pill ("Safe Zone" in green)
   - Center: Large "Go Home" button (navy, rounded, prominent) with home icon + estimated time
   - Below: Recent destinations as horizontal scroll chips
   - Bottom nav: Home (active), Trip, Contacts, Map, Settings
   - SOS floating button: bottom-right, crimson red, circular, 64dp, always visible

8. DESTINATION SEARCH
   - Search bar at top with placeholder "Where are you going?"
   - Saved places: Home, Work, School with icons
   - Recent destinations list
   - Map showing current location

9. ROUTE SELECTION
   - Map showing 3 route options (different colored polylines)
   - Bottom sheet with route cards:
     - Route 1: "Fastest — 12 min" (gray badge)
     - Route 2: "Better Lit — 16 min" (green badge, recommended tag)
     - Route 3: "More Populated — 14 min" (blue badge)
   - Each card: distance, time, safety score bar (0–100), safe points count
   - "Start Trip" button on selected route

10. ACTIVE TRIP SCREEN
    - Full map with route polyline highlighted
    - Top bar: ETA countdown + distance remaining
    - Companion status bar (below top bar): avatar thumbnails + "Linh and Vy are watching"
    - Bottom area: large SOS button (left) + Companion Mode button (right)
    - Progress indicator along route
    - Minimal, glanceable — optimized for walking

11. CHECK-IN PROMPT (overlay)
    - Semi-transparent overlay on active trip
    - Card: "Are you okay?" with soft alert icon
    - Two large buttons: "I'm Fine" (green) and "Need Help" (red)
    - Auto-escalation timer text: "If no response in 60s, your contacts will be notified"

12. SOS ACTIVATION SCREEN
    - Full-screen crimson red background
    - Central: circular countdown (3, 2, 1) with pulsing ring animation
    - Text: "Hold to activate SOS"
    - On activation: "SOS SENT" with checkmark
    - Below: "Calling Linh..." with contact avatar
    - Nearest safe points list at bottom
    - "Cancel" button (small, bottom)

13. FAKE CALL SCREEN
    - Simulated incoming call UI (matches OS native call screen)
    - Caller: "Linh" (or configured trusted contact name)
    - Accept / Decline buttons
    - On accept: timer counting up, mute/speaker buttons
    - Subtle SafeWalk branding at top

14. ARRIVAL CONFIRMATION
    - Celebration/relief illustration (person arriving at door, warm light)
    - "You arrived safely!" in large green text
    - Time: "10:47 PM"
    - "Linh and Vy have been notified."
    - "End Trip" button
    - Optional: "Rate this route's safety" with 5 stars

15. TRUSTED CONTACTS LIST
    - Contact cards with avatar, name, relationship badge, phone
    - Star for priority contact
    - Swipe to edit/delete
    - Toggle: "Can view my trips" per contact
    - "Add Contact" FAB

16. SAFETY MAP
    - Full map with colored overlays:
      - Green zones: well-lit, populated
      - Yellow zones: moderate
      - Red pins: community-reported unsafe spots
    - Bottom sheet: nearby safe points list (name, type, distance, open/closed status)
    - "Report an Issue" FAB

17. REPORT INCIDENT
    - Map with pin drop for location
    - Category selector: Dark Area, Broken Light, Followed, Harassment, Other
    - Tag chips: "dark", "deserted", "no sidewalk", "broken light"
    - Optional text description
    - Optional photo upload
    - Severity slider (1–5)
    - "Submit Report" button

18. SETTINGS
    - Profile section (avatar, name, email)
    - Privacy: auto-share toggle, trip history toggle
    - Safety: SOS hold duration, check-in interval, fake call contact name
    - Accessibility: high contrast, large touch targets, haptic feedback
    - Notifications: trip alerts, community alerts
    - About: version, terms, privacy policy

19. EMPTY/ERROR STATES
    - No trusted contacts yet: illustration + "Add your first contact"
    - No internet during trip: offline mode indicator + "Location still tracking"
    - Permission denied: explanation + "Go to Settings" button
    - Trip history empty: illustration + "Your first trip awaits"

---

DESIGN PRINCIPLES:
- Every screen should be usable with one hand (thumb zone)
- Critical actions in bottom 60% of screen
- SOS must be reachable from ANY screen in ≤2 taps
- During active trip: minimal UI, maximum glanceability
- Never use red except for SOS — avoid constant alarm aesthetic
- Dark mode variant: use #0F172A background, #E2E8F0 text, keep SOS red
```

---

## Part B: Presentation Slide Deck Prompt

Use this prompt with PowerPoint AI, Gamma.app, Beautiful.ai, or any slide generation tool.

---

### PROMPT: SafeWalk Presentation Deck

```
Create a professional presentation deck for "SafeWalk" — a mobile app UX/UI design project by Group 11. This is a university course final presentation for a UX/UI Design class. The deck should tell a compelling product story from problem to solution.

TOTAL SLIDES: 25–30 slides

VISUAL STYLE:
- Clean, modern, minimalist — inspired by Apple keynote aesthetic
- Primary color: Deep Navy #1B3A5C
- Accent: Sky Blue #3B82F6 and Emerald Green #10B981
- Alert red #EF4444 used sparingly (SOS references only)
- White backgrounds with navy headers
- Typography: Inter or Helvetica Neue, bold headlines, light body
- Large visuals, minimal text per slide (max 5 bullet points)
- Use device mockups to showcase app screens
- Include icons from Lucide/Phosphor set for visual consistency

---

SLIDE STRUCTURE:

SLIDE 1 — TITLE
- "SafeWalk" in large navy text
- Subtitle: "A Personal Safety Companion for Nighttime Commuters"
- Group 11 | UX/UI Design | 2025–2026
- Small SafeWalk logo icon (shield + walking figure)

SLIDE 2 — AGENDA
- Clean numbered list: Problem → Research → Persona → Pain Points → Solution → Features → Architecture → Design → Prototype → Demo → Accessibility → Next Steps

SLIDE 3 — THE PROBLEM
- Headline: "Walking alone at night is scarier than it needs to be."
- 3 statistics (use icons):
  - "78% of women feel unsafe walking alone after dark" (source: UN Women)
  - "Average 5+ steps to share location in an emergency"
  - "No single app combines safe routing + live sharing + SOS"
- Visual: dark street photo with single person silhouette

SLIDE 4 — PROBLEM STATEMENT
- Large quote format: "People who regularly walk alone at night need a simple way to choose safer routes, share their journey faster, and call for help easier — because current tools are fragmented, multi-step, and don't address real-time anxiety."

SLIDE 5 — SDG ALIGNMENT
- UN SDG 11 logo: Sustainable Cities and Communities
- Brief text: "SafeWalk supports Target 11.7 — providing safe, inclusive public spaces for all."

SLIDE 6 — USER RESEARCH OVERVIEW
- Methods: 12 interviews + 95 survey responses
- Key finding icons: "82% share location manually", "67% have pretended to make phone calls", "91% want a one-tap emergency feature"

SLIDE 7 — COMPETITIVE ANALYSIS
- 2×2 matrix: Safety Focus (low→high) vs. Ease of Use (low→high)
- Plot 8–10 competitor apps (Google Maps, Life360, bSafe, Noonlight, Citizen, etc.)
- SafeWalk positioned in top-right quadrant
- Caption: "No existing app combines all three: safe routing + live sharing + discreet SOS"

SLIDE 8 — MEET HÀ (PERSONA)
- Left: illustrated persona portrait (22-year-old Vietnamese woman, casual style)
- Right: bio card
  - Name: Hà Trần, 22
  - Role: Senior student, part-time barista
  - Commute: Walks home alone after 10 PM shifts
  - Device: Mid-range Android
  - Quote: "I don't need a super smart app. I just need to feel like if something happens, I'm not completely alone."

SLIDE 9 — PAIN POINTS
- 6 pain point cards with icons:
  1. "Doesn't know which route is safer at night"
  2. "Too many steps to share location when scared"
  3. "Feels isolated during the entire walk"
  4. "No discreet way to call for help"
  5. "Anxiety starts before leaving, not just during danger"
  6. "Wants protection without 24/7 surveillance"

SLIDE 10 — USER JOURNEY MAP
- 6-column horizontal journey: Before Trip → Start Trip → Walking → Incident → Arrival → After
- Each column: user action, feeling (emoji scale), pain point, SafeWalk opportunity
- Color gradient from anxious (yellow) to safe (green)

SLIDE 11 — EMPATHY MAP
- 4 quadrants: Says / Thinks / Does / Feels
- Centered on Hà's nighttime commute experience
- Key quotes in each quadrant

SLIDE 12 — VALUE PROPOSITION
- Large text: "SafeWalk doesn't sell absolute safety. It reduces isolation, reduces response delay, and increases the sense of control for someone walking alone."

SLIDE 13 — FEATURE OVERVIEW
- 7 feature cards in grid layout (2 rows):
  - Safe Onboarding | Safe Route Selection | Live Trip Sharing | Smart Check-In | SOS Emergency | Companion Mode | Arrival Confirmation
- Each with icon + 1-line description

SLIDE 14 — CORE FLOW DIAGRAM
- Visual flowchart: Open App → Go Home → Select Route → Trip Active → (Check-in / SOS / Fake Call) → Arrive → Notify Contacts

SLIDE 15 — INFORMATION ARCHITECTURE
- Sitemap tree: Home, Trip, Contacts, Safety Map, Settings
- Clean tree diagram with icons at each node

SLIDE 16 — DESIGN SYSTEM
- Color palette swatches with hex codes
- Typography scale (H1 through Caption)
- Button styles (Primary, Secondary, SOS, Ghost)
- Icon set sample
- Spacing grid demonstration

SLIDE 17-20 — KEY SCREENS (4 slides, 2–3 screens each in device mockups)
- Slide 17: Onboarding + Home Screen
- Slide 18: Route Selection + Active Trip
- Slide 19: Check-In + SOS Activation
- Slide 20: Companion Mode + Arrival Confirmation

SLIDE 21 — PROTOTYPE DEMO
- Center: large device mockup with "Play Demo" overlay
- Or: QR code linking to Figma prototype
- Text: "Interactive prototype — 126 Figma screens, 45 coded in Flutter"

SLIDE 22 — ROUTE SAFETY ALGORITHM
- Simple diagram showing scoring factors:
  - Street Lighting (30%) + Road Type (25%) + Safe Points (20%) + Time of Day (15%) + Community Reports (10%) = Safety Score
- Note: "MVP uses rule-based scoring with simulated data"

SLIDE 23 — ACCESSIBILITY
- Checklist visual:
  - ✓ Large touch targets (48dp+)
  - ✓ WCAG AA contrast
  - ✓ One-hand operation
  - ✓ Haptic SOS feedback
  - ✓ Icon + text for all states
  - ✓ Low-attention design for walking
  - ✓ Max 2 taps to SOS from any screen

SLIDE 24 — USABILITY TESTING RESULTS
- 5 key metrics with before/after:
  - Setup time: <3 min ✓
  - Taps to start trip: 3 ✓
  - Time to SOS: <5 sec ✓
  - Route label comprehension: 92% ✓
  - Safety perception: 4.3/5 ✓
- User quote: "This is the first app that made me feel less alone on my walk home."

SLIDE 25 — TECH STACK
- Clean icon grid: Flutter | Firebase | Google Maps API | FCM | Firestore
- Architecture diagram: Client → Business Logic → Data Layer → External Services

SLIDE 26 — DEVELOPMENT TIMELINE
- Gantt-style visual: 9 weeks
- Research → Design → Test → Code → Deliver

SLIDE 27 — TEAM
- 5 member cards: PM/Researcher, UX Architect, UI Designer, Dev Lead, Dev + QA
- Each with name, photo placeholder, role title

SLIDE 28 — WHAT'S NEXT (Phase 2)
- Community Safety Map
- Enhanced AI Scoring
- Smartwatch Integration
- Voice-Activated SOS
- Low Battery Alerts

SLIDE 29 — CLOSING
- Large text: "SafeWalk turns a scary walk into a journey with preparation, companionship, and a rapid response plan."
- SafeWalk logo

SLIDE 30 — Q&A
- "Questions?" in large text
- Team email / GitHub / Figma prototype link
- Thank you note
```

---

## Part C: Quick Reference — Design Tokens

| Token | Value | Usage |
|-------|-------|-------|
| `--color-primary` | `#1B3A5C` | Headers, nav, trust signals |
| `--color-secondary` | `#3B82F6` | Buttons, links, route lines |
| `--color-safe` | `#10B981` | Safe indicators, arrival, "I'm fine" |
| `--color-caution` | `#F59E0B` | Moderate warnings |
| `--color-emergency` | `#EF4444` | SOS button ONLY |
| `--color-bg` | `#F8FAFC` | Main background |
| `--color-surface` | `#FFFFFF` | Cards, sheets |
| `--color-text` | `#1E293B` | Primary text |
| `--color-muted` | `#64748B` | Secondary text |
| `--radius-card` | `12px` | Cards |
| `--radius-modal` | `16px` | Bottom sheets, modals |
| `--radius-button` | `12px` | Standard buttons |
| `--radius-sos` | `50%` | SOS button (circle) |
| `--spacing-unit` | `8px` | Base grid unit |
| `--spacing-screen` | `16px` | Screen edge padding |
| `--font-family` | `Inter` | Primary typeface |
| `--font-headline` | `Bold 20–28pt` | Headlines |
| `--font-body` | `Regular 14–16pt` | Body text |
| `--font-caption` | `Medium 12pt` | Labels, captions |
| `--touch-min` | `48dp` | Minimum touch target |
| `--touch-sos` | `72dp` | SOS button size |
