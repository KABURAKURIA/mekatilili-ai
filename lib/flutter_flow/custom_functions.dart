import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

bool checkNotificationTimes(List<DateTime> previousNotificationTimes) {
  // Return true if previousNotificationTimes contains dates within this week
  final now = DateTime.now();
  final startOfWeek = DateTime(now.year, now.month, now.day)
      .subtract(Duration(days: now.weekday - 1));
  final endOfWeek = startOfWeek.add(Duration(days: 6));
  for (final notificationTime in previousNotificationTimes) {
    if (notificationTime.isAfter(startOfWeek) &&
        notificationTime.isBefore(endOfWeek)) {
      return true;
    }
  }
  return false;
}

DateTime returnRandomTime(List<DateTime>? previousScheduledDays) {
  final now = DateTime.now();
  final tomorrow = DateTime(now.year, now.month, now.day + 1);
  final fiveDaysFromNow = tomorrow.add(Duration(days: 5));
  final random = math.Random();

  // Initialize with a default value
  DateTime randomTime = now;
  // Initialize isTimeValid to false
  bool isTimeValid = false;

  do {
    // Generate a random day between tomorrow and 5 days from now.
    final randomDay = tomorrow.add(Duration(days: random.nextInt(5)));
    // Generate a random hour between 10 AM (10) and 7 PM (19).
    final randomHour =
        10 + random.nextInt(9); // This will give you a range of 10 to 18
    // Create a DateTime object with the random day and hour.
    randomTime =
        DateTime(randomDay.year, randomDay.month, randomDay.day, randomHour);

    // Check if the generated day is not in the previousScheduledDays and the time is between 10 AM and 7 PM.
    isTimeValid = (randomTime.isAfter(tomorrow) &&
            randomTime.isBefore(fiveDaysFromNow)) &&
        (previousScheduledDays?.any((scheduledDay) =>
                    scheduledDay.day == randomTime.day &&
                    scheduledDay.month == randomTime.month &&
                    scheduledDay.year == randomTime.year) ??
                false) ==
            false &&
        randomTime.hour >= 10 &&
        randomTime.hour < 19;
    // Continue looping if the time is not valid.
  } while (!isTimeValid);

  return randomTime;
}

String randomTitlePicker() {
  // Randomly pick between Hi, hello and hey
  final titles = [
    "Ready to put your imagination to work? ✨",
    "Escape reality and dream big with AI 💭",
    "Let's bring your imagination to life 🌌",
    "Take a break and dream with AI 🎨",
    "Explore popular AI images this week 🤩",
    "Explore some new ideas today! ✨"
  ];
  final random = math.Random();
  final index = random.nextInt(titles.length);
  return titles[index];
}

String randomDailyGreeting(String firstName) {
  final now = DateTime.now();
  final daySeed = now.month + now.day + now.year;
  final random = math.Random(daySeed);
  final phrases = [
    "What will you dream of today, $firstName?",
    "Artistic adventures await you, $firstName!",
    "Ready to create some magic, $firstName?",
    "Let's make today colorful, $firstName!",
    "Unleash your creativity, $firstName!",
    "Paint a new world today, $firstName!",
    "Let's turn ideas into art, $firstName!",
    "Welcome back to the canvas of wonders, $firstName!",
    "Time to make the digital canvas vibrant, $firstName!",
    "Art awaits at your fingertips, $firstName!",
    "Let your imagination soar, $firstName!",
    "Bring your ideas to life, $firstName!",
    "Dive into the ocean of creativity, $firstName!",
    "Your art journey continues, $firstName!",
    "Dream, create, inspire, $firstName!",
    "Let's sketch a day to remember, $firstName!",
    "Crafting your next masterpiece, $firstName?",
    "Your imagination is the limit, $firstName!"
  ];

  // Randomly pick one of the phrases
  final welcomePhrase = phrases[random.nextInt(phrases.length)];
  return welcomePhrase;
}

bool checkGreetingTime(DateTime lastGreetingTime) {
  // if lastGreetingTime is the same day as today, return true
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final lastGreetingDay = DateTime(
      lastGreetingTime.year, lastGreetingTime.month, lastGreetingTime.day);
  return lastGreetingDay == today;
}

DocumentReference stringToDocRef(String documentID) {
  // Convert the document ID as a string into the document Reference
  return FirebaseFirestore.instance.collection('albums').doc(documentID);
}

String imagePathToString(String imagePath) {
  return imagePath;
}

DateTime twoMinutesAgo() {
  return DateTime.now().subtract(Duration(minutes: 2));
}

bool isMoreThanWeek(
  DateTime oldTime,
  DateTime newTime,
) {
  return newTime.difference(oldTime).inDays >= 7;
}
