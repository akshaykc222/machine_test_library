import 'package:equatable/equatable.dart';

class BookModel extends Equatable {
  final String title;
  final String author;

  const BookModel({required this.title, required this.author});

  @override
  List<Object?> get props => [title];
}
