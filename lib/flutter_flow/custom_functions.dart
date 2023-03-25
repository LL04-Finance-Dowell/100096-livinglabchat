import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

bool checkLoginResponseHasValue(dynamic userPassed) {
  // if (['', null, 0, false].contains(userPassed)) {
  //   print('Value is falsey');
  //   return false;
  // } else {
  //   print('Value is OK');

  //   if (userPassed == null) {
  //     return false;
  //   }
  //   if (userPassed == 'null') {
  //     return false;
  //   }

  //   if (userPassed.length < 1) {
  //     return false;
  //   }

  //   return true;
  // }

  if (userPassed == null) {
    return false;
  }

  if (userPassed.isEmpty) {
    return false;
  }
  return true;

  // if (userPassed.trim().length < 1) {
  //   return false;
  // } else if (userPassed.trim() == "") {
  //   return false;
  // } else if (userPassed.trim() == "null") {
  //   return false;
  // } else if (userPassed.trim() == " ") {
  //   return false;
  // } else
  //   return true;

  // return userPassed?.isNotEmpty ?? false;

// bool checkLoginResponseHasValue(String userPassed) {

//   if (userPassed == null || userPassed.isEmpty) {
//     return true;
//   } else {
//     return false;
//   }

// bool? checkLoginResponseHasValue(String userPassed) {

//   // if (userPassed.toString() == "" ||
//   //     userPassed.toString() == "null" ||
//   //     userPassed.toString() == null ||
//   //     userPassed.toString() == Null ||
//   //     userPassed.length < 1 ||
//   //     userPassed.isEmpty) {
//   //   return false;
//   // } else {
//   //   return true;
//   // }

//   print('testing' + userPassed);

//   if (userPassed.isEmpty) {
//     return false;
//   } else {
//     return true;
//   }

//
//
//
//
}
