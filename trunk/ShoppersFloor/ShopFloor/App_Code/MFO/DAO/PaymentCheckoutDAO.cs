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
/// Summary description for PaymentCheckoutClass
/// </summary>
/// 
namespace MFO.DAO
{
    public class PaymentCheckoutDAO
    {

        public DataTable getnormaladdressdetails()
        {
            return GenericDAO.getDataTable("select * from View_NewShippingAddress_Master where AddressType='Normal'");
        }
        public DataTable getdefaultaddressdetails(int userid)
        {
            return GenericDAO.getDataTable("select * from View_NewShippingAddress_Master where UserID='" + userid + "'");
        }
        public DataTable getnewshippingaddressdetails(int userid)
        {
            return GenericDAO.getDataTable("select * from View_NewShippingAddress_Master where UserID='" + userid + "'");
        }
        #region checkdefaultaddress
        public DataTable checkdefaultaddress(int userid)
        {
            Dictionary<String, String> paramDic = new Dictionary<String, String>();
            paramDic.Add("@UserID", userid.ToString());
            return GenericDAO.getTableByProcedure("sp_Fronend_CheckDefaultAddress", paramDic);

        }
        #endregion
    }
}