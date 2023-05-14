import 'package:get/get.dart';

class LocalLanguages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'english_lng': 'English',
          'hindi_lng': 'Hindi',
          'lang_chnage': 'Language Change By Getx',
          'please_select': 'Please select one which you want to choose',
        },
        'hindi': {
          'english_lng': 'अंग्रेज़ी',
          'hindi_lng': 'हिंदी',
          'lang_chnage': 'चेंज बी गेट्स इन लैंग्वेज',
          'please_select': 'कृपया वह चुनें जिसे आप चूसना चाहते हैं',
        },
      };
}
