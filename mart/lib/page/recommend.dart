import 'package:flutter/cupertino.dart';
import 'package:mart/server/server.dart';

class RecommendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RecommendState();
  }
}

class RecommendState extends State<RecommendPage> {
  @override
  void initState() {
    super.initState();
    server.dio.post('/lsm-web/leadFlowInfo/getProduct', queryParameters: {
      "type": 0,
      "page": 1,
      "limit": 20
    }, data: {
      "type": 0,
      "page": 1,
      "limit": 20
    }).then((response) => {
          response.statusCode == 200
              ? print('data->${response.data}')
              : print('error')
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('this is Recommend Page'),
    );
  }
}
