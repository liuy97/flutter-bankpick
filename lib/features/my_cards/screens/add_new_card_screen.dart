import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class AddNewCardScreen extends StatelessWidget {
  const AddNewCardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new card'),
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(children: [
                Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                      const Text(
                        'Email Address',
                        style: TextStyle(fontSize: 14),
                      ),
                      const Gap(16),
                      TextFormField(
                        initialValue: 'Tanya Myroniuk',
                        decoration: const InputDecoration(
                          isDense: true,
                          fillColor: Colors.transparent,
                          contentPadding: EdgeInsets.only(bottom: 10),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          prefixIcon: Padding(
                              padding: EdgeInsets.only(right: 8, bottom: 10),
                              child: Icon(
                                  IconData(0xe902, fontFamily: 'icomoon'),
                                  size: 22,
                                  color: Color(0xffA2A2A7))),
                          prefixIconConstraints: BoxConstraints(minWidth: 22),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                      const Gap(16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                const Text('Expiry Date'),
                                TextFormField(
                                  initialValue: '09/06/2024',
                                  decoration: const InputDecoration(
                                      isDense: true,
                                      fillColor: Colors.transparent,
                                      contentPadding:
                                          EdgeInsets.only(bottom: 10),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey))),
                                  textInputAction: TextInputAction.next,
                                )
                              ])),
                          const SizedBox(width: 80),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('4-digit CVV'),
                              TextFormField(
                                initialValue: '6986',
                                decoration: const InputDecoration(
                                    isDense: true,
                                    fillColor: Colors.transparent,
                                    contentPadding: EdgeInsets.only(bottom: 10),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey))),
                                textInputAction: TextInputAction.next,
                              )
                            ],
                          ))
                        ],
                      ),
                      const Gap(16),
                      const Text(
                        'Card Number',
                        style: TextStyle(fontSize: 14),
                      ),
                      const Gap(16),
                      TextFormField(
                        initialValue: '4562 1122 4595 7852',
                        decoration: InputDecoration(
                          isDense: true,
                          fillColor: Colors.transparent,
                          contentPadding: const EdgeInsets.only(bottom: 10),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          prefixIcon: const Padding(
                              padding: EdgeInsets.only(right: 8, bottom: 10),
                              child: Icon(
                                  IconData(0xe90f, fontFamily: 'icomoon'),
                                  size: 22,
                                  color: Color(0xffA2A2A7))),
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 22),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'assets/images/mastercard.png',
                              width: 22,
                              height: 22,
                              fit: BoxFit.fill,
                            ),
                          ),
                          suffixIconConstraints:
                              const BoxConstraints(minWidth: 22),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ])),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: FilledButton(
                        child: const Text("Add new card",
                            style: TextStyle(fontSize: 16)),
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                      ),
                    )),
                  ],
                )
              ]))),
    );
  }
}
