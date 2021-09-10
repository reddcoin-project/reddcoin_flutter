import 'package:bitcoin_flutter/bitcoin_flutter.dart';
import 'package:reddcoin/models/coin.dart';

class AvailableCoins {
  final Map<String, Coin> _availableCoinList = {
    'reddcoin': Coin(
      name: 'reddcoin',
      displayName: 'Reddcoin',
      uriCode: 'reddcoin',
      letterCode: 'RDD',
      iconPath: 'assets/icon/rdd-icon-48.png',
      iconPathTransparent: 'assets/icon/rdd-icon-white-48.png',
      bip44: 44,
      coinType: 4,
      networkType: NetworkType(
        messagePrefix: '\x18Reddcoin Signed Message:\n',
        bech32: 'rc',
        bip32: Bip32Type(public: 0x0488b21e, private: 0x0488ade4),
        pubKeyHash: 0x3d,
        scriptHash: 0x05,
        wif: 0xbd,
      ),
      fractions: 8,
      minimumTxValue: 10000,
      feePerKb: 0.01,
      explorerTxDetailUrl: 'https://live.reddcoin.com/tx/',
      genesisHash:
          'b868e0d95a3c3c0e0dadc67ee587aaf9dc8acbf99e3b4b3110fad4eb74c1decc',
    ),
    'reddcoinTestnet': Coin(
      name: 'reddcoinTestnet',
      displayName: 'Reddcoin Testnet',
      uriCode: 'reddcoin',
      letterCode: 'tRDD',
      iconPath: 'assets/icon/rdd-icon-48.png',
      iconPathTransparent: 'assets/icon/rdd-icon-white-48.png',
      bip44: 44,
      coinType: 1,
      networkType: NetworkType(
        messagePrefix: '\x18Reddcoin Signed Message:\n',
        bech32: 'trc',
        bip32: Bip32Type(public: 0x043587cf, private: 0x04358394),
        pubKeyHash: 0x6f,
        scriptHash: 0xc4,
        wif: 0xef,
      ),
      fractions: 8,
      minimumTxValue: 10000,
      feePerKb: 0.01,
      explorerTxDetailUrl: 'https://live.reddcoin.com/tx/',
      genesisHash:
          'a12ac9bd4cd26262c53a6277aafc61fe9dfe1e2b05eaa1ca148a5be8b394e35a',
    ),
  };

  Map<String, Coin> get availableCoins {
    return _availableCoinList;
  }

  Coin getSpecificCoin(identifier) {
    return _availableCoinList[identifier]!;
  }
}
