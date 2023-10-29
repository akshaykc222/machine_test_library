import 'package:machine_test_library/library_managment/data/repositories/library_repository.dart';

import '../../data/models/book.dart';

class GetBooksUseCase {
  final LibraryRepository repository;

  GetBooksUseCase(this.repository);

  List<BookModel> call() {
    return repository.getBooks();
  }
}
