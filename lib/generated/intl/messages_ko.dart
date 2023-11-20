// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko locale. All the
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
  String get localeName => 'ko';

  static String m0(value) => "${value}";

  static String m1(value) => "${value}";

  static String m2(value, commentCount) => "댓글 ${value}";

  static String m3(value) => "${value}";

  static String m4(gender) => "로그인";

  static String m6(videoCount) =>
      "Create a profile, follow other accounts, make your own videos, and more.";

  static String m7(nameOfTheApp, when) => "${nameOfTheApp}에 가입하세요 ${when}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addComment": MessageLookupByLibrary.simpleMessage("댓글을 남겨주세요!"),
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("이미 계정이 있으신가요?"),
        "appleButton": MessageLookupByLibrary.simpleMessage("Apple로 계속 진행"),
        "commentCount": m0,
        "commentLike": m1,
        "commentTitle": m2,
        "emailPasswordButton": MessageLookupByLibrary.simpleMessage("이메일 사용"),
        "facebookButton":
            MessageLookupByLibrary.simpleMessage("Facebook으로 계속 진행"),
        "googleButton": MessageLookupByLibrary.simpleMessage("Google로 계속 진행"),
        "likeCount": m3,
        "logIn": m4,
        "signUpSubtitle": m6,
        "signUpTitle": m7
      };
}
