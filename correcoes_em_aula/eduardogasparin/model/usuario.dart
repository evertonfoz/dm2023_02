import 'livro.dart';

class Usuario {
  final String nome;
  final String endereco;
  late List<Livro>? _livrosEmprestados;

  Usuario({
    required this.nome,
    required this.endereco,
  }) : assert(nome.isNotEmpty && endereco.isNotEmpty);

  List<Livro> get livrosEmprestados => _livrosEmprestados ?? [];

  void adicionaLivro({required Livro livro}) {
    if (_livrosEmprestados == null) {
      _livrosEmprestados = [];
    }
    _livrosEmprestados!.add(livro);
  }

  void removeLivro({required Livro livro}) {
    if (_livrosEmprestados == null) {
      throw Exception('Não há livros emprestados');
    }
    _livrosEmprestados!.remove(livro);
  }

  copyWith({String? nome, String? endereco, List<Livro>? livrosEmprestados}) {
    return Usuario(
      nome: nome ?? this.nome,
      endereco: endereco ?? this.endereco,
    );
  }
}
