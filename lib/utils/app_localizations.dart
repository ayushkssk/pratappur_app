class AppLocalizations {
  static Map<String, Map<String, String>> _localizedValues = {
    'app_title': {
      'en': 'Pratappur App',
      'hi': 'प्रतापपुर ऐप',
    },
    'village_name': {
      'en': 'Pratappur Village',
      'hi': 'प्रतापपुर गाँव',
    },
    'home': {
      'en': 'Home',
      'hi': 'होम',
    },
    'news_notices': {
      'en': 'News & Notices',
      'hi': 'समाचार और सूचनाएं',
    },
    'photo_gallery': {
      'en': 'Photo Gallery',
      'hi': 'फोटो गैलरी',
    },
    'about_village': {
      'en': 'About Village',
      'hi': 'गाँव के बारे में',
    },
    'important_contacts': {
      'en': 'Important Contacts',
      'hi': 'महत्वपूर्ण संपर्क',
    },
    'grievance_portal': {
      'en': 'Grievance Portal',
      'hi': 'शिकायत पोर्टल',
    },
    'government_schemes': {
      'en': 'Government Schemes',
      'hi': 'सरकारी योजनाएं',
    },
    'talent_corner': {
      'en': 'Talent Corner',
      'hi': 'प्रतिभा कॉर्नर',
    },
    'emergency_services': {
      'en': 'Emergency Services',
      'hi': 'आपातकालीन सेवाएं',
    },
    'important_places': {
      'en': 'Important Places',
      'hi': 'महत्वपूर्ण स्थान',
    },
    'km': {
      'en': 'km',
      'hi': 'कि.मी.',
    },
  };

  static String getText(String key, bool isHindi) {
    return _localizedValues[key]?[isHindi ? 'hi' : 'en'] ?? key;
  }
}
