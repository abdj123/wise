import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'fr', 'it', 'de', 'pt'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? frText = '',
    String? itText = '',
    String? deText = '',
    String? ptText = '',
  }) =>
      [enText, esText, frText, itText, deText, ptText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Chat_Page
  {
    'gbbowr18': {
      'en': 'What are you thinking?',
      'de': 'Was denken sie?',
      'es': '¿Qué piensas? ',
      'fr': 'Qu\'est-ce que vous pensez?',
      'it': 'Cosa stai pensando?',
      'pt': 'O que você está pensando?',
    },
    '31b0gyo1': {
      'en': 'Home',
      'de': 'Home',
      'es': 'Home',
      'fr': 'Home',
      'it': 'Home',
      'pt': 'Home',
    },
  },
  // Auth_Page
  {
    'ga83pwix': {
      'en': 'Create Account',
      'de': 'Erstellen Sie ein Konto',
      'es': 'Crea una cuenta',
      'fr': 'Créer un compte',
      'it': 'Crea Account',
      'pt': 'Criar Conta',
    },
    'rr5c2xxt': {
      'en': 'Create Account',
      'de': 'Erstellen Sie ein Konto',
      'es': 'Crea una cuenta',
      'fr': 'Créer un compte',
      'it': 'Crea Account',
      'pt': 'Criar Conta',
    },
    '4kc5okh6': {
      'en': 'Email',
      'de': 'Email',
      'es': 'Email',
      'fr': 'Email',
      'it': 'Email',
      'pt': 'Senha',
    },
    'zsv28u7v': {
      'en': 'Password',
      'de': 'Passwort',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
      'it': 'Password',
      'pt': '',
    },
    'og9dk3rs': {
      'en': 'Get Started',
      'de': 'Los geht\'s',
      'es': 'Comenzar',
      'fr': 'Commencer',
      'it': 'Inizia',
      'pt': 'Começar',
    },
    '3anzshfc': {
      'en': 'Or sign up with',
      'de': 'Oder registrieren Sie sich mit',
      'es': 'O regístrate con',
      'fr': 'Ou inscrivez-vous avec',
      'it': 'O iscriviti con',
      'pt': 'Ou cadastre-se com',
    },
    '5d6mtrqk': {
      'en': 'Continue with Google',
      'de': 'Weiter mit Google',
      'es': 'Continuar con Google',
      'fr': 'Continuer avec Google',
      'it': 'Continua con Google',
      'pt': 'Continue com o Google',
    },
    'nhty0ifr': {
      'en': 'Log In',
      'de': 'Anmelden',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
      'it': 'Accedi',
      'pt': 'Entrar',
    },
    '12fwi88t': {
      'en': 'Welcome Back',
      'de': 'Willkommen zurück',
      'es': 'Bienvenido de nuevo',
      'fr': 'Bienvenue',
      'it': 'Benvenuto',
      'pt': 'Bem-vindo de volta',
    },
    'v6ho4dj1': {
      'en': 'Email',
      'de': 'Email',
      'es': 'Email',
      'fr': 'Email',
      'it': 'Email',
      'pt': '',
    },
    'lbo4sxr4': {
      'en': 'Password',
      'de': 'Passwort',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
      'it': 'Password',
      'pt': 'Senha',
    },
    '314mysal': {
      'en': 'Sign In',
      'de': 'Anmelden',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
      'it': 'Accedi',
      'pt': 'Entrar',
    },
    '8zx37rgf': {
      'en': 'Or sign in with',
      'de': 'Oder anmelden Sie sich mit',
      'es': 'O inicia sesión con',
      'fr': 'Ou connectez-vous avec',
      'it': 'O accedi con',
      'pt': 'Ou entre com',
    },
    'rdv0tnmb': {
      'en': 'Continue with Google',
      'de': 'Weiter mit Google',
      'es': 'Continúa con Google',
      'fr': 'Continuer avec Google',
      'it': 'Continua con Google',
      'pt': 'Continue com o Google',
    },
    'sbt2w119': {
      'en': 'Forgot Password?',
      'de': 'Passwort vergessen?',
      'es': '¿Olvidó su contraseña?',
      'fr': 'Mot de passe oublié ?',
      'it': 'Password dimenticata?',
      'pt': 'Esqueceu a senha?',
    },
    'apwj28ee': {
      'en': 'Home',
      'de': 'Home',
      'es': 'Casa',
      'fr': 'Accueil',
      'it': 'Home',
      'pt': 'Home',
    },
  },
  // Profile_Page
  {
    'qufkr6hv': {
      'en': 'Change photo',
      'de': 'Foto ändern',
      'es': 'Cambiar foto',
      'fr': 'Changer de photo',
      'it': 'Cambia foto',
      'pt': 'Alterar foto',
    },
    'o8g36et8': {
      'en': 'Voice Speed: ',
      'de': 'Sprechgeschwindigkeit:',
      'es': 'Velocidad de Voz:',
      'fr': 'Vitesse de voix:',
      'it': 'Velocità di voce:',
      'pt': 'Velocidade de Voz:',
    },
    'jty1wbv9': {
      'en': 'Voice Rate',
      'de': '',
      'es': 'Velocidad de voz',
      'fr': 'Vitesse de voix',
      'it': 'Velocità di voce',
      'pt': 'Velocidade de voz',
    },
    'd4ia2rr4': {
      'en': 'Search...',
      'de': 'Suchen...',
      'es': 'Buscar...',
      'fr': 'Rechercher...',
      'it': 'Cerca...',
      'pt': 'Buscar...',
    },
    'o014eel4': {
      'en': 'Very Slow',
      'de': 'Sehr langsam',
      'es': 'Muy lento',
      'fr': 'Très lent',
      'it': 'Molto lento',
      'pt': 'Muito lento',
    },
    'evjtgb9i': {
      'en': 'Slow',
      'de': 'Langsam',
      'es': 'Lento',
      'fr': 'Lente',
      'it': 'Lento',
      'pt': 'Lento',
    },
    'la0axw7f': {
      'en': 'Medium',
      'de': 'Mittel',
      'es': 'Medio',
      'fr': 'Moyenne',
      'it': 'Medio',
      'pt': 'Médio',
    },
    '4mcehpkn': {
      'en': 'Fast',
      'de': 'Schnell',
      'es': 'Rápido',
      'fr': 'Rapide',
      'it': 'Rapido',
      'pt': 'Rápido',
    },
    '160uad71': {
      'en': 'Very Fast',
      'de': 'Sehr schnell',
      'es': 'Muy rápido',
      'fr': 'Très rapide',
      'it': 'Molto veloce',
      'pt': 'Muito rápido',
    },
    'lktdqtp7': {
      'en': 'Voice Language:',
      'de': 'Sprachausgabe:',
      'es': 'Lenguaje de voz:',
      'fr': 'Langue de voix:',
      'it': 'Lingua di voce:',
      'pt': 'Língua de voz:',
    },
    'jti5n1wa': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'xy9s3dd1': {
      'en': 'Search...',
      'de': 'Suchen...',
      'es': 'Buscar...',
      'fr': 'Rechercher...',
      'it': 'Cerca...',
      'pt': 'Buscar...',
    },
    'hcn37pys': {
      'en': 'en-US',
      'de': 'en-US',
      'es': 'en-US',
      'fr': 'en-US',
      'it': 'en-US',
      'pt': 'en-US',
    },
    '2hw19ift': {
      'en': 'en-GB',
      'de': 'en-GB',
      'es': 'en-GB',
      'fr': 'en-GB',
      'it': 'en-GB',
      'pt': 'en-GB',
    },
    'znnmr8lv': {
      'en': 'es-ES',
      'de': 'es-ES',
      'es': 'es-ES',
      'fr': 'es-ES',
      'it': 'es-ES',
      'pt': 'es-ES',
    },
    'mbyar6p8': {
      'en': 'fr-FR',
      'de': 'fr-FR',
      'es': 'fr-FR',
      'fr': 'fr-FR',
      'it': 'fr-FR',
      'pt': 'fr-FR',
    },
    'zv9j8r6v': {
      'en': 'de-DE',
      'de': 'de-DE',
      'es': 'de-DE',
      'fr': 'de-DE',
      'it': 'de-DE',
      'pt': 'de-DE',
    },
    '36rmhw1v': {
      'en': 'it-IT',
      'de': 'it-IT',
      'es': 'it-IT',
      'fr': 'it-IT',
      'it': 'it-IT',
      'pt': 'it-IT',
    },
    'nrh4ov80': {
      'en': 'pt-BR',
      'de': 'pt-BR',
      'es': 'pt-BR',
      'fr': 'pt-BR',
      'it': 'pt-BR',
      'pt': 'pt-BR',
    },
    'rvskngli': {
      'en': 'App Language:',
      'de': 'App-Sprache:',
      'es': 'Idioma:',
      'fr': 'Langue:',
      'it': 'Lingua dell\'app:',
      'pt': 'Idioma:',
    },
    '6xjiz2qz': {
      'en': 'Dark Mode:',
      'de': 'Dark Mode:',
      'es': 'Dark Mode:',
      'fr': 'Dark Mode:',
      'it': 'Dark Mode:',
      'pt': 'Dark Mode:',
    },
    'vhlxldva': {
      'en': 'Contact Us',
      'de': 'Kontaktieren Sie Uns',
      'es': 'Contáctenos',
      'fr': 'Contactez-Nous',
      'it': 'Contattaci',
      'pt': 'Contate-Nos',
    },
    '3bc464nf': {
      'en': 'Terms and Policy',
      'de': 'Bedingungen und Richtlinien',
      'es': 'Términos y Política',
      'fr': 'Conditions et Politique',
      'it': 'Termini e Politica',
      'pt': 'Termos e Política',
    },
    '9ngyh6zj': {
      'en': 'Log Out',
      'de': 'Beenden',
      'es': 'Salir',
      'fr': 'Quitter',
      'it': 'Esci',
      'pt': 'Sair',
    },
    'iubtocaw': {
      'en': 'Delete',
      'de': 'Löschen',
      'es': 'Eliminar',
      'fr': 'Supprimer',
      'it': 'Elimina',
      'pt': 'Excluir',
    },
    'xl72fazo': {
      'en': 'Home',
      'de': 'Home',
      'es': 'Casa',
      'fr': 'Accueil',
      'it': 'Home',
      'pt': 'Home',
    },
  },
  // Ai_Characters
  {
    'tdr78ru9': {
      'en': 'Free',
      'de': 'Kostenlos',
      'es': 'Gratis',
      'fr': 'Gratuit',
      'it': 'Gratis',
      'pt': 'Grátis',
    },
    'okdr1sqm': {
      'en': '🧠 Critical Thinkers 💭',
      'de': '🧠 Kritische Denker 💭',
      'es': '🧠 Pensadores Críticos 💭',
      'fr': '🧠 Penseurs Critiques 💭',
      'it': '🧠 Pensatori Critici 💭',
      'pt': '🧠 Pensadores Críticos 💭',
    },
    'o0bsugyp': {
      'en': '🙏 Religious Figures ⛩️',
      'de': '🙏 Religiöse Figuren 🕌',
      'es': '🙏 Figuras Religiosas 🕌',
      'fr': '🙏 Figures Religieuses 🕌',
      'it': '🙏 Figure Religiose 🕌',
      'pt': '🙏 Figuras Religiosas 🕌',
    },
    'cz9nuks1': {
      'en': '🎥 Cinema Legends ⭐',
      'de': '🎥 Legenden Des Kinos ⭐',
      'es': '🎥 Leyendas Del Cine ⭐',
      'fr': '🎥 Légendes Du Cinéma ⭐',
      'it': '🎥 Leggende Del Cinema ⭐',
      'pt': '🎥 Lendas Do Cinema ⭐',
    },
    '21faypvm': {
      'en': '✨ Musical Idols 🎤',
      'de': '✨ Musik Idole 🎤',
      'es': '✨ Idolos Musicales 🎤',
      'fr': '✨ Idols Musicaux 🎤',
      'it': '✨ Idoli Musicali 🎤',
      'pt': '✨ Idolos Musicais 🎤',
    },
    'ttqxxra2': {
      'en': '💵 Political Shapers 🏦',
      'de': '💵 Politische Riesen 🏦',
      'es': '💵 Gigantes Políticos 🏦',
      'fr': '💵 Géants Politiques 🏦',
      'it': '💵 Giganti Politici 🏦',
      'pt': '💵 Gigantes Políticos 🏦',
    },
    '3fttn3ks': {
      'en': '🏰 Strategic Leaders ⚔️',
      'de': '🏰 Strategische Führer ⚔️',
      'es': '🏰 Líderes Estratégicos ⚔️',
      'fr': '🏰 Leaders Stratégiques ⚔️',
      'it': '🏰 Leader Strategici ⚔️',
      'pt': '🏰 Líderes Estratégicos ⚔️',
    },
    'vcvyg28n': {
      'en': '✒️ Iconic Writers 📜',
      'de': '✒️ Ikonische Schriftsteller 📜',
      'es': '✒️ Escritores Icónicos 📜',
      'fr': '✒️ Écrivains Iconiques 📜',
      'it': '✒️ Scrittori Iconici 📜',
      'pt': '✒️ Escritores Icônicos 📜',
    },
    'yumkgobv': {
      'en': '🧪 Scientific Pioneers 🔭',
      'de': '🧪 Wissenschaftliche Pioniere 🔭',
      'es': '🧪 Pioneros Científicos 🔭',
      'fr': '🧪 Pionniers Scientifiques 🔭',
      'it': '🧪 Pionieri Scientifici 🔭',
      'pt': '🧪 Pioneiros Científicos 🔭',
    },
    '5hvrwg7o': {
      'en': '👁️ Visionary Catalysts 🕰️',
      'de': '👁️ Visionäre Katalysatoren 🕰️',
      'es': '👁️ Visionarios Catalizadores 🕰️',
      'fr': '👁️ Catalyseurs Visionnaires 🕰️',
      'it': '👁️ Catalizzatori Visionari 🕰️',
      'pt': '👁️ Catalisadores Visionários 🕰️',
    },
    'asog97u3': {
      'en': '🎨 Influential Artists 🖌️',
      'de': '🎨 Einflussreiche Künstler 🖌️',
      'es': '🎨 Artistas Influyentes 🖌️',
      'fr': '🎨 Artistes Influents 🖌️',
      'it': '🎨 Artisti Influentiali 🖌️',
      'pt': '🎨 Artistas Influentes 🖌️',
    },
    'u6iqdqlf': {
      'en': '✊ Social Reformers 🏳️',
      'de': '✊ Gesellschaftliche Reformer 🏳️',
      'es': '✊ Reformadores Sociales 🏳️',
      'fr': '✊ Réformateurs Sociaux 🏳️',
      'it': '✊ Riformatori Sociali 🏳️',
      'pt': '✊ Reformadores Sociais 🏳️',
    },
    'uw6c2uem': {
      'en': 'More in the PRO Version! ➡️',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    's8sn8g1n': {
      'en': 'Premium',
      'de': 'Premium',
      'es': 'Premium',
      'fr': 'Premium',
      'it': 'Premium',
      'pt': 'Premium',
    },
    'wfqkthx3': {
      'en': 'Search historical figures...',
      'de': 'Suche historische figuren...',
      'es': 'Busca figuras históricas...',
      'fr': 'Rechercher figures historiques...',
      'it': 'Cerca figure storiche...',
      'pt': 'Busca figuras históricas...',
    },
    '245h5x54': {
      'en': '🧠 Critical Thinkers 💭',
      'de': '🧠 Kritische Denker 💭',
      'es': '🧠 Pensadores Críticos 💭',
      'fr': '🧠 Penseurs Critiques 💭',
      'it': '🧠 Pensatori Critici 💭',
      'pt': '🧠 Pensadores Críticos 💭',
    },
    'rfxvk35n': {
      'en': '🙏 Religious Figures 🕌',
      'de': '🙏 Religiöse Figuren 🕌',
      'es': '🙏 Figuras Religiosas 🕌',
      'fr': '🙏 Figures Religieuses 🕌',
      'it': '🙏 Figure Religiose 🕌',
      'pt': '🙏 Figuras Religiosas 🕌',
    },
    's5wmfpif': {
      'en': '🎥 Cinema Legends ⭐',
      'de': '🎥 Legenden Des Kinos ⭐',
      'es': '🎥 Leyendas Del Cine ⭐',
      'fr': '🎥 Légendes Du Cinéma ⭐',
      'it': '🎥 Leggende Del Cinema ⭐',
      'pt': '🎥 Lendas Do Cinema ⭐',
    },
    'ax5zeg1l': {
      'en': '✨ Musical Idols 🎤',
      'de': '✨ Musik Idole 🎤',
      'es': '✨ Ídolos Musicales 🎤',
      'fr': '✨ Idols Musicaux 🎤',
      'it': '✨ Idoli Musicali 🎤',
      'pt': '✨ Idolos Musicais 🎤',
    },
    'p45jn50b': {
      'en': '💵 Political Shapers 🏦',
      'de': '💵 Politische Riesen 🏦',
      'es': '💵 Gigantes Políticos 🏦',
      'fr': '💵 Géants Politiques 🏦',
      'it': '💵 Giganti Politici 🏦',
      'pt': '💵 Gigantes Políticos 🏦',
    },
    'zdk6ifv8': {
      'en': '🏰 Strategic Leaders ⚔️',
      'de': '🏰 Strategische Führer ⚔️',
      'es': '🏰 Líderes Estratégicos ⚔️',
      'fr': '🏰 Leaders Stratégiques ⚔️',
      'it': '🏰 Leader Strategici ⚔️',
      'pt': '🏰 Líderes Estratégicos ⚔️',
    },
    'ygp2osxw': {
      'en': '✒️ Iconic Writers 📜',
      'de': '✒️ Ikonische Schriftsteller 📜',
      'es': '✒️ Escritores Icónicos 📜',
      'fr': '✒️ Écrivains Iconiques 📜',
      'it': '✒️ Scrittori Iconici 📜',
      'pt': '✒️ Escritores Icônicos 📜',
    },
    '57ny9bf3': {
      'en': '🧪 Scientific Pioneers 🔭',
      'de': '🧪 Wissenschaftliche Pioniere 🔭',
      'es': '🧪 Pioneros Científicos 🔭',
      'fr': '🧪 Pionniers Scientifiques 🔭',
      'it': '🧪 Pionieri Scientifici 🔭',
      'pt': '🧪 Pioneiros Científicos 🔭',
    },
    '5wje35lm': {
      'en': '👁️ Visionary Catalysts 🕰️',
      'de': '👁️ Visionäre Katalysatoren 🕰️',
      'es': '👁️ Catalizadores Visionarios 🕰️',
      'fr': '👁️ Catalyseurs Visionnaires 🕰️',
      'it': '👁️ Catalizzatori Visionari 🕰️',
      'pt': '👁️ Catalisadores Visionários 🕰️',
    },
    'kj3io6qv': {
      'en': '🎨 Influential Artists 🖌️',
      'de': '🎨 Einflussreiche Künstler 🖌️',
      'es': '🎨 Artistas Influyentes 🖌️',
      'fr': '🎨 Artistes Influents 🖌️',
      'it': '🎨 Artisti Influentiali 🖌️',
      'pt': '🎨 Artistas Influentes 🖌️',
    },
    'cz0m0gi9': {
      'en': '✊ Social Reformers 🏳️',
      'de': '✊ Gesellschaftliche Reformer 🏳️',
      'es': '✊ Reformadores Sociales 🏳️',
      'fr': '✊ Réformateurs Sociaux 🏳️',
      'it': '✊ Riformatori Sociali 🏳️',
      'pt': '✊ Reformadores Sociais 🏳️',
    },
    'tivxj0u0': {
      'en': 'Recent',
      'de': 'Aktuell',
      'es': 'Recientes',
      'fr': 'Récent',
      'it': 'Recente',
      'pt': 'Recente',
    },
    'uij9qm2b': {
      'en': 'Choose your character to chat with',
      'de': 'Wählen Sie Ihren Charakter zum Chatten',
      'es': 'Elija su personaje para chatear',
      'fr': 'Choisissez votre personnage pour discuter',
      'it': 'Scegli il tuo personaggio per chiacchierare',
      'pt': 'Escolha seu personagem para conversar',
    },
    'whmjjokg': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
  },
  // new_auth_page
  {
    'fke9licd': {
      'en': 'Welcome to ChatBack',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'dn2zgnab': {
      'en': 'Your personal AI companion',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'u96m4m4p': {
      'en': 'Continue with Google',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    '31wtti0j': {
      'en': 'By continuing, you agree to our ',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'nthxzua2': {
      'en': 'Terms of Service',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'y6rgqui0': {
      'en': ' and ',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    '0ysz9vj5': {
      'en': 'Privacy Policy',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
  },
  // Contact_us_page
  {
    'k337dd64': {
      'en': 'Contact Us',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'cc2lalas': {
      'en': 'Contact Us',
      'de': 'Kontaktieren Sie Uns',
      'es': 'Contáctenos',
      'fr': 'Nous Contacter',
      'it': 'Contattarci',
      'pt': 'Contate-Nos',
    },
    '0igp2ow7': {
      'en':
          'We\'re here to help! Send us a message and we\'ll respond as soon as possible.',
      'de':
          'Wir sind hier, um Ihnen zu helfen! Senden Sie uns eine Nachricht und wir werden so schnell wie möglich antworten.',
      'es':
          '¡Estamos aquí para ayudar! Envíenos un mensaje y responderemos lo antes posible.',
      'fr':
          'Nous sommes là pour vous aider ! Envoyez-nous un message et nous vous répondrons dès que possible.',
      'it':
          'Siamo qui per aiutarvi! Inviateci un messaggio e risponderemo il più presto possibile.',
      'pt':
          'Estamos aqui para ajudar! Envie-nos uma mensagem e responderemos o mais rápido possível.',
    },
    'sxzp92cw': {
      'en': 'chatbackcontact@gmail.com',
      'de': 'chatbackcontact@gmail.com',
      'es': 'chatbackcontact@gmail.com',
      'fr': 'chatbackcontact@gmail.com',
      'it': 'chatbackcontact@gmail.com',
      'pt': 'chatbackcontact@gmail.com',
    },
    '3rxwd101': {
      'en': 'Send us a Message',
      'de': 'Senden Sie uns eine Nachricht',
      'es': 'Envíenos un Mensaje',
      'fr': 'Envoyez-nous un Message',
      'it': 'Inviateci un Messaggio',
      'pt': 'Envie-nos uma Mensagem',
    },
    'r1osz5bu': {
      'en': 'Full Name',
      'de': 'Vollständiger Name',
      'es': 'Nombre Completo',
      'fr': 'Nom Complet',
      'it': 'Nome Completo',
      'pt': 'Nome Completo',
    },
    'q28iw95l': {
      'en': 'Email Address',
      'de': 'E-Mail-Adresse',
      'es': 'Correo Electrónico',
      'fr': 'Adresse Électronique',
      'it': 'Indirizzo Email',
      'pt': 'Endereço de E-mail',
    },
    '1fqmr109': {
      'en': 'Message',
      'de': 'Nachricht',
      'es': 'Mensaje',
      'fr': 'Message',
      'it': 'Messaggio',
      'pt': 'Mensagem',
    },
    '6gtallbo': {
      'en': 'Send Message',
      'de': 'Nachricht Senden',
      'es': 'Enviar Mensaje',
      'fr': 'Envoyer Message',
      'it': 'Invia Messaggio',
      'pt': 'Enviar Mensagem',
    },
    '2o574oc2': {
      'en': 'Full Name is required',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'um69ilib': {
      'en': 'Please Enter Valid User Name',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'o10owtrd': {
      'en': 'Please choose an option from the dropdown',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'ldpg35nh': {
      'en': 'Email Address is required',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'ypb9hzda': {
      'en': 'Please Enter Valid Email Address',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'icwg0ocn': {
      'en': 'Please choose an option from the dropdown',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    '1s4tdpxk': {
      'en': 'Message is required',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    '60sm4xg0': {
      'en': 'Please choose an option from the dropdown',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'f3g9evdw': {
      'en': 'FAQ',
      'de': 'FAQ',
      'es': 'FAQ',
      'fr': 'FAQ',
      'it': 'FAQ',
      'pt': 'FAQ',
    },
    'xv67ontr': {
      'en': 'Will more AI characters be added?',
      'de': 'Werden weitere KI-Charaktere hinzugefügt?',
      'es': '¿Se agregarán más personajes de IA?',
      'fr': 'De nouveaux caractères d\'IA seront-ils ajoutés?',
      'it': 'Saranno aggiunti altri personaggi di AI?',
      'pt': 'Mais personagens de IA serão adicionados?',
    },
    'evj88y43': {
      'en':
          'Yes, we have a ongoing commitment to expanding and enriching our collection of AI characters, with new additions planned for the future.',
      'de':
          'Ja, wir haben eine laufende Verpflichtung, unsere Sammlung von KI-Charakteren zu erweitern und zu bereichern, mit neuen Hinzufügungen, die für die Zukunft geplant sind.',
      'es':
          'Sí, tenemos un compromiso continuo de expandir y enriquecer nuestra colección de personajes de IA, con nuevas actualizaciones planeadas para el futuro.',
      'fr':
          'Oui, nous nous engageons à développer et à enrichir en continu notre collection de caractères d\'IA, avec de nouvelles additions prévues pour l\'avenir.',
      'it':
          'Sì, abbiamo un impegno costante a espandere e arricchire la nostra collezione di personaggi di intelligenza artificiale, con nuove aggiunte pianificate per il futuro.',
      'pt':
          'Sim, temos um compromisso contínuo de expandir e enriquecer nossa coleção de personagens de IA, com novas adições planejadas para o futuro.',
    },
    '28nw6xkg': {
      'en': 'Is my data secure?',
      'de': 'Sind meine Daten sicher?',
      'es': '¿Están seguros mis datos?',
      'fr': 'Mes données sont-elles sécurisées?',
      'it': 'I miei dati sono sicuri?',
      'pt': 'Meus dados estão seguros?',
    },
    '68cnao7j': {
      'en':
          'We prioritize user security, using industry-standard encryption to safeguard data and conversations. If you\'d like your data removed from our servers, please contact us.',
      'de':
          'Wir priorisieren die Benutzersicherheit und verwenden branchenübliche Verschlüsselungsprotokolle, um Benutzerdaten und -gespräche zu schützen. Kontaktieren Sie uns, um Ihre Daten von unseren Servern zu entfernen.',
      'es':
          'Priorizamos la seguridad del usuario, empleando protocolos de cifrado estándar de la industria para salvaguardar los datos y conversaciones. Póngase en contacto con nosotros para eliminar sus datos de nuestros servidores.',
      'fr':
          'Nous donnons la priorité à la sécurité des utilisateurs, en utilisant des protocoles de cryptage conformes aux normes du secteur pour protéger les données et conversations. Contactez-nous pour supprimer vos données de nos serveurs.',
      'it':
          'Diamo la priorità alla sicurezza degli utenti, utilizzando protocolli di crittografia conformi agli standard del settore per salvaguardare i dati e le conversazioni. Contattateci per rimuovere i vostri dati dai nostri server.',
      'pt':
          'Damos prioridade à segurança dos usuários, empregando protocolos de criptografia padrão da indústria para proteger os dados e conversas. Contate-nos para remover seus dados dos nossos servidores.',
    },
    '0ds1gve9': {
      'en': 'Which LLM is in use?',
      'de': 'Welches LLM wird verwendet?',
      'es': '¿Qué LLM se utiliza?',
      'fr': 'Quel LLM est utilisé?',
      'it': 'Quale LLM è in uso?',
      'pt': 'Qual LLM está em uso?',
    },
    'olqr6tgw': {
      'en':
          'Our characters are powered by OpenAI\'s cutting-edge language models, ensuring a high level of accuracy and coherence.',
      'de':
          'Unsere Charaktere werden von den bahnbrechenden Sprachmodellen von OpenAI angetrieben, was einen hohen Grad an Genauigkeit und Kohärenz gewährleistet.',
      'es':
          'Nuestros personajes están impulsados por los modelos de lenguaje de vanguardia de OpenAI, lo que garantiza un alto nivel de precisión y coherencia.',
      'fr':
          'Nos caractères sont alimentés par les modèles de langage de pointe d\'OpenAI, garantissant un niveau élevé de précision et de cohérence.',
      'it':
          'I nostri personaggi sono alimentati dai modelli linguistici all\'avanguardia di OpenAI, garantendo un alto livello di precisione e coerenza.',
      'pt':
          'Nossos personagens são impulsionados pelos modelos de linguagem de ponta da OpenAI, garantindo um alto nível de precisão e coerência.',
    },
  },
  // terms_and_policy
  {
    '5twyokvd': {
      'en': 'Terms & Privacy Policy',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'bialaqrn': {
      'en': 'Terms of Service',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'yo3fdlb9': {
      'en':
          'By using our AI chat application, you agree to these terms. Please read them carefully.',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'p2ft250e': {
      'en': '1. Acceptable Use',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    '7m43ubqt': {
      'en':
          'You agree not to use the service for any unlawful purposes or to conduct any unlawful activity.',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'jdxz4nko': {
      'en': '2. User Content',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'mblywy5k': {
      'en': 'You retain any inelectual proporties that you gave to the AI.',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    '2i85w3rq': {
      'en': '3. Service Modifications',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'wl9p2r7o': {
      'en':
          'We reserve the right to modify or discontinue, temporarily or permanently, the service with or without notice.',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'm7uwrddl': {
      'en': 'Privacy Policy',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    '9aetnpeu': {
      'en': '1. Information Collection',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'ipq51z4l': {
      'en':
          'We collect information that you provide directly to us, including but not limited to:\n• Account Information: Email address, profile picture.\n• Chat History: Your messages and the AI-generated responses.',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'v8wqkul5': {
      'en': '2. Data Usage',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'ikad2vrm': {
      'en':
          'We use the collected information to:\n- Improve our AI models: To enhance the accuracy and engagement of conversations.\n- Communicate with you: To send updates, notifications, and promotional materials.',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'zyiaj3we': {
      'en': '3. Data Protection',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'g22fsy2q': {
      'en':
          'We take your privacy seriously. We:\n\n*  Securely store your data: Using encryption and other security measures.\n*  Control access: Only authorized personnel have access to your information.',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    '4rp2a44a': {
      'en': 'Contact Us',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'x1yuny0q': {
      'en':
          'If you have any questions about our Terms of Service or Privacy Policy, please contact us at:',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'ojkyj8j1': {
      'en': 'chatbackcontact@gmail.com',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'uuxzs5y5': {
      'en': 'Response Time: Within 24-48 hours',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'dgce3md4': {
      'en': 'I Agree',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
  },
  // emptyList
  {
    'hd53pom8': {
      'en': 'Hi, I\'m ',
      'de': 'Hallo, ich bin ',
      'es': 'Hola, soy ',
      'fr': 'Bonjour, je suis ',
      'it': 'Ciao, sono ',
      'pt': 'Olá, sou ',
    },
    'xrk26569': {
      'en': 'Hi, I\'m Buddha',
      'de': 'Keine Aktivität',
      'es': 'Sin actividad',
      'fr': 'Aucune activité',
      'it': 'Nessuna attività',
      'pt': 'Nenhuma Atividade',
    },
    'tv3r24i3': {
      'en': 'See profile',
      'de': 'Profil anzeigen',
      'es': 'Ver perfil',
      'fr': 'Voir le profil',
      'it': 'Vedi profilo',
      'pt': 'Ver perfil',
    },
  },
  // user_account
  {
    'm2i2fzrc': {
      'en': 'Are you sure you want to delete your account?',
      'de': 'Sind Sie sicher, dass Sie Ihr Konto löschen möchten?',
      'es': '¿Está seguro de que desea eliminar su cuenta?',
      'fr': 'Êtes-vous sûr de vouloir supprimer votre compte ?',
      'it': 'Sei sicuro di voler eliminare il tuo account?',
      'pt': 'Tem certeza de que deseja excluir sua conta?',
    },
    'p0y0a940': {
      'en':
          'All your data will be permanently erased, and this action cannot be undone.',
      'de':
          'Alle Ihre Daten werden dauerhaft gelöscht, und diese Aktion kann nicht rückgängig gemacht werden.',
      'es':
          'Toda su información será eliminada de forma permanente y esta acción no se puede deshacer.',
      'fr':
          'Toutes vos informations seront supprimées de manière permanente et cette action ne peut pas être annulée.',
      'it':
          'Tutti i tuoi dati saranno cancellati in modo permanente e questa azione non può essere annullata.',
      'pt':
          'Todos os seus dados serão apagados permanentemente, e essa ação não pode ser desfeita.',
    },
    'uinal84v': {
      'en':
          'You will lose access to all your saved information, preferences, and any other content associated with your account.',
      'de':
          'Sie werden den Zugriff auf alle Ihre gespeicherten Informationen, Einstellungen und alle anderen Inhalte verlieren, die mit Ihrem Konto verbunden sind.',
      'es':
          'Perderá acceso a toda su información guardada, preferencias y cualquier otro contenido asociado con su cuenta.',
      'fr':
          'Vous perdrez l\'accès à toutes vos informations enregistrées, préférences et tout autre contenu associé à votre compte.',
      'it':
          'Perderai l\'accesso a tutte le tue informazioni salvate, preferenze e qualsiasi altro contenuto associato al tuo account.',
      'pt':
          'Você perderá o acesso a todas as suas informações salvas, preferências e qualquer outro conteúdo associado à sua conta.',
    },
    '9sliogc9': {
      'en': 'Cancel',
      'de': 'Abbrechen',
      'es': 'Cancelar',
      'fr': 'Annuler',
      'it': 'Annulla',
      'pt': 'Cancelar',
    },
    'zzufz7g4': {
      'en': 'Delete',
      'de': 'Löschen',
      'es': 'Eliminar',
      'fr': 'Supprimer',
      'it': 'Elimina',
      'pt': 'Excluir',
    },
  },
  // popUp_signup
  {
    'ax2fvwo0': {
      'en':
          'Welcome to ChatBack! \nPlease note the following:\n\n- The AI characters you interact with are fictional personas and should not be considered real individuals. \n- Conversations are stored securely on our servers. If you\'d like to delete your conversation history, contact us.',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'cnatrdu8': {
      'en': 'Cancel',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'l9vshjph': {
      'en': 'Delete',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
  },
  // About_Ai
  {
    'vyiqldmh': {
      'en': 'Let\'s Chat',
      'de': 'Let\'s Chat',
      'es': 'Let\'s Chat',
      'fr': 'Let\'s Chat',
      'it': 'Let\'s Chat',
      'pt': 'Let\'s Chat',
    },
  },
  // RecentChats
  {
    'jxftfl9m': {
      'en': 'Recent Chats',
      'de': 'Letzte Chats',
      'es': 'Chats Recientes',
      'fr': 'Discussions Récentes',
      'it': 'Chat Recenti',
      'pt': 'Bate-papos Recentes',
    },
    'b8ghwb2d': {
      'en': 'New chat',
      'de': 'Neuer Chat',
      'es': 'Nuevo Chat',
      'fr': 'Nouveau Chat',
      'it': 'Nuovo Chat',
      'pt': 'Novo Chat',
    },
    'b0apxlui': {
      'en': 'Chats',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
  },
  // app_settings
  {
    '5i6s9bco': {
      'en': 'App Settings',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'qi7lfnrq': {
      'en':
          'Tap here to access the settings page! Here, you can customize your experience by selecting your preferred language, adjusting your voice speech rate, and adding an avatar image.',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
  },
  // emptyRecentChats
  {
    'ingvj2qp': {
      'en': 'No Recent Chats!',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
  },
  // about_ai_wkt
  {
    'fbgyuwvh': {
      'en': 'About page',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    '8di8h085': {
      'en':
          'Click on the Avatar\'s profile picture to access their About page, which features an audio clip and a concise bio.',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
  },
  // Chatwith_wkt
  {
    'ia0c55q1': {
      'en': 'Tap to initiate a conversation!',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
  },
  // text_input
  {
    '49t3klta': {
      'en': 'IMPORTANT!',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'wpksj823': {
      'en':
          'Your first message sets the conversation language, which cannot be changed later.',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
  },
  // searchWidget
  {
    'gkz8fheh': {
      'en': 'Search AI characters...',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
  },
  // paywall_page
  {
    'ier4ek0y': {
      'en': 'Upgrade to Pro',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'cij7qlll': {
      'en':
          'Get unlimited access to all AI characters and engage in unlimited conversations. Unlock the full potential of AI interactions.',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'a52x9me4': {
      'en': 'Monthly',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'yojsg2vu': {
      'en': 'Pro Plan Features',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'ch3iroma': {
      'en': 'Unlimited AI conversations',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'kda96e10': {
      'en': 'Access to all AI characters',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'xuzm0adz': {
      'en': 'Priority support',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'i1q0q6wn': {
      'en': 'Upgrade Now',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'ydhn8clq': {
      'en': 'Annual',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'n3rpyd4j': {
      'en': 'Pro Plan Features',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'ordt5tw7': {
      'en': 'Unlimited AI conversations',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'utzwkhwv': {
      'en': 'Access to all AI characters',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'b8xg9t9s': {
      'en': 'Priority support',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'f231tgy2': {
      'en': '33% OFF',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'ysel5qt2': {
      'en': 'Upgrade Now',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    '54ypha0a': {
      'en': 'Cancel anytime. Terms apply.',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
  },
  // ChangePhotoWkt
  {
    'fj1oe0vz': {
      'en': 'Tap to Change Photo',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'n1q8g2iq': {
      'en':
          'Update your profile picture by selecting a new image from your gallery',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
  },
  // edit_name
  {
    'g6ki1vii': {
      'en': 'Display Name',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    '7zrb6zr4': {
      'en': 'Enter your display name',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'n1p41t7w': {
      'en': 'Save Changes',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
  },
  // Miscellaneous
  {
    'bw8fgkvb': {
      'en': 'Hello World',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    '6t21wt7t': {
      'en': 'Hello World',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'i02ug41d': {
      'en': 'Marcus Aurelius',
      'de': '',
      'es': 'Marco Aurelio',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'rp3yvw3c': {
      'en': 'Hello World',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'vfk9gj0u': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'gdjzx0tb': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'mtxg5zdk': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    '13o8sy62': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'aq5g393k': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'emcpx1kh': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    '90ysqgar': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'r5vzzk65': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'wkgx9s9w': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'wvuwxffc': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'w4ig62j9': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    '6h5c867n': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'h9i2kic4': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'c2vov1s7': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'xle6q48g': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    '8cwc0cl5': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    '9g57ibsc': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'dscdufo9': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'l4gvq7uz': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'khbn4v4d': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'gyqmq1th': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'we852qk3': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'yv822w26': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'va5nwnaz': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'cc5g53aw': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    'gv46pmk7': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
    '3do7zg1c': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'pt': '',
    },
  },
].reduce((a, b) => a..addAll(b));
