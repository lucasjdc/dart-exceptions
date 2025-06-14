import 'controllers/bank_controller.dart';
import 'models/account.dart';
import 'exceptions/bank_controller_exceptions.dart';

void main() {
  //assert(2 < 1, "Levantei o Assert");
  // Criando o banco
  BankController bankController = BankController();

  // Adicionando contas
  //Account accountTest = Account(name: "Lucas", balance: -20, isAuthenticated: true);
  bankController.addAccount(
      id: "Ricarth",
      account:
          Account(name: "Ricarth Lima", balance: 400, isAuthenticated: true));

  bankController.addAccount(
      id: "Kako",
      account:
          Account(name: "Caio Couto", balance: 600, isAuthenticated: true));

  // Fazendo transferência
  try {
    bool result = bankController.makeTransfer(idSender: "Kako", idReceiver: "Ricarth", amount: 400);

    if (result) {
      print("Transação concluída com sucesso!");
    }

  } on SenderIdInvalidException catch (e) {
    print(e);
    print("O ID: '${e.idSender}' do remetente não é um ID válido.");
  } on ReceiverIdInvalidException catch (e) {
    print(e);
    print("O ID: '${e.idReceiver}' do destinatário não é um ID válido.");
  } on SenderNotAuthenticatedException catch (e) {
    print(e);
    print("O usuário remetente de ID '${e.idSender}' não está autenticado.");
  } on SenderBalanceLowerThanAmountException catch (e) {
    print(e);
    print("O usuário de ID '${e.idSender}' tentou enviar ${e.amount} sendo que na sua conta tem apenas ${e.senderBalance}.");
  } on Exception {
    print("Algo deu errado.");
  }
}

