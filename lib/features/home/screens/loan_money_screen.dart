import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoanMoneyScreen extends StatelessWidget {
  const LoanMoneyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Loan money'),
        ),
        body: SafeArea(
          child: Column(children: [
            const Expanded(
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.all(22),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Loan money',
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xffA2A2A7)),
                              ),
                            ])))),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: FilledButton(
                    child: const Text("Loan Money",
                        style: TextStyle(fontSize: 16)),
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                  ),
                )),
              ],
            )
          ]),
        ));
  }
}
