import 'package:astama/core/constants/app_assets_image.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Features/home/data/model/api/reciters_model.dart';
import 'Features/home/view/screens/home.dart';
import 'core/bloc/theme/theme_bloc.dart';
import 'core/utils/locator.dart';
import 'core/utils/simple_bloc_observer.dart';

// onboarding screen => ✅
// home screen => ✅
// author screen => ✅
// player screen => ✅
// handle errors => ✅
// handle toast => ✅
// player ui => ✅
// download screen => ✅

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  setupServiceLocator();
  Hive.registerAdapter(ReciterModelAdapter());
  Hive.registerAdapter(MoshafModelAdapter());
  await Hive.openBox<ReciterModel>(AppAssetsImage.kReciterBox);
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: providers,
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            if (state is LoadedThemeState) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                locale: const Locale('ar'),
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                supportedLocales: const [Locale('ar')],
                title: 'أستمع',
                theme: state.themeData,
                builder: BotToastInit(),
                navigatorObservers: [BotToastNavigatorObserver()],
                home: const HomeScreen(),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
