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
/// Summary description for FrontendUserRegister
/// </summary>
/// 
namespace MFO.DAO
{
    public class FrontendUserRegisterDAO
    {

        #region frontuserregistration
        public int? FrontEndNewUserRegister(Dictionary<string, string> paramDic)
        {
            return GenericDAO.executeProcedure("sp_FrontEndUserRegistration", paramDic);
        }
        #endregion
        #region frontuseremailpreferences
        public int? FrontEndAddEmailPreferences(Dictionary<string, string> paramDic)
        {
            return GenericDAO.executeProcedure("sp_FrontEndAddEmailPreferences", paramDic);
        }
        #endregion
        public DataTable getcancelorder(string forgotemailid)
        {
            return GenericDAO.getDataTable("select * from AddToCart_Master where AddToCart_UserID ='" + forgotemailid + "'");
        }

        #region checkemailiduserregister
        public DataTable checkemailiduserregister(string emailid)
        {
            //Dictionary<string, string> paramDic = new Dictionary<string, string>();
            //paramDic.Add("@EmailID", emailid);
            return GenericDAO.getDataTable("Select * from View_UserRegistration where EmailId='"+emailid+"'");
        }
        public DataTable getforgotpassworduserid(string forgotemailid)
        {
            return GenericDAO.getDataTable("select * from View_UserRegistration where EmailId='" + forgotemailid + "'");
        }
        public DataTable getforgotpassworduser(string forgotemailid)
        {
            return GenericDAO.getDataTable("select * from View_UserRegistration where EmailId='" + forgotemailid + "'");
        }
        #endregion
    }
}