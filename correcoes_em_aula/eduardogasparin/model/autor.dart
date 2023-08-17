import 'livro.dart';

class Autor {
  final String nome;
  final DateTime dataNascimento;
  final List<Livro>? livrosEscritos;

  Autor({
    required this.nome,
    required this.dataNascimento,
    this.livrosEscritos,
  }) : assert(
          nome.isNotEmpty &&
              dataNascimento.isBefore(
                DateTime.now(),
              ),
        );

  copyWith({
    String? nome,
    DateTime? dataNascimento,
    List<Livro>? livrosEscritos,
  }) {
    return Autor(
      nome: nome ?? this.nome,
      dataNascimento: dataNascimento ?? this.dataNascimento,
      livrosEscritos: livrosEscritos ?? this.livrosEscritos,
    );
  }
}
