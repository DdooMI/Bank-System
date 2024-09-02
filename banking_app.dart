import 'dart:io';

import 'client.dart';
import 'bank_account.dart';
import 'saving_bank_account.dart';

class BankingApp {
  late List<Client> clients;
  late List<BankAccount> accounts;

  BankingApp() {
    clients = [];
    accounts = [];
    createTestData();
  }

  createTestData() {
    for (int i = 0; i < 10; i++) {
      Client client = Client(
          name: 'name ${i + 1}',
          address: 'address ${i + 1}',
          phoneNumber: 'phoneNumber ${i + 1}');
      BankAccount bankAccount =
          BankAccount.init(balance: (1000 * (i + 1)).toDouble());
      client.bankAccount = bankAccount;
      bankAccount.client = client;
      accounts.add(bankAccount);
      clients.add(client);
    }
  }

  viewMenu() {
    int number = 0;
    while (number != 7) {
      print('''
    1- Create a bank account
    2- list all the available bank accounts.
    3- display the account details.
    4- withdraw money.    
    5- deposit money.
    6- delete account.
    7- exit.    
    SELECT NUMBER TO CONTINUE
    ''');
      number = int.parse(stdin.readLineSync() ?? '7'); // (!)

      if (number == 1) {
        createNewAccount();
      } else if (number == 2) {
        printAllAccounts();
      } else if (number == 3) {
        printAccountDetails();
      } else if (number == 4) {
        withdraw();
      } else if (number == 5) {
        deposit();
      } else if (number == 6) {
        deleteAccount();
      } else if (number == 7) {
        return;
      } else {
        print("Invalid number");
      }
    }
  }

  int searchAccountIdGetIndex(int accountId) {
    for (int i = 0; i < accounts.length; i++) {
      if (accounts[i].accountId == accountId) {
        return i;
      }
    }
    return -1;
  }

  BankAccount? searchAccountIdGetAccount(int accountId) {
    for (int i = 0; i < accounts.length; i++) {
      if (accounts[i].accountId == accountId) {
        return accounts[i];
      }
    }
    return null;
  }

  void printAllAccounts() {
    for (int i = 0; i < clients.length; i++) {
      clients[i].view();
      print("########");
    }
  }

  void printAccountDetails() {
    print('enter ID');
    int id = int.parse(stdin.readLineSync()!);
    BankAccount? bankAccount = searchAccountIdGetAccount(id);
    if (bankAccount != null) {
      bankAccount.view();
    } else {
      print("Not Found");
    }
  }

  void withdraw() {
    print('enter ID');
    int id = int.parse(stdin.readLineSync()!);
    print('enter amount');
    double amount = double.parse(stdin.readLineSync()!);

    BankAccount? bankAccount = searchAccountIdGetAccount(id);
    if (bankAccount != null) {
      bankAccount.withdraw(amount);
    } else {
      print('Account not available');
    }
  }

  void deposit() {
    print('enter ID');
    int id = int.parse(stdin.readLineSync()!);
    print('enter amount');
    double amount = double.parse(stdin.readLineSync()!);

    BankAccount? bankAccount = searchAccountIdGetAccount(id);
    if (bankAccount != null) {
      bankAccount.deposit(amount);
    } else {
      print('Account not available');
    }
  }

  void deleteAccount() {
    print('enter ID');
    int id = int.parse(stdin.readLineSync()!);
    int index = searchAccountIdGetIndex(id);
    if (index != -1) {
      accounts.removeAt(index);
      clients.removeAt(index);
    } else {
      print("Not Found");
    }
  }

  void createNewAccount() {
    print("enter name");
    String name = stdin.readLineSync()!;
    print("enter address");
    String address = stdin.readLineSync()!;
    print("enter phonenumber");
    String phoneNumber = stdin.readLineSync()!;
    print("enter the new balance");
    double balance = double.parse(stdin.readLineSync()!);
    print("do yo want a saving account?(y/n)");
    bool savingAccount = (stdin.readLineSync()) == 'y' ? true : false;

    Client client =
        Client(name: name, address: address, phoneNumber: phoneNumber);
    BankAccount bankAccount = savingAccount ==true
        ? SavingBankAccount(balance: balance)
        : BankAccount.init(balance: balance);
    client.bankAccount = bankAccount;
    bankAccount.client = client;
    accounts.add(bankAccount);
    clients.add(client);
    print("Done!");
    client.view();
  }
}
