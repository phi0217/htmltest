package controller.externalaccount;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;

/**
 * Created by Phi on 2017/6/16.
 */
@Controller
@RequestMapping(value = "/fund/externalaccount")
public class ExternalAccountController {

    @ResponseBody
    @RequestMapping(value = "/inputExternalAccountNew")
    public String inputExternalAccountNew(@RequestParam(value = "externalAccountName", required = false) String externalAccountName,
                                          @RequestParam(value = "externalAccount", required = false) String externalAccount,
                                          @RequestParam(value = "currency", required = false) String currency,
                                          @RequestParam(value = "holderAccount", required = false) String holderAccount,
                                          @RequestParam(value = "memberId", required = false) String memberId,
                                          @RequestParam(value = "fundTypeCode", required = false) String fundTypeCode,
                                          @RequestParam(value = "fundTypeName", required = false) String fundTypeName,
                                          @RequestParam(value = "billFlag", required = false) Integer billFlag,
                                          @RequestParam(value = "selfWithdrawalRight", required = false) Integer selfWithdrawalRight,
                                          @RequestParam(value = "autoWithdrawalRight", required = false) Integer autoWithdrawalRight,
                                          @RequestParam(value = "insideTransfRight", required = false) Integer insideTransfRight,
                                          @RequestParam(value = "transfPayRight", required = false) Integer transfPayRight,
                                          @RequestParam(value = "getAutoRight", required = false) Integer getAutoRight,
                                          @RequestParam(value = "getMinAmount", required = false) Integer getMinAmount,
                                          @RequestParam(value = "getRemainBalance", required = false) BigDecimal getRemainBalance,
                                          @RequestParam(value = "getFundPath", required = false) String getFundPath,
                                          @RequestParam(value = "getAccountNo", required = false) String getAccountNo,
                                          @RequestParam(value = "putAutoRight", required = false) Integer putAutoRight,
                                          @RequestParam(value = "putMinAmount", required = false) BigDecimal putMinAmount,
                                          @RequestParam(value = "putRemainBalance", required = false) BigDecimal putRemainBalance,
                                          @RequestParam(value = "putFundPath", required = false) String putFundPath,
                                          @RequestParam(value = "putAccountNo", required = false) String putAccountNo,
                                          @RequestParam(value = "agenDeliverHolderAccount", required = false) String agenDeliverHolderAccount,
                                          @RequestParam(value = "agenDeliverHolderShortName", required = false) String agenDeliverHolderShortName,
                                          @RequestParam(value = "loanLimit", required = false) BigDecimal loanLimit,
                                          @RequestParam(value = "loanInterestFlag", required = false) Integer loanInterestFlag,
                                          @RequestParam(value = "loanInterestPeriod", required = false) Integer loanInterestPeriod,
                                          @RequestParam(value = "loanIrstDay", required = false) String loanIrstDay,
                                          @RequestParam(value = "loanIrstPayAccnt", required = false) String loanIrstPayAccnt,
                                          @RequestParam(value = "irstFlag", required = false) Integer irstFlag,
                                          @RequestParam(value = "irstReceiveAccountNo", required = false) String irstReceiveAccountNo,
                                          @RequestParam(value = "changeNoticeFlags", required = false) String changeNoticeFlags,
                                          @RequestParam(value = "remark", required = false) String remark){
        return null;
    }
    @RequestMapping(value = "/modifyExternalAccountNew")
    public String modifyExternalAccountNew(){
        return null;
    }
    @RequestMapping(value = "/deleteExternalAccountNew")
    public String deleteExternalAccountNew(){
        return null;
    }
    @RequestMapping(value = "/auditExternalAccountNew")
    public String auditExternalAccountNew(){
        return null;
    }
    @RequestMapping(value = "/inputExternalAccountUpdate")
    public String inputExternalAccountUpdate(){
        return null;
    }
    @RequestMapping(value = "/modifyExternalAccountUpdate")
    public String modifyExternalAccountUpdate(){
        return null;
    }
    @RequestMapping(value = "/deleteExternalAccountUpdate")
    public String deleteExternalAccountUpdate(){
        return null;
    }
    @RequestMapping(value = "/auditExternalAccountUpdate")
    public String auditExternalAccountUpdate(){
        return null;
    }
    @RequestMapping(value = "/inputExternalAccountDrop")
    public String inputExternalAccountDrop(){
        return null;
    }
    @RequestMapping(value = "/deleteExternalAccountDrop")
    public String deleteExternalAccountDrop(){
        return null;
    }
    @RequestMapping(value = "/auditExternalAccountDrop")
    public String auditExternalAccountDrop(){
        return null;
    }
    @RequestMapping(value = "/inputExternalAccountFundTypeUpdate")
    public String inputExternalAccountFundTypeUpdate(){
        return null;
    }
    @RequestMapping(value = "/modifyExternalAccountFundTypeUpdate")
    public String modifyExternalAccountFundTypeUpdate(){
        return null;
    }
    @RequestMapping(value = "/deleteExternalAccountFundTypeUpdate")
    public String deleteExternalAccountFundTypeUpdate(){
        return null;
    }
    @RequestMapping(value = "/auditExternalAccountFundTypeUpdate")
    public String auditExternalAccountFundTypeUpdate(){
        return null;
    }
    @RequestMapping(value = "/inputExternalAccountLoanLimitUpdate")
    public String inputExternalAccountLoanLimitUpdate(){
        return null;
    }
    @RequestMapping(value = "/modifyExternalAccountLoanLimitUpdate")
    public String modifyExternalAccountLoanLimitUpdate(){
        return null;
    }
    @RequestMapping(value = "/deleteExternalAccountLoanLimitUpdate")
    public String deleteExternalAccountLoanLimitUpdate(){
        return null;
    }
    @RequestMapping(value = "/auditExternalAccountLoanLimitUpdate")
    public String auditExternalAccountLoanLimitUpdate(){
        return null;
    }
    @RequestMapping(value = "/queryExternalAccount")
    public String queryExternalAccount(){
        return null;
    }
}
