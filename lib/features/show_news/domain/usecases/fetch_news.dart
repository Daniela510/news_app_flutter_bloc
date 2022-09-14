import 'package:dartz/dartz.dart';

import 'package:clean_architecture/core/services_locator.dart';
import '../repositories/fetch_repo_contract.dart';
import '../../../../core/failures_successes/failures.dart';
import '../entities/news_info.dart';

class FetchNewsUsecase {
  final FetchRepo fetchRepo = serviceLocator<FetchRepo>();

  //FetchNewsUsecase({required this.fetchRepo}); -- obsolete bc of get_it package

  Future<Either<Failure, List<NewsInfo>>> fetchNews(String? searchText) {
    return fetchRepo.fetchNews(searchText);
  }
}
