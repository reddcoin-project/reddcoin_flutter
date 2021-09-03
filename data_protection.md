# Privacy and Data Protection
Thank you for using reddcoin-flutter.

This app treats your data very carefully.
It will connect to an electrum server and exchange transaction and blockchain related messages with it following the [electrumx-protocol](https://electrumx.readthedocs.io/en/latest/protocol-basics.html "electrumx-protocol").
The data shared is essentially the same, as if you would use a reddcoin full node.

By default, no data beyond that will leave your device.  
This app **stores all necessary data locally** on your device. 
There is **no analytics**- **or advertising** software inside.

**Optional Price Ticker**  
The price ticker for PPC and FIAT exchange rates can be enabled or disabled optionally during setup or in "App Settings."

The ticker is hosted as a "Cloudflare Worker" on Cloudflare.  
Cloudflare Privacy Policy: https://www.cloudflare.com/privacypolicy/

Ticker source code: 
https://github.com/bananenwilly/ppc-worker-ticker