import 'package:flutter/material.dart';
import 'package:reddcoin/tools/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetupLanguageScreen extends StatefulWidget {
  const SetupLanguageScreen({Key? key}) : super(key: key);

  @override
  _SetupLanguageScreenState createState() => _SetupLanguageScreenState();
}

class _SetupLanguageScreenState extends State<SetupLanguageScreen> {
  String _lang = '';
  bool _initial = true;
  late SharedPreferences prefs;

  @override
  void didChangeDependencies() async {
    if (_initial) {
      prefs = await SharedPreferences.getInstance();
      _lang = prefs.getString('language_code') ??
          AppLocalizations.instance.locale.toString();
      setState(() {
        _initial = false;
      });
    }
    super.didChangeDependencies();
  }

  void saveLang(String lang) async {
    await AppLocalizations.delegate.load(Locale(lang));
    await prefs.setString('language_code', lang);
    setState(() {
      _lang = lang;
    });

    //show notification
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        AppLocalizations.instance.translate('app_settings_saved_snack'),
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        AppLocalizations.instance.translate('app_settings_language'),
      )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: AppLocalizations.availableLocales.keys.map((lang) {
              return InkWell(
                onTap: () => saveLang(lang),
                child: ListTile(
                  title: Text(AppLocalizations.availableLocales[lang]!),
                  leading: Radio(
                    value: _lang,
                    groupValue: lang,
                    onChanged: (dynamic _) => saveLang(lang),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
