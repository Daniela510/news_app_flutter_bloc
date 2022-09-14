import 'package:clean_architecture/core/services/api_services.dart';
import 'package:clean_architecture/features/show_news/data/data_soruces/fetch_from_remote_ds.dart';
import 'package:clean_architecture/features/show_news/data/repositories/fetch_repo_impl.dart';
import 'package:clean_architecture/features/show_news/domain/repositories/fetch_repo_contract.dart';
import 'package:clean_architecture/features/show_news/domain/usecases/fetch_news.dart';
import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.instance;

void setUpServices() {
  serviceLocator.registerSingleton<ApiService>(ApiServiceImpl());
  serviceLocator.registerSingleton<FetchFromRemoteDS>(FetchFromRemoteDSImpl());
  serviceLocator.registerSingleton<FetchRepo>(FetchRepoImpl());
  serviceLocator.registerSingleton<FetchNewsUsecase>(FetchNewsUsecase());
}
