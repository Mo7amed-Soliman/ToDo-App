import 'package:get_it/get_it.dart';
import 'package:todo_app/core/database/cache/cache_helper.dart';
import 'package:todo_app/core/database/sqflite_helper/sqflite_helper.dart';

final getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<SqfliteHelper>(SqfliteHelper());
}
