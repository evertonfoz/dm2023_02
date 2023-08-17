import 'dart:io';

menuPrincipal() {
  bool opcao = true;
  while (opcao) {
    print('Selecione uma das atividades: ');
    print('1- Cadastrar autor');
    print('2- Cadastrar livro');
    print('3- Cadastrar usuario');
    print('4- Emprestar livro');
    print('5- Devolver livro');
    print('6- Lista livros disponiveis');
    print('7- Lista livros emprestados');
    print('8- Lista livros por autor');
    print('9- Sair');

    // le a escolha

    String escolha = stdin.readLineSync()!;

    switch (escolha) {
      case '1':
        cadastraAutor();
        break;
      case '2':
        cadastraLivro();
        break;
      case '3':
        cadastraUsuario();
        break;
      case '4':
        emprestaLivro();
        break;
      case '5':
        devolveLivro();
        break;
      case '6':
        listaLivrosDisponiveis();
        break;
      case '7':
        listaLivrosEmprestados();
        break;
      case '8':
        listaLivrosAutor();
        break;
      case '9':
        opcao = false;
        break;
      default:
        print('Opção não existente, por favor, tente de novo..');
    }
  }
}
