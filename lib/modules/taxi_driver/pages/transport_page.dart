import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxi_driver/modules/taxi_driver/widgets/services_card.dart';

class TransportPage extends StatefulWidget {
  const TransportPage({Key key}) : super(key: key);

  @override
  _TransportPageState createState() => _TransportPageState();
}

class _TransportPageState extends State<TransportPage> {
  List<String> urls = [
    'https://i0.wp.com/nuz.uz/uploads/posts/2018-08/1533201584_1513844050_taksi.jpg?w=696&ssl=1',
    'http://retail-loyalty.org/upload/iblock/6e9/fd7aa0db3664dc8b5cffbf26403a3338.jpg',
    'https://www.google.com/url?sa=i&url=http%3A%2F%2Favtoshef.com%2Fsemejnaya-poezdka-na-avtomobile-kak-sdelat-dorogu-priyatnej%2F&psig=AOvVaw17KcxQU4luh1WavdXfOOBf&ust=1643908687226000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCPiXxqHD4fUCFQAAAAAdAAAAABAD',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJ8uJycgZusOS4mKFxUjtKVM2WcERaEzDEWg&usqp=CAU',
    'data:image/jpeg;base64,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',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FF),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFF6F7FF),
        title: Row(
          children: [],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 80.0,
                          child: ServicesCard(urls[1], 'asd', 'adf', context),
                        ),
                        Container(
                          child: Text('????????????'),
                          height: 80,
                          width: 80,
                        ),
                        Container(
                          height: 80.0,
                          child: ServicesCard(urls[3], 'asd', 'adf', context),
                        ),
                        Container(
                          child: Text('????????'),
                          height: 80,
                          width: 80,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 80.0,
                          child: ServicesCard(urls[1], 'asd', 'adf', context),
                        ),
                        Container(
                          child: Text('??????????????'),
                          height:80,
                          width: 80,
                        ),

                      ],
                    ),
                    // SizedBox(
                    //   height: 10.0,
                    // ),
                    // Row(
                    //   children: [
                    //     Container(
                    //       height: 80.0,
                    //       child: ServicesCard(urls[1], 'asd', 'adf', context),
                    //     ),
                    //     Container(
                    //       child: Text('???????????????? ????????????????'),
                    //       height: 100,
                    //       width: 80,
                    //     ),
                    //     Container(
                    //       height: 80.0,
                    //       child: ServicesCard(urls[3], 'asd', 'adf', context),
                    //     ),
                    //     Container(
                    //       child: Text('???? ????????'),
                    //       height: 80,
                    //       width: 80,
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     Container(
                    //       height: 80.0,
                    //       child: ServicesCard(urls[1], 'asd', 'adf', context),
                    //     ),
                    //     Container(
                    //       child: Text('?????????? ????????????????'),
                    //       height: 100,
                    //       width: 80,
                    //     ),
                    //     Container(
                    //       height: 80.0,
                    //       child: ServicesCard(urls[3], 'asd', 'adf', context),
                    //     ),
                    //     Container(
                    //       child: Text('?????????? ??????????????'),
                    //       height: 80,
                    //       width: 80,
                    //     ),
                    //  ],
                   // ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
