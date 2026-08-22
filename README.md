<div align="center">

<img src="https://raw.githubusercontent.com/mohamedagm/MegoFood/main/android/app/src/main/res/drawable-hdpi/splash.png" alt="MegoFood Logo" width="20%" style="border-radius:24px"/>

<br/>

# MegoFood 🍔

### Food Delivery & E-Commerce Platform

_From onboarding to order placed — a complete food delivery experience built with Flutter._

</div>

---

> [!IMPORTANT]
> ### 🔒 Copyright & Usage Notice
>
> **MegoFood** is published as a **professional portfolio project**. The source code is made publicly available strictly **for viewing and technical evaluation purposes** — this is not an open-source release.
>
> Unless explicitly authorized in writing by the copyright holder, you may **not**:
>
> &nbsp;&nbsp;🚫&nbsp; Copy or reuse any part of this project
> &nbsp;&nbsp;🚫&nbsp; Modify the code or create derivative works
> &nbsp;&nbsp;🚫&nbsp; Redistribute the source code, in whole or in part
> &nbsp;&nbsp;🚫&nbsp; Use the project for academic or commercial purposes
>
> <br>
>
> **© 2026 Mohamed Ahmed — All Rights Reserved**

---

<p align="center">

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![BLoC](https://img.shields.io/badge/State_Management-BLoC-blue?style=for-the-badge)](https://bloclibrary.dev/)
[![Feature--First](https://img.shields.io/badge/Pattern-Feature--First-ff69b4?style=for-the-badge)](https://docs.flutter.dev/app-architecture/guide)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-lightgrey?style=for-the-badge&logo=flutter)](https://flutter.dev/multi-platform)
<a href="https://pub.dev/packages/get_it">
<img src="https://img.shields.io/badge/DI-GetIt-4CAF50?style=for-the-badge" alt="GetIt DI"/>
</a>
<a href="https://pub.dev/packages/go_router">
<img src="https://img.shields.io/badge/Routing-go__router-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="go_router"/>
</a>

</p>

---

## 📋 Table of Contents

<br>

**🔷 Overview**

|     | Section                                 |                |
| :-: | :-------------------------------------- | :------------- |
| 📖  | [About the Project](#about-the-project) | `Overview`     |
| ✨  | [Core Features](#core-features)         | `Highlights`   |

<br>

**⚙️ Technical**

|     | Section                                               |                        |
| :-: | :---------------------------------------------------- | :--------------------- |
| 🏗  | [Architecture Overview](#architecture-overview)       | `Feature-First · BLoC` |
| 🧠  | [Design Decisions](#design-decisions)                 | `Key patterns`         |
| 📁  | [Project Structure](#project-structure)               | `lib/ tree`            |
| ⚒  | [Tech Stack & Dependencies](#tech-stack-dependencies) | `Packages & Plugins`   |

<br>

**📦 Resources**

|     | Section                                       |                     |
| :-: | :-------------------------------------------- | :------------------ |
| ⚙️  | [Configuration](#configuration)               | `Backend URL`       |
| 🗺  | [Roadmap](#roadmap)                           | `In progress`       |
| 👤  | [Developer](#developer)                       | `Contributors`      |
| 📄  | [License](#license)                           | `All Rights Reserved` |

---

<h2 id="about-the-project">📖 About the Project</h2>

**MegoFood** is a full-featured food delivery mobile application covering the entire journey — from a smooth onboarding experience, through browsing restaurants and menus, all the way to checkout and order confirmation.

The app connects to an **ASP.NET Core REST API** backend for authentication and catalog data, while keeping the shopping experience fully responsive offline through **local persistence**: the cart and favourites live in Hive, so they survive restarts and work without connectivity.

The project spans `~200 Dart files` across **13 independent feature modules**, built with a strict feature-first structure and BLoC/Cubit state management.

<h2 id="core-features">✨ Core Features</h2>

### 🔐 Authentication (fully connected to REST API)

- Login & registration with full input validation (email, password, Egyptian phone number, OTP)
- Email OTP verification after registration
- Forgot password flow → OTP verification → reset password
- Profile completion & automatic session handling via cached tokens
- Smart initial routing: `onboarding → auth → home` based on cached state

### 🛍️ Shopping Experience

- **Home** — base categories, trending products & top stores
- **Restaurants & Products** — restaurant details, rich menus & product pages with add-to-cart
- **Search** — live search results with debouncing ⚡
- **Explore & Filters** — category-based browsing with filter bottom sheets
- **Cart** — quantity management & coupons 🎟️, persisted locally with Hive
- **Favourites** — saved locally, available offline

### 💳 Checkout Flow

- Address management with **Google Maps** location picking 📍
- Card selection & coupon codes
- Order placed screen with payment summary ✅

### 👤 Profile & More

- Edit profile · My orders · Settings · Language selection 🌐
- Notification center 🔔
- Account deletion

### 🎨 UI / Theming

- **Material 3** with a custom `ThemeExtension` design system for colors & typography
- Full **dark & light mode** ☀️🌙 following system settings
- Native splash screen, shimmer loading placeholders & smooth page indicators
- Shared reusable widget library across all features

<h2 id="architecture-overview">🏗 Architecture Overview</h2>

This Flutter application follows a **Feature-First Architecture** combined with **BLoC/Cubit** state management and the **Repository Pattern**, with functional error handling using `dartz`.

```
                  ┌──────────────────────────────────────────────────────────────┐
                  │                   FLUTTER CLIENT (This Repo)                 │
                  │                                                              │
                  │  ┌─────────────────┐   ┌──────────────────┐   ┌───────────┐  │
                  │  │  Feature-First  │   │  Cubit/Bloc State│   │  Hive +   │  │
                  │  │  Architecture   │   │    Management    │   │   Shared  │  │
                  │  └─────────────────┘   └──────────────────┘   │ Preferences│ │
                  │                                               └───────────┘  │
                  │  ┌─────────────────┐   ┌─────────────────┐   ┌───────────┐  │
                  │  │   go_router     │   │ Dio + Custom    │   │  GetIt DI │  │
                  │  │ Declarative Nav │   │ Interceptors    │   │  Locator  │  │
                  │  └─────────────────┘   └─────────────────┘   └───────────┘  │
                  └──────────────────────────────┬───────────────────────────────┘
                                                 │ REST API (Dio)
                                                 ▼
                                  ┌──────────────────────────────┐
                                  │        Backend API           │
                                  │  Auth · Catalog · Categories │
                                  │  Restaurants · Products      │
                                  └──────────────────────────────┘
```

### Typical Feature Flow

1. The user performs an action in the UI.
2. The corresponding Cubit receives the action.
3. The Cubit calls the Repository.
4. The Repository communicates with the local data source (Hive) or the remote API (Dio).
5. The result is converted into success or failure states (`Either<Failure, T>`).
6. The UI reacts to the emitted state.

This structure supports modularity, maintainability, and future feature expansion.

<h2 id="design-decisions">🧠 Design Decisions</h2>

### Global Cart & Favourites via `ShellRoute`

A GoRouter `ShellRoute` provides `CartCubit` and `FavoriteCubit` above every route that needs them — keeping cart/favourites badge counts and state perfectly consistent across all screens without prop-drilling or duplicate instances.

### Smart Initial Routing

On startup, the router decides the entry screen from cached flags:

```text
isOnboardingDone == null  →  Onboarding
token == null             →  Auth
otherwise                 →  Main App
```

### Functional Error Handling

Repositories return `Either<Failure, T>` (via `dartz`) instead of throwing exceptions — forcing every caller to explicitly handle failure states, backed by custom `Failure` classes and Dio exception mapping.

### Theming as a Design System

Colors and text styles are exposed through custom `ThemeExtension`s (`AppColorsExtension`, `AppTextStylesExtension`) with light/dark variants — making theme-aware styling type-safe and consistent everywhere.

<h2 id="project-structure">📁 Project Structure</h2>

```
lib/
├── core/                       # App-wide shared resources
│   ├── api/                    # Dio consumer, endpoints & interceptors
│   ├── cache/                  # SharedPreferences wrapper
│   ├── const/                  # App assets constants
│   ├── errors/                 # Failures & Dio exceptions (Either pattern)
│   ├── routing/                # GoRouter config + smart initial-route logic
│   ├── services/               # GetIt setup & location service
│   ├── storage/                # Hive storage service
│   ├── theme/                  # Material 3 themes + color/text-style extensions
│   ├── utils/                  # Validators, helpers & formatters
│   └── widgets/                # Shared reusable components
│
├── features/                   # Independent feature modules
│   ├── auth/                   # Login, register, OTP, reset password, addresses
│   ├── onBoarding/             # Welcome flow
│   ├── main/                   # Bottom-nav shell
│   ├── home/                   # Home feed, top rated, top stores
│   ├── explore/                # Explore & filters
│   ├── search/                 # Live search
│   ├── product_details/        # Product page
│   ├── restaurant_details/     # Restaurant page
│   ├── menu/                   # Menu, orders, profile, settings
│   ├── category_restaurants/   # Restaurants by category
│   ├── cart/                   # Cart, coupons, checkout, order placed
│   ├── favorite/               # Favourites (local)
│   └── notification/           # Notifications
│
└── main.dart                   # App entry point
```

### Feature Module Pattern

Full features follow the same internal structure for consistency:

```
feature_name/
├── data/
│   ├── models/                 # DTOs & JSON parsers
│   ├── repo/                   # Repository implementations
│   └── datasource/             # Local data sources (Hive)
└── presentation/
    ├── manager/                # Business logic (Cubits / Blocs)
    ├── views/                  # Screens
    └── widgets/                # Feature-specific widgets
```

<h2 id="tech-stack-dependencies">⚒ Tech Stack & Dependencies</h2>

### Core

| Package        | Purpose                                         |
| -------------- | ----------------------------------------------- |
| `flutter`      | Cross-platform UI framework (iOS & Android)     |
| `flutter_bloc` | Bloc/Cubit state management                     |
| `equatable`    | Value equality for Cubit state comparisons      |
| `go_router`    | Declarative routing & deep linking              |
| `get_it`       | Dependency injection (Service Locator)          |
| `dartz`        | Functional error handling: `Either<L, R>` types |

### Networking

| Package | Purpose                           |
| ------- | --------------------------------- |
| `dio`   | HTTP client with interceptors     |
| `intl`  | Date/number formatting            |

### Storage

| Package              | Purpose                                        |
| -------------------- | ---------------------------------------------- |
| `hive_ce`            | Local persistence (cart & favourites boxes)    |
| `shared_preferences` | Session flags & tokens                         |

### Maps & Location

| Package               | Purpose                                    |
| --------------------- | ------------------------------------------ |
| `google_maps_flutter` | Interactive maps & address picking         |
| `geolocator`          | Device location access                     |
| `geocoding`           | Coordinates ↔ address conversion           |

### UI & UX

| Package                      | Purpose                          |
| ---------------------------- | -------------------------------- |
| `google_fonts`               | Custom typography                |
| `flutter_svg`                | SVG asset rendering              |
| `cached_network_image`       | Network image caching            |
| `shimmer`                    | Loading placeholder effects      |
| `pinput`                     | OTP input fields                 |
| `smooth_page_indicator`      | Onboarding page indicator        |
| `flutter_staggered_grid_view`| Staggered product grids          |
| `flutter_switch`             | Toggle switches (settings)       |

### Media & Tools

| Package                 | Purpose                            |
| ----------------------- | ---------------------------------- |
| `image_picker`          | Profile image selection            |
| `flutter_native_splash` | Native splash screens (light/dark) |
| `build_runner`          | Code generation (Hive adapters)    |

<h2 id="configuration">⚙️ Configuration</h2>

The backend base URL lives in `lib/core/api/api_end_points.dart`:

```dart
static String baseUrl = 'http://megofood.runasp.net';
```

### Getting Started

```bash
# 1️⃣ Clone the repo
git clone https://github.com/mohamedagm/MegoFood.git
cd MegoFood

# 2️⃣ Install dependencies
flutter pub get

# 3️⃣ Generate Hive adapters
dart run build_runner build --delete-conflicting-outputs

# 4️⃣ Run the app
flutter run
```

> Requires Flutter SDK `^3.9.2`

<h2 id="roadmap">🗺 Roadmap</h2>

| Status | Area                                          |
| :----: | --------------------------------------------- |
|   ✅   | Authentication & session management           |
|   ✅   | Home, catalog, search & filters               |
|   ✅   | Cart, favourites & checkout flow              |
|   🔄   | Payments integration 💳                       |
|   🔄   | Push notifications 🔔                         |
|   🔄   | Maps enhancements 🗺                          |
|   🔄   | Remaining backend endpoints wiring            |

<h2 id="developer">👤 Developer</h2>

<table align="center">
<tr>
<td align="center">
  <a href="https://github.com/mohamedagm">
    <img src="https://github.com/mohamedagm.png" width="120" height="120" style="border-radius:50%"><br>
    <b>Mohamed Ahmed (AboGM)</b>
  </a><br>
  <sub>Flutter Developer</sub><br>
  <a href="https://github.com/mohamedagm"><img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white"></a>
  <a href="https://www.linkedin.com/in/mohamedahmedgm/"><img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white"></a>
</td>
</tr>
</table>

<h2 id="license">📄 License</h2>

**All Rights Reserved © 2026 — Mohamed Ahmed**

This project — including all source code, assets, branding, and documentation — is the intellectual property of the developer and is published **for portfolio and technical-evaluation purposes only**.

No part of this project may be copied, modified, redistributed, or used for academic or commercial purposes without prior written permission.

> See the [Copyright & Usage Notice](#top) at the top of this document for full details.

---

<div align="center">

🍔 **MegoFood** — *Bon appétit!* 🍟<br/>

Made with 💙 and lots of coffee ☕ using [Flutter](https://flutter.dev)

</div>
