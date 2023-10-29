import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:machine_test_library/library_managment/data/data_sources/library_data_source.dart';
import 'package:machine_test_library/library_managment/data/repositories/library_repository.dart';
import 'package:machine_test_library/library_managment/domain/repositories/library_repository_impl.dart';
import 'package:machine_test_library/library_managment/domain/use_cases/get_book_use_case.dart';
import 'package:machine_test_library/library_managment/domain/use_cases/get_dash_board_use_case.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  //data source
  getIt.registerSingleton<LibraryDataSource>(LibraryDataSourceImpl());

  //repository
  getIt.registerSingleton<LibraryRepository>(LibraryRepositoryImpl(getIt()));

  //usecase
  getIt.registerSingleton<GetDashBoardUseCase>(GetDashBoardUseCase(getIt()));
  getIt.registerSingleton<GetBooksUseCase>(GetBooksUseCase(getIt()));
  await GetStorage.init();
}
