import 'bank_account.dart';
import 'client.dart';

class SavingBankAccount extends BankAccount{
  late double minimumBalance;

  SavingBankAccount({required double balance}):super.init(balance: balance){
    minimumBalance = 1000;
  }

  @override
  void withdraw(double amount) {
    if(balance - amount > minimumBalance){
      balance -= amount;
      print("Done!");
    }else{
      print("can't withdraw");
    }
    view();
  }

  @override
  void deposit(double amount) {
    if(amount > 100){
      balance+=amount;
      print("Done!");
    }else{
      print("the minimum deposit is 100");
    }
  }
}