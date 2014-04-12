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
/// Summary description for CashOnDelivery
/// </summary>
/// 
namespace MFO.DAO
{
    public class CashOnDeliveryDAO
    {

        public DataTable getcashondeliverydetails(int userid, int orderno)
        {
            Dictionary<string, string> colDic = new Dictionary<string, string>();
            colDic.Add("UserID", userid.ToString());
            colDic.Add("OrderNo", orderno.ToString());
            return GenericDAO.getDataTableByAndClause("View_ProductOrder", colDic);
        }
    }
}