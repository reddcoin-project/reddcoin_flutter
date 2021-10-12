import 'package:flutter/material.dart';
import 'package:reddcoin/providers/appsettings.dart';
import 'package:reddcoin/tools/app_localizations.dart';
import 'package:reddcoin/tools/price_ticker.dart';
import 'package:reddcoin/widgets/buttons.dart';
import 'package:reddcoin/widgets/expanded_section.dart';

class SettingsPriceTicker extends StatefulWidget {
  final AppSettings _settings;
  final Function _saveSnack;

  SettingsPriceTicker(this._settings, this._saveSnack);

  @override
  _SettingsPriceTickerState createState() => _SettingsPriceTickerState();
}

class _SettingsPriceTickerState extends State<SettingsPriceTicker> {
  late bool _listExpanded;

  @override
  void initState() {
    if (widget._settings.exchangeRates.isNotEmpty &&
        widget._settings.selectedCurrency.isNotEmpty) {
      setState(() {
        _listExpanded = true;
      });
    } else {
      setState(() {
        _listExpanded = false;
      });
    }
    super.initState();
  }

  void enableFeed(BuildContext ctx) async {
    await showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            AppLocalizations.instance.translate('setup_continue_alert_title'),
            textAlign: TextAlign.center,
          ),
          content: Text(
            AppLocalizations.instance
                .translate('app_settings_price_alert_content'),
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
              onPressed: () {
                widget._settings.setSelectedCurrency('USD');
                PriceTicker.checkUpdate(widget._settings);
                Navigator.pop(context);
                setState(() {
                  _listExpanded = true;
                });
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

  Widget renderButton(BuildContext ctx) {
    if (widget._settings.selectedCurrency.isEmpty) {
      return PeerButton(
        text: AppLocalizations.instance
            .translate('app_settings_price_feed_enable_button'),
        action: () => enableFeed(ctx),
      );
    }
    return PeerButton(
      text: AppLocalizations.instance
          .translate('app_settings_price_feed_disable_button'),
      action: () {
        widget._settings.setSelectedCurrency('');
        setState(() {
          _listExpanded = false;
        });
      },
    );
  }

  void saveCurrency(BuildContext ctx, String newCurrency) {
    widget._settings.setSelectedCurrency(newCurrency);
    widget._saveSnack(ctx);
  }

  List<Widget> renderCurrencies(BuildContext ctx) {
    if (widget._settings.exchangeRates.isNotEmpty &&
        widget._settings.selectedCurrency.isNotEmpty) {
      //copy data
      final currencyData = widget._settings.exchangeRates.keys.toList();

      return currencyData.map((currency) {
        return InkWell(
          onTap: () => saveCurrency(ctx, currency),
          child: ListTile(
            title: Text(
              AppLocalizations.instance.translate('currency_$currency'),
            ),
            subtitle: Text(
              '1 RDD = ${PriceTicker.renderPrice(1, currency, "RDD", widget._settings.exchangeRates).toStringAsFixed(6)} $currency',
            ),
            leading: Radio(
                value: currency,
                groupValue: widget._settings.selectedCurrency,
                onChanged: (dynamic _) => saveCurrency(ctx, currency)),
            trailing: Text(
              PriceTicker.currencySymbols[currency] ?? '',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        );
      }).toList();
    }
    return [Container()];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpandedSection(
          expand: _listExpanded,
          child: Column(
            children: renderCurrencies(context),
          ),
        ),
        renderButton(context),
      ],
    );
  }
}
