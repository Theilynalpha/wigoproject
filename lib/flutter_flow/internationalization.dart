import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'de', 'ar'];

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
    String? deText = '',
    String? arText = '',
  }) =>
      [enText, esText, deText, arText][languageIndex] ?? '';

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

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // loginPage
  {
    'o07j3mgv': {
      'en': 'Welcome back',
      'ar': 'البدء',
      'de': 'Loslegen',
      'es': 'Empezar',
    },
    'fzxvw3mu': {
      'en': 'Login to access your account below.',
      'ar': 'قم بإنشاء حسابك أدناه.',
      'de': 'Erstellen Sie unten Ihr Konto.',
      'es': 'Crea tu cuenta a continuación.',
    },
    'a9j78va9': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'i7f18cve': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'wztjmbn8': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'es': 'Contraseña',
    },
    'lw1jpm1f': {
      'en': 'Enter your password...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
    },
    'm2xyjvuf': {
      'en': 'Forgot Password?',
      'ar': 'هل نسيت كلمة السر؟',
      'de': 'Passwort vergessen?',
      'es': '¿Has olvidado tu contraseña?',
    },
    'qbmoi1av': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'de': 'Anmeldung',
      'es': 'Acceso',
    },
    'cjqb8ial': {
      'en': 'Don\'t have an account?',
      'ar': 'ليس لديك حساب؟',
      'de': 'Sie haben kein Konto?',
      'es': '¿No tienes una cuenta?',
    },
    'a0iimirx': {
      'en': 'Create',
      'ar': 'ليس لديك حساب؟',
      'de': 'Sie haben kein Konto?',
      'es': '¿No tienes una cuenta?',
    },
    '2bb3vct7': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // registerAccount
  {
    'gpokmd81': {
      'en': 'Get Started',
      'ar': 'البدء',
      'de': 'Loslegen',
      'es': 'Empezar',
    },
    'oitrrwgg': {
      'en': 'Create your account below.',
      'ar': 'قم بإنشاء حسابك أدناه.',
      'de': 'Erstellen Sie unten Ihr Konto.',
      'es': 'Crea tu cuenta a continuación.',
    },
    'gcwdqm4g': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'iam0xgwx': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'bqv15dcf': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'es': 'Contraseña',
    },
    'joih97mn': {
      'en': 'Enter your password...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
    },
    'rzpiwq9p': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
      'de': 'Kennwort bestätigen',
      'es': 'Confirmar contraseña',
    },
    'eyfkffka': {
      'en': 'Enter your password...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
    },
    '5kmjfwsk': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
      'de': 'Benutzerkonto erstellen',
      'es': 'Crear una cuenta',
    },
    '3twynvfz': {
      'en': 'Login',
      'ar': 'هل لديك حساب؟',
      'de': 'Sie haben bereits ein Konto?',
      'es': '¿Ya tienes una cuenta?',
    },
    '9ssznj0g': {
      'en': 'Already have an account?',
      'ar': 'هل لديك حساب؟',
      'de': 'Sie haben bereits ein Konto?',
      'es': '¿Ya tienes una cuenta?',
    },
    'momge5oj': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // completeProfile
  {
    'yhcaf7r2': {
      'en': 'Complete Profile',
      'ar': 'الملف الشخصي الكامل',
      'de': 'Vollständiges Profil',
      'es': 'Perfil completo',
    },
    'r6npjsue': {
      'en': 'Upload a photo for us to easily identify you.',
      'ar': 'قم بتحميل صورة لنا للتعرف عليك بسهولة.',
      'de':
          'Laden Sie ein Foto hoch, damit wir Sie leicht identifizieren können.',
      'es': 'Sube una foto para que te identifiquemos fácilmente.',
    },
    'sdptn7dd': {
      'en': 'Your Name',
      'ar': 'اسمك',
      'de': 'Dein Name',
      'es': 'Tu nombre',
    },
    'n636qnrx': {
      'en': 'Your Age',
      'ar': 'عمرك',
      'de': 'Ihr Alter',
      'es': 'Su edad',
    },
    's7yvjzbs': {
      'en': 'i.e. 34',
      'ar': 'أي 34',
      'de': 'dh 34',
      'es': 'es decir, 34',
    },
    '72ii0waq': {
      'en': 'Your Title',
      'ar': 'لقبك',
      'de': 'Dein Titel',
      'es': 'Tu título',
    },
    'pf8glhkg': {
      'en': 'What is your position?',
      'ar': 'ماهوموقعك؟',
      'de': 'Wo befinden Sie sich?',
      'es': '¿Cual es tu posicion?',
    },
    'hbhd3bdt': {
      'en': 'Complete Profile',
      'ar': 'الملف الشخصي الكامل',
      'de': 'Vollständiges Profil',
      'es': 'Perfil completo',
    },
    '1eac148w': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ew7dbn3s': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jhhlgzk5': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4k3jnl38': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // forgotPassword
  {
    'g416xg9f': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
      'de': 'Passwort vergessen',
      'es': 'Has olvidado tu contraseña',
    },
    'xaiad71o': {
      'en':
          'Enter the email associated with your account and we will send you a verification code.',
      'ar': 'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رمز التحقق.',
      'de':
          'Geben Sie die mit Ihrem Konto verknüpfte E-Mail-Adresse ein und wir senden Ihnen einen Bestätigungscode.',
      'es':
          'Introduce el correo electrónico asociado a tu cuenta y te enviaremos un código de verificación.',
    },
    'u4nuk910': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    '37kotxi0': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'hiwpaze1': {
      'en': 'Send Reset Link',
      'ar': 'أرسل رابط إعادة التعيين',
      'de': 'Zurücksetzen-Link senden',
      'es': 'Enviar enlace de reinicio',
    },
    '598b8d3m': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // onboarding
  {
    'i8hl2uua': {
      'en': 'Example One',
      'ar': 'إنشاء الميزانيات',
      'de': 'Erstellen Sie Budgets',
      'es': 'Crear presupuestos',
    },
    'hxtwax0y': {
      'en':
          'Create budgets that you can tie transactions too in order for easy tracking.',
      'ar':
          'قم بإنشاء ميزانيات يمكنك ربط المعاملات بها أيضًا من أجل التتبع السهل.',
      'de':
          'Erstellen Sie Budgets, mit denen Sie auch Transaktionen verknüpfen können, um sie einfach nachverfolgen zu können.',
      'es':
          'Cree presupuestos en los que también pueda vincular transacciones para facilitar el seguimiento.',
    },
    'mjy3ljln': {
      'en': 'Example 2',
      'ar': 'تتبع الإنفاق',
      'de': 'Behalten Sie die Ausgaben im Auge',
      'es': 'Mantenga un registro de los gastos',
    },
    'uf9k1spp': {
      'en':
          'Easily add transactions and associate them with budgets that have been created.',
      'ar': 'أضف المعاملات بسهولة وربطها بالميزانيات التي تم إنشاؤها.',
      'de':
          'Fügen Sie ganz einfach Transaktionen hinzu und verknüpfen Sie sie mit erstellten Budgets.',
      'es':
          'Agregue fácilmente transacciones y asócielas con los presupuestos que se han creado.',
    },
    '9c4outzf': {
      'en': 'Example three',
      'ar': 'تحليل الميزانية',
      'de': 'Budgetanalyse',
      'es': 'Análisis de presupuesto',
    },
    'q30ina4f': {
      'en': 'Know where your budgets are and how they can be adjusted.',
      'ar': 'تعرف على مكان ميزانياتك وكيف يمكن تعديلها.',
      'de': 'Wissen, wo Ihre Budgets sind und wie sie angepasst werden können.',
      'es': 'Sepa dónde están sus presupuestos y cómo se pueden ajustar.',
    },
    'ypt7b97g': {
      'en': 'Start',
      'ar': 'إنشاء ميزانيتك',
      'de': 'Erstellen Sie Ihr Budget',
      'es': 'Crea tu presupuesto',
    },
    'oo0kk9qe': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // MY_Card
  {
    '6t7n9ugd': {
      'en': 'Balance',
      'ar': 'الرصيد',
      'de': 'Gleichgewicht',
      'es': 'Equilibrio',
    },
    'eeky0wf2': {
      'en': '\$7,630',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dntk53bl': {
      'en': 'Wallet',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lr97k2rc': {
      'en': '**** 0149',
      'ar': '**** 0149',
      'de': '**** 0149',
      'es': '**** 0149',
    },
    'l9racj60': {
      'en': '05/25',
      'ar': '05/25',
      'de': '25.05',
      'es': '25/05',
    },
    'yet7zk5d': {
      'en': 'Quick Service',
      'ar': 'خدمة سريعة',
      'de': 'Schneller Service',
      'es': 'Servicio rapido',
    },
    '8bnd6lco': {
      'en': 'Transfer',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'roobc02h': {
      'en': 'Block Card',
      'ar': 'بطاقة وقفة',
      'de': 'Pausenkarte',
      'es': 'Tarjeta de pausa',
    },
    '27pb7ji4': {
      'en': 'Transaction',
      'ar': 'عملية',
      'de': 'Transaktion',
      'es': 'Transacción',
    },
    'ymfmz1ax': {
      'en': 'Dribbble LTD.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'o08jnodl': {
      'en': 'Paid on: May, 4th 2023',
      'ar': '',
      'de': '',
      'es': '',
    },
    'sriclhoq': {
      'en': '\$500.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cgsqlide': {
      'en': 'Overdue',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mgleghvd': {
      'en': 'FlutterFlow',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1igtvnk2': {
      'en': 'Paid on: May, 4th 2023',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qvrdky9h': {
      'en': '\$500.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1915bsre': {
      'en': 'Overdue',
      'ar': '',
      'de': '',
      'es': '',
    },
    '818kwp79': {
      'en': 'ScreenStudio App',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4hkh9400': {
      'en': 'Paid on: May, 4th 2023',
      'ar': '',
      'de': '',
      'es': '',
    },
    'o2bnhrqf': {
      'en': '\$24.99',
      'ar': '',
      'de': '',
      'es': '',
    },
    '56xp8lap': {
      'en': 'Paid',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6j0nslbr': {
      'en': 'Slack Ltd',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hwnkex2v': {
      'en': 'Paid on: May, 4th 2023',
      'ar': '',
      'de': '',
      'es': '',
    },
    'o0dd4h7m': {
      'en': '\$24.99',
      'ar': '',
      'de': '',
      'es': '',
    },
    '03ibk0hz': {
      'en': 'Paid',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7gucduid': {
      'en': 'Wallet',
      'ar': 'هل نسيت كلمة السر',
      'de': 'Passwort vergessen',
      'es': 'Has olvidado tu contraseña',
    },
    'm8rhanhc': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // MY_profilePage
  {
    'i16gr6pz': {
      'en': '[User Name Here]',
      'ar': '',
      'de': '',
      'es': '',
    },
    'eixjjzil': {
      'en': 'User.name@domainname.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    'f1bvbey3': {
      'en': 'My Account',
      'ar': 'حسابي',
      'de': 'Mein Konto',
      'es': 'Mi cuenta',
    },
    'i61y9ibx': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'de': 'Profil bearbeiten',
      'es': 'Editar perfil',
    },
    '03k0vw86': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
      'de': 'Kennwort ändern',
      'es': 'Cambia la contraseña',
    },
    '6w6wv95p': {
      'en': 'Notification Settings',
      'ar': 'إعدادات الإشعار',
      'de': 'Benachrichtigungseinstellungen',
      'es': 'Configuración de las notificaciones',
    },
    '9aogde79': {
      'en': 'Tutorial',
      'ar': 'درس تعليمي',
      'de': 'Lernprogramm',
      'es': 'Tutorial',
    },
    'eojlfs66': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'de': 'Datenschutz-Bestimmungen',
      'es': 'Política de privacidad',
    },
    '2ll42t1u': {
      'en': 'Dark Mode',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8d386226': {
      'en': 'Light Mode',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8srr2k0j': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // transferComplete
  {
    'xf8d4sm8': {
      'en': 'Transfer Complete',
      'ar': 'نقل كامل',
      'de': 'Übertragung vollständig',
      'es': 'transferencia completa',
    },
    'iq9jjji8': {
      'en':
          'Great work, you successfully transferred funds. It may take a few days for the funds to leave your account.',
      'ar':
          'عمل رائع ، لقد قمت بتحويل الأموال بنجاح. قد يستغرق خروج الأموال من حسابك بضعة أيام.',
      'de':
          'Großartige Arbeit, Sie haben erfolgreich Geld überwiesen. Es kann einige Tage dauern, bis das Geld von Ihrem Konto abgebucht wird.',
      'es':
          'Buen trabajo, transfirió fondos con éxito. Los fondos pueden tardar unos días en salir de su cuenta.',
    },
    'wrbg19ed': {
      'en': 'Okay',
      'ar': 'تمام',
      'de': 'Okay',
      'es': 'Okey',
    },
    'ndkybnrt': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // transferFunds
  {
    'pe3o18oh': {
      'en': 'Transfer Funds',
      'ar': 'تحويل الأموال',
      'de': 'Geld überweisen',
      'es': 'Transferir fondos',
    },
    'kyzwrfh4': {
      'en': 'Balance',
      'ar': 'الرصيد',
      'de': 'Gleichgewicht',
      'es': 'Equilibrio',
    },
    'zq4ozx20': {
      'en': '\$7,630',
      'ar': '7630 دولارًا',
      'de': '\$7.630',
      'es': '\$7,630',
    },
    'qukh7yo1': {
      'en': '**** 0149',
      'ar': '**** 0149',
      'de': '**** 0149',
      'es': '**** 0149',
    },
    'n87hkr7d': {
      'en': '05/25',
      'ar': '05/25',
      'de': '25.05',
      'es': '25/05',
    },
    '3ct4fj7p': {
      'en': 'Change Account',
      'ar': 'تغير الحساب',
      'de': 'Account wechseln',
      'es': 'Cambiar cuenta',
    },
    'w4smsh2i': {
      'en': 'Internal Transfer',
      'ar': 'التحويل الداخلي',
      'de': 'Interner Transfer',
      'es': 'Transferencia interna',
    },
    '6uxty3hy': {
      'en': 'External Transfer',
      'ar': 'التحويل الخارجي',
      'de': 'Externe Übertragung',
      'es': 'Transferencia externa',
    },
    'p4ngma0d': {
      'en': 'ACH Payment',
      'ar': 'دفع ACH',
      'de': 'ACH-Zahlung',
      'es': 'Pago CCA',
    },
    'uxo87fjc': {
      'en': 'Transfer Type',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fddma8xl': {
      'en': 'Select Account',
      'ar': 'حدد حساب',
      'de': 'Konto auswählen',
      'es': 'Seleccionar cuenta',
    },
    '23l6kqgm': {
      'en': 'Account ****2010',
      'ar': 'الحساب **** 2010',
      'de': 'Konto ****2010',
      'es': 'Cuenta ****2010',
    },
    '3hwdfadf': {
      'en': 'Account ****2011',
      'ar': 'الحساب **** 2011',
      'de': 'Konto ****2011',
      'es': 'Cuenta ****2011',
    },
    'xvj00xg1': {
      'en': 'Account ****2012',
      'ar': 'الحساب **** 2012',
      'de': 'Konto ****2012',
      'es': 'Cuenta ****2012',
    },
    'ok5xluvk': {
      'en': 'Choose an Account',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ynie0pc5': {
      'en': '\$ Amount',
      'ar': 'المبلغ بالدولار',
      'de': '\$ Betrag',
      'es': '\$ Monto',
    },
    'wngoi0v4': {
      'en': 'Your new account balance is:',
      'ar': 'رصيد حسابك الجديد هو:',
      'de': 'Ihr neuer Kontostand beträgt:',
      'es': 'El nuevo saldo de su cuenta es:',
    },
    'g6bfec2g': {
      'en': '\$7,630',
      'ar': '7630 دولارًا',
      'de': '\$7.630',
      'es': '\$7,630',
    },
    'xaw2jdst': {
      'en': 'Send Transfer',
      'ar': 'أرسل حوالة',
      'de': 'Überweisung senden',
      'es': 'Enviar transferencia',
    },
    'xku4zxbe': {
      'en': 'Tap above to complete transfer',
      'ar': 'اضغط أعلاه لإكمال النقل',
      'de': 'Tippen Sie oben, um die Übertragung abzuschließen',
      'es': 'Toque arriba para completar la transferencia',
    },
    'imaejg7x': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // editProfile
  {
    '4rzqov3y': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'de': 'Profil bearbeiten',
      'es': 'Editar perfil',
    },
    'zoxan2gi': {
      'en': 'Change Photo',
      'ar': 'غير الصوره',
      'de': 'Foto ändern',
      'es': 'Cambiar foto',
    },
    '3p9y21e2': {
      'en': 'Your Name',
      'ar': 'اسمك',
      'de': 'Dein Name',
      'es': 'Tu nombre',
    },
    'dw9gmjdc': {
      'en': 'Please enter a valid number...',
      'ar': 'من فضلك أدخل رقما صالحا...',
      'de': 'Bitte geben Sie eine gültige Nummer ein...',
      'es': 'Por favor ingrese un número valido...',
    },
    'z4fstn5l': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'jozgvwyg': {
      'en': 'Your email',
      'ar': 'بريدك الالكتروني',
      'de': 'Deine E-Mail',
      'es': 'Tu correo electrónico',
    },
    '8h1cjk5a': {
      'en': 'Your Age',
      'ar': 'عمرك',
      'de': 'Ihr Alter',
      'es': 'Su edad',
    },
    '5v21r6gb': {
      'en': 'i.e. 34',
      'ar': 'أي 34',
      'de': 'dh 34',
      'es': 'es decir, 34',
    },
    'zvymbfia': {
      'en': 'Your Title',
      'ar': 'لقبك',
      'de': 'Dein Titel',
      'es': 'Tu título',
    },
    'i6edcl52': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'de': 'Änderungen speichern',
      'es': 'Guardar cambios',
    },
    '59naq8ur': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // changePassword
  {
    'l5iggwaz': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
      'de': 'Kennwort ändern',
      'es': 'Cambia la contraseña',
    },
    '2b97u8y5': {
      'en':
          'Enter the email associated with your account and we will send you link to reset your password.',
      'ar':
          'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رابطًا لإعادة تعيين كلمة المرور الخاصة بك.',
      'de':
          'Geben Sie die mit Ihrem Konto verknüpfte E-Mail-Adresse ein und wir senden Ihnen einen Link zum Zurücksetzen Ihres Passworts.',
      'es':
          'Ingrese el correo electrónico asociado con su cuenta y le enviaremos un enlace para restablecer su contraseña.',
    },
    'ajy1c3r9': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'hsqfoxya': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'if4pz6lm': {
      'en': 'Send Reset Link',
      'ar': 'أرسل رابط إعادة التعيين',
      'de': 'Zurücksetzen-Link senden',
      'es': 'Enviar enlace de reinicio',
    },
    '5tvk9lv0': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // notificationsSettings
  {
    'sc4ff4ce': {
      'en': 'Notifications',
      'ar': 'إشعارات',
      'de': 'Benachrichtigungen',
      'es': 'Notificaciones',
    },
    'r72zvrv5': {
      'en':
          'Choose what notifcations you want to recieve below and we will update the settings.',
      'ar': 'اختر الإشعارات التي تريد تلقيها أدناه وسنقوم بتحديث الإعدادات.',
      'de':
          'Wählen Sie unten aus, welche Benachrichtigungen Sie erhalten möchten, und wir aktualisieren die Einstellungen.',
      'es':
          'Elija qué notificaciones desea recibir a continuación y actualizaremos la configuración.',
    },
    'gjygkr0n': {
      'en': 'Push Notifications',
      'ar': 'دفع الإخطارات',
      'de': 'Mitteilungen',
      'es': 'Notificaciones push',
    },
    '3y3yhxbk': {
      'en':
          'Receive Push notifications from our application on a semi regular basis.',
      'ar': 'تلقي إشعارات من تطبيقنا على أساس شبه منتظم.',
      'de':
          'Erhalten Sie regelmäßig Push-Benachrichtigungen von unserer Anwendung.',
      'es':
          'Reciba notificaciones Push de nuestra aplicación de forma semi regular.',
    },
    '1ytebj35': {
      'en': 'Email Notifications',
      'ar': 'اشعارات البريد الالكتروني',
      'de': 'E-Mail Benachrichtigungen',
      'es': 'Notificaciónes de Correo Electrónico',
    },
    '9lvh5nst': {
      'en':
          'Receive email notifications from our marketing team about new features.',
      'ar':
          'تلقي إشعارات البريد الإلكتروني من فريق التسويق لدينا حول الميزات الجديدة.',
      'de':
          'Erhalten Sie E-Mail-Benachrichtigungen von unserem Marketingteam über neue Funktionen.',
      'es':
          'Reciba notificaciones por correo electrónico de nuestro equipo de marketing sobre nuevas funciones.',
    },
    '69d2j74u': {
      'en': 'Location Services',
      'ar': 'خدمات الموقع',
      'de': 'Standortdienste',
      'es': 'Servicios de localización',
    },
    '3k8cuv0d': {
      'en':
          'Allow us to track your location, this helps keep track of spending and keeps you safe.',
      'ar':
          'اسمح لنا بتتبع موقعك ، فهذا يساعد على تتبع الإنفاق ويحافظ على سلامتك.',
      'de':
          'Erlauben Sie uns, Ihren Standort zu verfolgen, dies hilft, die Ausgaben im Auge zu behalten und schützt Sie.',
      'es':
          'Permítanos rastrear su ubicación, esto ayuda a realizar un seguimiento de los gastos y lo mantiene seguro.',
    },
    'isgrgbfs': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'de': 'Änderungen speichern',
      'es': 'Guardar cambios',
    },
    'a96mlyeh': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // privacyPolicy
  {
    'alczfiiy': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'de': 'Datenschutz-Bestimmungen',
      'es': 'Política de privacidad',
    },
    'fvsfg5on': {
      'en': 'How we use your data',
      'ar': 'كيف نستخدم بياناتك',
      'de': 'Wie wir Ihre Daten verwenden',
      'es': 'Cómo usamos sus datos',
    },
    'nbiyrnzl': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.\n\nEuismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem integer vitae justo eget magna fermentum iaculis eu. Lacinia at quis risus sed. Faucibus purus in massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit.\n\nEt malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Commodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
      'ar':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incidunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. غير consectetur a erat nam. دونك ألتريسيس تينسيدونت قوس غير مخادع. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis في erat pellentesque adipiscing. موريس نونك كونيج سيرة ذاتية. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla. Euismod lacinia في quis risus sed vulputate odio. فيليت كريمينسيم sodales ut eu sem سيرة ذاتية صحيحة justo eget. Risus feugiat في ما قبل ميتوس. Leo vel orci porta non pulvinar neque laoreet suspension interdum. Suscipit Tellus mauris a Diam Maecenas Sed enim ut sem. SEM السيرة الذاتية الصحيحة justo eget magna fermentum iaculis eu. لاسينيا في quis risus sed. Faucibus purus في ماسا مؤقت. ليو بقطر سوليتودين معرف مؤقت الاتحاد الأوروبي. Nisi scelerisque eu ultrices السيرة الذاتية موصل. Vulputate كريم معلق في وقت مبكر. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus Préium quam vulputate. Elit pellentesque موطن morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. sit amet mattis vulputate enim nulla. Nisi lacus sed viverra Tellus في العادة السيئة. اجلس أميت ريسوس نولام إيجيت فيليس إيجيت نونك لوبورتيز. Pretium lectus quam id leo in vitae. Adipiscing Diam donec adipiscing tristique. كومودو سيد egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing النخبة pellentesque المعيشية morbi. مونتيس ناسيتور ريديكولوس موس موريس. Ut etiam sit amet nisl purus in. Arcu ac Ornare suspendisse sed nisi lacus sed viverra.',
      'de':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis bei erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla. Euismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem integer vitae justo eget magna fermentum iaculis eu. Lacinia bei quis risus sed. Faucibus purus in massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Commodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla. Euismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem entero vitae justo eget magna fermentum iaculis eu. Lacinia at quis risus sed. Faucibus purus en massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Cómodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
    },
    'oks4x95o': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // tutorial_PROFILE
  {
    '38wb3rix': {
      'en': 'Tutorial',
      'ar': 'درس تعليمي',
      'de': 'Lernprogramm',
      'es': 'Tutorial',
    },
    'o6prpb1q': {
      'en': 'Create Budgets',
      'ar': 'إنشاء الميزانيات',
      'de': 'Erstellen Sie Budgets',
      'es': 'Crear presupuestos',
    },
    '292pbdw7': {
      'en':
          'Create budgets that you can tie transactions too in order for easy tracking.',
      'ar':
          'قم بإنشاء ميزانيات يمكنك ربط المعاملات بها أيضًا من أجل التتبع السهل.',
      'de':
          'Erstellen Sie Budgets, mit denen Sie auch Transaktionen verknüpfen können, um sie einfach nachverfolgen zu können.',
      'es':
          'Cree presupuestos en los que también pueda vincular transacciones para facilitar el seguimiento.',
    },
    'b10xvuf9': {
      'en': 'Keep Track of Spending',
      'ar': 'تتبع الإنفاق',
      'de': 'Behalten Sie die Ausgaben im Auge',
      'es': 'Mantenga un registro de los gastos',
    },
    't6k1smsm': {
      'en':
          'Easily add transactions and associate them with budgets that have been created.',
      'ar': 'أضف المعاملات بسهولة وربطها بالميزانيات التي تم إنشاؤها.',
      'de':
          'Fügen Sie ganz einfach Transaktionen hinzu und verknüpfen Sie sie mit erstellten Budgets.',
      'es':
          'Agregue fácilmente transacciones y asócielas con los presupuestos que se han creado.',
    },
    'u8xxj427': {
      'en': 'Budget Analysis',
      'ar': 'تحليل الميزانية',
      'de': 'Budgetanalyse',
      'es': 'Análisis de presupuesto',
    },
    'iqi0pkmb': {
      'en': 'Know where your budgets are and how they can be adjusted.',
      'ar': 'تعرف على مكان ميزانياتك وكيف يمكن تعديلها.',
      'de': 'Wissen, wo Ihre Budgets sind und wie sie angepasst werden können.',
      'es': 'Sepa dónde están sus presupuestos y cómo se pueden ajustar.',
    },
    'uydm0fnm': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // homePage_alt
  {
    'xdh0z8qh': {
      'en': 'Welcome,',
      'ar': 'مرحبا،',
      'de': 'Herzlich willkommen,',
      'es': 'Bienvenidos,',
    },
    'v74pa882': {
      'en': 'Andrew',
      'ar': 'أندرو',
      'de': 'Andreas',
      'es': 'Andrés',
    },
    'rzpg3cvh': {
      'en': 'Your latest updates are below.',
      'ar': 'آخر التحديثات الخاصة بك أدناه.',
      'de': 'Ihre neuesten Updates sind unten.',
      'es': 'Sus últimas actualizaciones se encuentran a continuación.',
    },
    'flto6ti8': {
      'en': 'Total Balance',
      'ar': 'إجمالي الرصيد',
      'de': 'Gesamtsaldo',
      'es': 'Balance total',
    },
    'g07h0azf': {
      'en': '\$25,281',
      'ar': '25281 دولارًا',
      'de': '25.281 \$',
      'es': '\$25,281',
    },
    'v9ghmn0y': {
      'en': 'Total Balance',
      'ar': 'إجمالي الرصيد',
      'de': 'Gesamtsaldo',
      'es': 'Balance total',
    },
    '7vf40ybo': {
      'en': '\$25,281',
      'ar': '25281 دولارًا',
      'de': '25.281 \$',
      'es': '\$25,281',
    },
    'k4scs2cu': {
      'en': 'Total Balance',
      'ar': 'إجمالي الرصيد',
      'de': 'Gesamtsaldo',
      'es': 'Balance total',
    },
    'cvrbfozm': {
      'en': '\$25,281',
      'ar': '25281 دولارًا',
      'de': '25.281 \$',
      'es': '\$25,281',
    },
    'a33ldz0h': {
      'en': 'Next Payroll',
      'ar': 'كشوف المرتبات التالية',
      'de': 'Nächste Gehaltsabrechnung',
      'es': 'Nómina siguiente',
    },
    '3dgzzz79': {
      'en': '\$25,281',
      'ar': '25281 دولارًا',
      'de': '25.281 \$',
      'es': '\$25,281',
    },
    'hp28r17l': {
      'en': 'Debit Date',
      'ar': 'تاريخ الخصم',
      'de': 'Belastungsdatum',
      'es': 'Fecha de débito',
    },
    'k04gl6sz': {
      'en': 'Aug 31, 2021',
      'ar': '31 أغسطس 2021',
      'de': '31. August 2021',
      'es': '31 de agosto de 2021',
    },
    'd5tcdo3w': {
      'en': '4 days left',
      'ar': 'باقي 4 ايام',
      'de': 'noch 4 Tage',
      'es': '4 días restantes',
    },
    '8wofym4i': {
      'en': '1 New Alert',
      'ar': '1 تنبيه جديد',
      'de': '1 Neue Benachrichtigung',
      'es': '1 nueva alerta',
    },
    'kaq4nzj6': {
      'en': 'Fraud Alert',
      'ar': 'تنبيه الاحتيال',
      'de': 'Betrugsalarm',
      'es': 'Alerta de fraude',
    },
    '7zcrtqx6': {
      'en':
          'We noticed a small charge that is out of character of this account, please review.',
      'ar': 'لقد لاحظنا تكلفة صغيرة خارجة عن طبيعة هذا الحساب ، يرجى المراجعة.',
      'de':
          'Wir haben eine kleine Belastung festgestellt, die für dieses Konto untypisch ist. Bitte überprüfen Sie diese.',
      'es':
          'Notamos un pequeño cargo que está fuera de lugar en esta cuenta, revíselo.',
    },
    '23yxoc9m': {
      'en': 'View Now',
      'ar': 'عرض الآن',
      'de': 'Jetzt ansehen',
      'es': 'Ver ahora',
    },
    'a86mwddx': {
      'en': 'Marketing Budget',
      'ar': 'ميزانية التسويق',
      'de': 'Werbehaushalt, Werbebudget',
      'es': 'Presupuesto de marketing',
    },
    '6c2o39hz': {
      'en': '\$3,000',
      'ar': '3000 دولار',
      'de': '3.000 \$',
      'es': '\$3,000',
    },
    '5subrra4': {
      'en': 'Total Spent',
      'ar': 'إجمال الصرف',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    '0wtm2m51': {
      'en': '\$2,502',
      'ar': '2،502 دولار',
      'de': '2.502 \$',
      'es': '\$2,502',
    },
    'bp9d56pc': {
      'en': '4 days left',
      'ar': 'باقي 4 ايام',
      'de': 'noch 4 Tage',
      'es': '4 días restantes',
    },
    'b8oj0pck': {
      'en': 'Team Name',
      'ar': 'اسم الفريق',
      'de': 'Teamname',
      'es': 'Nombre del equipo',
    },
    '87ospwsq': {
      'en': '\$5,000',
      'ar': '5000 دولار',
      'de': '5.000 \$',
      'es': '\$5,000',
    },
    'jzfejglt': {
      'en': 'Head of Design',
      'ar': 'رئيس قسم التصميم',
      'de': 'Leiter Design',
      'es': 'Jefe de Diseño',
    },
    'zm0lhm2a': {
      'en': '[Time Stamp]',
      'ar': '[الطابع الزمني]',
      'de': '[Zeitstempel]',
      'es': '[Marca de tiempo]',
    },
    '8hu2v2im': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // Alerts
  {
    'qpphkxhk': {
      'en': 'Below are a summary of your invoices.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bbhozegw': {
      'en': 'All',
      'ar': '',
      'de': '',
      'es': '',
    },
    '78862695': {
      'en': 'Today',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5glur0sb': {
      'en': 'ScreenStudio App',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6zrgy5ee': {
      'en': 'Paid on: May, 4th 2023',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4fpjdh14': {
      'en': '\$24.99',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tl0kkc1y': {
      'en': 'DUE',
      'ar': '',
      'de': '',
      'es': '',
    },
    'sxcmbcpl': {
      'en': 'Slack Ltd',
      'ar': '',
      'de': '',
      'es': '',
    },
    'membk7he': {
      'en': 'Paid on: May, 4th 2023',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tw9vzm2z': {
      'en': '\$24.99',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dd9y8p8p': {
      'en': 'DUE',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lfoac4wc': {
      'en': 'Earlier Invoices',
      'ar': '',
      'de': '',
      'es': '',
    },
    'oayo3ibx': {
      'en': 'Dribbble LTD.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'e8w9zk02': {
      'en': 'Paid on: May, 4th 2023',
      'ar': '',
      'de': '',
      'es': '',
    },
    'e9aj60e0': {
      'en': '\$500.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    'k6rl2imr': {
      'en': 'Overdue',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qy2wr3rz': {
      'en': 'FlutterFlow',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8id4gtww': {
      'en': 'Paid on: May, 4th 2023',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nls7la9q': {
      'en': '\$500.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    'e1yi3u0h': {
      'en': 'Overdue',
      'ar': '',
      'de': '',
      'es': '',
    },
    't7uidd1y': {
      'en': 'ScreenStudio App',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rhu6ii6p': {
      'en': 'Paid on: May, 4th 2023',
      'ar': '',
      'de': '',
      'es': '',
    },
    'opzrfsoj': {
      'en': '\$24.99',
      'ar': '',
      'de': '',
      'es': '',
    },
    'eqctpmwt': {
      'en': 'Paid',
      'ar': '',
      'de': '',
      'es': '',
    },
    'iktvsqab': {
      'en': 'Slack Ltd',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4zrzvb5j': {
      'en': 'Paid on: May, 4th 2023',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2m1drjvq': {
      'en': '\$24.99',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2fyhlcvf': {
      'en': 'Paid',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1fdi42ga': {
      'en': 'Open',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1n01lg65': {
      'en': 'Today',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nhb3maj5': {
      'en': 'ScreenStudio App',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ligmv9ny': {
      'en': 'Paid on: May, 4th 2023',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zjsrrl7l': {
      'en': '\$24.99',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ee0d31sn': {
      'en': 'DUE',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yazherss': {
      'en': 'Slack Ltd',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fxx45pdm': {
      'en': 'Paid on: May, 4th 2023',
      'ar': '',
      'de': '',
      'es': '',
    },
    'usyuydjm': {
      'en': '\$24.99',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jkbxny8a': {
      'en': 'DUE',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dq97de3p': {
      'en': 'Earlier Invoices',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0k43ysyf': {
      'en': 'Dribbble LTD.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'osufh299': {
      'en': 'Paid on: May, 4th 2023',
      'ar': '',
      'de': '',
      'es': '',
    },
    'p2x4p7al': {
      'en': '\$500.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    'k5271i5p': {
      'en': 'Overdue',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ghv8jfi2': {
      'en': 'FlutterFlow',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2u0xoar7': {
      'en': 'Paid on: May, 4th 2023',
      'ar': '',
      'de': '',
      'es': '',
    },
    'os0e90vd': {
      'en': '\$500.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0x13josh': {
      'en': 'Overdue',
      'ar': '',
      'de': '',
      'es': '',
    },
    'y557tb4i': {
      'en': 'Paid',
      'ar': '',
      'de': '',
      'es': '',
    },
    'twso6h76': {
      'en': 'Earlier Invoices',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3ivh9dzf': {
      'en': 'Dribbble LTD.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ge0zdbcu': {
      'en': 'Paid on: May, 4th 2023',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bhlgtd2h': {
      'en': '\$500.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bc7e2819': {
      'en': 'Paid',
      'ar': '',
      'de': '',
      'es': '',
    },
    'iufy3vu0': {
      'en': 'FlutterFlow',
      'ar': '',
      'de': '',
      'es': '',
    },
    '57cxhk4q': {
      'en': 'Paid on: May, 4th 2023',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vxj7jq2j': {
      'en': '\$500.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4eythey2': {
      'en': 'Paid',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ot54u4pi': {
      'en': 'Notifications',
      'ar': 'إشعارات',
      'de': 'Benachrichtigungen',
      'es': 'Notificaciones',
    },
    'g3v43dw0': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // numberemail
  {
    'dzijjnh8': {
      'en': 'Select which contact details should we use to reset your password',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wobgg645': {
      'en': 'Via SMS',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q25i8afv': {
      'en': '+1 111 ******99',
      'ar': '',
      'de': '',
      'es': '',
    },
    'm35ttdy9': {
      'en': 'Via Email',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6wx98gxh': {
      'en': 'and***ley@yourdomain.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1dhccaxs': {
      'en': 'Continue',
      'ar': 'أرسل رابط إعادة التعيين',
      'de': 'Zurücksetzen-Link senden',
      'es': 'Enviar enlace de reinicio',
    },
    'apuqqqcs': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'de': 'Anmeldung',
      'es': 'Acceso',
    },
    '3mnu3wd7': {
      'en': 'Recover Password',
      'ar': 'إشعارات',
      'de': 'Benachrichtigungen',
      'es': 'Notificaciones',
    },
    'dz9x4nfa': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // Newpassword
  {
    'jiy8vow6': {
      'en': 'Login to access your account below.',
      'ar': 'قم بإنشاء حسابك أدناه.',
      'de': 'Erstellen Sie unten Ihr Konto.',
      'es': 'Crea tu cuenta a continuación.',
    },
    '8bc2sr14': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    '2miqjchl': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    '7u7i28ch': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'es': 'Contraseña',
    },
    'e8cmk16g': {
      'en': 'Enter your password...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
    },
    'js13sdrg': {
      'en': 'Continue',
      'ar': 'أرسل رابط إعادة التعيين',
      'de': 'Zurücksetzen-Link senden',
      'es': 'Enviar enlace de reinicio',
    },
    'fmz8zk2n': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // GetDriver
  {
    'nwlndiq8': {
      'en': 'Sedan ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ex3d3yzy': {
      'en': 'Vol. Max 0.40m3',
      'ar': '',
      'de': '',
      'es': '',
    },
    '93sja3kr': {
      'en': 'Peso Max. 10 Kg',
      'ar': '',
      'de': '',
      'es': '',
    },
    'p7znq2fk': {
      'en': 'Take Vehicle',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lt9mewem': {
      'en': 'Mini Van',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5e0dz9t6': {
      'en': 'Vol. Max 1.70m3',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7gm1p5u0': {
      'en': 'Peso Max. 20 Kg',
      'ar': '',
      'de': '',
      'es': '',
    },
    '09hvoil0': {
      'en': 'Take Vehicle',
      'ar': '',
      'de': '',
      'es': '',
    },
    'agqo9r86': {
      'en': 'Van',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zmp6chen': {
      'en': 'Vol. Max 3.40m3',
      'ar': '',
      'de': '',
      'es': '',
    },
    'e7scdlv9': {
      'en': 'Peso Max. 60 Kg',
      'ar': '',
      'de': '',
      'es': '',
    },
    'a4bibnph': {
      'en': 'Take Vehicle',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4vutv61d': {
      'en': 'Pick Up',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hvwlo7yp': {
      'en': 'Vol. Max 6.00m3',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0u7mq9rx': {
      'en': 'Peso Max. 90 Kg',
      'ar': '',
      'de': '',
      'es': '',
    },
    'k296mkuo': {
      'en': 'Take Vehicle',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5tffweg2': {
      'en': 'Plataforma',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5r5i5lmk': {
      'en': 'Vol. Max 35.00m3',
      'ar': '',
      'de': '',
      'es': '',
    },
    'chuf37qc': {
      'en': 'Peso Max. 200 Kg',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pmr34pfh': {
      'en': 'Take Vehicle',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pn8jwml9': {
      'en': 'Camion Cava',
      'ar': '',
      'de': '',
      'es': '',
    },
    'aydln4g9': {
      'en': 'Vol. Max 17.00m3',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j4gwrwn3': {
      'en': 'Peso Max. 120 Kg',
      'ar': '',
      'de': '',
      'es': '',
    },
    'o3rtojf4': {
      'en': 'Take Vehicle',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lxm893rr': {
      'en': 'Payment',
      'ar': 'إشعارات',
      'de': 'Benachrichtigungen',
      'es': 'Notificaciones',
    },
    'vugbphil': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Payment
  {
    'lnexvd56': {
      'en': 'My Wallet',
      'ar': '',
      'de': '',
      'es': '',
    },
    'trguqlwt': {
      'en': 'Paypal',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yys38cqh': {
      'en': 'Apple Pay',
      'ar': '',
      'de': '',
      'es': '',
    },
    'k8ur1acp': {
      'en': 'Google Pay',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tisdsgjt': {
      'en': '****  **** **** **** 4679',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ckqxfixc': {
      'en': 'Continue',
      'ar': '',
      'de': '',
      'es': '',
    },
    'sxawdpsh': {
      'en': 'Payment',
      'ar': 'إشعارات',
      'de': 'Benachrichtigungen',
      'es': 'Notificaciones',
    },
    'a83v9njt': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // PaymentM
  {
    'mv2wu0c0': {
      'en': 'Paypal',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6uktvp25': {
      'en': 'Apple Pay',
      'ar': '',
      'de': '',
      'es': '',
    },
    'w79lyz04': {
      'en': 'Google Pay',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nk8orql8': {
      'en': '****  **** **** **** 4679',
      'ar': '',
      'de': '',
      'es': '',
    },
    'u2nf9sbb': {
      'en': 'Continue',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tqnacynp': {
      'en': 'Payment',
      'ar': 'إشعارات',
      'de': 'Benachrichtigungen',
      'es': 'Notificaciones',
    },
    'u8we4bal': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // TopUp
  {
    '1qcpq1vi': {
      'en': 'Below are a summary of your invoices.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pylvyl0c': {
      'en': 'Enter the amount of top up',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wg5430yy': {
      'en': '[Some hint text...]',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3acuo8zv': {
      'en': '\$247',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jb9bvcgq': {
      'en': '\$10',
      'ar': '',
      'de': '',
      'es': '',
    },
    'u3yzh6u1': {
      'en': '\$20',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qnq5j8mx': {
      'en': '\$50',
      'ar': '',
      'de': '',
      'es': '',
    },
    'sy8pnda2': {
      'en': '\$100',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4enpclpj': {
      'en': '\$200',
      'ar': '',
      'de': '',
      'es': '',
    },
    'x5jzv4nn': {
      'en': '\$250',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rh5g9kti': {
      'en': '\$500',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yig4hlcn': {
      'en': '\$750',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jlvahqt0': {
      'en': '\$1,000',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3b0z5xfu': {
      'en': 'Continue',
      'ar': '',
      'de': '',
      'es': '',
    },
    '40hoiexc': {
      'en': 'Payment',
      'ar': 'إشعارات',
      'de': 'Benachrichtigungen',
      'es': 'Notificaciones',
    },
    'l2xil3i2': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // MyOrder
  {
    'jnoxmvwp': {
      'en': 'Enter Track ID Number',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3mwwfb10': {
      'en': 'From Me',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yxh1vv0n': {
      'en': 'All',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gey5vovz': {
      'en': 'Pending',
      'ar': '',
      'de': '',
      'es': '',
    },
    'n66t0xnk': {
      'en': 'On Process',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1kjl6xvi': {
      'en': 'Completed',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4jv1zv5z': {
      'en': 'Canceled',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fdovru9w': {
      'en': 'SK92968324',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1sfy3qi7': {
      'en': 'Order delivered',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7nosyyqc': {
      'en': 'Completed',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qfhw6v76': {
      'en': 'SK92968324',
      'ar': '',
      'de': '',
      'es': '',
    },
    'txxhmefu': {
      'en': 'On transit area',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hzraxxp3': {
      'en': 'On Process',
      'ar': '',
      'de': '',
      'es': '',
    },
    'uo1w2tex': {
      'en': 'SK92968324',
      'ar': '',
      'de': '',
      'es': '',
    },
    '18qrzyzq': {
      'en': 'Waiting for driver',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3wa6jj30': {
      'en': 'Pending',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9i8dmlh5': {
      'en': 'SK92968324',
      'ar': '',
      'de': '',
      'es': '',
    },
    'w49z4wh3': {
      'en': 'Order canceled',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5m6cfmgc': {
      'en': 'Canceled',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bx2xrwg4': {
      'en': 'To Me',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jlc0gmi5': {
      'en': 'All',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xdv2xsjd': {
      'en': 'Pending',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ggp0wpv4': {
      'en': 'On Process',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kwak23h1': {
      'en': 'Completed',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bjfm2rd8': {
      'en': 'Canceled',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tr59ajxk': {
      'en': 'SK92968324',
      'ar': '',
      'de': '',
      'es': '',
    },
    'a6umd42d': {
      'en': 'Order delivered',
      'ar': '',
      'de': '',
      'es': '',
    },
    'c7boaa4w': {
      'en': 'Completed',
      'ar': '',
      'de': '',
      'es': '',
    },
    'b92dy1sv': {
      'en': 'SK92968324',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5wg1agxu': {
      'en': 'On transit area',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8dj3eq79': {
      'en': 'On Process',
      'ar': '',
      'de': '',
      'es': '',
    },
    'toeealao': {
      'en': 'SK92968324',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qz50l7uo': {
      'en': 'Waiting for driver',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l36wamkr': {
      'en': 'Pending',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hctl0fx0': {
      'en': 'SK92968324',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rtvjcfb8': {
      'en': 'Order canceled',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tpjnhnzd': {
      'en': 'Canceled',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gny0k2vn': {
      'en': 'Payment',
      'ar': 'إشعارات',
      'de': 'Benachrichtigungen',
      'es': 'Notificaciones',
    },
    'g7ti9ksg': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Maps
  {
    '5c4wzmfw': {
      'en': 'Marvin McKinney',
      'ar': '',
      'de': '',
      'es': '',
    },
    'n9ztfnxj': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // HomePage
  {
    'db3c4iwd': {
      'en': 'Welcome,',
      'ar': 'مرحبا،',
      'de': 'Herzlich willkommen,',
      'es': 'Bienvenidos,',
    },
    'zuewrz2v': {
      'en': 'Andrew',
      'ar': 'أندرو',
      'de': 'Andreas',
      'es': 'Andrés',
    },
    'c4gb9a6s': {
      'en': 'Your latest updates are below.',
      'ar': 'آخر التحديثات الخاصة بك أدناه.',
      'de': 'Ihre neuesten Updates sind unten.',
      'es': 'Sus últimas actualizaciones se encuentran a continuación.',
    },
    '8ziyswdo': {
      'en': 'Balance',
      'ar': 'الرصيد',
      'de': 'Gleichgewicht',
      'es': 'Equilibrio',
    },
    'wkrpze3d': {
      'en': '\$7,630',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7b01m7nr': {
      'en': 'Wallet',
      'ar': '',
      'de': '',
      'es': '',
    },
    'u3pm7gw8': {
      'en': '**** 0149',
      'ar': '**** 0149',
      'de': '**** 0149',
      'es': '**** 0149',
    },
    'wix6wkp6': {
      'en': '05/25',
      'ar': '05/25',
      'de': '25.05',
      'es': '25/05',
    },
    'm3f6f4fg': {
      'en': 'Quick Service',
      'ar': 'خدمة سريعة',
      'de': 'Schneller Service',
      'es': 'Servicio rapido',
    },
    '0wtqympm': {
      'en': 'Send Package',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'qzoy5txo': {
      'en': 'Agendar Viaje',
      'ar': 'بطاقة وقفة',
      'de': 'Pausenkarte',
      'es': 'Tarjeta de pausa',
    },
    's06g2ss3': {
      'en': 'Transfer',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    '2aoy0pav': {
      'en': 'Check ROutes',
      'ar': 'بطاقة وقفة',
      'de': 'Pausenkarte',
      'es': 'Tarjeta de pausa',
    },
    'q3w1hn0a': {
      'en': 'Transaction',
      'ar': 'عملية',
      'de': 'Transaktion',
      'es': 'Transacción',
    },
    'glqrmbfq': {
      'en': 'Go Far Rewards',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nsvw1mm8': {
      'en': 'Income',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'fecogmpj': {
      'en': '\$50.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9gebe7lw': {
      'en': 'Hello World',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4f6xbxnd': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // MapsCopy
  {
    '55q4djkc': {
      'en': 'Continue',
      'ar': 'أرسل رابط إعادة التعيين',
      'de': 'Zurücksetzen-Link senden',
      'es': 'Enviar enlace de reinicio',
    },
    'oesw1iqg': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // PinC
  {
    'hkstb0dr': {
      'en': 'Confirm your Code',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xpe06wjp': {
      'en': 'This code helps keep your account safe and secure.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9x9t09h1': {
      'en': 'Confirm & Continue',
      'ar': '',
      'de': '',
      'es': '',
    },
    's5i6ggck': {
      'en': 'Enter Pin Code Below',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cmsvoq10': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Fingerprint
  {
    '533k1bkb': {
      'en': 'Login to access your account below.',
      'ar': 'قم بإنشاء حسابك أدناه.',
      'de': 'Erstellen Sie unten Ihr Konto.',
      'es': 'Crea tu cuenta a continuación.',
    },
    'ekqjowi8': {
      'en': 'Skip',
      'ar': '',
      'de': '',
      'es': '',
    },
    'n85p5hp6': {
      'en': 'Activate',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xz60696y': {
      'en': 'Fingerprint',
      'ar': 'هل نسيت كلمة السر',
      'de': 'Passwort vergessen',
      'es': 'Has olvidado tu contraseña',
    },
    'fchjokw6': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Faqs
  {
    'q3p2kugr': {
      'en': 'FAQ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'o1kvhgak': {
      'en': 'What is Wigo?',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hed8pwxr': {
      'en': 'How to use Wigo?',
      'ar': '',
      'de': '',
      'es': '',
    },
    't8giydn4': {
      'en': 'Can I create my own shipping?',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1w9qzpok': {
      'en': 'Is Wigo free to use?',
      'ar': '',
      'de': '',
      'es': '',
    },
    'am71gnpo': {
      'en': 'How to make offer on Wigo?',
      'ar': '',
      'de': '',
      'es': '',
    },
    'njgt7pqe': {
      'en': 'Contact Us',
      'ar': '',
      'de': '',
      'es': '',
    },
    'y76y368y': {
      'en': 'Customer Service',
      'ar': '',
      'de': '',
      'es': '',
    },
    'n5p1zcy9': {
      'en': 'Whatsapp',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6lxtb1nu': {
      'en': 'Website',
      'ar': '',
      'de': '',
      'es': '',
    },
    '17ayzbpv': {
      'en': 'Facebook',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nkje4csx': {
      'en': 'Twitter',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mz0u86j3': {
      'en': 'Instagram',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0n4evu4s': {
      'en': 'Payment',
      'ar': 'إشعارات',
      'de': 'Benachrichtigungen',
      'es': 'Notificaciones',
    },
    '0brup7ku': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Home8ProductList
  {
    '7zxrxwey': {
      'en': 'Our menu is below',
      'ar': '',
      'de': '',
      'es': '',
    },
    'exxdtxe4': {
      'en': 'Vol. Max 0.40m3',
      'ar': '',
      'de': '',
      'es': '',
    },
    'uv0xzbco': {
      'en': 'Peso Max. 10 Kg',
      'ar': '',
      'de': '',
      'es': '',
    },
    't94clzl2': {
      'en': '\$11.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    'sdwij56i': {
      'en': 'Title',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cc8hjyz7': {
      'en': 'Subtext',
      'ar': '',
      'de': '',
      'es': '',
    },
    'svfuosap': {
      'en': '\$11.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ak677r5k': {
      'en': 'Title',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fkh537sq': {
      'en': 'Subtext',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1oigjl2b': {
      'en': '\$11.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1wrbw4ui': {
      'en': 'Title',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qm8e0k4h': {
      'en': 'Subtext',
      'ar': '',
      'de': '',
      'es': '',
    },
    'y8rd0bpm': {
      'en': '\$11.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vgn6i9al': {
      'en': 'Title',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xeid7x1c': {
      'en': 'Subtext',
      'ar': '',
      'de': '',
      'es': '',
    },
    'w22cs08n': {
      'en': '\$11.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    'f0ing3wl': {
      'en': 'Title',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rji2xhh3': {
      'en': 'Subtext',
      'ar': '',
      'de': '',
      'es': '',
    },
    'krryujor': {
      'en': '\$11.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    'n7xp4xty': {
      'en': 'Title',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kmw4xd3n': {
      'en': 'Subtext',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tt5r2cj6': {
      'en': '\$11.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pgr32fms': {
      'en': 'Notifications',
      'ar': 'إشعارات',
      'de': 'Benachrichtigungen',
      'es': 'Notificaciones',
    },
    '9agua5ke': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // TrackPage
  {
    'khhtx1jh': {
      'en': 'Marvin McKinney',
      'ar': '',
      'de': '',
      'es': '',
    },
    'g3lc36lb': {
      'en': 'SK27367279',
      'ar': '',
      'de': '',
      'es': '',
    },
    'e0sy3iuq': {
      'en': 'Track ID',
      'ar': '',
      'de': '',
      'es': '',
    },
    'aqw78kca': {
      'en': '2 - 3 days',
      'ar': '',
      'de': '',
      'es': '',
    },
    'a2f0wk96': {
      'en': 'Estimate Time',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7q8j2u67': {
      'en': '2.4 Kg',
      'ar': '',
      'de': '',
      'es': '',
    },
    'm81y5pr2': {
      'en': 'Package Weight',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pe5e4qaa': {
      'en': 'Service Complete',
      'ar': '',
      'de': '',
      'es': '',
    },
    'i17f4aap': {
      'en': 'Checked in at: 4:30pm',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pfqys0p7': {
      'en':
          'Your car has been complete you may now go and pay for your service at the counter.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'oj559qb4': {
      'en': 'Post Service Check',
      'ar': '',
      'de': '',
      'es': '',
    },
    'oi40a5s1': {
      'en': 'Checked in at: 4:30pm',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ld13nynm': {
      'en':
          'Your car is being evaluated by our tech, we are topping off your liquids and making one more quality check.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '02di6p8u': {
      'en': 'In Bay -- Changing Oil',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9yx4l1zl': {
      'en': 'Started at: 4:43pm',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0hn4raca': {
      'en':
          'Your car is currently in the bay and our technicians are changing your oil right now.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1g7vt9ip': {
      'en': 'Preparation',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gjvxv870': {
      'en': 'Completed at: 4:42pm',
      'ar': '',
      'de': '',
      'es': '',
    },
    '91aqjoex': {
      'en':
          'Our team is prepping the bay and your car in order for our techs to be able to change your oil.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cxgbxm83': {
      'en': 'Report an Issue ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'u2jvuq18': {
      'en': 'Tracking',
      'ar': 'هل نسيت كلمة السر',
      'de': 'Passwort vergessen',
      'es': 'Has olvidado tu contraseña',
    },
    'aj46b5dj': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // SizePage
  {
    'aohu8qxl': {
      'en': 'Package Category',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1nsjiaeh': {
      'en': 'Document',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gftd4e6a': {
      'en': 'Electronics',
      'ar': '',
      'de': '',
      'es': '',
    },
    'h2qdzmq1': {
      'en': 'Glass',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kz5o9leu': {
      'en': 'Electronics',
      'ar': '',
      'de': '',
      'es': '',
    },
    'igqp4jya': {
      'en': 'Search for an item...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'v7kg6xjg': {
      'en': 'Weight',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yq2px4it': {
      'en': 'Option 1',
      'ar': '',
      'de': '',
      'es': '',
    },
    'je3z8aev': {
      'en': 'Kg',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4qv8fahl': {
      'en': 'Search for an item...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'e4yom70u': {
      'en': '0',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ga2thh70': {
      'en': 'Dimension',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ld3ft9ke': {
      'en': 'In',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3qtmeefb': {
      'en': 'Cm',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4amlam3l': {
      'en': 'Cm',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hh4ksgeb': {
      'en': 'Search for an item...',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1xhwdkxp': {
      'en': 'Insert Height',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6t35w1gq': {
      'en': 'Option 1',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7b48aa3i': {
      'en': 'Cm',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8ozaw6an': {
      'en': 'Search for an item...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'i3pwkq57': {
      'en': 'Insert Width',
      'ar': '',
      'de': '',
      'es': '',
    },
    'oi3jiv4t': {
      'en': 'Option 1',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ny82tuj0': {
      'en': 'Cm',
      'ar': '',
      'de': '',
      'es': '',
    },
    'p7qivio5': {
      'en': 'Search for an item...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vcxhfraw': {
      'en': 'Insert Long',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9tsvil84': {
      'en': 'Continue',
      'ar': '',
      'de': '',
      'es': '',
    },
    'oovk1tkr': {
      'en': 'Page Title',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4n95gkn0': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Preview
  {
    'jhf21ixa': {
      'en': 'Andrew Daniels',
      'ar': '',
      'de': '',
      'es': '',
    },
    'n3hztcwa': {
      'en': 'Section',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8svnvdrt': {
      'en': '202 F',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q9buwxfb': {
      'en': 'Seat',
      'ar': '',
      'de': '',
      'es': '',
    },
    '56us8x9k': {
      'en': '19F',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l7q1urmn': {
      'en': 'Card ending in 4214',
      'ar': '',
      'de': '',
      'es': '',
    },
    'za5h6jsu': {
      'en': 'Price Breakdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    '55fvptvn': {
      'en': 'Base Price',
      'ar': '',
      'de': '',
      'es': '',
    },
    '98r9ojw4': {
      'en': '\$156.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    '56eodj5g': {
      'en': 'Taxes',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hjs22csc': {
      'en': '\$24.20',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cgyg4af4': {
      'en': 'Cleaning Fee',
      'ar': '',
      'de': '',
      'es': '',
    },
    'p7h97sp3': {
      'en': '\$40.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6s5hi8ix': {
      'en': 'Cleaning Fee',
      'ar': '',
      'de': '',
      'es': '',
    },
    'b9y9o5us': {
      'en': '\$40.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    'p629tj16': {
      'en': 'Price Breakdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    '51xuxutj': {
      'en': 'Base Price',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kuwlqivq': {
      'en': '\$156.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mngagt46': {
      'en': 'Taxes',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qgzsjka6': {
      'en': '\$24.20',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0bk53rng': {
      'en': 'Cleaning Fee',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hy70viei': {
      'en': '\$40.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5chxm0ro': {
      'en': 'Cleaning Fee',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pkdbu315': {
      'en': '\$40.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    'o1wtu4iw': {
      'en': 'Price Breakdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gjkzuyeb': {
      'en': 'Base Price',
      'ar': '',
      'de': '',
      'es': '',
    },
    'whus6to0': {
      'en': '\$156.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zwiinkyc': {
      'en': 'Taxes',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1y7weyn3': {
      'en': '\$24.20',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ykcican5': {
      'en': 'Cleaning Fee',
      'ar': '',
      'de': '',
      'es': '',
    },
    'y5mpn65t': {
      'en': '\$40.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5ikaeaop': {
      'en': 'Cleaning Fee',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2b9td66s': {
      'en': '\$40.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mxzca1nb': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // checkout
  {
    'eavd4oc0': {
      'en': 'Price Breakdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    '11ev2ijx': {
      'en': 'Base Price',
      'ar': '',
      'de': '',
      'es': '',
    },
    'a3i8guug': {
      'en': '\$156.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    'g0duvpm6': {
      'en': 'Taxes',
      'ar': '',
      'de': '',
      'es': '',
    },
    '54bl2jii': {
      'en': '\$24.20',
      'ar': '',
      'de': '',
      'es': '',
    },
    'iynxxogo': {
      'en': 'Cleaning Fee',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qsv0f0nv': {
      'en': '\$40.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    't8x2s5zo': {
      'en': 'Cleaning Fee',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wbopume7': {
      'en': '\$40.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    '64d9vmwy': {
      'en': 'Price Breakdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0wzj0204': {
      'en': 'Base Price',
      'ar': '',
      'de': '',
      'es': '',
    },
    'n8tklbna': {
      'en': '\$156.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9sbsnayz': {
      'en': 'Taxes',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5olwuajh': {
      'en': '\$24.20',
      'ar': '',
      'de': '',
      'es': '',
    },
    'm6i4b68p': {
      'en': 'Cleaning Fee',
      'ar': '',
      'de': '',
      'es': '',
    },
    'p3iib6el': {
      'en': '\$40.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kjxowxji': {
      'en': 'Cleaning Fee',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jcm7ur95': {
      'en': '\$40.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mt7t1bbc': {
      'en': 'Price Breakdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'k3bs8pbd': {
      'en': 'Base Price',
      'ar': '',
      'de': '',
      'es': '',
    },
    'glsbw73h': {
      'en': '\$156.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    'n5cibgsp': {
      'en': 'Taxes',
      'ar': '',
      'de': '',
      'es': '',
    },
    'odnsi0tf': {
      'en': '\$24.20',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fygcmao8': {
      'en': 'Cleaning Fee',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3npnkgou': {
      'en': '\$40.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    'sh084im1': {
      'en': 'Cleaning Fee',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xagj31kz': {
      'en': '\$40.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5uoci74p': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Directory
  {
    'w42djj21': {
      'en': 'Contacts',
      'ar': '',
      'de': '',
      'es': '',
    },
    'sqjz6vys': {
      'en': 'Add Contacts',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qk6s54m8': {
      'en': 'Andrew Jackson',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ht6u3utd': {
      'en': 'email@dominio.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ee68d25e': {
      'en': 'V-123456789',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bnimkcta': {
      'en': '+58 416 000 0000',
      'ar': '',
      'de': '',
      'es': '',
    },
    'sd1llee8': {
      'en': 'Mary Allen',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kodmy3ms': {
      'en': 'email@dominio.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    'k53wdm78': {
      'en': 'V-123456789',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ci80bgwv': {
      'en': '+58 416 000 0000',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mkgeblb2': {
      'en': 'Address',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kv4ki7bl': {
      'en': 'Add Address',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1jjuh8y5': {
      'en': 'Ress. Madre Vieja, Lecheria',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4905cftr': {
      'en': 'Urbaneja. 6016',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hpqr8nej': {
      'en': 'Res. Esturion, Pto. La Cruz',
      'ar': '',
      'de': '',
      'es': '',
    },
    'c71guc52': {
      'en': 'Sotillo. 6023',
      'ar': '',
      'de': '',
      'es': '',
    },
    'sfxbmc34': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // notificationsSettingsCopy
  {
    '39awdqml': {
      'en': 'Notifications',
      'ar': 'إشعارات',
      'de': 'Benachrichtigungen',
      'es': 'Notificaciones',
    },
    '5krpbdvq': {
      'en':
          'Choose what notifcations you want to recieve below and we will update the settings.',
      'ar': 'اختر الإشعارات التي تريد تلقيها أدناه وسنقوم بتحديث الإعدادات.',
      'de':
          'Wählen Sie unten aus, welche Benachrichtigungen Sie erhalten möchten, und wir aktualisieren die Einstellungen.',
      'es':
          'Elija qué notificaciones desea recibir a continuación y actualizaremos la configuración.',
    },
    '7d9mzui3': {
      'en': 'Remember me',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1qfh9q5g': {
      'en': 'Face ID',
      'ar': '',
      'de': '',
      'es': '',
    },
    'u0yszhic': {
      'en': 'Biometric ID',
      'ar': '',
      'de': '',
      'es': '',
    },
    'oesd4tu8': {
      'en': 'Google Authenticator',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3pmsypdf': {
      'en': 'Change PIN',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fptdh8vu': {
      'en': 'Change Password',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ye6a4klr': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // Invite
  {
    '06wvdg47': {
      'en': 'Search members...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gjkusn50': {
      'en': 'Share with your frineds',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2bmzakhx': {
      'en': 'UserName',
      'ar': '',
      'de': '',
      'es': '',
    },
    'y5irut3o': {
      'en': 'Remove',
      'ar': '',
      'de': '',
      'es': '',
    },
    'n7lqmhg9': {
      'en': 'UserName',
      'ar': '',
      'de': '',
      'es': '',
    },
    'a73lqkrd': {
      'en': 'Remove',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ri513elx': {
      'en': 'UserName',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zdd1x982': {
      'en': 'Remove',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wl10g4ia': {
      'en': 'Send Invitation',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l1upwlck': {
      'en': 'user@domainname.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    'r70vsvfv': {
      'en': 'View',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bx03xiuq': {
      'en': 'user@domainname.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    'k7pcak4s': {
      'en': 'View',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ccsnqtoo': {
      'en': 'Username',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qq3pfjov': {
      'en': 'user@domainname.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4coh0ejl': {
      'en': 'View',
      'ar': '',
      'de': '',
      'es': '',
    },
    'n0zyg5c8': {
      'en': 'Username',
      'ar': '',
      'de': '',
      'es': '',
    },
    'owmnss5k': {
      'en': 'user@domainname.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kxk9390a': {
      'en': 'View',
      'ar': '',
      'de': '',
      'es': '',
    },
    'y1jcgd8k': {
      'en': 'user@domainname.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gdnpp3pl': {
      'en': 'View',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0nxdwn7u': {
      'en': 'Page Title',
      'ar': '',
      'de': '',
      'es': '',
    },
    'z1e36qja': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // SplashScreen
  {
    '7aggxf11': {
      'en': 'Welcome!',
      'ar': '',
      'de': '',
      'es': '',
    },
    'k8ejdjq3': {
      'en':
          'Thanks for joining! Access or create your account below, and get started on your journey!',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nkowil5c': {
      'en': 'Get Started',
      'ar': '',
      'de': '',
      'es': '',
    },
    '60k3xl6z': {
      'en': 'My Account',
      'ar': '',
      'de': '',
      'es': '',
    },
    'v6i60wb1': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // bookAppointment
  {
    'sfzj3riz': {
      'en': 'Book Appointment',
      'ar': 'موعد الكتاب',
      'de': 'Einen Termin verabreden',
      'es': 'Reservar una cita',
    },
    '4skzh9os': {
      'en':
          'Fill out the information below in order to book your appointment with our office.',
      'ar': 'املأ المعلومات أدناه من أجل حجز موعدك مع مكتبنا.',
      'de':
          'Füllen Sie die folgenden Informationen aus, um Ihren Termin in unserem Büro zu buchen.',
      'es':
          'Complete la información a continuación para reservar su cita con nuestra oficina.',
    },
    'b87tcas2': {
      'en': 'Emails will be sent to:',
      'ar': 'سيتم إرسال رسائل البريد الإلكتروني إلى:',
      'de': 'E-Mails werden gesendet an:',
      'es': 'Los correos electrónicos serán enviados a:',
    },
    'iicnw3dq': {
      'en': 'Booking For',
      'ar': 'الحجز لـ',
      'de': 'Buchung für',
      'es': 'reserva para',
    },
    '4atu73u9': {
      'en': '[Persons name]',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5tkkg4yu': {
      'en': 'Type of Appointment',
      'ar': 'نوع التعيين',
      'de': 'Art der Ernennung',
      'es': 'Tipo de cita',
    },
    '7w5m45zt': {
      'en': 'Doctors Visit',
      'ar': 'زيارة الأطباء',
      'de': 'Arztbesuch',
      'es': 'Visita de médicos',
    },
    'bmfmxg71': {
      'en': 'Routine Checkup',
      'ar': 'فحص روتيني حتى',
      'de': 'Routineuntersuchung',
      'es': 'Chequeo de rutina',
    },
    'prt95f0g': {
      'en': 'Scan/Update',
      'ar': 'مسح / تحديث',
      'de': 'Scannen/Aktualisieren',
      'es': 'Escanear/Actualizar',
    },
    'xukiv2ku': {
      'en': 'Choose Date',
      'ar': 'اختر موعدا',
      'de': 'Wählen Sie Datum',
      'es': 'Elija fecha',
    },
    'kpyw7qiu': {
      'en': 'Choose Date',
      'ar': 'اختر موعدا',
      'de': 'Wählen Sie Datum',
      'es': 'Elija fecha',
    },
    'b5umyycx': {
      'en': 'Continue',
      'ar': 'احجز الآن',
      'de': 'buchen Sie jetzt',
      'es': 'Reservar ahora',
    },
  },
  // bookingOld
  {
    '8laf5zmk': {
      'en': 'Book Appointment',
      'ar': 'موعد الكتاب',
      'de': 'Einen Termin verabreden',
      'es': 'Reservar una cita',
    },
    'udwhsu8p': {
      'en':
          'Fill out the information below in order to book your appointment with our office.',
      'ar': 'املأ المعلومات أدناه من أجل حجز موعدك مع مكتبنا.',
      'de':
          'Füllen Sie die folgenden Informationen aus, um Ihren Termin in unserem Büro zu buchen.',
      'es':
          'Complete la información a continuación para reservar su cita con nuestra oficina.',
    },
    'm6f5lawq': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    '8qob10s7': {
      'en': '[email]',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yz52729g': {
      'en': 'Booking For',
      'ar': 'الحجز لـ',
      'de': 'Buchung für',
      'es': 'reserva para',
    },
    '6i36vls1': {
      'en': '[Persons name]',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hdmqdmzq': {
      'en': 'Type of Appointment',
      'ar': 'نوع التعيين',
      'de': 'Art der Ernennung',
      'es': 'Tipo de cita',
    },
    'stpxpct6': {
      'en': 'Doctors Visit',
      'ar': 'زيارة الأطباء',
      'de': 'Arztbesuch',
      'es': 'Visita de médicos',
    },
    'wvgk6obb': {
      'en': 'Routine Checkup',
      'ar': 'فحص روتيني حتى',
      'de': 'Routineuntersuchung',
      'es': 'Chequeo de rutina',
    },
    'xt7ujyt8': {
      'en': 'Scan/Update',
      'ar': 'مسح / تحديث',
      'de': 'Scannen/Aktualisieren',
      'es': 'Escanear/Actualizar',
    },
    'andpn0t0': {
      'en': 'What\'s the problem?',
      'ar': 'ما هي المشكلة؟',
      'de': 'Was ist das Problem?',
      'es': '¿Cuál es el problema?',
    },
    'ycaso9dc': {
      'en': 'Choose Date',
      'ar': 'اختر موعدا',
      'de': 'Wählen Sie Datum',
      'es': 'Elija fecha',
    },
    '2pmd2p3w': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'de': 'Abbrechen',
      'es': 'Cancelar',
    },
    '13j05r8j': {
      'en': 'Book Now',
      'ar': 'احجز الآن',
      'de': 'buchen Sie jetzt',
      'es': 'Reservar ahora',
    },
  },
  // pauseCard
  {
    'dt7m486y': {
      'en': 'Pause Card',
      'ar': 'بطاقة وقفة',
      'de': 'Pausenkarte',
      'es': 'Tarjeta de pausa',
    },
    '6edae99k': {
      'en': 'Are you sure you want to pause your card?',
      'ar': 'هل أنت متأكد أنك تريد إيقاف بطاقتك مؤقتًا؟',
      'de': 'Möchten Sie Ihre Karte wirklich pausieren?',
      'es': '¿Seguro que quieres pausar tu tarjeta?',
    },
    'omtrfcm5': {
      'en': 'Nevermind',
      'ar': 'لا بأس',
      'de': 'egal',
      'es': 'No importa',
    },
    'hw07mkb9': {
      'en': 'Yes, Pause',
      'ar': 'نعم توقف',
      'de': 'Ja, Pause',
      'es': 'Sí, pausa',
    },
  },
  // Congrast
  {
    '9gq8qama': {
      'en': 'Yes, Pause',
      'ar': 'نعم توقف',
      'de': 'Ja, Pause',
      'es': 'Sí, pausa',
    },
  },
  // Contact
  {
    'smbubw25': {
      'en': 'Select Contact',
      'ar': '',
      'de': '',
      'es': '',
    },
    'x35kyzfq': {
      'en': 'Andrew Jackson',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fjow63rv': {
      'en': 'email@dominio.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1z80yqwb': {
      'en': 'V-123456789',
      'ar': '',
      'de': '',
      'es': '',
    },
    '82ucb3ln': {
      'en': '+58 416 000 0000',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hvh7ik55': {
      'en': 'Andrew Jackson',
      'ar': '',
      'de': '',
      'es': '',
    },
    'he9itww3': {
      'en': 'email@dominio.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fgh3ehxw': {
      'en': 'V-123456789',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ow1wqlnk': {
      'en': '+58 416 000 0000',
      'ar': '',
      'de': '',
      'es': '',
    },
    'p55bjbl5': {
      'en': 'Continue',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // bookAppointmentCopy
  {
    '7w8gwg4z': {
      'en': 'Book Appointment',
      'ar': 'موعد الكتاب',
      'de': 'Einen Termin verabreden',
      'es': 'Reservar una cita',
    },
    'rbgbp10e': {
      'en':
          'Fill out the information below in order to book your appointment with our office.',
      'ar': 'املأ المعلومات أدناه من أجل حجز موعدك مع مكتبنا.',
      'de':
          'Füllen Sie die folgenden Informationen aus, um Ihren Termin in unserem Büro zu buchen.',
      'es':
          'Complete la información a continuación para reservar su cita con nuestra oficina.',
    },
    'j6i9s8zg': {
      'en': 'Emails will be sent to:',
      'ar': 'سيتم إرسال رسائل البريد الإلكتروني إلى:',
      'de': 'E-Mails werden gesendet an:',
      'es': 'Los correos electrónicos serán enviados a:',
    },
    'wl5s436v': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'de': 'Abbrechen',
      'es': 'Cancelar',
    },
    'snxseflf': {
      'en': 'Book Now',
      'ar': 'احجز الآن',
      'de': 'buchen Sie jetzt',
      'es': 'Reservar ahora',
    },
  },
  // bookAppointmentCopy2
  {
    '67fuvet4': {
      'en': 'Book Appointment',
      'ar': 'موعد الكتاب',
      'de': 'Einen Termin verabreden',
      'es': 'Reservar una cita',
    },
    '7ctv9yg2': {
      'en':
          'Fill out the information below in order to book your appointment with our office.',
      'ar': 'املأ المعلومات أدناه من أجل حجز موعدك مع مكتبنا.',
      'de':
          'Füllen Sie die folgenden Informationen aus, um Ihren Termin in unserem Büro zu buchen.',
      'es':
          'Complete la información a continuación para reservar su cita con nuestra oficina.',
    },
    '7tykwqqv': {
      'en': 'Emails will be sent to:',
      'ar': 'سيتم إرسال رسائل البريد الإلكتروني إلى:',
      'de': 'E-Mails werden gesendet an:',
      'es': 'Los correos electrónicos serán enviados a:',
    },
    'anthulny': {
      'en': 'Booking For',
      'ar': 'الحجز لـ',
      'de': 'Buchung für',
      'es': 'reserva para',
    },
    'nl4vorbw': {
      'en': '[Persons name]',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fy7f822r': {
      'en': 'Type of Appointment',
      'ar': 'نوع التعيين',
      'de': 'Art der Ernennung',
      'es': 'Tipo de cita',
    },
    '6mra8bp2': {
      'en': 'Doctors Visit',
      'ar': 'زيارة الأطباء',
      'de': 'Arztbesuch',
      'es': 'Visita de médicos',
    },
    'cmht0vdz': {
      'en': 'Routine Checkup',
      'ar': 'فحص روتيني حتى',
      'de': 'Routineuntersuchung',
      'es': 'Chequeo de rutina',
    },
    'hjtj34qu': {
      'en': 'Scan/Update',
      'ar': 'مسح / تحديث',
      'de': 'Scannen/Aktualisieren',
      'es': 'Escanear/Actualizar',
    },
    '6ro62jld': {
      'en': 'Choose Date',
      'ar': 'اختر موعدا',
      'de': 'Wählen Sie Datum',
      'es': 'Elija fecha',
    },
    'jhufhxib': {
      'en': 'Choose Date',
      'ar': 'اختر موعدا',
      'de': 'Wählen Sie Datum',
      'es': 'Elija fecha',
    },
    'szslbd50': {
      'en': 'Continue',
      'ar': 'احجز الآن',
      'de': 'buchen Sie jetzt',
      'es': 'Reservar ahora',
    },
  },
  // bookAppointmentCopy2Copy
  {
    'z22thnf3': {
      'en': 'Book Appointment',
      'ar': 'موعد الكتاب',
      'de': 'Einen Termin verabreden',
      'es': 'Reservar una cita',
    },
    'cgdt6tu9': {
      'en':
          'Fill out the information below in order to book your appointment with our office.',
      'ar': 'املأ المعلومات أدناه من أجل حجز موعدك مع مكتبنا.',
      'de':
          'Füllen Sie die folgenden Informationen aus, um Ihren Termin in unserem Büro zu buchen.',
      'es':
          'Complete la información a continuación para reservar su cita con nuestra oficina.',
    },
    'dtixf9i3': {
      'en': 'Emails will be sent to:',
      'ar': 'سيتم إرسال رسائل البريد الإلكتروني إلى:',
      'de': 'E-Mails werden gesendet an:',
      'es': 'Los correos electrónicos serán enviados a:',
    },
    'zii4g0vq': {
      'en': 'Booking For',
      'ar': 'الحجز لـ',
      'de': 'Buchung für',
      'es': 'reserva para',
    },
    'odcl46wb': {
      'en': '[Persons name]',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pq1uguxg': {
      'en': 'Type of Appointment',
      'ar': 'نوع التعيين',
      'de': 'Art der Ernennung',
      'es': 'Tipo de cita',
    },
    'y8ypa0vm': {
      'en': 'Doctors Visit',
      'ar': 'زيارة الأطباء',
      'de': 'Arztbesuch',
      'es': 'Visita de médicos',
    },
    '8kg5o7gf': {
      'en': 'Routine Checkup',
      'ar': 'فحص روتيني حتى',
      'de': 'Routineuntersuchung',
      'es': 'Chequeo de rutina',
    },
    'sfou5cvz': {
      'en': 'Scan/Update',
      'ar': 'مسح / تحديث',
      'de': 'Scannen/Aktualisieren',
      'es': 'Escanear/Actualizar',
    },
    'r0636uc8': {
      'en': 'Choose Date',
      'ar': 'اختر موعدا',
      'de': 'Wählen Sie Datum',
      'es': 'Elija fecha',
    },
    '7k2is0ia': {
      'en': 'Choose Date',
      'ar': 'اختر موعدا',
      'de': 'Wählen Sie Datum',
      'es': 'Elija fecha',
    },
    'yneaks68': {
      'en': 'Continue',
      'ar': 'احجز الآن',
      'de': 'buchen Sie jetzt',
      'es': 'Reservar ahora',
    },
  },
  // RateTrip
  {
    'e2trx7bh': {
      'en': 'Rate Your Trip',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yk04v3hd': {
      'en': 'Let us know what you thought of the place below!',
      'ar': '',
      'de': '',
      'es': '',
    },
    '58l84vgo': {
      'en': 'How would you rate it?',
      'ar': '',
      'de': '',
      'es': '',
    },
    'e4dwtjyx': {
      'en': 'Please leave a description of the place...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bohnrxhb': {
      'en': 'Submit Review',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Miscellaneous
  {
    'lzyb73wy': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kx9cdks4': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fjtevpzg': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'h7vxdkqk': {
      'en': 'please',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5kzk1xi0': {
      'en': 'please',
      'ar': '',
      'de': '',
      'es': '',
    },
    'csgknj2i': {
      'en': 'please',
      'ar': '',
      'de': '',
      'es': '',
    },
    'efvtwj7k': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ec5hfa1e': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q5ljwvfo': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j4rmwb3h': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6ah1b18f': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2kos1hen': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'aox3s4fb': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l8hv5a7z': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4pjwb70a': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0xlokf4y': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8twlwiwt': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    't4xzlq9q': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '513nj4m0': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'a1jxfgju': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
