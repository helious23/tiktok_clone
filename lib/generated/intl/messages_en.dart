// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(value) => "${value}";

  static String m1(value) => "${value}";

  static String m2(value, commentCount) =>
      "${value} ${Intl.plural(commentCount, one: 'comment', other: 'comments')}";

  static String m3(value) => "${value}";

  static String m4(gender) =>
      "Log in ${Intl.gender(gender, female: 'madam', male: 'sir', other: 'human')}";

  static String m5(nameOfTheApp) => "Log into your ${nameOfTheApp}";

  static String m6(videoCount) =>
      "Create a profile, follow other accounts, make your own ${Intl.plural(videoCount, zero: 'no videos', one: 'video', other: 'videos')}, and more.";

  static String m7(nameOfTheApp) => "Sign up for ${nameOfTheApp}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addComment": MessageLookupByLibrary.simpleMessage("Add comment..."),
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "appleButton":
            MessageLookupByLibrary.simpleMessage("Continue with Apple"),
        "commentCount": m0,
        "commentLike": m1,
        "commentTitle": m2,
        "emailPasswordButton":
            MessageLookupByLibrary.simpleMessage("Use email & password"),
        "facebookButton":
            MessageLookupByLibrary.simpleMessage("Continue with Facebook"),
        "googleButton":
            MessageLookupByLibrary.simpleMessage("Continue with Google"),
        "likeCount": m3,
        "logIn": m4,
        "loginTitle": m5,
        "signUpSubtitle": m6,
        "signUpTitle": m7
      };
}
