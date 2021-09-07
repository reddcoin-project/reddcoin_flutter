import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reddcoin/providers/unencryptedOptions.dart';
import 'package:reddcoin/tools/app_localizations.dart';
import 'package:reddcoin/providers/activewallets.dart';
import 'package:reddcoin/tools/app_routes.dart';
import 'package:reddcoin/widgets/buttons.dart';
import 'package:reddcoin/widgets/double_tab_to_clipboard.dart';
import 'package:reddcoin/widgets/setup_progress.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class SetupSaveScreen extends StatefulWidget {
  @override
  _SetupSaveScreenState createState() => _SetupSaveScreenState();
}

class _SetupSaveScreenState extends State<SetupSaveScreen> {
  bool _sharedYet = false;
  bool _initial = true;
  String _seed = '';
  double _currentSliderValue = 12;
  late ActiveWallets _activeWallets;

  Future<void> shareSeed(seed) async {
    await Share.share(seed);
    Timer(
      Duration(seconds: 1),
      () => setState(() {
        _sharedYet = true;
      }),
    );
  }

  @override
  void didChangeDependencies() async {
    if (_initial) {
      _activeWallets = Provider.of<ActiveWallets>(context);
      _seed = await _activeWallets.seedPhrase;

      setState(() {
        _initial = false;
      });
    }

    super.didChangeDependencies();
  }

  void recreatePhrase(double sliderValue) async {
    var _entropy = 128;
    var _intValue = sliderValue.toInt();

    switch (_intValue) {
      case 15:
        _entropy = 160;
        break;
      case 18:
        _entropy = 192;
        break;
      case 21:
        _entropy = 224;
        break;
      case 24:
        _entropy = 256;
        break;
      default:
        _entropy = 128;
    }

    await _activeWallets.createPhrase(null, _entropy);
    _seed = await _activeWallets.seedPhrase;

    setState(() {
      _sharedYet = false;
    });
  }

  Future<void> handleContinue() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            AppLocalizations.instance.translate('setup_continue_alert_title'),
            textAlign: TextAlign.center,
          ),
          content: Text(
            AppLocalizations.instance.translate('setup_continue_alert_content'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                AppLocalizations.instance
                    .translate('server_settings_alert_cancel'),
              ),
            ),
            TextButton(
              onPressed: () async {
                var prefs = await Provider.of<UnencryptedOptions>(context,
                        listen: false)
                    .prefs;
                await prefs.setBool('importedSeed', false);
                await Navigator.popAndPushNamed(context, Routes.SetUpPin);
              },
              child: Text(
                AppLocalizations.instance.translate('continue'),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SetupProgressIndicator(2),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                height: MediaQuery.of(context).size.height,
                color: Theme.of(context).primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/icon/rdd-icon-white-256.png',
                      width: 50,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text(
                        AppLocalizations.instance
                            .translate('label_wallet_seed'),
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                    DoubleTabToClipboard(
                      clipBoardData: _seed,
                      child: SelectableText(
                        _seed,
                        minLines: 4,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          wordSpacing: 10,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Slider(
                          activeColor: Colors.white,
                          inactiveColor: Theme.of(context).accentColor,
                          value: _currentSliderValue,
                          min: 12,
                          max: 24,
                          divisions: 4,
                          label: _currentSliderValue.round().toString(),
                          onChanged: (value) {
                            setState(() {
                              _currentSliderValue = value;
                            });
                            if (value % 3 == 0) {
                              recreatePhrase(value);
                            }
                          },
                        ),
                        Text(
                          AppLocalizations.instance
                              .translate('setup_seed_slider_label'),
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                    Text(
                      AppLocalizations.instance.translate(
                          'label_keep_seed_safe', {
                        'numberOfWords': _currentSliderValue.round().toString()
                      }),
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: _sharedYet
                          ? PeerButtonBorder(
                              action: () async => await handleContinue(),
                              text: AppLocalizations.instance
                                  .translate('continue'),
                            )
                          : PeerButtonBorder(
                              action: () async => await shareSeed(_seed),
                              text: AppLocalizations.instance
                                  .translate('export_now'),
                            ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
