import 'bank_account.dart';

class Client {
  String name;
  String address;
  String phoneNumber;

  late BankAccount bankAccount;
  Client(
      {required this.name, required this.address, required this.phoneNumber});

  view() {
    print("Name: $name");
    print("Phone Number: $phoneNumber");
    print("Address: $address");
    bankAccount.view();
  }
}
