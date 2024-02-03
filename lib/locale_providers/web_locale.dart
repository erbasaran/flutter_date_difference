import 'dart:html' as html;

String getLocale() {
  final languages = html.window.navigator.languages;
  if (languages != null && languages.isNotEmpty) {
    //we need to split the language code and the country code
    return languages.first.split("-")[0].toLowerCase().trim();
  }
  return "en";
}
