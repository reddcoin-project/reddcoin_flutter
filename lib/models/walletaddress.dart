import 'package:hive/hive.dart';
part 'walletaddress.g.dart';

@HiveType(typeId: 2)
class WalletAddress extends HiveObject {
  @HiveField(0)
  final String address;
  @HiveField(1)
  String? addressBookName; //nullable for backward compatability
  @HiveField(2)
  String? status;
  @HiveField(3)
  bool used;
  @HiveField(4)
  bool? isOurs = true; //nullable for backward compatability
  @HiveField(5)
  String? wif = ''; //nullable for backward compatability
  @HiveField(6)
  bool? isChangeAddr = false; //nullable for backward compatability

  WalletAddress({
    required this.address,
    required this.addressBookName,
    required this.used,
    required this.status,
    required this.isOurs,
    required this.wif,
    required this.isChangeAddr,
  });

  set newStatus(String? newStatus) {
    status = newStatus;
  }

  set newAddressBookName(String newAddressBookName) {
    addressBookName = newAddressBookName;
  }

  set newUsed(bool newUsed) {
    used = newUsed;
  }

  set newWif(String newWif) {
    wif = newWif;
  }

  bool get IsChangeAddr {
    return isChangeAddr ?? false;
  }

  set newIsChangeAddr(bool newChange) {
    isChangeAddr = newChange;
  }
}
