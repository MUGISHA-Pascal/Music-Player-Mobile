import 'package:music_player_mobile/core/providers/current_user_notifier.dart';
import 'package:music_player_mobile/core/theme/theme.dart';
import 'package:music_player_mobile/features/auth/view/pages/signup_page.dart';
import 'package:music_player_mobile/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:music_player_mobile/features/home/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    await JustAudioBackground.init(
      androidNotificationChannelId: 'com.pascal.app.channel.audio',
      androidNotificationChannelName: 'Audio playback',
      androidNotificationOngoing: true,
    );
  } catch (e) {
    print('AudioService initialization error: $e');
    // Continue without audio background service for now
  }
  
  final dir = await getApplicationDocumentsDirectory();
  Hive.defaultDirectory = dir.path;
  
  final container = ProviderContainer();
  
  try {
    await container.read(authViewModelProvider.notifier).initSharedPreferences();
    await container.read(authViewModelProvider.notifier).getData();
  } catch (e) {
    print('Auth initialization error: $e');
    // Continue without auth data for now
  }

  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserNotifierProvider);

    return MaterialApp(
      title: 'Music App',
      theme: AppTheme.darkThemeMode,
      home: currentUser == null ? const SignupPage() : const HomePage(),
    );
  }
}
