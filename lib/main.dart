import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/more_dependents/add_transaction.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/more_dependents/budget_dependents.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/more_dependents/budget_money_container.dart';
import 'UI/home_dependents/bottom_nav/analytics_dependent/transaction_details/airtime_transaction.dart';
import 'UI/home_dependents/bottom_nav/analytics_dependent/transaction_details/data_transaction.dart';
import 'UI/home_dependents/bottom_nav/analytics_dependent/transaction_details/savings_transaction.dart';
import 'UI/home_dependents/bottom_nav/analytics_dependent/transaction_details/transaction_details.dart';
import 'UI/home_dependents/bottom_nav/analytics_dependent/transaction_details/transfers_transaction.dart';
import 'UI/home_dependents/bottom_nav/home_dependents/services/airtime_and_data.dart';
import 'UI/home_dependents/bottom_nav/home_dependents/services/request_money/new_request.dart';
import 'UI/home_dependents/bottom_nav/home_dependents/services/request_money/new_request_link.dart';
import 'UI/home_dependents/bottom_nav/home_dependents/services/request_money/request_money.dart';
import 'package:stripling_wallet/UI/home_dependents/bottom_nav/home_dependents/services/save_money/save_money_select.dart';
import 'UI/home_dependents/bottom_nav/home_dependents/services/save_money/save_money.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/home_guardians/services/dependants_request.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/manage_activities/child_statement.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/manage_activities/spend_limit.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/manage_activities/transfer_limit.dart';
import 'package:stripling_wallet/UI/welcome/new_onboarding.dart';
import 'UI/home_dependents/bottom_nav/home_dependents/services/save_money/savings_select/create_fixed_savings.dart';
import 'UI/home_dependents/bottom_nav/home_dependents/services/save_money/savings_select/fixed_savings.dart';
import 'UI/home_dependents/bottom_nav/home_dependents/services/save_money/savings_select/regular_savings.dart';
import 'UI/home_dependents/bottom_nav/home_dependents/services/save_money/savings_select/regular_savings_confirmation.dart';
import 'UI/home_dependents/bottom_nav/home_dependents/services/save_money/savings_select/savings_select.dart';
import 'UI/home_dependents/bottom_nav/home_dependents/services/save_money/savings_select/target_confirmation.dart';
import 'UI/home_dependents/bottom_nav/home_dependents/services/save_money/savings_select/target_savings.dart';
import 'UI/home_dependents/bottom_nav/home_dependents/services/save_money/savings_select/target_savings_two.dart';
import 'UI/home_dependents/bottom_nav/home_dependents/services/send_money/confirmation_pin.dart';
import 'UI/home_dependents/bottom_nav/home_dependents/services/send_money/send_money.dart';
import 'UI/home_dependents/bottom_nav/more_dependents/add_budget_depedndents.dart';
import 'UI/home_dependents/index.dart';
import 'UI/home_guardians/bottom_nav_guardians/home_guardians/notifications.dart';
import 'UI/home_guardians/bottom_nav_guardians/home_guardians/services/dependants_request_tab/accept_confirmation.dart';
import 'UI/home_guardians/bottom_nav_guardians/home_guardians/services/funds_dependant/funds_dependant.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/settings_guardian/customization.dart';
import 'UI/home_guardians/bottom_nav_guardians/home_guardians/services/funds_dependant/automated_continue.dart';
import 'UI/home_guardians/bottom_nav_guardians/home_guardians/services/funds_dependant/automated_payment.dart';
import 'UI/home_guardians/bottom_nav_guardians/home_guardians/services/funds_dependant/one_time_payment.dart';
import 'UI/home_guardians/bottom_nav_guardians/home_guardians/services/my_dependants/add_dependant_continue.dart';
import 'UI/home_guardians/bottom_nav_guardians/home_guardians/services/my_dependants/add_dependent.dart';
import 'UI/home_guardians/bottom_nav_guardians/home_guardians/services/my_dependants/dependents_id.dart';
import 'UI/home_guardians/bottom_nav_guardians/home_guardians/services/my_dependants/my_dependants.dart';
import 'package:stripling_wallet/UI/home_guardians/bottom_nav_guardians/wallet_guardian/fund_wallet.dart';
import 'package:stripling_wallet/UI/home_guardians/index_guardian.dart';
import 'package:stripling_wallet/UI/welcome/registration/forgot_password/sent_instructions.dart';
import 'package:stripling_wallet/UI/welcome/registration/login.dart';
import 'UI/home_guardians/bottom_nav_guardians/home_guardians/services/transactions.dart';
import 'UI/home_guardians/bottom_nav_guardians/manage_activities/physical_card.dart';
import 'UI/home_guardians/bottom_nav_guardians/settings_guardian/legal.dart';
import 'UI/home_guardians/bottom_nav_guardians/settings_guardian/profile/id_document.dart';
import 'UI/home_guardians/bottom_nav_guardians/settings_guardian/profile/profile.dart';
import 'UI/home_guardians/bottom_nav_guardians/settings_guardian/profile/upgrade_account.dart';
import 'UI/home_guardians/bottom_nav_guardians/settings_guardian/security.dart';
import 'UI/home_guardians/bottom_nav_guardians/wallet_guardian/add_wallet/add_bank_transfer.dart';
import 'UI/home_guardians/bottom_nav_guardians/wallet_guardian/add_wallet/add_debit_card.dart';
import 'UI/home_guardians/bottom_nav_guardians/wallet_guardian/add_wallet/add_ussd.dart';
import 'UI/home_guardians/bottom_nav_guardians/wallet_guardian/debit_card.dart';
import 'UI/welcome/registration/dependats_registration/dependants_authentication.dart';
import 'UI/welcome/identification.dart';
import 'UI/welcome/registration/dependats_registration/dependants_pin.dart';
import 'UI/welcome/registration/dependats_registration/log_in_pin.dart';
import 'UI/welcome/registration/forgot_password/create_new_password.dart';
import 'UI/welcome/registration/forgot_password/reset_password.dart';
import 'UI/welcome/registration/guardian_registration/guardian_sign_up/create_pin.dart';
import 'UI/welcome/registration/guardian_registration/guardian_sign_up/guardian_sign_up.dart';
import 'UI/welcome/registration/guardian_registration/guardian_sign_up/guardian_sign_up_continue.dart';
import 'UI/welcome/registration/guardian_registration/guardian_sign_up/otp.dart';
import 'UI/welcome/splashscreen.dart';
import 'controller/app_theme.dart';
import 'controller/theme_controller.dart';

void main() async {
  // Make application portrait only
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final themeController = Get.put(ThemeController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: themeController.theme,
      debugShowCheckedModeBanner: false,
      title: 'Stripling Wallet',
      // home: const SplashScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        NewBoarding.id:(context)=> const NewBoarding(),
        DependantsAuthentication.id:(context)=> const DependantsAuthentication(),
        '/identification': (context) => const Identification(),
        Login.id:(context) => Login(),
        GuardianSignUp.id:(context) => const GuardianSignUp(),
        GuardianSignUpContinue.id:(context) => const GuardianSignUpContinue(),
        OTP.id:(context) => const OTP(),
        CreatePin.id:(context) => const CreatePin(),
        ResetPassword.id:(context) => const ResetPassword(),
        SendInstructions.id:(context) => const SendInstructions(),
        CreateNewPassword.id:(context) => const CreateNewPassword(),
        //ParentInterface
        IndexGuardian.id:(context) => const IndexGuardian(),
        FundsWallet.id:(context)=> const FundsWallet(), //
        MyDependants.id:(context)=> const MyDependants(collect: false,),
        AddDependants.id:(context)=> const AddDependants(),
        AddDependantsContinue.id:(context)=> const AddDependantsContinue(),
        Transactions.id:(context)=> const Transactions(),
        DebitCard.id:(context)=> const DebitCard(),
        AddDebitCard.id:(context)=> const AddDebitCard(),
        AddBankTransfer.id:(context)=> const AddBankTransfer(),
        AddUssd.id:(context)=> const AddUssd(),
        Legal.id:(context)=> const Legal(),
        Security.id:(context)=> const Security(),
        Customization.id:(context)=> Customization(),
        UpgradeAccount.id:(context)=> const UpgradeAccount(),
        IdDocument.id:(context)=> const IdDocument(),
        FundsDependant.id:(context)=> const FundsDependant(),
        AutomatedPayment.id:(context)=> const AutomatedPayment(),
        AutomatedPaymentContinue.id:(context)=> const AutomatedPaymentContinue(),
        OneTimePayment.id:(context)=> const OneTimePayment(),
        SpendLimit.id:(context)=> const SpendLimit(),
        PhysicalCard.id:(context)=> const PhysicalCard(),
        DependantsId.id:(context)=> const DependantsId(),
        AccountLimit.id:(context)=> const AccountLimit(),
        ChildStatement.id:(context)=> const ChildStatement(),
        TransferLimit.id:(context)=> const TransferLimit(),
        DependantsRequest.id:(context)=> const DependantsRequest(),
        Notifications.id:(context)=> const Notifications(),
        AcceptConfirmation.id:(context)=> const AcceptConfirmation(),

        //ChildInterface
        Index.id:(context) => const Index(),
        AirtimeAndData.id:(context)=> const AirtimeAndData(),
        SaveMoney.id:(context)=> const SaveMoney(populate: false,),
        RequestMoney.id:(context)=> const RequestMoney(),
        NewRequest.id:(context)=> const NewRequest(),
        NewRequestLink.id:(context)=> const NewRequestLink(),
        FixedSavings.id:(context)=> const FixedSavings(),
        CreateFixedSavings.id:(context)=> const CreateFixedSavings(),
        SavingsSelect.id:(context)=> const SavingsSelect(),
        TargetSavings.id:(context)=> const TargetSavings(), //1
        TargetSavingsTwo.id:(context)=> const TargetSavingsTwo(),
        TargetConfirmation.id:(context)=> const TargetConfirmation(),
        SendMoney.id:(context)=> const SendMoney(),
        SaveMoneySelect.id:(context)=> const SaveMoneySelect(),
        RegularSavings.id:(context)=> const RegularSavings(),
        RegularSavingsConfirmation.id:(context)=> const RegularSavingsConfirmation(),
        Confirmation.id:(context)=> const Confirmation(),
        AirtimeTransaction.id:(context)=> const AirtimeTransaction(),
        SavingsTransaction.id:(context)=> const SavingsTransaction(),
        DataTransaction.id:(context)=> const DataTransaction(),
        TransfersTransaction.id:(context)=> const TransfersTransaction(),
        TransactionDetails.id:(context)=> const TransactionDetails(),
        BudgetDependents.id:(context)=> const BudgetDependents(populate: false),
        AddBudgetDependents.id:(context)=> const AddBudgetDependents(),
        BudgetMoneyContainer.id:(context)=> const BudgetMoneyContainer(),
        AddTransaction.id:(context)=> const AddTransaction(),
        DependantsPin.id:(context)=> const DependantsPin(),
        LogInPin.id:(context)=> const LogInPin(),
      },
    );
  }
}