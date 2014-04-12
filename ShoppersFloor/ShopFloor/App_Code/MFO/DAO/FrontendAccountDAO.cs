using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.IO;
using System.Drawing;
using MFO.Common;
/// <summary>
/// Summary description for FrontendAccount
/// </summary>
/// 
namespace MFO.DAO
{
    public class FrontendAccountDAO
    {
        public int? FrontEndAddNewShippingAddress(IDictionary<string, string> paramDic)
        {
            return GenericDAO.executeProcedure("sp_FrontEnd_NewShippingAddress_Master", paramDic);
        }

        public int? FrontEndUpdateShippingAddress(Dictionary<string, string> paramDic)
        {
            return GenericDAO.executeProcedure("sp_FrontEnd_UpdateNewShippingAddress_Master", paramDic);
        }
        #region UpdateShippingAddress
        public int? UpdateShippingAddress(Dictionary<string, string> paramDic)
        {
            return GenericDAO.executeProcedure("sp_FrontEnd_UpdateShippingAddress", paramDic);
        }
        #endregion
        #region UpdateBillingAddress
        public int? UpdateBillingAddress(Dictionary<string, string> paramDic)
        {
            return GenericDAO.executeProcedure("sp_FrontEnd_UpdateBillingAddress", paramDic);
        }
        #endregion
        #region UpdateEmailPreferences
        public int? FrontEndUpdateEmailPreferences(Dictionary<string, string> paramDic)
        {
            return GenericDAO.executeProcedure("sp_UpdateFrontEndEmailPreferences", paramDic);
        }
        public DataTable UpdateCheckEmailPreferences(int userid)
        {
            return GenericDAO.getDataTable("select * from View_EmailPreferences_Master Where UserID='" + userid + "'");
        }
        #endregion

        public DataTable getCredits(int userid)
        {
           
            return GenericDAO.getDataTable("select UserCredit from View_NewShippingAddress_Master where UserID= " + userid + "");
        }

        public DataTable getaccountdetails(int userid)
        {
            return GenericDAO.getDataTable("select *, SUBSTRING(DateofBirth,3,2) AS [month], SUBSTRING(DateofBirth,1,2) AS [day],SUBSTRING(DateofBirth,5,8) AS [year] from View_UserRegistration where UserID='" + userid + "'");
        }
        public DataTable getpassword(string password, int userid)
        {
            return GenericDAO.getDataTable("select * from View_UserRegistration where Password='" + password + "' and UserID='" + userid + "'");
        }
        public DataTable getwaitlistdata(string userId)
        {
            return GenericDAO.getDataTable("Select * From View_AddToWaitList_Master where UserID='" + userId + "'");
        }
        public DataTable getdetailforaddtocard(int wishListId)
        {
            return GenericDAO.getDataTable("select * from View_AddToWaitList_Master where AddToWaitListID =" + wishListId);
        }
        public int getQuantity(String pid)
        {
            int i = 0;
            Object obj = GenericDAO.scalarQuery("select Inventory from View_ImageProductNew_Master where ImageNewID =" + pid);
            if (obj != null)
                i = Convert.ToInt32(Convert.ToDecimal(obj.ToString()));
            return i;
        }
        public DataTable getspecialoffer()
        {
            return GenericDAO.getDataTableByTableName("View_SpecialOffer_Master");
        }
        public DataTable getallcountry()
        {
            return GenericDAO.getDataTableByTableName("View_CountryMaster");
        }

        public DataTable getcountryById(string country)
        {
            return GenericDAO.getDataTable("select * from View_CountryMaster where CountryName ='" + country + "'");
        }
        public DataTable getstateById(string state, string country)
        {
            return GenericDAO.getDataTable("select * from View_StateMaster where CountryName ='" + country + "' and StateName='" + state + "'");
        }

        public DataTable getcitystatecountrybypincode1(string pincode)
        {
            return GenericDAO.getDataTable("select * from PinCodeLocation_Master where PinCodeLocation_PinCode='" + pincode + "'");
        }
        public DataTable getcountryidonselectedindexchange(string countryname)
        {
            return GenericDAO.getDataTable("select * from View_CountryMaster where CountryName='" + countryname + "'");
        }
        public DataTable getAllState()
        {
            return GenericDAO.getDataTable("select * from View_StateMaster order by StateName asc");
        }
        public DataTable getstateidonselectedindexchange(string statename)
        {
            return GenericDAO.getDataTable("select * from View_StateMaster where StateName='" + statename + "'");
        }
        public DataTable getallday()
        {
            return GenericDAO.getDataTableByTableName("View_Days_Master");
        }
        public DataTable getallmonth()
        {
            return GenericDAO.getDataTableByTableName("View_Month_Master");
        }
        public DataTable getallyear()
        {
            return GenericDAO.getDataTableByTableName("View_Years_Master");
        }
        #region Order
        public DataTable getorderdetails(string orderid)
        {
            return GenericDAO.getDataTable("select *  from View_ProductOrder where OrderNo='" + orderid + "'");
        }
        #endregion
    }
}