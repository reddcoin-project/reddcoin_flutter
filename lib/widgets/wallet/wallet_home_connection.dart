import 'package:flutter/material.dart';
import 'package:reddcoin/providers/electrumconnection.dart';
import 'package:reddcoin/tools/app_localizations.dart';
import 'package:reddcoin/widgets/loading_indicator.dart';

class WalletHomeConnection extends StatelessWidget {
  final ElectrumConnectionState _connectionState;
  WalletHomeConnection(this._connectionState);
  @override
  Widget build(BuildContext context) {
    Widget widget;
    if (_connectionState == ElectrumConnectionState.connected) {
      widget = Text(
        AppLocalizations.instance.translate('wallet_connected'),
        style: TextStyle(
          color: Theme.of(context).backgroundColor,
          letterSpacing: 1.4,
          fontSize: 16,
        ),
      );
    } else if (_connectionState == ElectrumConnectionState.offline) {
      widget = Text(
        AppLocalizations.instance.translate('wallet_offline'),
        style: TextStyle(
          color: Theme.of(context).backgroundColor,
          fontSize: 16,
          letterSpacing: 1.4,
        ),
      );
    } else {
      widget = Container(width: 88, child: LoadingIndicator());
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/icon/ppc-icon-white-256.png',
          width: 20,
        ),
        SizedBox(
          width: 10,
        ),
        widget
      ],
    );
  }
}
