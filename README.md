[![Reddcoin Donate](https://badgen.net/badge/reddcoin/Donate/green?icon=https://raw.githubusercontent.com/reddcoin-project/reddcoin_flutter/Reddcoin/assets/media/R-Graphic-CLR.svg)](https://live.reddcoin.com/address/RaWe7UEQ1p2PYmdwbCxAThrq4GucNh3Q6s)
<a href="https://weblate.rdd.lol/engage/reddcoin-flutter/">
<img src="https://weblate.rdd.lol/widgets/reddcoin-flutter/-/translations/svg-badge.svg" alt="Übersetzungsstatus" /></a>
[![Codemagic build status](https://api.codemagic.io/apps/613966bcd1095a40b9432606/613966bcd1095a40b9432605/status_badge.svg)](https://codemagic.io/apps/613966bcd1095a40b9432606/613966bcd1095a40b9432605/latest_build)
[![Analyze & Test](https://github.com/reddcoin-project/reddcoin_flutter/actions/workflows/analyze-test.yml/badge.svg)](https://github.com/reddcoin-project/reddcoin_flutter/actions/workflows/analyze-test.yml)
# reddcoin_flutter
Wallet for Reddcoin and Reddcoin Testnet using Electrumx as backend.  
**App in constant development**  
Basic testing successfull on iOS 14.4 and Android 10.  
**Use at own risk.**  


<p align="center">
     <a href="https://f-droid.org/packages/com.reddcoin.reddcoin_flutter/">
<img src="https://fdroid.gitlab.io/artwork/badge/get-it-on.png"
     alt="Get it on F-Droid"
     height="80"></a>
<a href="https://play.google.com/store/apps/details?id=com.reddcoin.reddcoin_flutter"><img src="https://play.google.com/intl/en_us/badges/images/generic/en-play-badge.png"
     alt="Get it on Google Play" height="80"></a>
</p>
<p align="center">
     <a href="https://apps.apple.com/us/app/reddcoin-wallet/id1571755170?itsct=apps_box_badge&amp;itscg=30200" style="display: inline-block; overflow: hidden; border-radius: 13px; width: 250px; height: 83px;"><img src="https://tools.applemediaservices.com/api/badges/download-on-the-app-store/black/en-us?size=250x83&amp;releaseDate=1626912000&h=8e86ea0b88a4e8559b76592c43b3fe60" alt="Download on the App Store" style="border-radius: 13px; width: 250px; height: 83px;"></a>
</p> 

You can also sign up for our open beta testing here:

* [Android](https://play.google.com/apps/testing/com.reddcoin.reddcoin_flutter)
* [iOS](https://testflight.apple.com/join/iilc4SvQ)

![Screenshot_scaled](https://user-images.githubusercontent.com/17320471/132971293-6875b792-6638-424e-86be-eb6a3468ab1f.png)

## Help Translate
<a href="https://weblate.reddcoin.com/engage/reddcoin-flutter/">
<img src="https://weblate.reddcoin.com/widgets/reddcoin-flutter/-/multi-auto.svg" alt="Translation status" />
</a>

## Known Limitations
- can't send to Multisig addresses
- adds 1 Satoshi extra fee due to sporadic internal rounding errors 
- will not mint

## Development
This repository currently relies on a fork of bitcoin_flutter, which can be found here: 
[reddcoin/bitcoin_flutter](https://github.com/reddcoin-project/bitcoin_flutter "github.com/reddcoin/bitcoin_flutter")

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
