using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MFO.Commom;
using System.Collections;
using MFO.Utils;
using MFO.services;
using SFloor.DAO;
using MFO.Constants;
using MFO.Loggers;

/// <summary>
/// Summary description for Class1
/// </summary>
/// 
namespace SFloor.Services
{

    public static class EmailTemplateService
    {

        public static void sendOrderPlacedEmail()
        {
            Logger.Info("START EmailTemplateService.sendOrderPlacedEmail()");
            try
            {
                string orderId = HttpContext.Current.Session[Constant.Session.CURRENT_ORDER] + "";
                Logger.Debug("orderId" + orderId);
                DataTable orderDT = OrderDAO.getOrder(orderId);
                DataTable orderDetailsDT = OrderDAO.getOrderDetails(orderId);
                DataTable shippingDT = ShippingDAO.getShipping(orderDT.Rows[0]["SHIPPING_ID"] + "");
                String emailSendTo = shippingDT.Rows[0]["EMAIL"] + "";
                Logger.Debug("emailSendTo" + emailSendTo);
                if (!CommonUtil.DT.isEmptyOrNull(orderDT))
                {
                    IDictionary context = new Hashtable();
                    context.Add("CUSTOMER", shippingDT.Rows[0]["NAME"] + "");
                    context.Add("ORDER_DATE", DateTime.Now + "");
                    context.Add("ORDER_NO", orderDT.Rows[0]["ORDER_NO"] + "");
                    context.Add("PAYMINT_MODE", orderDT.Rows[0]["PAYMINT_METHOD"]);
                    context.Add("EMAIL", emailSendTo);
                    context.Add("MOBILE", shippingDT.Rows[0]["MOBILE"] + "");
                    context.Add("ADDRESS", shippingDT.Rows[0]["ADDRESS"] + "");
                    context.Add("CITY", shippingDT.Rows[0]["CITY"] + "");
                    context.Add("STATE", shippingDT.Rows[0]["STATE"] + "");
                    context.Add("PIN", shippingDT.Rows[0]["PIN"] + "");
                    context.Add("COUNTRY", "India.");
                    context.Add("CC_NO ", ConfigUtil.CC_NO);
                    context.Add("CC_EMAIL ", ConfigUtil.CC_Email);
                    Logger.Debug("CustomerCareNo = " + ConfigUtil.CC_NO);
                    Logger.Debug("CustomerCareEmail = " + ConfigUtil.CC_Email);
                    Logger.Debug("context.CUSTOMER_CARE_NO = " + context["CC_NO"]);
                    Logger.Debug("context.CUSTOMER_CARE_EMAIL = " + context["CC_EMAIL"]);
                    Logger.Debug("context.PIN = " + context["PIN"]);

                    context.Add("SHIPPING_CHARGE", ConfigUtil.getValue("ShippigCharge"));
                    context.Add("SUBTOTAL", orderDT.Rows[0]["AMOUNT"]);
                    context.Add("VAT", orderDT.Rows[0]["VAT"]);
                    context.Add("TOTAL", orderDT.Rows[0]["TOTAL_AMOUNT"]);
                    List<object> orderList = new List<object>();
                    foreach (DataRow orderRow in orderDetailsDT.Rows)
                    {
                        orderList.Add(new
                        {
                            NAME = orderRow["SKUName"],
                            BRAND = orderRow["SKUBrand"],
                            QTY = orderRow["QTY"],
                            COLOR = orderRow["Color"],
                            SIZE = orderRow["Size"],
                            TOTAL = orderRow["TOTAL"],
                            SKU = orderRow["SKU"],
                            UNIT_PRICE = orderRow["UNIT_PRICE"],
                            IMG = ConfigUtil.getServerPath() + "" + orderRow["PathInternaldetailsSmallImage"],
                        });
                    }
                    context.Add("ALL_PRODUCT", orderList);
                    Logger.Debug("orderList:- " + orderList.Count);
                    String html = CommonUtil.readTemlate("orderPlaced.vm", context);
                    Logger.Debug("template file:- "+html);
                    EmailService.SendMail(ConfigUtil.MailFrom, emailSendTo, "Order Confirmation - Order ID - " + orderDT.Rows[0]["ORDER_NO"], html);
                    EmailService.SendMail(ConfigUtil.MailFrom, ConfigUtil.getValue("OrderTrakerEmail"), "Order Confirmation - Order ID - " + orderDT.Rows[0]["ORDER_NO"], html);
                }

            }
            catch (Exception e) {
                Logger.Info("error occur "+e);
                Logger.Error(e);

            }
            Logger.Info("End EmailTemplateService.sendOrderPlacedEmail()");
        }
        public static Dictionary<String, String> sendForgetPasswordEmail(String email)
        { 
            Dictionary<String,String> responseDic= new Dictionary<String,String>();
              
                String emailSendTo = email;
                DataTable dt = AjaxService.getUser(email);
                if (!CommonUtil.DT.isEmptyOrNull(dt))
                {
                    IDictionary context = new Hashtable();
                    context.Add("USER_ID", dt.Rows[0]["EMAIL"] + "");
                    context.Add("PASSWORD", dt.Rows[0]["PASSWORD"] + "");
                    String html = CommonUtil.readTemlate("forgetPassword.vm", context);
                    EmailService.SendMail(ConfigUtil.MailFrom, emailSendTo, "Forget Password Response", html);
                    responseDic.Add("info", "UserId and Password has been sent to Your e-Mail ID. \n Please Check Your e-Mail");

                }
                else
                {
                    responseDic.Add("error", "Oops!! Email is not Registered.");

                }
 
              return responseDic;
        }
    }
}