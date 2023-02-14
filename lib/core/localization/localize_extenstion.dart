import 'package:wall_e/core/localization/localize.dart';

extension LocalizeExtenstion on Localize {
  String get key => getName();

  String getName() {
    switch (this) {
      case Localize.appName:
        return "app_name";

      
      case Localize.sourceoffund:
        return "Source of Fund";

      case Localize.welcome:
        return "welcome";

      case Localize.appDescription:
        return "app_desc";

      case Localize.appDescription1:
        return "app_desc1";
      case Localize.addBeneficiary:
        return "add_beneficiary";
      case Localize.accountDeposite:
        return "account_deposite";
      case Localize.aboutKantipurRemit:
        return "about_kantipur";
      case Localize.bankTransfer:
        return "bank_transfer";
      case Localize.forward:
        return "continue";

        case Localize.selectBank:
        return "Select Bank";
      case Localize.payoutType:
        return "payout_type";
      case Localize.search:
        return "search";
      case Localize.calculate:
        return "calculate";
      case Localize.cashPayment:
        return "cash_Payment";

      case Localize.helpSupport:
        return "help_support";

      case Localize.emailmobile:
        return "email_mobile";

      case Localize.noresult:
        return "no_result";

      case Localize.onbodingafeTransaction:
        return "onboding_safe_transaction";

      case Localize.onbodingSafeTransactionDesc:
        return "onboding_safe_transaction_desc";

      case Localize.onbodingGreatValue:
        return "onboding_great_value";

      case Localize.provinceErrorMessage:
        return "province_error_message";

      case Localize.location:
        return "location";

      case Localize.locationErrorMessage:
        return "location_error_message";

      case Localize.onbodingGreatValueDesc:
        return "onboding_great_value_desc";

      case Localize.onbodingFast:
        return "onboding_fast";

      case Localize.onbodingFastDesc:
        return "onboding_fast_desc";

      case Localize.onbodingLargestPayoutNetwork:
        return "onboding_largest_payout_network";

      case Localize.onbodingLargestPayoutNetworkDesc:
        return "onboding_largest_payout_network_desc";

      case Localize.onbodingConvenient:
        return "onboding_convenient";

      case Localize.onbodingConvenientDesc:
        return "onboding_convenient_desc";

      case Localize.onbodingPeaceOfMind:
        return "onboding_peace_of_mind";

      case Localize.onbodingPeaceOfMindDesc:
        return "onboding_peace_of_mind_desc";

      case Localize.loading:
        return "loading";

      case Localize.letsStart:
        return "lets_start";

      case Localize.getReadyToEnjoy:
        return "get_ready_to_enjoy";

      case Localize.signUp:
        return "sign_up";

      case Localize.signupwithemail:
        return "sign_up_with_email";

      case Localize.signupwith:
        return "sign_up_with";

      case Localize.signupsecureway:
        return "sign_up_secure_way";

      case Localize.exjoyaccount:
        return "exjoy_account";

      case Localize.recievemoneyinstantly:
        return "recieve_money_instantly";

      case Localize.twentyfourhourservice:
        return "24_hour_service";

      case Localize.paymentservice:
        return "payment_service";

      case Localize.logIn:
        return "log_in";

      case Localize.signUpDesc:
        return "sign_up_desc";

      case Localize.emailIdPlaceholder:
        return "email_id_placeholder";

      case Localize.emailIdErrorMessage:
        return "email_id_error_message";

      case Localize.pinPlaceholder:
        return "pin_placeholder";
      case Localize.subject:
        return "subject";
      case Localize.contactmsg:
        return "contactus_msg";
      case Localize.beneficiaryCreated:
        return "beneficiary_created";
      case Localize.recipient:
        return "recipient";

      case Localize.pinErrorMessage:
        return "pin_error_message";

      case Localize.pinChangesSuccessful:
        return "pin_changes_successful";

      case Localize.pinChangesSuccessfulDesc:
        return "pin_created_success_desc";

      case Localize.confirmPinPlaceholder:
        return "confirm_pin_placeholder";

      case Localize.confirmPinErrorMessage:
        return "confirm_pin_error_message";

      case Localize.referralCodeTitleMessage:
        return "referral_code_title_message";

      case Localize.referralCodePlaceholder:
        return "referral_code_placeholder";

      case Localize.referralCodeErrorMessage:
        return "referral_code_error_message";

      case Localize.termsMessage:
        return "terms_message";

      case Localize.termsCondition:
        return "terms_condition";

      case Localize.and:
        return "and";

      case Localize.privacyPolicy:
        return "privacy_policy";

      case Localize.alreadyAccountTitle:
        return "already_account_title";

      case Localize.registrationTitle:
        return "registration_title";

      case Localize.personalTitle:
        return "personal_title";

      case Localize.addressTitle:
        return "address_title";

      case Localize.passwordDetails:
        return "new_password_details";
      case Localize.newPassword:
        return "new_password";
      case Localize.confirmPassword:
        return "confirm_password";
      case Localize.changePassword:
        return "change_password";
      case Localize.resendPin:
        return "resend_pin";
      case Localize.resetSuccessTitle:
        return "reset_success_title";

      case Localize.resetSuccessDes:
        return "reset_success_desc";

      case Localize.idUploadTitle:
        return "id_upload_title";

      case Localize.firstnamePlaceholder:
        return "firstname_placeholder";

      case Localize.firstnameErrorMessage:
        return "firstname_error_message";

      case Localize.middlenamePlaceholder:
        return "middlename_placeholder";

      case Localize.middlenameErrorMessage:
        return "middlename_error_message";

      case Localize.lastnamePlaceholder:
        return "lastname_placeholder";

      case Localize.lastnameErrorMessage:
        return "lastname_error_message";

      case Localize.dobPlaceholder:
        return "dob_placeholder";

      case Localize.dobErrorMessage:
        return "dob_error_message";

      case Localize.genderPlaceholder:
        return "gender_placeholder";

      case Localize.genderErrorMessage:
        return "gender_error_message";

      case Localize.nationalityPlaceholder:
        return "nationality_placeholder";

      case Localize.nationalityErrorMessage:
        return "nationality_error_message";

      case Localize.contactPlaceholder:
        return "contact_placeholder";

      case Localize.findus:
        return "find_us";

      case Localize.contactus:
        return "contact_us";

      case Localize.contactNumber:
        return "contact_number";

      case Localize.contactErrorMessage:
        return "contact_error_message";

      case Localize.nextButtonTitle:
        return "Next";

      case Localize.countryPlaceholder:
        return "country_placeholder";

      case Localize.countryErrorMessage:
        return "country_error_message";

      case Localize.streetcodePlaceholder:
        return "street_code_placeholder";
      case Localize.province:
        return "province";
      case Localize.streetPlaceholder:
        return "street_placeholder";

      case Localize.streetErrorMessage:
        return "street_error_message";

      case Localize.suburbPlaceholder:
        return "suburb_placeholder";

      case Localize.suburbErrorMessage:
        return "suburb_error_message";

      case Localize.postalCodePlaceholder:
        return "postal_code_placeholder";

      case Localize.postalCodeErrorMessage:
        return "postal_code_error_message";

      case Localize.statePlaceholder:
        return "state_placeholder";

      case Localize.stateErrorMessage:
        return "state_error_message";

      case Localize.backButtonTitle:
        return "Back";

      case Localize.idTypePlaceholder:
        return "id_type_placeholder";

      case Localize.idTypeErrorMessage:
        return "id_type_error_message";

      case Localize.idNumberPlaceholder:
        return "id_number_placeholder";

      case Localize.idNumberErrorMessage:
        return "id_number_error_message";

      case Localize.idExpiryPlaceholder:
        return "id_expiry_placeholder";

      case Localize.idExpiryErrorMessage:
        return "id_expiry_error_message";

      case Localize.fileUploadTitle:
        return "file_upload_title";

      case Localize.fileUploadDesc:
        return "file_upload_desc";

      case Localize.frontTitle:
        return "front_title";

      case Localize.backTitle:
        return "back_title";

      case Localize.uploadDesc:
        return "upload_desc";

      case Localize.skipButtonTitle:
        return "skip_button_title";

      case Localize.doneButtonTitle:
        return "done_button_title";

      case Localize.registtrationSuccessTitle:
        return "Registration Successful";

      case Localize.registtrationSuccessDescription:
        return "You email have been successfully added.";

      case Localize.backLoginButtonTitle:
        return "back_login_button_title";

      case Localize.loginToContinue:
        return "login_to_continue";

      case Localize.loginInOptions:
        return "login_in_options";

      case Localize.notHaveAnOptions:
        return "not_have_an_options";

      case Localize.sendVerficationCode:
        return "send_verfication_code";

      case Localize.receiveVerficationCode:
        return "receive_verfication_code";

      case Localize.send:
        return "send";

      case Localize.changeLogInPin:
        return "change_log_in_pin";

      case Localize.enterSexDigitPin:
        return "enter_six_digit_pin";

      case Localize.update:
        return "update";

      case Localize.accountVerification:
        return "account_verification";

      case Localize.enterSixDigitVerificationCode:
        return "enter_six_digit_verification_code";

      case Localize.enterYourPin:
        return "enter_your_pin";

      case Localize.tapAboveToSwitchLogInOption:
        return "tap_above_to_switch_log_in_option";

      case Localize.forgot:
        return "forgot";

      case Localize.forgotPassword:
        return "forgot_password";

      case Localize.setNewPinMessage:
        return "set_new_pin_message";

      case Localize.newPinDetails:
        return "new_pin_details";

      case Localize.logInFastThroughFingerprint:
        return "log_in_fast_through_fingerprint";

      case Localize.useFingerprint:
        return "use_fingerprint";

      case Localize.continueWithPinOnly:
        return "continue_with_pin_only";

      case Localize.home:
        return "home";

      case Localize.receiver:
        return "receiver";

      case Localize.history:
        return "history";

      case Localize.more:
        return "more";

      case Localize.userId:
        return "user_id";

      case Localize.username:
        return "username";

      case Localize.password:
        return "password";

      case Localize.emptyerrormessage:
        return "empty_error_message";

      case Localize.kycVerified:
        return "kyc_verified";

      case Localize.settings:
        return "settings";

      case Localize.changePin:
        return "change_pin";

      case Localize.notifications:
        return "notifications";

      case Localize.help:
        return "help";

      case Localize.helpCenter:
        return "help_center";

      case Localize.faqs:
        return "faqs";

      case Localize.helpFeedback:
        return "help_feedback";

      case Localize.chatWithUs:
        return "chat_with_us";

      case Localize.callUs:
        return "call_us";

      case Localize.legal:
        return "legal";

      case Localize.aboutUs:
        return "about_us";

      case Localize.logOut:
        return "log_out";

      case Localize.versin:
        return "versin";

      case Localize.profile:
        return "profile";

      case Localize.nationality:
        return "nationality";

      case Localize.gender:
        return "gender";

      case Localize.dateOfBirth:
        return "date_of_birth";

      case Localize.address:
        return "address";

      case Localize.mobileNumber:
        return "mobile_number";

      case Localize.mobileNumberPlaceHolder:
        return "mobile_number_placeHolder";

      case Localize.mobileNumberErrorMessage:
        return "mobile_number_error_message";

      case Localize.idType:
        return "id_type";

      case Localize.idExpiryDate:
        return "id_expiry_date";

      case Localize.currentPin:
        return "current_pin";

      case Localize.oldPin:
        return "old_pin";

      case Localize.newPin:
        return "new_pin";

      case Localize.documentUpload:
        return "document_upload";

      case Localize.uploadDocuments:
        return "upload_documents";

      case Localize.identificationInformation:
        return "identification_information";

      case Localize.addReceiver:
        return "Add Receiver";

      case Localize.payoutTitle:
        return "payout_title";

      case Localize.addTitle:
        return "add_title";

      case Localize.addressErrorMessage:
        return "address_error_message";

      case Localize.relationship:
        return "relationship";

      case Localize.relationshipLabel:
        return "relationship_label";

      case Localize.relationshipErrorMessage:
        return "relationship_error_message";

      case Localize.imageUpload:
        return "image_upload";

      case Localize.payoutMethod:
        return "payout_method";

      case Localize.payoutMethodLabel:
        return "payout_method_label";

      case Localize.payoutMethodErrorMessage:
        return "payout_method_error_message";

      case Localize.bank:
        return "Bank";

      case Localize.bankLabel:
        return "bank_label";

      case Localize.bankErrorMessage:
        return "bank_error_message";

      case Localize.branch:
        return "Branch";

      case Localize.branchLabel:
        return "branch_label";

      case Localize.branchErrorMessage:
        return "branch_error_message";

      case Localize.accountNumber:
        return "account_number";

      case Localize.accountNumberLabel:
        return "account_number_label";

      case Localize.accountNumberErrorMessage:
        return "account_number_error_message";

      case Localize.wallet:
        return "wallet";

      case Localize.walletErrorMessage:
        return "wallet_error_message";

      case Localize.walletId:
        return "wallet_id";

      case Localize.walletIdErrorMessage:
        return "wallet_id_error_message";

      case Localize.district:
        return "district";

      case Localize.districtErrorMessage:
        return "district_error_message";

      case Localize.area:
        return "area";

      case Localize.areaErrorMessage:
        return "district_error_message";

      case Localize.receiverDetails:
        return "receiver_details";

      case Localize.payoutInformation:
        return "payout_information";

      case Localize.personalInformation:
        return "personal_information";

      case Localize.contactInformation:
        return "contact_information";

      case Localize.searchReceivers:
        return "search_receivers";

      case Localize.transactionHistory:
        return "transaction_history";

      case Localize.searchTransactions:
        return "search_transactions";

      case Localize.transactionSummary:
        return "transaction_summary";

      case Localize.change:
        return "Change";

      case Localize.receiverInformation:
        return "receiver_information";

      case Localize.walletName:
        return "wallet_name";

      case Localize.walletIdLabel:
        return "wallet_id_label";

      case Localize.exchangeRate:
        return "exchange_rate";

      case Localize.purpose:
        return "purpose";

      case Localize.serviceCharge:
        return "service_charge";

      case Localize.promoCodeDiscount:
        return "promo_code_discount";

      case Localize.payWithYour:
        return "pay_with_your";

      case Localize.purposeRemit:
        return "purpose_remit";

      case Localize.discount:
        return "discount";

      case Localize.promotionRate:
        return "promotion_rate";

      case Localize.transferAmount:
        return "transfer_amount";

      case Localize.reasonTransfer:
        return "reason_transfer";

      case Localize.reasonTransferErrorMessage:
        return "reason_transfer_error_msg";

      case Localize.promocodeErrorMessage:
        return "promo_code_error_msg";

      case Localize.christmasDiscountOffer:
        return "christmas_discount_offer";

      case Localize.grandTotal:
        return "grand_total";

      case Localize.youAreSending:
        return "you_are_sending";

      case Localize.receiverGets:
        return "receiver_gets";

      case Localize.transactionIsSuccessful:
        return "transaction_is_successful";

      case Localize.yourTransactionHasBeenPerformedSuccessfully:
        return "your_transaction_has_been_performed_successfully";

      case Localize.referenceNumber:
        return "reference_number";

      case Localize.thankYouForUsing:
        return "thank_you_for_using";

      case Localize.viewTransactionDetails:
        return "view_transaction_details";

      case Localize.goBack:
        return "go_back";

      case Localize.gotologin:
        return "Go to Login";

      case Localize.pleasePassTheRefreanceNumber:
        return "please_pass_the_refreance_number";

      case Localize.transactionHistoryTitle:
        return "transaction_history_title";

      case Localize.transactionDetail:
        return "transaction_detail";

      case Localize.transferStatus:
        return "transfer_status";

      case Localize.processing:
        return "processing";

      case Localize.started:
        return "started";

      case Localize.amountDeposited:
        return "amount_deposited";

      case Localize.summary:
        return "summary";

      case Localize.payoutMethodTitle:
        return "payout_method_title";

      case Localize.mobileWallet:
        return "mobile_wallet";

      case Localize.walletIdTitle:
        return "wallet_id_title";

      case Localize.receiverInfo:
        return "receiver_info";

      case Localize.transferFee:
        return "transfer_fee";

      case Localize.youSend:
        return "you_send";

      case Localize.youPay:
        return "you_pay";

      case Localize.referAFriend:
        return "refer_a_friend";

      case Localize.latestTransactions:
        return "latest_transactions";

      case Localize.seeAll:
        return "see_all";

      case Localize.todayExrate:
        return "today_exrate";

      case Localize.viewExchangeHistory:
        return "view_exchange_history";

      case Localize.setRateAlert:
        return "set_rate_alert";

      case Localize.areYouSure:
        return "are_you_sure";

      case Localize.doYouWantToExitApp:
        return "do_you_want_to_exit_app";

      case Localize.doYouWantToLogout:
        return "do_you_want_to_logout";

      case Localize.no:
        return "no";

      case Localize.yes:
        return "yes";

      case Localize.utilitiesPayment:
        return "utilities_payment";

      case Localize.payoutLocation:
        return "payout_location";

      case Localize.sendMoneyTitle:
        return "send_money_title";

      case Localize.enterEitherField:
        return "enter_either_field";

      case Localize.amount:
        return "amount";

      case Localize.selectReceiverErrorMessage:
        return "select_receiver_error_message";

      case Localize.amountError:
        return "amount_error";

      case Localize.chooseReceiverTitle:
        return "choose_receiver_title";

      case Localize.receiverError:
        return "receiver_error";

      case Localize.paymentMethod:
        return "payment_method";

      case Localize.bankDetail:
        return "bank_detail";

      case Localize.bankName:
        return "bank_name";

      case Localize.accountName:
        return "account_name";

      case Localize.bsbCode:
        return "bsb_code";

      case Localize.accountNumberPlaceholder:
        return "account_number_placeholder";

      case Localize.copied:
        return "copied";

      case Localize.promoCodePlaceholder:
        return "promo_code_placeholder";

      case Localize.promoCodeTitleMsg:
        return "promo_code_title_msg";

      case Localize.apply:
        return "apply";

      case Localize.sendingMsg:
        return "sending_msg";

      case Localize.receiverGet:
        return "receiver_get";

      case Localize.uploadReceiptMsg:
        return "upload_receipt_msg";

      case Localize.pleasePay:
        return "please_pay";

      case Localize.securitydetails:
        return "security_details";

      case Localize.bankAccountToMentioned:
        return "bank_account_to_mentioned";

      case Localize.screenshotReceiptMsg:
        return "screenshot_receipt_msg";

      case Localize.amountErrorMsg:
        return "amount_error_msg";

      case Localize.uploadReceiptErrorMsg:
        return "upload_receipt_error_msg";

      case Localize.ratesChanges:
        return "rates_changes";

      case Localize.totalToPay:
        return "total_to_pay";

      case Localize.serviceIncluded:
        return "service_included";

      case Localize.findgooglemap:
        return "find_google_map";

      case Localize.enternewpin:
        return "enter_new_pin";

      case Localize.enterfourdigit:
        return "enter_four_digit";

      case Localize.enterverificationcode:
        return "enter_verification_code";

      case Localize.entercode:
        return "enter_code";

      case Localize.entercodephone:
        return "enter_code_phone";

      case Localize.confirm:
        return "confirm";

      case Localize.verify:
        return "verify";

      case Localize.sendVerificationCode:
        return "send_verification_code";

      case Localize.titlePaymentMethod:
        return "title_payment_method";

      case Localize.sendingMessage:
        return "sending_msg";

      case Localize.receivingMessage:
        return "receiver_get";

      case Localize.emaillinkdesc:
        return "email_link_desc";

      case Localize.beneficiarycreatedsuccessfully:
        return "Beneficiary Created Successfully";

      case Localize.beneficiarycreateddesc:
        return "Your beneficiary has been successfully created. Enjoy!";

      case Localize.finish:
        return "finish";

      case Localize.transactionnumber:
        return "transaction_number";

      case Localize.sendto:
        return "send_to";

      case Localize.name:
        return "name";

      case Localize.recieveramount:
        return "reciever_amount";

      case Localize.paymentdetail:
        return "payment_detail";

      case Localize.sendamount:
        return "send_amount";

      case Localize.fee:
        return "fee";
    }
  }

/* use this property to get localize string value
 */
  String get value => localizeValue();

  String localizeValue() {
    return key.trim();
  }
}
