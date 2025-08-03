import 'package:music_player_mobile/features/home/models/song_model.dart';
import 'package:music_player_mobile/features/home/repositories/home_local_repository.dart';
// import 'package:just_audio_background/just_audio_background.dart';  // Temporarily disabled
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:async';
part 'current_song_notifier.g.dart';

@riverpod
class CurrentSongNotifier extends _$CurrentSongNotifier {
  late HomeLocalRepository _homeLocalRepository;
  AudioPlayer? _audioPlayer;
  bool isPlaying = false;
  bool _isInitialized = false;

  AudioPlayer get audioPlayer {
    if (_audioPlayer == null) {
      _audioPlayer = AudioPlayer();
      _isInitialized = true;
      
      // Set up the player state listener
      _audioPlayer!.playerStateStream.listen((state) {
        if (state.processingState == ProcessingState.completed) {
          _audioPlayer!.seek(Duration.zero);
          _audioPlayer!.pause();
          isPlaying = false;
          this.state = this.state?.copyWith(hex_code: this.state?.hex_code);
        }
      });
    }
    return _audioPlayer!;
  }

  @override
  SongModel? build() {
    _homeLocalRepository = ref.watch(homeLocalRepositoryProvider);
    
    // Dispose the audio player when the provider is disposed
    ref.onDispose(() {
      _audioPlayer?.dispose();
    });
    
    return null;
  }

  void updateSong(SongModel song) async {
    try {
      // Ensure audio player is initialized
      final player = audioPlayer;
      
      await player.stop();
      
      // Use basic audio source without background support
      final audioSource = AudioSource.uri(Uri.parse(song.song_url));
      
      await player.setAudioSource(audioSource);
      await player.play();
      
      isPlaying = true;
      state = song;
      _homeLocalRepository.uploadLocalSong(song);
    } catch (e) {
      print('Error updating song: $e');
      // Reset state on error
      isPlaying = false;
      // Handle error appropriately
    }
  }

  void playPause() {
    if (_audioPlayer == null) return;
    
    if (isPlaying) {
      _audioPlayer!.pause();
    } else {
      _audioPlayer!.play();
    }
    isPlaying = !isPlaying;
    state = state?.copyWith(hex_code: state?.hex_code);
  }

  void seek(double val) {
    if (_audioPlayer == null || _audioPlayer!.duration == null) return;
    
    _audioPlayer!.seek(
      Duration(
        milliseconds: (val * _audioPlayer!.duration!.inMilliseconds).toInt(),
      ),
    );
  }
}
