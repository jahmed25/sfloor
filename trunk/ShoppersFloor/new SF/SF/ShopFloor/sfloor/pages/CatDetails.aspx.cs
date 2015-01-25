﻿using System;
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
using System.Text.RegularExpressions;
using System.Collections.Generic;
using MFO.DAO;
using MFO.Commom;
using MFO.services;
using MFO.Services;
using MFO.Constants;
using MFO.Utils;
using MFO.Common;
using SFloor.Services;
using SFloor.Pages;

public partial class sfloor_CatDetails : GenericPage
{
    public string style;
    public string SKUClassification, VariantType;
    public string qty;
    public string size;
    public string color;
    public string isSize;
    public string isColor;
    public string isSku;
    public string avalibilty = "In Stock";
    public int? inventory = 0;
    public int index = 1;
    protected DataTable dt = new DataTable();
    protected DataTable relProductDT = new DataTable();
    protected DataTable recentProductTD = new DataTable();
    protected DataTable sizeDT = null;
    protected DataTable colorDT = null;

    public override void load(object sender, EventArgs e)
    {
        style = Request.QueryString["htm"];
        applypagging();
        qty = Request.QueryString["qty"];
        size = Request.QueryString["size"];
        color = Request.QueryString["color"];
        isSize = Request.QueryString["isSize"];
        isColor = Request.QueryString["isColor"];
        isSku = Request.QueryString["isSku"];
        updateRecentView(style);
        if (!IsPostBack)
        {
            dt = CategoryDetailsService.getDTBySKU(style);
            fillproductdetails();
            fillReatedProductType();
            fillRecentView();
        }

    }

    private void applypagging()
    {
        if(Request.QueryString["action"]!=null)
        {
         index=Int32.Parse(Request.QueryString["index"]);
            if("prev".Equals(Request.QueryString["action"])&&index==0)
            {
                string [] str = CatDetailsService.getRelLastProduct(Request.QueryString["htm"]);
                style = str[0];
                index = Int32.Parse(str [1]);

            }
            else if("next".Equals(Request.QueryString["action"]))
            {
                index = index + 1;
                string[] str = CatDetailsService.getRelProductDT(Request.QueryString["htm"], index);
                style = str[0];
                index = Int32.Parse(str[1]);

            }
            else{
                string[] str = CatDetailsService.getRelProductDT(Request.QueryString["htm"], index);
                style = str[0];
                index = Int32.Parse(str[1]);
            }
        }
        
    }
    private void updateRecentView(string skuOrStyle)
    {
        int? pId = new FrontViewProductDetailsDAO().getProductIDBySkuOrStyle(skuOrStyle);
        String userId = Session["UserID"] == null ? "" : Session["UserID"].ToString();
        String ip = CommonUtil.GetUser_IP();
        RecentViewDAO.addRecentViewItems(pId, userId, ip, DateTime.Now);
    }

    public void fillproductdetails()
    {
        style = dt.Rows[0]["StyleCode"] + "".Trim() == "" ? dt.Rows[0]["SKUCode"] + "".Trim() : dt.Rows[0]["StyleCode"] + "";
        isSize = "Size".Equals(dt.Rows[0]["VariantType"] + "") ? "true" : "false";
        if (!StringUtil.isNullOrEmpty(style))
        {
            if ("true".Equals(isSize))
                sizeDT = CatDetailsService.getSizeDT(style, true);
            colorDT = CatDetailsService.getColorDT(style, true);
        }
        else
        {
            if ("true".Equals(isSize))
                sizeDT = CatDetailsService.getSizeDT(style, false);
                colorDT = CatDetailsService.getColorDT(dt.Rows[0]["SKUCode"] + "", false);
        }
        if (!CommonUtil.DT.isEmptyOrNull(colorDT))
            color = colorDT.Rows[0]["Color"] + "";
        isColor = CommonUtil.DT.isEmptyOrNull(colorDT) ? "false" : "true";
        isSku=StringUtil.isNullOrEmpty(dt.Rows[0]["StyleCode"] + "")?"false":"true";
        inventory = AjaxService.getInventory(dt.Rows[0]["SKUCode"] + "");
        if (inventory == 0)
        {
            avalibilty = "Sold Out.";
        }
    }

    public void fillReatedProductType() 
    {
        relProductDT = CatDetailsService.getRelProductDT(dt.Rows[0]["SKUProductType"]+"");
    }
    private void fillRecentView()
    {
        String userId = "" + Session["UserID"];
        recentProductTD = RecentViewDAO.getRecentItemsByUserId(userId, CommonUtil.GetUser_IP());
        if (recentProductTD == null)
        {
            recentProductTD = new DataTable();
        }

    }
}