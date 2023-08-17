import 'dart:io';

void main() {
  List<Livro> livros = [];
  List<Autor> autores = [];
  List<Usuario> usuarios = [];

  // Funções que encapsulam o processo de envio de dados para a classe

  void listaLivrosAutor(Autor autor) {
    print('\n\nLivros escritos pelo autor ${autor.nome}');
    for (int i = 0; i < autor.livrosEscritos.length; i++) {
      print('$i - ${autor.livrosEscritos[i].titulo}');
    }
  }

  void listaUsuarios() {
    print('\n\nLista de usuarios cadastrados');
    for (int i = 0; i < usuarios.length; i++) {
      print('$i - ${usuarios[i].nome}');
    }
  }

  void listaAutores() {
    print('\n\nLista de autores cadastrados **');
    for (int i = 0; i < autores.length; i++) {
      print('$i - ${autores[i].nome}');
    }
  }

  // funcao para cadastrar um novo livro
  void cadastraLivro() {
    print(
        '\n ** Cadastro de livro - Por favor, informe os dados solicitados **');

    // captura o nome do livro
    stdout.write('Informe o nome do livro: ');
    String titulo = stdin.readLineSync()!;

    // captura o ano de publicação
    stdout.write('Informe o ano de publicação: ');
    int ano = int.parse(stdin.readLineSync()!);

    // seleciona o autor na lista de autores cadastrados
    stdout.write('Dos autores cadastrados, selecione o correspondente: ');
    listaAutores();
    int indice = int.parse(stdin.readLineSync()!);
    Autor autor = autores[indice];

    // cria o objeto e adiciona na lista
    livros.add(Livro(titulo, autor.nome, ano, true));

    // adiciona o livro na lista dos livros deste autor
    autor.livrosEscritos.add(Livro(titulo, autor.nome, ano, true));
  }

  // funcao para cadastrar um novo autor
  void cadastraAutor() {
    print(
        '\n ** Cadastro de autor - Por favor, informe os dados solicitados **');

    // captura o nome do autor
    stdout.write('Informe o nome do autor: ');
    String nome = stdin.readLineSync()!;

    // captura a data de nascimento
    stdout.write('Informe a data de nascimento: ');
    String data = stdin.readLineSync()!;

    // cria o objeto e adiciona na lista
    autores.add(Autor(nome, data));
  }

  // funcao para cadastrar um novo usuário
  void cadastraUsuario() {
    print(
        '\n ** Cadastro de usuário - Por favor, informe os dados solicitados  **');
    // captura o nome
    stdout.write('Informe o nome: ');
    String nome = stdin.readLineSync()!;

    // captura o endereço do usuario
    stdout.write('Informe o endereço do usuário: ');
    String endereco = stdin.readLineSync()!;

    usuarios.add(Usuario(nome, endereco));
  }

  void listaLivrosDisponiveis() {
    print('Livros disponívies para emprestimo: ');
    for (int i = 0; i < livros.length; i++) {
      if (livros[i].disponivel) {
        print('$i - ${livros[i].titulo}');
      }
    }
  }

  void listaLivrosEmprestados() {
    print('Livros emprestados: ');
    for (int i = 0; i < livros.length; i++) {
      if (!livros[i].disponivel) {
        print('$i - ${livros[i].titulo}');
      }
    }
  }

  // Funções que serão usadas para realizar as operações

  void emprestaLivro() {
    print('\nDos livros disponiveis, selecione o correspondente: ');
    listaLivrosDisponiveis();
    int indiceLivro = int.parse(stdin.readLineSync()!);
    Livro livro = livros[indiceLivro];

    print('\Selecione o usuario: ');
    listaUsuarios();
    int indiceUsuario = int.parse(stdin.readLineSync()!);
    Usuario usuario = usuarios[indiceUsuario];

    if (livro.disponivel) {
      livro.disponivel = false;
      usuario.livrosEmprestados.add(livro);
      print('Livro ${livro.titulo} emprestado para ${usuario.nome}');
    } else {
      print('Este livro já está emprestado');
    }
  }

  void devolveLivro() {
    print('\nDos livros emprestados, selecione o correspondente: ');
    listaLivrosEmprestados();
    int indiceLivro = int.parse(stdin.readLineSync()!);
    Livro livro = livros[indiceLivro];

    print('\Selecione o usuario: ');
    listaUsuarios();
    int indiceUsuario = int.parse(stdin.readLineSync()!);
    Usuario usuario = usuarios[indiceUsuario];

    if (!livro.disponivel && usuario.livrosEmprestados.contains(livro)) {
      livro.disponivel = true;
      usuario.livrosEmprestados.remove(livro);
      print('Livro ${livro.titulo} devolvido');
    } else {
      print('Este livro não esta emprestado ao usuário');
    }
  }

  //
}
// falta fazer o menu para selecionar as oeprações

/*
Classes Principais:

Livro: Deve conter informações como título, autor, ano de publicação e status (disponível ou emprestado).
Autor: Deve conter informações como nome, data de nascimento e lista de livros escritos.
Usuário: Deve conter informações como nome, endereço e lista de livros emprestados.
Funcionalidades:

Cadastro: O sistema deve permitir o cadastro de novos livros, autores e usuários.
Empréstimo de Livro: Um usuário pode pegar um livro emprestado, alterando o status do livro para 'emprestado'.
Devolução de Livro: Um usuário pode devolver um livro, alterando o status do livro para 'disponível'.
Listagem: O sistema deve permitir a listagem de todos os livros disponíveis, todos os livros emprestados e todos os livros de um autor específico.
Conceitos a serem aplicados:

Orientação a Objetos: Utilize classes, objetos, herança e encapsulamento.
Listas: Utilize listas para gerenciar múltiplos livros, autores e usuários.
Manipulação de Strings: Para entrada e saída de dados, bem como formatação.
Tratamento de Exceções: Implemente tratamento de erros para situações como tentar emprestar um livro já emprestado.
Instruções:

Comece definindo as classes principais e seus atributos.
Implemente os métodos necessários para cada funcionalidade.
Crie um menu interativo no console que permita ao usuário escolher entre as diferentes funcionalidades.
Teste cada funcionalidade cuidadosamente para garantir que o sistema funcione como esperado.
*/
