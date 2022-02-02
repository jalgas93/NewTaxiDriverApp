import 'package:flutter/material.dart';
import 'package:taxi_driver/modules/app_common/widgets/block_container.dart';
import 'package:taxi_driver/modules/app_common/widgets/page_background.dart';

import 'map_page.dart';


class TaxiPage extends StatelessWidget {
  const TaxiPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBackground(
      child: Scaffold(
          appBar: AppBar(
            title:  Text('Taxi'),
          ),
          body:  BlockContainer(
            child: Center(
              child: Text(''),
            ),
          )),
    );
  }
}
