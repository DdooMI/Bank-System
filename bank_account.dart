import 'client.dart';

class BankAccount {
  late int accountId;
  late double balance;
  static int id = 0;
  late Client client;

  BankAccount.init({required this.balance}) {
    calcId();
  }
  BankAccount() {
    balance = 0;
    calcId();
  }

  void calcId() {
    accountId = id;
    id++;
  }

  void withdraw(double amount){
    if(balance >= amount){
      balance -= amount;
      print("Done!");
    }else{
      print("Not enough balance");
    }
    view();
  }

  void deposit(double amount){
    balance += amount;
    view();
  }

  void view(){
    print("the balance is $balance");
  }
}
