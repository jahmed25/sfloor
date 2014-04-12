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


/// <summary>
/// Summary description for SiteMapClass
/// </summary>
/// 
namespace MFO.DAO
{
    public class SiteMapClass
    {
        SqlConnection con = null;
        SqlCommand cmd = null;
        string qrystr = string.Empty;
        SqlDataReader dr = null;
        string constring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
        public SiteMapClass()
        {
            con = new SqlConnection(constring);
            cmd = new SqlCommand();
            cmd.Connection = con;
        }
        public DataTable getsitemapcategorydata()
        {
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select distinct(SKUCategoryType),SKUStatus from View_ImageProductNew_Master where SKUCategoryType is not null and SKUStatus='Active' and SKUCategoryType !='' order by SKUCategoryType";
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds.Tables[0];
            }
        }
        public DataTable getsitemapbranddataA(string Brand)
        {
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT distinct(SKUBrand) from View_ImageProductNew_Master Where SKUBrand like '" + Brand + "%' and SKUStatus='Active' and SKUBrand is not null and SKUBrand !='' order by SKUBrand";
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds.Tables[0];
            }
        }
        public DataTable getsitemapcategorybranddataA(string Category, string Brand)
        {
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT  distinct(SKUBrand) from View_ImageProductNew_Master Where SKUCategoryType='" + Category + "' and SKUBrand like '" + Brand + "%' and SKUStatus='Active' and SKUBrand is not null and SKUBrand !='' order by SKUBrand";
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds.Tables[0];
            }
        }
    }
}