import 'autor.dart';

class Livro {
  final String titulo;
  final List<Autor> autores;
  final int anoPublicacao;
  final bool disponivel;

  // #region Construtor
  Livro({
    required this.titulo,
    required this.autores,
    required this.anoPublicacao,
    this.disponivel = false,
  }) : assert(
          titulo.isNotEmpty && anoPublicacao <= DateTime.now().year,
        ) {
    autores.forEach((autor) {
      if (autor.livrosEscritos == null) {
        autor = autor.copyWith(
          livrosEscritos: [],
        );
      }
      autor.livrosEscritos!.add(this);
    });
  }
  // #endregion

  // #region copyWith
  copyWith({
    String? titulo,
    List<Autor>? autores,
    int? anoPublicacao,
    bool? disponivel,
  }) {
    return Livro(
      titulo: titulo ?? this.titulo,
      autores: autores ?? this.autores,
      anoPublicacao: anoPublicacao ?? this.anoPublicacao,
      disponivel: disponivel ?? this.disponivel,
    );
  }
  // #endregion
}
