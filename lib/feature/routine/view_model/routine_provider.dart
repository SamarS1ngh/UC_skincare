import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoutineProvider extends StateNotifier<List<ImageWithTime?>> {
  RoutineProvider() : super([null, null, null, null, null]) {
    _loadStreakData();
  }

  final ImagePicker picker = ImagePicker();
  final FirebaseStorage storage = FirebaseStorage.instance;
  int streakCount = 0;
  DateTime? lastCompletionDate;

  void reset() {
    state = [null, null, null, null, null];
  }

  void pickImage(int index) async {
    XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      state[index] = ImageWithTime(image, DateTime.now());
      state = [...state];
    }
  }

  Future<void> uploadImages() async {
    log('firebase storage requires credit card info for use.');
    bool allImagesSelected =
        state.every((imageWithTime) => imageWithTime != null);

    if (allImagesSelected) {
      // All images are selected, increment streak
      _incrementStreak();
    } else {
      // Reset streak if not all images are selected
      _resetStreak();
    }

    for (int i = 0; i < state.length; i++) {
      if (state[i] != null) {
        try {
          Reference ref =
              storage.ref().child('streaks/${state[i]!.image.name}');
          await ref.putFile(File(state[i]!.image.path));
          String downloadUrl = await ref.getDownloadURL();
          log('Image uploaded successfully! Download URL: $downloadUrl');
        } catch (e) {
          log('Error uploading image: $e');
        }
      }
    }
  }

  Future<void> _incrementStreak() async {
    final prefs = await SharedPreferences.getInstance();
    DateTime now = DateTime.now();

    // Check if the last completion date is today
    if (lastCompletionDate != null &&
        lastCompletionDate!.day == now.day &&
        lastCompletionDate!.month == now.month &&
        lastCompletionDate!.year == now.year) {
      // Streak continues
      streakCount++;
    } else {
      // New day, reset streak count
      streakCount = 1;
    }

    lastCompletionDate = now;
    await prefs.setInt('streakCount', streakCount);
    await prefs.setString(
        'lastCompletionDate', lastCompletionDate!.toIso8601String());
    log('Streak incremented: $streakCount');
  }

  Future<void> _resetStreak() async {
    streakCount = 0;
    lastCompletionDate = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('streakCount', streakCount);
    await prefs.remove('lastCompletionDate'); // Clear last completion date
    log('Streak reset to: $streakCount');
  }

  Future<void> _loadStreakData() async {
    final prefs = await SharedPreferences.getInstance();
    streakCount = prefs.getInt('streakCount') ?? 0;
    String? lastDateString = prefs.getString('lastCompletionDate');
    if (lastDateString != null) {
      lastCompletionDate = DateTime.parse(lastDateString);
    }
  }
}

class ImageWithTime {
  final XFile image;
  final DateTime time;

  ImageWithTime(this.image, this.time);
}
