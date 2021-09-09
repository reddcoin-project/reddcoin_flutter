import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:package_info/package_info.dart';
import 'package:reddcoin/tools/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailto/mailto.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  bool _initial = true;
  PackageInfo? _packageInfo;

  @override
  void didChangeDependencies() async {
    if (_initial) {
      _packageInfo = await PackageInfo.fromPlatform();
      setState(() {
        _initial = false;
      });
    }
    super.didChangeDependencies();
  }

  void _launchURL(_url) async {
    await canLaunch(_url)
        ? await launch(
            _url,
          )
        : throw 'Could not launch $_url';
  }

  Future<void> launchMailto() async {
    final mailtoLink = Mailto(
      to: ['hello@app.reddcoin.net'],
      subject: 'Reddcoin Wallet',
    );
    await launch('$mailtoLink');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.instance.translate('about'),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(children: [
          Expanded(
            child: SingleChildScrollView(
              child: _packageInfo == null
                  ? Container()
                  : Container(
                      padding: const EdgeInsets.all(20.0),
                      width: double.infinity,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('${_packageInfo!.appName}'),
                            Text(
                              'Version ${_packageInfo!.version} Build ${_packageInfo!.buildNumber}',
                            ),
                            Text(AppLocalizations.instance.translate(
                              'about_developers',
                              {'year': DateFormat.y().format(DateTime.now())},
                            )),
                            TextButton(
                                onPressed: () => _launchURL(
                                    'https://github.com/reddcoin-project/reddcoin_flutter/blob/main/LICENSE'),
                                child: Text(
                                  AppLocalizations.instance
                                      .translate('about_license'),
                                )),
                            Divider(),
                            SizedBox(height: 10),
                            Text(
                              AppLocalizations.instance.translate('about_free'),
                            ),
                            TextButton(
                                onPressed: () => _launchURL(
                                    'https://github.com/reddcoin-project/reddcoin_flutter'),
                                child: Text(
                                  AppLocalizations.instance
                                      .translate('about_view_source'),
                                )),
                            Divider(),
                            SizedBox(height: 10),
                            Text(
                              AppLocalizations.instance
                                  .translate('about_data_protection'),
                            ),
                            TextButton(
                              onPressed: () => _launchURL(
                                  'https://github.com/reddcoin-project/reddcoin_flutter/blob/main/data_protection.md'),
                              child: Text(
                                AppLocalizations.instance
                                    .translate('about_data_declaration'),
                              ),
                            ),
                            Divider(),
                            SizedBox(height: 10),
                            Text(
                              AppLocalizations.instance
                                  .translate('about_foundation'),
                            ),
                            TextButton(
                              onPressed: () => _launchURL(
                                  'https://www.reddcoin.com/foundation'),
                              child: Text(
                                AppLocalizations.instance
                                    .translate('about_foundation_button'),
                              ),
                            ),
                            Divider(),
                            SizedBox(height: 10),
                            Text(
                              AppLocalizations.instance
                                  .translate('about_translate'),
                            ),
                            TextButton(
                              onPressed: () async =>
                                  _launchURL('https://weblate.rdd.lol'),
                              child: Text(
                                AppLocalizations.instance
                                    .translate('about_go_weblate'),
                              ),
                            ),
                            Divider(),
                            SizedBox(height: 10),
                            Text(
                              AppLocalizations.instance
                                  .translate('about_help_or_feedback'),
                            ),
                            TextButton(
                              onPressed: () async => launchMailto(),
                              child: Text(
                                AppLocalizations.instance
                                    .translate('about_send_mail'),
                              ),
                            ),
                          ]),
                    ),
            ),
          ),
        ]));
  }
}

//TODO add URI link to donate to Foundation when P2SH / multisig is ready
