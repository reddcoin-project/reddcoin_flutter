[![Reddcoin Donate](https://badgen.net/badge/reddcoin/Donate/green?icon=https://raw.githubusercontent.com/reddcoin/media/84710cca6c3c8d2d79676e5260cc8d1cd729a427/Reddcoin%202020%20Logo%20Files/01.%20Icon%20Only/Inside%20Circle/Transparent/Green%20Icon/reddcoin-icon-green-transparent.svg)](https://chainz.cryptoid.info/rdd/address.dws?p92W3t7YkKfQEPDb7cG9jQ6iMh7cpKLvwK)
<a href="https://weblate.rdd.lol/engage/reddcoin-flutter/">
<img src="https://weblate.rdd.lol/widgets/reddcoin-flutter/-/translations/svg-badge.svg" alt="Übersetzungsstatus" /></a>
[![Codemagic build status](https://api.codemagic.io/apps/61012a37d885ed7a8c3e8b25/61012a37d885ed7a8c3e8b24/status_badge.svg)](https://codemagic.io/apps/61012a37d885ed7a8c3e8b25/61012a37d885ed7a8c3e8b24/latest_build)
[![Analyze & Test](https://github.com/reddcoin/reddcoin_flutter/actions/workflows/analyze-test.yml/badge.svg)](https://github.com/reddcoin/reddcoin_flutter/actions/workflows/analyze-test.yml)
# reddcoin_flutter
Wallet for Reddcoin and Reddcoin Testnet using Electrumx as backend.  
**App in constant development**  
Basic testing successfull on iOS 14.4 and Android 10.  
**Use at own risk.**  


<p align="center">
     <a href="https://f-droid.org/packages/com.coinerella.reddcoin/">
<img src="https://fdroid.gitlab.io/artwork/badge/get-it-on.png"
     alt="Get it on F-Droid"
     height="80"></a>
<a href="https://play.google.com/store/apps/details?id=com.coinerella.reddcoin"><img src="https://play.google.com/intl/en_us/badges/images/generic/en-play-badge.png"
     alt="Get it on Google Play" height="80"></a>
</p>
<p align="center">
     <a href="https://apps.apple.com/us/app/reddcoin-wallet/id1571755170?itsct=apps_box_badge&amp;itscg=30200" style="display: inline-block; overflow: hidden; border-radius: 13px; width: 250px; height: 83px;"><img src="https://tools.applemediaservices.com/api/badges/download-on-the-app-store/black/en-us?size=250x83&amp;releaseDate=1626912000&h=8e86ea0b88a4e8559b76592c43b3fe60" alt="Download on the App Store" style="border-radius: 13px; width: 250px; height: 83px;"></a>
</p> 

You can also sign up for our open beta testing here:

* [Android](https://play.google.com/apps/testing/com.coinerella.reddcoin)
* [iOS](https://testflight.apple.com/join/iilc4SvQ)

![Screenshot_small](![Screenshot_1630990930](https://user-images.githubusercontent.com/10765021/132613437-1fb9fb2e-1ba5-4eed-8c70-20169143e1aa.png))

## Help Translate
<a href="https://weblate.rdd.lol/engage/reddcoin-flutter/">
<img src="https://weblate.rdd.lol/widgets/reddcoin-flutter/-/translations/multi-auto.svg" alt="Translation status" />
</a>

## Known Limitations
- can't send to Multisig addresses
- adds 1 Satoshi extra fee due to sporadic internal rounding errors 
- will not mint

## Development
This repository currently relies on a fork of bitcoin_flutter, which can be found here: 
[reddcoin/bitcoin_flutter](https://github.com/reddcoin/bitcoin_flutter "github.com/reddcoin/bitcoin_flutter")

The original library is not compatible, due to transaction timestamp incompability. 

**Update icons**  
`flutter pub run flutter_launcher_icons:main`

**Update Hive adapters**  
`flutter packages pub run build_runner build`

**Update splash screen**  
`flutter pub run flutter_native_splash:create`

## Basic e2e testing
`flutter drive --target=test_driver/app.dart --driver=test_driver/key_new.dart`  
`flutter drive --target=test_driver/app.dart --driver=test_driver/key_imported.dart`
