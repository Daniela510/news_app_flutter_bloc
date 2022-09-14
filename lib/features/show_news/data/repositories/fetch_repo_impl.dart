import 'package:dartz/dartz.dart';

import 'package:clean_architecture/features/show_news/domain/entities/news_info.dart';
import 'package:clean_architecture/core/failures_successes/failures.dart';
import '../../domain/repositories/fetch_repo_contract.dart';
import 'package:clean_architecture/core/failures_successes/exceptions.dart';
import 'package:clean_architecture/core/services_locator.dart';
import 'package:clean_architecture/features/show_news/data/data_soruces/fetch_from_remote_ds.dart';

class FetchRepoImpl implements FetchRepo {
  final FetchFromRemoteDS fetchFromRemoteDS =
      serviceLocator<FetchFromRemoteDS>();
  // the fetchFromRemoteDS is now located with the get it package so this is obsolete
  // const FetchRepoImpl({required this.fetchFromRemoteDS});
  @override
  Future<Either<Failure, List<NewsInfo>>> fetchNews(String? searchText) async {
    try {
      return Right(await fetchFromRemoteDS.fetchNews(searchText));
    } on FetchException catch (e) {
      return Left(FetchFailure(message: e.message));
    }
  }
}
