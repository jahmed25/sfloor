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
/// Summary description for FrontendCategories
/// </summary>
/// 
namespace MFO.DAO
{
    public class FrontendCategoriesDAO
    {

        public DataTable getbrandname(string SKUCategory, string SKUCategoryType)
        {
            return GenericDAO.getDataTable("select distinct(SKUBrand) from View_ImageProductNew_Master where CategoryID = '" + SKUCategory + "' and CategoryTypeID = '" + SKUCategoryType + "' and SKUStatus='Active' and RecordStatus='1'");
        }
        public DataTable getbrandnameleft(string SKUCategory, string SKUCategoryType)
        {
            return GenericDAO.getDataTable("select distinct(SKUBrand) from View_ImageProductNew_Master where CategoryID = '" + SKUCategory + "' and SKUCategoryType = '" + SKUCategoryType + "'");
        }
    }
}