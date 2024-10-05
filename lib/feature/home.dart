import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../flavors/flavour_config.dart';
import '../translations/locale_keys.g.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(FlavorConfig.instance.flavor.toString()),
          Text(
            '${LocaleKeys.baseURL.tr()} ${FlavorConfig.instance.domainURL}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text("Secret API key : ${FlavorConfig.instance.apiSecreatKey}")
        ],
      ),
    );
  }
}
