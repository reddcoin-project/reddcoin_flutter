import 'package:bitcoin_flutter/bitcoin_flutter.dart';

class Coin {
  final String name;
  final String displayName;
  final String letterCode;
  final String iconPath;
  final String iconPathTransparent;
  final int bip44;
  final int coinType;
  final String uriCode;
  final NetworkType networkType;
  final int fractions;
  final int minimumTxValue;
  final double feePerKb;
  final String explorerTxDetailUrl;
  final String genesisHash;

  Coin({
    required this.name,
    required this.displayName,
    required this.letterCode,
    required this.iconPath,
    required this.iconPathTransparent,
    required this.bip44,
    required this.coinType,
    required this.uriCode,
    required this.networkType,
    required this.fractions,
    required this.minimumTxValue,
    required this.feePerKb,
    required this.explorerTxDetailUrl,
    required this.genesisHash,
  });
}
