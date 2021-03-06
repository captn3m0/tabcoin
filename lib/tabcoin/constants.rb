# frozen_string_literal: true

module Tabcoin
  # rubocop:disable Metrics/ClassLength
  class Constants
    APP_UUID = "BF9ECC49507140C99F29782668B5E6CD"
    API_VERSION = "1.0"
    # One-indexed, take care
    HEADERS = [
      # h1
      :app_uuid,
      # h2
      :api_uuid,
      # h3
      :device_uuid,
      # h4
      :user_uuid,
      # h5
      :APK_Digest,
      # h6, never used afaik
      :APK_ChkSum
    ].freeze

    FIELDMAP = {
      "f1" => :ResponseCode,
      "f10" => :SMSVerificationCode,
      "f103" => :ExpiringIn,
      "f106" => :Latitude,
      "f107" => :Longitude,
      "f108" => :GeoCode,
      "f11" => :SerialNumber,
      "f111" => :ResponseCodes,
      "f113" => :IsDeleted,
      "f114" => :AccountCodes,
      "f119" => :AccountStatus,
      "f12" => :IsRegistered,
      "f120" => :UPIStatus,
      "f125" => :KeyDump,
      "f126" => :NPCIResponseCode,
      "f127" => :NPCIApprovalRefNo,
      "f128" => :IsMerchantPayment,
      "f13" => :MobileNumber,
      "f14" => :TokenChallenge,
      "f145" => :IsATMPINSupported,
      "f146" => :CredATMPIN,
      "f147" => :CredType3,
      "f148" => :CredSubType3,
      "f149" => :CredCode3,
      "f15" => :IsChallengeInitial,
      "f150" => :CredKi3,
      "f154" => :CustRef,
      "f16" => :APICode,
      "f17" => :Token,
      "f173" => :PayeeCount,
      "f174" => :PayeeCode,
      "f195" => :AllRespCodes,
      "f2" => :LanguageID,
      "f21" => :VPA,
      "f228" => :BBPSRefNo,
      "f229" => :OperatorRefNo,
      "f23" => :BankIFSCList,
      "f236" => :SMSKeyword,
      "f24" => :APICodeList,
      "f244" => :CloseStatusCall,
      "f245" => :NEFTNextWorkingDate,
      "f25" => :IsFinalStatusCheck,
      "f26" => :BankID,
      "f265" => :Code,
      "f27" => :AccountCode,
      "f278" => :IFSCBranchInfo,
      "f279" => :AIM,
      "f28" => :AccountNumber,
      "f280" => :RegistrationVideo,
      "f281" => :RegistrationTS,
      "f282" => :PinGenerationVideo,
      "f283" => :PinGenerationTS,
      "f284" => :BankBalanceVideo,
      "f285" => :BankBalanceTS,
      "f286" => :TransferMoneyVideo,
      "f287" => :TransferMoneyTS,
      "f288" => :CCBillPaymentVideo,
      "f289" => :CCBillPaymentTS,
      "f29" => :AccountType,
      "f3" => :DeviceInfo1,
      "f30" => :AccountList,
      "f304" => :IsRefershInSession,
      "f305" => :IsATMUPIPIN,
      "f306" => :HasUPIPIN,
      "f31" => :IsDefault,
      "f388" => :PromotionType,
      "f4" => :DeviceInfo2,
      "f40" => :IsBlocked,
      "f41" => :VPAName,
      "f42" => :CredsType,
      "f43" => :CredsSubType,
      "f44" => :DataType,
      "f45" => :DataLength,
      "f46" => :CredsAllowed,
      "f47" => :CardLast6,
      "f48" => :ExpMonth,
      "f49" => :ExpYear,
      "f5" => :DeviceInfo3,
      "f50" => :CredOTP,
      "f51" => :CredPIN,
      "f52" => :CredType1,
      "f53" => :CredType2,
      "f54" => :CredSubType1,
      "f55" => :CredSubType2,
      "f56" => :CredCode1,
      "f57" => :CredCode2,
      "f58" => :CredKi1,
      "f59" => :CredKi2,
      "f6" => :DeviceInfo4,
      "f60" => :TransactionID,
      "f600" => :ConnectionType,
      "f61" => :Balance,
      "f7" => :OSVersion,
      "f70" => :VersionNo,
      "f75" => :Amount,
      "f8" => :DeviceManufacturer,
      "f83" => :CredNPIN,
      "f88" => :Description,
      "f89" => :ActivityUUID,
      "f9" => :DeviceModelNumber,
      "f90" => :TransactionStatus,
      "f91" => :AccountCode2,
      "f92" => :AccountName,
      "f93" => :AccountIFSC,
      "f94" => :TransactionMCC,
      "f95" => :TransactionRefID,
      "f96" => :TransactionMinimumAmount,
      "f97" => :TransactionRefUrl,
      "f98" => :IsPay,
      "f273" => :Unknown,
      "f117" => :SkipTransactions,
      "f104" => :Transactions,
      "f156" => :TransactionCount,
      "f100" => :VPA2,
      "f116" => :DateTime,
      "f102" => :DateTime,
      "f101" => :PayerName,
      "f99" => :TxnType,

      # Some responses contain headers
      "h1" => :app_uuid,
      "h2" => :api_uuid,
      "h3" => :device_uuid,
      "h4" => :user_uuid,
      "h5" => :APK_Digest,
      "h6" => :APK_ChkSum
    }.freeze
  end
  # rubocop:enable Metrics/ClassLength
end
