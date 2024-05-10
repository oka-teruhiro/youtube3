import 'package:flutter/material.dart';

class NotConnection extends StatelessWidget {
  const NotConnection({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text('インターネットに接続されていません'),
      content: SizedBox(
        width: 200,
        height: 200,
        child: Text('Wi-Fi をオンにするか、モバイルをオンにしてから、再起動して下さい。'),
      ),
    );
  }
}