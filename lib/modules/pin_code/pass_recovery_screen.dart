import 'package:deal_mart/shared/styles/sizes.dart';
import 'package:flutter/material.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/styles.dart';
import '../home/home_layout.dart';
import '../register/register_screen.dart';
class PasswordRecoveryScreen extends StatelessWidget {
  const PasswordRecoveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xffF7F7F7),
      appBar: AppBar(
      backgroundColor: const Color(0xffF7F7F7),
      elevation: 0,
      leading: CircleAvatar(
        backgroundColor: defTextColor,
        child: IconButton(
          onPressed: () {
            navigateTo(context, const RegisterScreen());
          },
          icon: const Icon(
            Icons.close,
            color: secondColor,
          ),
        ),
      ),
    ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text( 'password_recovery'
             // AppLocalization.of(context)!.translate('password_recovery_by_mobile_number')!
              ,style: black20bold(), ),
            sizedBoxh2,
            Text( 'by_mobile_number'
              // AppLocalization.of(context)!.translate('password_recovery_by_mobile_number')!
              ,style: black20bold(), ),
            sizedBoxh3,
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height:  MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                 boxShadow:const [
                BoxShadow(
                color: defTextColor,
                //spreadRadius: 5,
               // blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
          ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('phone_number'
                       // AppLocalization.of(context)!.translate('phone_number')!,
                   ,style: black14bold() ,),
                      sizedBoxh1,
                      formFeild(
                        txt: 'enter_phone_number',
                        //AppLocalization.of(context)!.translate('enter_phone_number')!,
                        isClikable: true,
                        type: TextInputType.phone,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'please_enter_your_phone_number';
                             // AppLocalization.of(context)!.translate('please_enter_your_phone_number');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            sizedBoxh2,
            defaultButton(context,
              color: primaryColor,txtColor: defTextColor,
                function: (){navigateTo(context,const HomeScreen());},
                text: 'confirm',
                //AppLocalization.of(context)!.translate('confirm')!
              ),
          ],
          ),
        ),
      ),
    );
  }
}
