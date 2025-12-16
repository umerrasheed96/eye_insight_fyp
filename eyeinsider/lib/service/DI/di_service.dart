import 'package:eyeinsider/data/authentication/auth_data_repo_impl.dart';
import 'package:eyeinsider/data/user_data/data_source/user_detail_data_source.dart';
import 'package:eyeinsider/data/user_data/user_data_repo_impl.dart';
import 'package:eyeinsider/domain/auth/auth_repo.dart';
import 'package:eyeinsider/domain/user_details/user_details_repo.dart';
import 'package:eyeinsider/providers/auth_provider.dart';
import 'package:eyeinsider/providers/user_detail_provider.dart';
import 'package:eyeinsider/service/navigation/navigation_service.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class DI {
  static GetIt i = GetIt.instance;

  static void initialize() {
    // Repositories

    i.registerLazySingleton<UserDetailsRepo>(
        () => UserDetailsRepoImpl(dataSource: UserDetailFirebaseDataSource()));
    i.registerLazySingleton<AuthRepo>(() => AuthDataRepoImpl());

    // Services
    i.registerLazySingleton<NavigationService>(() => NavigationService());

    // Providers
    i.registerLazySingleton<UserDetailsProvider>(
      () => UserDetailsProvider(userDetailsRepo: i<UserDetailsRepo>()),
    );
    i.registerLazySingleton<AuthProvider2>(
      () => AuthProvider2(repo: i<AuthRepo>()),
    );
  }
}

class AppProvider {
  static List<ChangeNotifierProvider> getProviders() {
    return [
      ChangeNotifierProvider<UserDetailsProvider>(
        create: (context) => DI.i<UserDetailsProvider>(),
      ),
      ChangeNotifierProvider<AuthProvider2>(
        create: (context) => DI.i<AuthProvider2>(),
      ),
    ];
  }
}
