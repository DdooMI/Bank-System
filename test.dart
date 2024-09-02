import 'bank_account.dart';
import 'banking_app.dart';
import 'client.dart';

void main(){
  Client client = Client(name: "Adham", address: "aswan", phoneNumber: "01111444777");
  BankAccount bankAccount = BankAccount.init(balance: 1000);

  client.bankAccount = bankAccount;
  bankAccount.client = client;

 BankingApp bankingApp = BankingApp();
 bankingApp.viewMenu();
}