import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class AllCardsScreen extends StatelessWidget {
  const AllCardsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('All Cards'),
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Column(children: [
                        CreditCardWidget(
                          enableFloatingCard: true,
                          cardNumber: '456112245957852',
                          expiryDate: '2020-04',
                          cardHolderName: 'AR Jonson',
                          cvvCode: '698',
                          bankName: 'Pick Bank',
                          showBackView: false,
                          obscureCardNumber: true,
                          obscureCardCvv: true,
                          isHolderNameVisible: true,
                          isSwipeGestureEnabled: true,
                          onCreditCardWidgetChange: (CreditCardBrand) {},
                        ),
                        CreditCardWidget(
                          enableFloatingCard: true,
                          cardNumber: '456112245957852',
                          expiryDate: '2020-04',
                          cardHolderName: 'AR Jonson',
                          cvvCode: '698',
                          bankName: 'Pick Bank',
                          showBackView: false,
                          obscureCardNumber: true,
                          obscureCardCvv: true,
                          isHolderNameVisible: true,
                          isSwipeGestureEnabled: true,
                          onCreditCardWidgetChange: (CreditCardBrand) {},
                        ),
                      ])),
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: FilledButton(
                              child: const Text("Add card +",
                                  style: TextStyle(fontSize: 16)),
                              onPressed: () {
                                GoRouter.of(context)
                                    .go('/my-cards/all-cards/add');
                              },
                            ),
                          )),
                        ],
                      )
                    ]))));
  }
}
