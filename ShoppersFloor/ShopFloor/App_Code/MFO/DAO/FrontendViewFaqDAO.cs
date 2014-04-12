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
/// Summary description for FrontendViewFaq


namespace MFO.DAO
{
    public class FrontendViewFaqDAO
    {

        public DataTable getgeneralqueriesfaq()
        {
            return GenericDAO.getDataTable("select * from View_FAQ_Master where FaqTypeName='General Queries'");
        }
        public DataTable getregistrationfaq()
        {
            return GenericDAO.getDataTable("select * from View_FAQ_Master where FaqTypeName='Registration'");
        }
        public DataTable getmerchandisefaq()
        {
            return GenericDAO.getDataTable("select * from View_FAQ_Master where FaqTypeName='Merchandise'");
        }
        public DataTable getpaymentfaq()
        {
            return GenericDAO.getDataTable("select * from View_FAQ_Master where FaqTypeName='Payment'");
        }
        public DataTable getcancellationandreturnsfaq()
        {
            return GenericDAO.getDataTable("select * from View_FAQ_Master where FaqTypeName='Cancellation / Returns'");
        }
        public DataTable getshippingfaq()
        {
            return GenericDAO.getDataTable("select * from View_FAQ_Master where FaqTypeName='Shipping'");

        }
        public DataTable getquestionanswerfaq(int faqid)
        {
            return GenericDAO.getDataTable("select * from View_FAQ_Master where FAQID='" + faqid + "'");
        }
        public DataTable getsearchquestion(string question)
        {
            return GenericDAO.getDataTable("select * from View_FAQ_Master where Question like'%" + question + "%'");
        }
    }
}