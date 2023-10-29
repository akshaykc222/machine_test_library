import 'package:machine_test_library/library_managment/data/repositories/library_repository.dart';

import '../../data/models/dash_board_model.dart';

class GetDashBoardUseCase {
  final LibraryRepository repository;

  GetDashBoardUseCase(this.repository);

  List<DashboardModel> call() {
    return repository.getDashboard();
  }
}
