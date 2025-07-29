# Music Player Mobile

A modern Flutter music player application with authentication, local audio playback, and a beautiful user interface.

## Features

- **User Authentication**: Secure signup and login system
- **Local Audio Playback**: Play music files from your device
- **Background Audio**: Continue playing music while using other apps
- **Audio Waveforms**: Visual representation of audio tracks
- **File Picker**: Easy selection of audio files from device storage
- **Customizable Theme**: Dark theme with color customization options
- **Offline Support**: Works completely offline with local files
- **Cross-Platform**: Supports Android, iOS, Web, Windows, Linux, and macOS

## Architecture

This project follows a clean architecture pattern with the following structure:

```
lib/
├── core/           # Shared utilities, constants, and widgets
│   ├── constants/  # App-wide constants
│   ├── failure/    # Error handling
│   ├── models/     # Shared data models
│   ├── providers/  # Global state providers
│   ├── theme/      # App theming
│   ├── utils/      # Utility functions
│   └── widgets/    # Reusable UI components
├── features/       # Feature-based modules
│   ├── auth/       # Authentication feature
│   └── home/       # Home screen and music player
└── main.dart       # App entry point
```

## Tech Stack

- **Framework**: Flutter 3.8+
- **State Management**: Riverpod with code generation
- **Audio Playback**: just_audio with background service
- **Local Storage**: Hive for data persistence
- **File Management**: file_picker for audio file selection
- **UI Components**: Custom widgets with Material Design
- **Audio Visualization**: audio_waveforms for waveform display
- **HTTP Client**: http for API calls (if needed)
- **Functional Programming**: fpdart for functional programming utilities

## Screenshots

*Screenshots will be added here*

## Getting Started

### Prerequisites

- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / VS Code
- Android SDK (for Android development)
- Xcode (for iOS development, macOS only)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd music_player_mobile
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run code generation** (for Riverpod)
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Building for Production

**Android:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

**Web:**
```bash
flutter build web --release
```

## Project Structure

### Core Components

- **Authentication**: User registration and login system
- **Music Player**: Local audio file playback with controls
- **File Management**: Audio file selection and organization
- **Theme System**: Customizable dark theme with color picker
- **State Management**: Global state using Riverpod providers

### Key Dependencies

- `just_audio`: Audio playback engine
- `just_audio_background`: Background audio service
- `audio_waveforms`: Audio visualization
- `file_picker`: File selection from device
- `hive`: Local database storage
- `flutter_riverpod`: State management
- `shared_preferences`: User preferences storage
- `flex_color_picker`: Color customization
- `dotted_border`: UI styling

## Configuration

### Android Permissions

The app requires the following permissions:
- `READ_EXTERNAL_STORAGE`: Access to audio files
- `WRITE_EXTERNAL_STORAGE`: Save files (if needed)
- `INTERNET`: Network access (if needed)

### iOS Permissions

- Microphone access (if recording features are added)
- File access permissions

## Customization

### Theme Customization

The app uses a dark theme by default with customizable colors. Users can modify the theme through the settings interface.

### Adding New Features

1. Create a new feature directory in `lib/features/`
2. Follow the existing pattern with `models/`, `repositories/`, `view/`, and `viewmodel/` directories
3. Add necessary providers to the core providers directory
4. Update the main app to include the new feature

## Troubleshooting

### Common Issues

1. **Audio not playing**: Check device permissions and audio file format
2. **Build errors**: Run `flutter clean` and `flutter pub get`
3. **Code generation issues**: Run `flutter packages pub run build_runner build --delete-conflicting-outputs`

### Debug Mode

For debugging, run the app in debug mode:
```bash
flutter run --debug
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Support

If you encounter any issues or have questions, please:
1. Check the existing issues
2. Create a new issue with detailed information
3. Include device information and error logs

---

**Note**: This is a mobile music player application built with Flutter. It supports local audio file playback and provides a modern, intuitive user interface for music listening.
