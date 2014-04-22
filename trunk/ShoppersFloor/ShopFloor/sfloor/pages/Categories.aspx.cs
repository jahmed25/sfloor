using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Drawing;
using System.Collections.Specialized;
using System.Net.Mail;
using System.IO;
using System.Collections.Generic;
using MFO.DAO;
using MFO.Commom;
using MFO.Loggers;
using MFO.Services;
using MFO.Constants;
using MFO.Utils;
public partial class Categories : System.Web.UI.Page
{

    DataTable dt = null;
    public string catUrl;
    public string catName;
    public string subCatUrl;
    public string subCatName;
    public string pTypeUrl;
    public string pTypeName;
    public string hostURL = ConfigUtil.hostURL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
             BindGrid();
        }
    }
    private void BindGrid()
    {

        String productType = Request.Params["Pid"] == null ? null : Request.Params["Pid"].Trim();
        String catType = Request.Params["CategoryType"] == null ? null : Request.Params["CategoryType"].Trim();
        if (!StringUtil.isNullOrEmpty(productType))
        {
            dt = CategoriesService.getProductByPTypeId(productType,1);
            if (!CommonUtil.DT.isEmptyOrNull(dt))
            {
                PType = productType;
            }
        }
        else if (!StringUtil.isNullOrEmpty(catType))
        {
            dt = CategoriesService.getProductByCatType(catType,1);
        }
        CommonUtil.DtNullCheck(dt);
        if (null != dt && dt.Rows.Count > 0)
        {
            fillCategory(dt);
            fillCategoryNamePanal();
            fillBrandPanal();
        }
        String pType = getProductType();
        //if (!"".Equals(pType))
        //{
        //    base.Master.Page.Title = "Buy " + lnkbtn_category.Text + " " + pType + " Online in India | Megafactoryoutlet.com";
        //    base.Master.Page.MetaKeywords = "" + pType + ", Buy " + pType + ", Buy " + lnkbtn_category.Text + " " + pType + ", Shop " + pType + ", Megafactoryoutlet, Megafactoryoutlet.com ";
        //}
        //else
        //{
        //    base.Master.Page.Title = "Buy " + lnkbtn_category.Text + " " + lnkbtn_categorytype.Text + " Online in India - " + lnkbtn_categorytype.Text + " For " + lnkbtn_category.Text + " | Megafactoryoutlet.com";
        //    base.Master.Page.MetaKeywords = "" + lnkbtn_category.Text + " " + lnkbtn_categorytype.Text + " , " + lnkbtn_categorytype.Text + " For " + lnkbtn_category.Text + " , " + lnkbtn_categorytype.Text + " , Megafactoryoutlet.com ";

        //}

    }
    private void fillCategory(DataTable dt)
    {
        categories.DataSource = addColm(dt).DefaultView;
        categories.DataBind();
        
        catName = dt.Rows[0]["SKUCategory"]+"";
        catUrl = ConfigUtil.hostURL() + StringUtil.urlEncode(catName);

        subCatName = dt.Rows[0]["SKUCategoryType"] + "";
        subCatUrl = catUrl + "/" + StringUtil.urlEncode(subCatName);

        if (Request.Params["Pid"] != null)
        {
            pTypeName = dt.Rows[0]["SKUProductType"] + "";
            pTypeUrl = subCatUrl + "/"+ StringUtil.urlEncode(pTypeName);;
        }
    }
    private void fillBrandPanal()
    {
        DataTable dt2 = CategoriesService.getDistictProductByBrand(dt.Rows[0]["CategoryTypeID"]+"");
        if (!CommonUtil.DT.isEmptyOrNull(dt2))
        {
            datalist_brandname.DataSource = dt2;
            datalist_brandname.DataBind();
        }
       
    }
   
    public void fillCategoryNamePanal()
    {
        if (!StringUtil.isNullOrEmpty(this.dt.Rows[0]["CategoryTypeID"] + "")) 
        {

            DataTable dt = CategoriesService.getDistictProductByCatType(this.dt.Rows[0]["CategoryTypeID"] + "");
            CommonUtil.DtNullCheck(dt);
            if (dt.Rows.Count > 0)
            {
                datalist_categoryname.DataSource = dt;
                String str = "";                         // Using this String and loop for MetaDescription
                for (int i = 0; i < dt.Rows.Count; i++)
                {

                    str += dt.Rows[i]["SKUProducttype"] + " , ";
                }
                str = str.Substring(0, str.Length - 1);
                if (Session["SKUProducttype"] == null)
                {
                    Session.Add("SKUProducttype", str);
                }
                else
                {
                    Session["SKUProducttype"] = str;
                }

                dt.Columns.Add("url", typeof(string));

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    dt.Rows[i]["url"] = removeAND(dt.Rows[i]["SKUProductType"] as String);
                }
                datalist_categoryname.DataSource = dt;
                datalist_categoryname.DataBind();
                MainCatHeader.InnerHtml = (String)dt.Rows[0]["SKUCategoryType"];


                String pType = getProductType();
                //if (!"".Equals(pType))
                //    base.Master.Page.MetaDescription = " Shop " + lnkbtn_category.Text + " " + pType + " online at best price in India. Free Shipping, Cash on Delivery, 30 Days-Return Policy, 24x7 Customer Support at Megafactoryoutlet.com";
                //else
                //   // base.Master.Page.MetaDescription = " Shop " + lnkbtn_category.Text + " " + lnkbtn_categorytype.Text + " online at best price in India. Get branded " + str + " online in India ";

            }
            else
            {
                lblmessage.Visible = true;
                lblmessage.Text = "Data is not available.";
            }

        }
       
    }
    
    String removeAND(String baseStr)
    {
       
            String first = Request.RawUrl.Split('/')[1].Replace(" ", "-").Replace("&", "").Replace("--", "-");
            String sec = Request.RawUrl.Split('/')[2].Replace(" ", "-").Replace("&", "").Replace("--", "-");
            baseStr = baseStr.Replace(" ", "-").Replace("&", "").Replace("--", "-");


            return ConfigUtil.hostURL() + first + "/" + sec + "/" + baseStr;
      
    }
    DataTable addColm(DataTable dt)
    {
        Logger.Info("Start addColm()");
        dt.Columns.Add("link", typeof(string));
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            String hRef = ConfigUtil.hostURL();
            String brand = dt.Rows[i]["SKUBrand"] as String;

            hRef += "" + brand.Replace(".","");          
            hRef += "-" + dt.Rows[i]["SKUName"] as String;
            hRef = hRef.Replace(" ", "-").Replace("&", "").Replace("--", "-");
            hRef += "?htm=" + dt.Rows[i]["SKUCode"] as String;
            dt.Rows[i]["link"] = hRef;
            
        }
       
        Logger.Info("End addColm()");
        
        return dt;
    }
    private String _PType;
    public String PType
    {
        get { return _PType; }
        set { _PType = value; }
    }
    string getProductType()
    {
        String pType = "";
        String[] url = Request.RawUrl.Split('/');
        if (url.Length == 4)
        {
            pType = url[3];
        }
        return pType;
       
    }
    
}
