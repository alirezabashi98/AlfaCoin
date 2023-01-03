import 'package:alfa_coin/providers/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _splashprovider = GetIt.I.get<SplashProvider>();

  @override
  void initState() {
    super.initState();
    _splashprovider.loadDate();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _splashprovider,
      child: Consumer<SplashProvider>(
        builder: ((context, provider, child) =>
            getList(provider)
        ),
      ),
    );
  }

  getUi(SplashProvider provider) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              SpinKitSpinningLines(
                color: Colors.white,
                size: 60.0,
              ),
              SizedBox(height: 10),
              Text(
                "Loading...",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getList(SplashProvider provider) {
    return ListView.builder(
      itemCount: provider.cryptoList.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(provider.cryptoList[index].name);
      },
    );
  }
}
