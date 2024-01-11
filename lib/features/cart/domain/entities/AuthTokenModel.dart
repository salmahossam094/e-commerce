

// ignore_for_file: file_names

class AuthTokenModel {
  AuthTokenModel({
    this.profile,
    this.token,
  });

  AuthTokenModel.fromJson(dynamic json) {
    profile =
        json['profile'] != null ? Profile.fromJson(json['profile']) : null;
    token = json['token'];
  }

  Profile? profile;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (profile != null) {
      map['profile'] = profile?.toJson();
    }
    map['token'] = token;
    return map;
  }
}

/// id : 945752
/// user : {"id":1682133,"username":"01068969516","first_name":"Salma","last_name":"Hossam El-Deen","date_joined":"2023-12-10T17:38:19.210499","email":"salmahossam094@gmail.com","is_active":true,"is_staff":false,"is_superuser":false,"last_login":null,"groups":[],"user_permissions":[160,116,119,115,213,137,204,118,131,122,128,127,203,123,140,139,455,454,130,266,124,259,121,133,206,125,129,136,185,146,126,604,258,135,138,205,117,120,186,132,134,277,1649]}
/// created_at : "2023-12-10T17:38:19.221731"
/// active : true
/// profile_type : "Merchant"
/// phones : ["+201068969516"]
/// company_emails : ["salmahossam094@gmail.com"]
/// company_name : "Salma Hosssam"
/// state : ""
/// country : "EGY"
/// city : "Cairo"
/// postal_code : ""
/// street : ""
/// email_notification : false
/// order_retrieval_endpoint : null
/// delivery_update_endpoint : null
/// logo_url : null
/// is_mobadra : false
/// sector : "other"
/// is_2fa_enabled : false
/// activation_method : 1
/// signed_up_through : 0
/// failed_attempts : 0
/// custom_export_columns : []
/// server_IP : []
/// username : null
/// primary_phone_number : "+201068969516"
/// primary_phone_verified : true
/// is_temp_password : false
/// otp_2fa_sent_at : null
/// otp_2fa_attempt : null
/// otp_sent_at : "2023-12-10T17:38:21.061944"
/// otp_sent_to : "01068969516"
/// otp_validated_at : "2023-12-10T17:38:41.272337"
/// awb_banner : null
/// email_banner : null
/// identification_number : null
/// delivery_status_callback : ""
/// merchant_external_link : null
/// merchant_status : 0
/// deactivated_by_bank : false
/// bank_deactivation_reason : null
/// bank_merchant_status : 0
/// national_id : null
/// super_agent : null
/// wallet_limit_profile : null
/// address : null
/// commercial_registration : null
/// commercial_registration_area : null
/// distributor_code : null
/// distributor_branch_code : null
/// allow_terminal_order_id : false
/// allow_encryption_bypass : false
/// wallet_phone_number : null
/// suspicious : 0
/// latitude : null
/// longitude : null
/// bank_staffs : {}
/// bank_rejection_reason : null
/// bank_received_documents : false
/// bank_merchant_digital_status : 0
/// bank_digital_rejection_reason : null
/// filled_business_data : true
/// day_start_time : "00:00:00"
/// day_end_time : null
/// withhold_transfers : false
/// sms_sender_name : "PayMob"
/// withhold_transfers_reason : null
/// withhold_transfers_notes : null
/// can_bill_deposit_with_card : false
/// can_topup_merchants : false
/// topup_transfer_id : null
/// referral_eligible : false
/// is_eligible_to_be_ranger : false
/// is_ranger : false
/// is_poaching : false
/// paymob_app_merchant : false
/// settlement_frequency : null
/// day_of_the_week : null
/// day_of_the_month : null
/// allow_transaction_notifications : false
/// allow_transfer_notifications : false
/// sallefny_amount_whole : 0.0
/// sallefny_fees_whole : 0.0
/// paymob_app_first_login : null
/// paymob_app_last_activity : null
/// payout_enabled : false
/// payout_terms : false
/// is_bills_new : false
/// can_process_multiple_refunds : false
/// settlement_classification : 0
/// instant_settlement_enabled : false
/// instant_settlement_transaction_otp_verified : false
/// preferred_language : null
/// ignore_flash_callbacks : false
/// acq_partner : null
/// dom : null
/// bank_related : null
/// permissions : []

class Profile {
  Profile({
    this.id,
    this.user,
    this.createdAt,
    this.active,
    this.profileType,
    this.phones,
    this.companyEmails,
    this.companyName,
    this.state,
    this.country,
    this.city,
    this.postalCode,
    this.street,
    this.emailNotification,
    this.orderRetrievalEndpoint,
    this.deliveryUpdateEndpoint,
    this.logoUrl,
    this.isMobadra,
    this.sector,
    this.is2faEnabled,
    this.activationMethod,
    this.signedUpThrough,
    this.failedAttempts,
    this.customExportColumns,
    this.serverIP,
    this.username,
    this.primaryPhoneNumber,
    this.primaryPhoneVerified,
    this.isTempPassword,
    this.otp2faSentAt,
    this.otp2faAttempt,
    this.otpSentAt,
    this.otpSentTo,
    this.otpValidatedAt,
    this.awbBanner,
    this.emailBanner,
    this.identificationNumber,
    this.deliveryStatusCallback,
    this.merchantExternalLink,
    this.merchantStatus,
    this.deactivatedByBank,
    this.bankDeactivationReason,
    this.bankMerchantStatus,
    this.nationalId,
    this.superAgent,
    this.walletLimitProfile,
    this.address,
    this.commercialRegistration,
    this.commercialRegistrationArea,
    this.distributorCode,
    this.distributorBranchCode,
    this.allowTerminalOrderId,
    this.allowEncryptionBypass,
    this.walletPhoneNumber,
    this.suspicious,
    this.latitude,
    this.longitude,
    this.bankStaffs,
    this.bankRejectionReason,
    this.bankReceivedDocuments,
    this.bankMerchantDigitalStatus,
    this.bankDigitalRejectionReason,
    this.filledBusinessData,
    this.dayStartTime,
    this.dayEndTime,
    this.withholdTransfers,
    this.smsSenderName,
    this.withholdTransfersReason,
    this.withholdTransfersNotes,
    this.canBillDepositWithCard,
    this.canTopupMerchants,
    this.topupTransferId,
    this.referralEligible,
    this.isEligibleToBeRanger,
    this.isRanger,
    this.isPoaching,
    this.paymobAppMerchant,
    this.settlementFrequency,
    this.dayOfTheWeek,
    this.dayOfTheMonth,
    this.allowTransactionNotifications,
    this.allowTransferNotifications,
    this.sallefnyAmountWhole,
    this.sallefnyFeesWhole,
    this.paymobAppFirstLogin,
    this.paymobAppLastActivity,
    this.payoutEnabled,
    this.payoutTerms,
    this.isBillsNew,
    this.canProcessMultipleRefunds,
    this.settlementClassification,
    this.instantSettlementEnabled,
    this.instantSettlementTransactionOtpVerified,
    this.preferredLanguage,
    this.ignoreFlashCallbacks,
    this.acqPartner,
    this.dom,
    this.bankRelated,
    this.permissions,
  });

  Profile.fromJson(dynamic json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    createdAt = json['created_at'];
    active = json['active'];
    profileType = json['profile_type'];
    phones = json['phones'] != null ? json['phones'].cast<String>() : [];
    companyEmails = json['company_emails'] != null
        ? json['company_emails'].cast<String>()
        : [];
    companyName = json['company_name'];
    state = json['state'];
    country = json['country'];
    city = json['city'];
    postalCode = json['postal_code'];
    street = json['street'];
    emailNotification = json['email_notification'];
    orderRetrievalEndpoint = json['order_retrieval_endpoint'];
    deliveryUpdateEndpoint = json['delivery_update_endpoint'];
    logoUrl = json['logo_url'];
    isMobadra = json['is_mobadra'];
    sector = json['sector'];
    is2faEnabled = json['is_2fa_enabled'];
    activationMethod = json['activation_method'];
    signedUpThrough = json['signed_up_through'];
    failedAttempts = json['failed_attempts'];

    serverIP = json['server_IP'];
    username = json['username'];
    primaryPhoneNumber = json['primary_phone_number'];
    primaryPhoneVerified = json['primary_phone_verified'];
    isTempPassword = json['is_temp_password'];
    otp2faSentAt = json['otp_2fa_sent_at'];
    otp2faAttempt = json['otp_2fa_attempt'];
    otpSentAt = json['otp_sent_at'];
    otpSentTo = json['otp_sent_to'];
    otpValidatedAt = json['otp_validated_at'];
    awbBanner = json['awb_banner'];
    emailBanner = json['email_banner'];
    identificationNumber = json['identification_number'];
    deliveryStatusCallback = json['delivery_status_callback'];
    merchantExternalLink = json['merchant_external_link'];
    merchantStatus = json['merchant_status'];
    deactivatedByBank = json['deactivated_by_bank'];
    bankDeactivationReason = json['bank_deactivation_reason'];
    bankMerchantStatus = json['bank_merchant_status'];
    nationalId = json['national_id'];
    superAgent = json['super_agent'];
    walletLimitProfile = json['wallet_limit_profile'];
    address = json['address'];
    commercialRegistration = json['commercial_registration'];
    commercialRegistrationArea = json['commercial_registration_area'];
    distributorCode = json['distributor_code'];
    distributorBranchCode = json['distributor_branch_code'];
    allowTerminalOrderId = json['allow_terminal_order_id'];
    allowEncryptionBypass = json['allow_encryption_bypass'];
    walletPhoneNumber = json['wallet_phone_number'];
    suspicious = json['suspicious'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    bankStaffs = json['bank_staffs'];
    bankRejectionReason = json['bank_rejection_reason'];
    bankReceivedDocuments = json['bank_received_documents'];
    bankMerchantDigitalStatus = json['bank_merchant_digital_status'];
    bankDigitalRejectionReason = json['bank_digital_rejection_reason'];
    filledBusinessData = json['filled_business_data'];
    dayStartTime = json['day_start_time'];
    dayEndTime = json['day_end_time'];
    withholdTransfers = json['withhold_transfers'];
    smsSenderName = json['sms_sender_name'];
    withholdTransfersReason = json['withhold_transfers_reason'];
    withholdTransfersNotes = json['withhold_transfers_notes'];
    canBillDepositWithCard = json['can_bill_deposit_with_card'];
    canTopupMerchants = json['can_topup_merchants'];
    topupTransferId = json['topup_transfer_id'];
    referralEligible = json['referral_eligible'];
    isEligibleToBeRanger = json['is_eligible_to_be_ranger'];
    isRanger = json['is_ranger'];
    isPoaching = json['is_poaching'];
    paymobAppMerchant = json['paymob_app_merchant'];
    settlementFrequency = json['settlement_frequency'];
    dayOfTheWeek = json['day_of_the_week'];
    dayOfTheMonth = json['day_of_the_month'];
    allowTransactionNotifications = json['allow_transaction_notifications'];
    allowTransferNotifications = json['allow_transfer_notifications'];
    sallefnyAmountWhole = json['sallefny_amount_whole'];
    sallefnyFeesWhole = json['sallefny_fees_whole'];
    paymobAppFirstLogin = json['paymob_app_first_login'];
    paymobAppLastActivity = json['paymob_app_last_activity'];
    payoutEnabled = json['payout_enabled'];
    payoutTerms = json['payout_terms'];
    isBillsNew = json['is_bills_new'];
    canProcessMultipleRefunds = json['can_process_multiple_refunds'];
    settlementClassification = json['settlement_classification'];
    instantSettlementEnabled = json['instant_settlement_enabled'];
    instantSettlementTransactionOtpVerified =
        json['instant_settlement_transaction_otp_verified'];
    preferredLanguage = json['preferred_language'];
    ignoreFlashCallbacks = json['ignore_flash_callbacks'];
    acqPartner = json['acq_partner'];
    dom = json['dom'];
    bankRelated = json['bank_related'];
    permissions = json['permissions'];
    customExportColumns = json['custom_export_columns'];
  }

  num? id;
  User? user;
  String? createdAt;
  bool? active;
  String? profileType;
  List<String>? phones;
  List<String>? companyEmails;
  String? companyName;
  String? state;
  String? country;
  String? city;
  String? postalCode;
  String? street;
  bool? emailNotification;
  dynamic orderRetrievalEndpoint;
  dynamic deliveryUpdateEndpoint;
  dynamic logoUrl;
  bool? isMobadra;
  String? sector;
  bool? is2faEnabled;
  num? activationMethod;
  num? signedUpThrough;
  num? failedAttempts;
  List<dynamic>? customExportColumns;
  List<dynamic>? serverIP;
  dynamic username;
  String? primaryPhoneNumber;
  bool? primaryPhoneVerified;
  bool? isTempPassword;
  dynamic otp2faSentAt;
  dynamic otp2faAttempt;
  String? otpSentAt;
  String? otpSentTo;
  String? otpValidatedAt;
  dynamic awbBanner;
  dynamic emailBanner;
  dynamic identificationNumber;
  String? deliveryStatusCallback;
  dynamic merchantExternalLink;
  num? merchantStatus;
  bool? deactivatedByBank;
  dynamic bankDeactivationReason;
  num? bankMerchantStatus;
  dynamic nationalId;
  dynamic superAgent;
  dynamic walletLimitProfile;
  dynamic address;
  dynamic commercialRegistration;
  dynamic commercialRegistrationArea;
  dynamic distributorCode;
  dynamic distributorBranchCode;
  bool? allowTerminalOrderId;
  bool? allowEncryptionBypass;
  dynamic walletPhoneNumber;
  num? suspicious;
  dynamic latitude;
  dynamic longitude;
  dynamic bankStaffs;
  dynamic bankRejectionReason;
  bool? bankReceivedDocuments;
  num? bankMerchantDigitalStatus;
  dynamic bankDigitalRejectionReason;
  bool? filledBusinessData;
  String? dayStartTime;
  dynamic dayEndTime;
  bool? withholdTransfers;
  String? smsSenderName;
  dynamic withholdTransfersReason;
  dynamic withholdTransfersNotes;
  bool? canBillDepositWithCard;
  bool? canTopupMerchants;
  dynamic topupTransferId;
  bool? referralEligible;
  bool? isEligibleToBeRanger;
  bool? isRanger;
  bool? isPoaching;
  bool? paymobAppMerchant;
  dynamic settlementFrequency;
  dynamic dayOfTheWeek;
  dynamic dayOfTheMonth;
  bool? allowTransactionNotifications;
  bool? allowTransferNotifications;
  num? sallefnyAmountWhole;
  num? sallefnyFeesWhole;
  dynamic paymobAppFirstLogin;
  dynamic paymobAppLastActivity;
  bool? payoutEnabled;
  bool? payoutTerms;
  bool? isBillsNew;
  bool? canProcessMultipleRefunds;
  num? settlementClassification;
  bool? instantSettlementEnabled;
  bool? instantSettlementTransactionOtpVerified;
  dynamic preferredLanguage;
  bool? ignoreFlashCallbacks;
  dynamic acqPartner;
  dynamic dom;
  dynamic bankRelated;
  List<dynamic>? permissions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['created_at'] = createdAt;
    map['active'] = active;
    map['profile_type'] = profileType;
    map['phones'] = phones;
    map['company_emails'] = companyEmails;
    map['company_name'] = companyName;
    map['state'] = state;
    map['country'] = country;
    map['city'] = city;
    map['postal_code'] = postalCode;
    map['street'] = street;
    map['email_notification'] = emailNotification;
    map['order_retrieval_endpoint'] = orderRetrievalEndpoint;
    map['delivery_update_endpoint'] = deliveryUpdateEndpoint;
    map['logo_url'] = logoUrl;
    map['is_mobadra'] = isMobadra;
    map['sector'] = sector;
    map['is_2fa_enabled'] = is2faEnabled;
    map['activation_method'] = activationMethod;
    map['signed_up_through'] = signedUpThrough;
    map['failed_attempts'] = failedAttempts;
    if (customExportColumns != null) {
      map['custom_export_columns'] =
          customExportColumns?.map((v) => v.toJson()).toList();
    }
    if (serverIP != null) {
      map['server_IP'] = serverIP?.map((v) => v.toJson()).toList();
    }
    map['username'] = username;
    map['primary_phone_number'] = primaryPhoneNumber;
    map['primary_phone_verified'] = primaryPhoneVerified;
    map['is_temp_password'] = isTempPassword;
    map['otp_2fa_sent_at'] = otp2faSentAt;
    map['otp_2fa_attempt'] = otp2faAttempt;
    map['otp_sent_at'] = otpSentAt;
    map['otp_sent_to'] = otpSentTo;
    map['otp_validated_at'] = otpValidatedAt;
    map['awb_banner'] = awbBanner;
    map['email_banner'] = emailBanner;
    map['identification_number'] = identificationNumber;
    map['delivery_status_callback'] = deliveryStatusCallback;
    map['merchant_external_link'] = merchantExternalLink;
    map['merchant_status'] = merchantStatus;
    map['deactivated_by_bank'] = deactivatedByBank;
    map['bank_deactivation_reason'] = bankDeactivationReason;
    map['bank_merchant_status'] = bankMerchantStatus;
    map['national_id'] = nationalId;
    map['super_agent'] = superAgent;
    map['wallet_limit_profile'] = walletLimitProfile;
    map['address'] = address;
    map['commercial_registration'] = commercialRegistration;
    map['commercial_registration_area'] = commercialRegistrationArea;
    map['distributor_code'] = distributorCode;
    map['distributor_branch_code'] = distributorBranchCode;
    map['allow_terminal_order_id'] = allowTerminalOrderId;
    map['allow_encryption_bypass'] = allowEncryptionBypass;
    map['wallet_phone_number'] = walletPhoneNumber;
    map['suspicious'] = suspicious;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['bank_staffs'] = bankStaffs;
    map['bank_rejection_reason'] = bankRejectionReason;
    map['bank_received_documents'] = bankReceivedDocuments;
    map['bank_merchant_digital_status'] = bankMerchantDigitalStatus;
    map['bank_digital_rejection_reason'] = bankDigitalRejectionReason;
    map['filled_business_data'] = filledBusinessData;
    map['day_start_time'] = dayStartTime;
    map['day_end_time'] = dayEndTime;
    map['withhold_transfers'] = withholdTransfers;
    map['sms_sender_name'] = smsSenderName;
    map['withhold_transfers_reason'] = withholdTransfersReason;
    map['withhold_transfers_notes'] = withholdTransfersNotes;
    map['can_bill_deposit_with_card'] = canBillDepositWithCard;
    map['can_topup_merchants'] = canTopupMerchants;
    map['topup_transfer_id'] = topupTransferId;
    map['referral_eligible'] = referralEligible;
    map['is_eligible_to_be_ranger'] = isEligibleToBeRanger;
    map['is_ranger'] = isRanger;
    map['is_poaching'] = isPoaching;
    map['paymob_app_merchant'] = paymobAppMerchant;
    map['settlement_frequency'] = settlementFrequency;
    map['day_of_the_week'] = dayOfTheWeek;
    map['day_of_the_month'] = dayOfTheMonth;
    map['allow_transaction_notifications'] = allowTransactionNotifications;
    map['allow_transfer_notifications'] = allowTransferNotifications;
    map['sallefny_amount_whole'] = sallefnyAmountWhole;
    map['sallefny_fees_whole'] = sallefnyFeesWhole;
    map['paymob_app_first_login'] = paymobAppFirstLogin;
    map['paymob_app_last_activity'] = paymobAppLastActivity;
    map['payout_enabled'] = payoutEnabled;
    map['payout_terms'] = payoutTerms;
    map['is_bills_new'] = isBillsNew;
    map['can_process_multiple_refunds'] = canProcessMultipleRefunds;
    map['settlement_classification'] = settlementClassification;
    map['instant_settlement_enabled'] = instantSettlementEnabled;
    map['instant_settlement_transaction_otp_verified'] =
        instantSettlementTransactionOtpVerified;
    map['preferred_language'] = preferredLanguage;
    map['ignore_flash_callbacks'] = ignoreFlashCallbacks;
    map['acq_partner'] = acqPartner;
    map['dom'] = dom;
    map['bank_related'] = bankRelated;
    if (permissions != null) {
      map['permissions'] = permissions?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1682133
/// username : "01068969516"
/// first_name : "Salma"
/// last_name : "Hossam El-Deen"
/// date_joined : "2023-12-10T17:38:19.210499"
/// email : "salmahossam094@gmail.com"
/// is_active : true
/// is_staff : false
/// is_superuser : false
/// last_login : null
/// groups : []
/// user_permissions : [160,116,119,115,213,137,204,118,131,122,128,127,203,123,140,139,455,454,130,266,124,259,121,133,206,125,129,136,185,146,126,604,258,135,138,205,117,120,186,132,134,277,1649]

class User {
  User({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.dateJoined,
    this.email,
    this.isActive,
    this.isStaff,
    this.isSuperuser,
    this.lastLogin,
    this.groups,
    this.userPermissions,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    dateJoined = json['date_joined'];
    email = json['email'];
    isActive = json['is_active'];
    isStaff = json['is_staff'];
    isSuperuser = json['is_superuser'];
    lastLogin = json['last_login'];
    groups = json['group'];

    userPermissions = json['user_permissions'] != null
        ? json['user_permissions'].cast<num>()
        : [];
  }

  num? id;
  String? username;
  String? firstName;
  String? lastName;
  String? dateJoined;
  String? email;
  bool? isActive;
  bool? isStaff;
  bool? isSuperuser;
  dynamic lastLogin;
  List<dynamic>? groups;
  List<num>? userPermissions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['date_joined'] = dateJoined;
    map['email'] = email;
    map['is_active'] = isActive;
    map['is_staff'] = isStaff;
    map['is_superuser'] = isSuperuser;
    map['last_login'] = lastLogin;
    if (groups != null) {
      map['groups'] = groups?.map((v) => v.toJson()).toList();
    }
    map['user_permissions'] = userPermissions;
    return map;
  }
}
