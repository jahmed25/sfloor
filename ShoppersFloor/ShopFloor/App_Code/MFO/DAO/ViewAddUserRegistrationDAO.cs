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
/// Summary description for viewadduserregistration

namespace MFO.DAO
{
    public class ViewAddUserRegistrationDAO
    {

        #region updateuserinformation
        public int? frontupdateuserinformation(Dictionary<string, string> paramDic)
        {
            return GenericDAO.executeProcedure("sp_UpdateFrontEndAccountInformation", paramDic);
        }
        #endregion
        #region updateuseraddress
        public int? frontupdateuseraddress(Dictionary<string, string> paramDic)
        {
            return GenericDAO.executeProcedure("sp_FrontEnd_UpdateBillingAddress", paramDic);
        }
        #endregion
        #region updatepassword
        public int? frontupdateuserpassword(Dictionary<string, string> paramDic)
        {
            return GenericDAO.executeProcedure("sp_UpdateFrontEndUserPassword", paramDic);
        }
        public int? frontupdateaccountuserpassword(Dictionary<string, string> paramDic)
        {
            return GenericDAO.executeProcedure("sp_UpdateFrontEndAccountUserPassword", paramDic);
        }
        #endregion
    }
}