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
/// Summary description for MenuUserClass
/// </summary>
/// 

namespace MFO.DAO
{
    public class MenuUserDAO
    {
        public DataTable getskucolor(string skucode)
        {
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where StyleCode='" + skucode + "' and StyleCode!='' and StyleCode is not null");

        }
        public DataTable getwomenhighestpricecategorydata(string SKUCategory, string SKUCategoryType, string productType)
        {
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master  where SKUCategory = '" + SKUCategory + "' and SKUCategoryType = '" + SKUCategoryType + "' and SKUStatus='Active'  and SKUClassification='Normal' and  ProductTypeID =  '" + productType + "' union select * from View_ImageProductNew_Master where   SKUCategory = '" + SKUCategory + "' and SKUCategoryType = '" + SKUCategoryType + "' and  ProductTypeID = '" + productType + "' and SKUStatus='Active' and VariantType='Size' and (StyleCode='' or StyleCode is null) union select * from View_ImageProductNew_Master  where SKUCategory = '" + SKUCategory + "' and SKUCategoryType = '" + SKUCategoryType + "' and  ProductTypeID = '" + productType + "' and SKUStatus='Active' and VariantType='Color' and  (StyleCode='' or StyleCode is null)  order by SpecialPrice desc");

        }
        public DataTable getwomenhighestpricecategorydataBybrand(string SKUCategory, string SKUCategoryType, string SKUBrand)
        {
            SKUBrand = SKUBrand.Replace("'", "\''");
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master  where SKUCategory = '" + SKUCategory + "' and SKUCategoryType = '" + SKUCategoryType + "' and SKUStatus='Active'  and SKUClassification='Normal' and  SKUBrand =  '" + SKUBrand + "' union select * from View_ImageProductNew_Master where   SKUCategory = '" + SKUCategory + "' and SKUCategoryType = '" + SKUCategoryType + "' and  SKUBrand = '" + SKUBrand + "' and SKUStatus='Active' and VariantType='Size' and (StyleCode='' or StyleCode is null) union select * from View_ImageProductNew_Master  where SKUCategory = '" + SKUCategory + "' and SKUCategoryType = '" + SKUCategoryType + "' and  SKUBrand = '" + SKUBrand + "' and SKUStatus='Active' and VariantType='Color' and  (StyleCode='' or StyleCode is null)  order by SpecialPrice desc");
        }
        public DataTable price_shorting6(string SKUCategory3, string SKUCategoryType3)
        {
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory3 + "' and SKUCategoryType = '" + SKUCategoryType3 + "' and SKUStatus='Active' and SKUClassification='Normal' and  SpecialPrice < 500  union select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory3 + "' and SKUCategoryType = '" + SKUCategoryType3 + "' and SKUStatus='Active' and VariantType='Size' and (StyleCode='' or StyleCode is null) and  SpecialPrice < 500 union select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory3 + "' and SKUCategoryType = '" + SKUCategoryType3 + "' and SKUStatus='Active' and VariantType='Color' and (StyleCode='' or StyleCode is null) and  SpecialPrice < 500 order by SpecialPrice");
        }
        public DataTable price_shorting6(string SKUCategory3, string SKUCategoryType3,string productdetail)
        {
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory3 + "' and SKUCategoryType = '" + SKUCategoryType3 + "' and ProductTypeID='" + productdetail + "' and SKUStatus='Active' and SKUClassification='Normal' and  SpecialPrice < 500  union select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory3 + "' and ProductTypeID='" + productdetail + "' and SKUCategoryType = '" + SKUCategoryType3 + "' and SKUStatus='Active' and VariantType='Size' and (StyleCode='' or StyleCode is null) and  SpecialPrice < 500 union select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory3 + "' and SKUCategoryType = '" + SKUCategoryType3 + "' and ProductTypeID='" + productdetail + "' and SKUStatus='Active' and VariantType='Color' and (StyleCode='' or StyleCode is null) and  SpecialPrice < 500 order by SpecialPrice");
        }
        public DataTable price_shorting6ByBrand(string SKUCategory3, string SKUCategoryType3, string SKUBrand)
        {
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory3 + "' and SKUCategoryType = '" + SKUCategoryType3 + "' and SKUBrand='" + SKUBrand + "' and SKUStatus='Active' and SKUClassification='Normal' and  SpecialPrice < 500  union select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory3 + "' and SKUBrand='" + SKUBrand + "' and SKUCategoryType = '" + SKUCategoryType3 + "' and SKUStatus='Active' and  VariantType='Size' and (StyleCode='' or StyleCode is null) and  SpecialPrice < 500 union select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory3 + "' and SKUCategoryType = '" + SKUCategoryType3 + "' and SKUBrand='" + SKUBrand + "' and SKUStatus='Active' and VariantType='Color' and (StyleCode='' or StyleCode is null) and  SpecialPrice < 500 order by SpecialPrice");
        }

        public DataTable getwomenlowestpricecategorydata(string SKUCategory, string SKUCategoryType, string productType)
        {
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master  where SKUCategory = '" + SKUCategory + "' and SKUCategoryType = '" + SKUCategoryType + "'  and SKUClassification='Normal' and  ProductTypeID =  '" + productType + "' union select * from View_ImageProductNew_Master where   SKUCategory = '" + SKUCategory + "' and SKUCategoryType = '" + SKUCategoryType + "' and  ProductTypeID = '" + productType + "' and VariantType='Size' and (StyleCode='' or StyleCode is null) union select * from View_ImageProductNew_Master  where SKUCategory = '" + SKUCategory + "' and SKUCategoryType = '" + SKUCategoryType + "' and  ProductTypeID = '" + productType + "' and VariantType='Color' and  (StyleCode='' or StyleCode is null)  order by SpecialPrice asc");
        }
        public DataTable getwomenlowestpricecategorydataByBrand(string SKUCategory, string SKUCategoryType, string SKUBrand)
        {
            SKUBrand = SKUBrand.Replace("'", "\''");
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master  where SKUCategory = '" + SKUCategory + "' and SKUCategoryType = '" + SKUCategoryType + "' and SKUStatus='Active'  and SKUClassification='Normal' and  SKUBrand =  '" + SKUBrand + "' union select * from View_ImageProductNew_Master where   SKUCategory = '" + SKUCategory + "' and SKUCategoryType = '" + SKUCategoryType + "' and  SKUBrand = '" + SKUBrand + "' and SKUStatus='Active' and VariantType='Size' and (StyleCode='' or StyleCode is null) union select * from View_ImageProductNew_Master  where SKUCategory = '" + SKUCategory + "' and SKUCategoryType = '" + SKUCategoryType + "' and  SKUBrand = '" + SKUBrand + "' and SKUStatus='Active' and VariantType='Color' and  (StyleCode='' or StyleCode is null)  order by SpecialPrice asc");
        }
        public DataTable getskusdtsize(string skucode)
        {
            return GenericDAO.getDataTable("select Size from ( select distinct(Size) from View_ImageProductNew_Master where StyleCode='" + skucode + "' and StyleCode!='' and StyleCode is not null ) as orderid order by Size desc");
        }
        public DataTable getskusize(string skucode)
        {
            return GenericDAO.getDataTable("select Size from ( select distinct(Size) from View_ImageProductNew_Master where StyleCode='" + skucode + "' and StyleCode!='' and StyleCode is not null ) as orderid order by CONVERT(INT, Size) asc");
        }
        public DataTable getwomenbranddata(string SKUCategory, string SKUCategoryType, string SKUBrand)
        {
            SKUBrand = SKUBrand.Replace("'", "\''");
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategory + "' and SKUCategoryType = '" + SKUCategoryType + "' and SKUBrand like '" + SKUBrand + "%' and SKUClassification='Normal' and SKUStatus='Active' union select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategory + "' and SKUCategoryType = '" + SKUCategoryType + "' and SKUBrand like '" + SKUBrand + "%' and VariantType='Size' and (StyleCode='' or StyleCode is null) and SKUStatus='Active' union select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategory + "' and SKUCategoryType = '" + SKUCategoryType + "' and SKUBrand like '" + SKUBrand + "%' and VariantType='Color' and SKUStatus='Active' and  (StyleCode='' or StyleCode is null)");
        }
        public DataTable getwomenbranddata1(string SKUCategory, string SKUCategoryType, string SKUBrand)
        {
            SKUBrand = SKUBrand.Replace("'", "\''");
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory + "' and SKUCategoryType = '" + SKUCategoryType + "' and SKUBrand like '" + SKUBrand + "%' and SKUClassification='Normal' and SKUStatus='Active' union select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory + "' and SKUCategoryType = '" + SKUCategoryType + "' and SKUBrand like '" + SKUBrand + "%' and VariantType='Size' and (StyleCode='' or StyleCode is null) and SKUStatus='Active' union select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory + "' and SKUCategoryType = '" + SKUCategoryType + "' and SKUBrand like '" + SKUBrand + "%' and VariantType='Color' and SKUStatus='Active' and (StyleCode='' or StyleCode is null)");
        }
        public DataTable getwomencategorydata(string SKUCategory, string SKUCategoryType)
        {
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategory + "' and CategoryTypeID = '" + SKUCategoryType + "' and  SKUClassification='Normal' and SKUStatus='Active' and RecordStatus='1' union select * from   View_ImageProductNew_Master where CategoryID = '" + SKUCategory + "' and CategoryTypeID = '" + SKUCategoryType + "' and   VariantType='Size' and SKUStatus='Active' and RecordStatus='1' and (StyleCode='' or StyleCode is null)   union select * from    View_ImageProductNew_Master where CategoryID = '" + SKUCategory + "' and CategoryTypeID = '" + SKUCategoryType + "' and    VariantType='Color' and SKUStatus='Active' and RecordStatus='1' and (StyleCode='' or StyleCode is null) order by ImageNewID desc");
        }

    
        public DataTable Shorting_price500_999(string SKUCategoryTypePrise, string SKUBrandPrise)
        {
            SKUBrandPrise = SKUBrandPrise.Replace("'", "\''");
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategoryTypePrise + "' and CategoryTypeID = '" + SKUBrandPrise + "' and SKUClassification='Normal'  and SpecialPrice >= 599 and SpecialPrice <= 999 union select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategoryTypePrise + "' and CategoryTypeID = '" + SKUBrandPrise + "' and VariantType='Size' and (StyleCode='' or StyleCode is null)and  SpecialPrice >= 599 and SpecialPrice <= 999  union select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategoryTypePrise + "' and CategoryTypeID = '" + SKUCategoryTypePrise + "' and VariantType='" + SKUBrandPrise + "' and (StyleCode!='' and StyleCode is not null)and  (SpecialPrice >= 599 and SpecialPrice <= 999) ORDER BY (VariantType)");
        }
        public DataTable Shorting_price500_999forshopbybrand(string SKUCategoryTypePrise, string SKUBrandPrise)
        {
            SKUBrandPrise = SKUBrandPrise.Replace("'", "\''");
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where SKUCategoryType = '" + SKUCategoryTypePrise + "' and SKUBrand like '%" + SKUBrandPrise + "' and SKUClassification='Normal' and SpecialPrice >= 500 and SpecialPrice <= 999 union select * from View_ImageProductNew_Master where SKUCategoryType = '" + SKUCategoryTypePrise + "' and SKUBrand like '%" + SKUBrandPrise + "'and VariantType='Size' and (StyleCode='' or StyleCode is null) and  SpecialPrice >= 500 and SpecialPrice <= 999 union  select * from View_ImageProductNew_Master where SKUCategoryType = '" + SKUCategoryTypePrise + "' and SKUBrand like '%" + SKUBrandPrise + "'and VariantType='Color' and (StyleCode='' or StyleCode is null) and  (SpecialPrice >= 500 and SpecialPrice <= 999)");
        }

        public DataTable ShortByPrice(string SKUCategoryTypePrise, string SKUBrandPrise, String fPrice, String sPrice)
        {
            SKUBrandPrise = SKUBrandPrise.Replace("'", "\''");
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where SKUCategoryType = '" + SKUCategoryTypePrise + "' and SKUBrand like '%" + SKUBrandPrise + "' and SKUClassification='Normal' and SpecialPrice >= " + fPrice + " and SpecialPrice <= " + sPrice + " union select * from View_ImageProductNew_Master where SKUCategoryType = '" + SKUCategoryTypePrise + "' and SKUBrand like '%" + SKUBrandPrise + "'and VariantType='Size' and (StyleCode='' or StyleCode is null) and  SpecialPrice >= " + fPrice + " and SpecialPrice <= " + sPrice + " union  select * from View_ImageProductNew_Master where SKUCategoryType = '" + SKUCategoryTypePrise + "' and SKUBrand like '%" + SKUBrandPrise + "'and VariantType='Color' and (StyleCode='' or StyleCode is null) and  (SpecialPrice >= " + fPrice + " and SpecialPrice <= " + sPrice + ")");
        }
        public DataTable ShortByPrice1(string SKUCategoryTypePrise, string SKUBrandPrise, String fPrice, String sPrice)
        {
            SKUBrandPrise = SKUBrandPrise.Replace("'", "\''");
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategoryTypePrise + "' and SKUBrand like '%" + SKUBrandPrise + "' and SKUClassification='Normal' and SpecialPrice >= " + fPrice + " and SpecialPrice <= " + sPrice + " union select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategoryTypePrise + "' and SKUBrand like '%" + SKUBrandPrise + "'and VariantType='Size' and (StyleCode='' or StyleCode is null) and  SpecialPrice >= " + fPrice + " and SpecialPrice <= " + sPrice + " union  select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategoryTypePrise + "' and SKUBrand like '%" + SKUBrandPrise + "'and VariantType='Color' and (StyleCode='' or StyleCode is null) and  (SpecialPrice >= " + fPrice + " and SpecialPrice <= " + sPrice + ")");
        }
        public DataTable ShortByPrice_1(string SKUCategoryTypePrise, string SKUBrandPrise, String fPrice, String sPrice)
        {
            SKUBrandPrise = SKUBrandPrise.Replace("'", "\''");
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategoryTypePrise + "' and SKUBrand like '%" + SKUBrandPrise + "' and SKUClassification='Normal' and SpecialPrice >= " + fPrice + " and SpecialPrice <= " + sPrice + " union select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategoryTypePrise + "' and SKUBrand like '%" + SKUBrandPrise + "'and VariantType='Size' and (StyleCode='' or StyleCode is null) and  SpecialPrice >= " + fPrice + " and SpecialPrice <= " + sPrice + " union  select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategoryTypePrise + "' and SKUBrand like '%" + SKUBrandPrise + "'and VariantType='Color' and (StyleCode='' or StyleCode is null) and  (SpecialPrice >= " + fPrice + " and SpecialPrice <= " + sPrice + ")");
        }
        public DataTable ShortByPrice2(string SKUBrandPrise, String fPrice, String sPrice)
        {
            SKUBrandPrise = SKUBrandPrise.Replace("'", "\''");
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where  SKUBrand like '%" + SKUBrandPrise + "' and SKUClassification='Normal' and SpecialPrice >= " + fPrice + " and SpecialPrice <= " + sPrice + " union select * from View_ImageProductNew_Master where SKUBrand like '%" + SKUBrandPrise + "'and VariantType='Size' and (StyleCode='' or StyleCode is null) and  SpecialPrice >= " + fPrice + " and SpecialPrice <= " + sPrice + " union  select * from View_ImageProductNew_Master where  SKUBrand like '%" + SKUBrandPrise + "'and VariantType='Color' and (StyleCode='' or StyleCode is null) and  (SpecialPrice >= " + fPrice + " and SpecialPrice <= " + sPrice + ")");
        }
        public DataTable Shorting_price1000_1499(string SKUCategoryTypePrise, string SKUBrandPrise)
        {
            SKUBrandPrise = SKUBrandPrise.Replace("'", "\''");
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategoryTypePrise + "' and CategoryTypeID = '" + SKUBrandPrise + "' and SKUClassification='Normal'  and SpecialPrice >= 1000 and SpecialPrice <= 1499 union select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategoryTypePrise + "' and CategoryTypeID = '" + SKUBrandPrise + "' and VariantType='Size' and (StyleCode='' or StyleCode is null)and   SpecialPrice >= 1000 and SpecialPrice <= 1499  union select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategoryTypePrise + "' and CategoryTypeID = '" + SKUCategoryTypePrise + "' and VariantType='" + SKUBrandPrise + "' and (StyleCode!='' and StyleCode is not null)and  (SpecialPrice >= 1000 and SpecialPrice <= 1499) ORDER BY (VariantType)");
        }
        public DataTable Shorting_price1000_1499ShoapbyBrand(string SKUCategoryTypePrise, string SKUBrandPrise)
        {
            SKUBrandPrise = SKUBrandPrise.Replace("'", "\''");
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where SKUCategoryType = '" + SKUCategoryTypePrise + "' and SKUBrand like '%" + SKUBrandPrise + "' and SKUClassification='Normal' and SpecialPrice >= 1000 and SpecialPrice <= 1499 union select * from View_ImageProductNew_Master where SKUCategoryType = '" + SKUCategoryTypePrise + "' and SKUBrand like '%" + SKUBrandPrise + "'and VariantType='Size' and (StyleCode='' or StyleCode is null) and  SpecialPrice >= 1000 and SpecialPrice <= 1499 union  select * from View_ImageProductNew_Master where SKUCategoryType = '" + SKUCategoryTypePrise + "' and SKUBrand like '%" + SKUBrandPrise + "'and VariantType='Color' and (StyleCode='' or StyleCode is null) and  (SpecialPrice >= 1000 and SpecialPrice <= 1499)");
        }
        public DataTable Shorting_price1500_1999(string SKUCategoryTypePrise, string SKUBrandPrise)
        {
            SKUBrandPrise = SKUBrandPrise.Replace("'", "\''");
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategoryTypePrise + "' and CategoryTypeID = '" + SKUBrandPrise + "' and SKUClassification='Normal' and SpecialPrice >= 1500 and SpecialPrice <= 1999 union select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategoryTypePrise + "' and CategoryTypeID = '" + SKUBrandPrise + "' and VariantType='Size' and (StyleCode='' or StyleCode is null)and  SpecialPrice >= 1500 and SpecialPrice <= 1999  union select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategoryTypePrise + "' and CategoryTypeID = '" + SKUBrandPrise + "' and VariantType='Color' and (StyleCode!='' and StyleCode is not null)and  (SpecialPrice >= 1500 and SpecialPrice <= 1999) ORDER BY (VariantType)");
        }
        public DataTable Shorting_price1500_1999shopbybrand(string SKUCategoryTypePrise, string SKUBrandPrise)
        {
            SKUBrandPrise = SKUBrandPrise.Replace("'", "\''");
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where SKUCategoryType = '" + SKUCategoryTypePrise + "' and SKUBrand like '%" + SKUBrandPrise + "' and SKUClassification='Normal' and SpecialPrice >= 1500 and SpecialPrice <= 1999 union select * from View_ImageProductNew_Master where SKUCategoryType = '" + SKUCategoryTypePrise + "' and SKUBrand like '%" + SKUBrandPrise + "'and VariantType='Size' and (StyleCode='' or StyleCode is null) and  SpecialPrice >= 1500 and SpecialPrice <= 1999 union  select * from View_ImageProductNew_Master where SKUCategoryType = '" + SKUCategoryTypePrise + "' and SKUBrand like '%" + SKUBrandPrise + "'and VariantType='Color' and (StyleCode='' or StyleCode is null) and  (SpecialPrice >= 1500 and SpecialPrice <= 1999)");
        }
        public DataTable Shorting_price2000_2599(string SKUCategoryTypePrise, string SKUBrandPrise)
        {
            SKUBrandPrise = SKUBrandPrise.Replace("'", "\''");
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategoryTypePrise + "' and CategoryTypeID = '" + SKUBrandPrise + "' and SKUClassification='Normal'  and SpecialPrice >= 2000 and SpecialPrice <= 2599 union select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategoryTypePrise + "' and CategoryTypeID = '" + SKUBrandPrise + "' and VariantType='Size' and (StyleCode='' or StyleCode is null)and  SpecialPrice >= 2000 and SpecialPrice <= 2599 union select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategoryTypePrise + "' and CategoryTypeID = '" + SKUCategoryTypePrise + "' and VariantType='" + SKUBrandPrise + "' and (StyleCode!='' and StyleCode is not null)and  SpecialPrice >= 2000 and SpecialPrice <= 2599 ORDER BY (VariantType)");
        }
        public DataTable Shorting_price2000_2599ShopbyBrand(string SKUCategoryTypePrise, string SKUBrandPrise)
        {
            SKUBrandPrise = SKUBrandPrise.Replace("'", "\''");
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where SKUCategoryType = '" + SKUCategoryTypePrise + "' and SKUBrand like '%" + SKUBrandPrise + "' and SKUClassification='Normal' and SpecialPrice >= 2000 and SpecialPrice <= 2599 union select * from View_ImageProductNew_Master where SKUCategoryType = '" + SKUCategoryTypePrise + "' and SKUBrand like '%" + SKUBrandPrise + "'and VariantType='Size' and (StyleCode='' or StyleCode is null) and  SpecialPrice >= 2000 and SpecialPrice <= 2599 union  select * from View_ImageProductNew_Master where SKUCategoryType = '" + SKUCategoryTypePrise + "' and SKUBrand like '%" + SKUBrandPrise + "'and VariantType='Color' and (StyleCode='' or StyleCode is null) and  (SpecialPrice >= 2000 and SpecialPrice <= 2599)");
        }
        public DataTable Shorting_price2500_2999(string SKUCategoryTypePrise, string SKUBrandPrise)
        {
            SKUBrandPrise = SKUBrandPrise.Replace("'", "\''");
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategoryTypePrise + "' and CategoryTypeID = '" + SKUBrandPrise + "' and SKUClassification='Normal' and SpecialPrice >= 2500 and SpecialPrice <= 2999 union select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategoryTypePrise + "' and CategoryTypeID = '" + SKUBrandPrise + "' and VariantType='Size' and (StyleCode='' or StyleCode is null)and  SpecialPrice >= 2500 and SpecialPrice <= 2999 union select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategoryTypePrise + "' and CategoryTypeID = '" + SKUCategoryTypePrise + "' and VariantType='" + SKUBrandPrise + "' and (StyleCode!='' and StyleCode is not null)and  SpecialPrice >= 2500 and SpecialPrice <= 2999 ORDER BY (VariantType)");

        }
        public DataTable Shorting_price2500_2999ShoapbyBrand(string SKUCategoryTypePrise, string SKUBrandPrise)
        {

            SKUBrandPrise = SKUBrandPrise.Replace("'", "\''");
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where SKUCategoryType = '" + SKUCategoryTypePrise + "' and SKUBrand like '%" + SKUBrandPrise + "' and SKUClassification='Normal' and SpecialPrice >= 2500 and SpecialPrice <= 2999 union select * from View_ImageProductNew_Master where SKUCategoryType = '" + SKUCategoryTypePrise + "' and SKUBrand like '%" + SKUBrandPrise + "'and VariantType='Size' and (StyleCode='' or StyleCode is null) and  SpecialPrice >= 2500 and SpecialPrice <= 2999 union  select * from View_ImageProductNew_Master where SKUCategoryType = '" + SKUCategoryTypePrise + "' and SKUBrand like '%" + SKUBrandPrise + "'and VariantType='Color' and (StyleCode='' or StyleCode is null) and  (SpecialPrice >= 2500 and SpecialPrice <= 2999)");  
        }
        public DataTable price_shorting(string SKUCategory1, string SKUCategoryType1, String first, String sec)
        {

            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory1 + "' and SKUCategoryType = '" + SKUCategoryType1 + "' and SKUStatus='Active' and SKUClassification='Normal' and  SpecialPrice >= " + first + " and SpecialPrice <= " + sec + "  union select * from   View_ImageProductNew_Master where SKUCategory = '" + SKUCategory1 + "' and SKUCategoryType = '" + SKUCategoryType1 + "' and SKUStatus='Active' and VariantType='Size' and (StyleCode='' or StyleCode is null)and  SpecialPrice >= " + first + " and SpecialPrice <= " + sec + "   union select * from    View_ImageProductNew_Master where SKUCategory  = '" + SKUCategory1 + "' and SKUCategoryType = '" + SKUCategoryType1 + "' and SKUStatus='Active' and VariantType='Color' and (StyleCode='' or StyleCode is null)and ( SpecialPrice >= " + first + " and    SpecialPrice <= " + sec + ") order by SpecialPrice");
        

        }
        public DataTable price_shorting(string SKUCategory1, string SKUCategoryType1, String first, String sec,string productdetail)
        {

            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory1 + "' and SKUCategoryType = '" + SKUCategoryType1 + "' and ProductTypeID='" + productdetail + "' and SKUStatus='Active' and SKUClassification='Normal' and  SpecialPrice >= " + first + " and SpecialPrice <= " + sec + "  union select * from   View_ImageProductNew_Master where SKUCategory = '" + SKUCategory1 + "' and SKUCategoryType = '" + SKUCategoryType1 + "' and ProductTypeID='" + productdetail + "' and SKUStatus='Active' and VariantType='Size' and (StyleCode='' or StyleCode is null) and  SpecialPrice >= " + first + " and SpecialPrice <= " + sec + "   union select * from    View_ImageProductNew_Master where SKUCategory  = '" + SKUCategory1 + "' and SKUCategoryType = '" + SKUCategoryType1 + "' and ProductTypeID='" + productdetail + "' and SKUStatus='Active' and VariantType='Color' and (StyleCode='' or StyleCode is null) and ( SpecialPrice >= " + first + " and    SpecialPrice <= " + sec + ") order by SpecialPrice");
        
        }
        public DataTable price_shortingByBrand(string SKUCategory1, string SKUCategoryType1, String first, String sec, string SKUBrand)
        {
            SKUBrand = SKUBrand.Replace("'", "\''");
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory1 + "' and SKUCategoryType = '" + SKUCategoryType1 + "' and SKUBrand='" + SKUBrand + "' and SKUStatus='Active' and  SKUClassification='Normal' and  SpecialPrice >= " + first + " and SpecialPrice <= " + sec + "  union select * from   View_ImageProductNew_Master where SKUCategory = '" + SKUCategory1 + "' and SKUCategoryType = '" + SKUCategoryType1 + "' and SKUBrand='" + SKUBrand + "' and SKUStatus='Active' and   VariantType='Size' and (StyleCode='' or StyleCode is null) and  SpecialPrice >= " + first + " and SpecialPrice <= " + sec + "   union select * from    View_ImageProductNew_Master where SKUCategory  = '" + SKUCategory1 + "' and SKUCategoryType = '" + SKUCategoryType1 + "' and SKUBrand='" + SKUBrand + "' and SKUStatus='Active' and VariantType='Color' and (StyleCode='' or StyleCode is null) and ( SpecialPrice >= " + first + " and    SpecialPrice <= " + sec + ") order by SpecialPrice");
      
        }
        public DataTable price_shorting5(string SKUCategory2, string SKUCategoryType2)
        {
                return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory2 + "' and SKUCategoryType = '" + SKUCategoryType2 + "' and SKUStatus='Active' and SKUClassification='Normal' and  SpecialPrice >= 3000  union select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory2 + "' and SKUCategoryType = '" + SKUCategoryType2 + "' and SKUStatus='Active' and VariantType='Size' and (StyleCode='' or StyleCode is null) and  SpecialPrice >= 3000 union select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory2 + "' and SKUCategoryType = '" + SKUCategoryType2 + "' and SKUStatus='Active' and VariantType='Color' and (StyleCode='' or StyleCode is null) and  SpecialPrice >= 3000 order by SpecialPrice");
        }
        public DataTable price_shorting5(string SKUCategory2, string SKUCategoryType2, string productdetail)
        {

            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory2 + "' and SKUCategoryType = '" + SKUCategoryType2 + "' and ProductTypeID='" + productdetail + "' and SKUStatus='Active' and SKUClassification='Normal' and  SpecialPrice >= 3000  union select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory2 + "' and SKUCategoryType = '" + SKUCategoryType2 + "' and ProductTypeID='" + productdetail + "' and SKUStatus='Active' and VariantType='Size' and (StyleCode='' or StyleCode is null) and  SpecialPrice >= 3000 union select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory2 + "' and SKUCategoryType = '" + SKUCategoryType2 + "' and ProductTypeID='" + productdetail + "' and SKUStatus='Active' and VariantType='Color' and (StyleCode='' or StyleCode is null) and  SpecialPrice >= 3000 order by SpecialPrice");

        }
        public DataTable price_shorting5ByBrand(string SKUCategory2, string SKUCategoryType2, string SKUBrand)
        {
       
                SKUBrand = SKUBrand.Replace("'", "\''");
                return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory2 + "' and SKUCategoryType = '" + SKUCategoryType2 + "' and SKUBrand='" + SKUBrand + "' and SKUStatus='Active' and SKUClassification='Normal' and  SpecialPrice >= 3000  union select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory2 + "' and SKUCategoryType = '" + SKUCategoryType2 + "' and SKUBrand='" + SKUBrand + "' and SKUStatus='Active' and VariantType='Size' and (StyleCode='' or StyleCode is null) and  SpecialPrice >= 3000 union select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory2 + "' and SKUCategoryType = '" + SKUCategoryType2 + "' and SKUBrand='" + SKUBrand + "' and SKUStatus='Active' and VariantType='Color' and (StyleCode='' or StyleCode is null) and  SpecialPrice >= 3000 order by SpecialPrice");
        }

        public DataTable getwomenhighestpricecategorydata(string SKUCategory, string SKUCategoryType)
        {
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory + "' and SKUCategoryType = '" + SKUCategoryType + "' and SKUStatus='Active' and SKUClassification='Normal' union select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory + "' and SKUCategoryType = '" + SKUCategoryType + "' and SKUStatus='Active' and VariantType='Size' and (StyleCode='' or StyleCode is null) union select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory + "' and SKUCategoryType = '" + SKUCategoryType + "' and SKUStatus='Active' and VariantType='Color' and (StyleCode='' or StyleCode is null) order by SpecialPrice desc");
       
        }
        public DataTable getwomenlowestpricecategorydata(string SKUCategory, string SKUCategoryType)
        {
        
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory + "' and SKUCategoryType = '" + SKUCategoryType + "' and SKUStatus='Active' and SKUClassification='Normal' union select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory + "' and SKUCategoryType = '" + SKUCategoryType + "' and SKUStatus='Active' and VariantType='Size' and (StyleCode='' or StyleCode is null) union select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory + "' and SKUCategoryType = '" + SKUCategoryType + "' and SKUStatus='Active' and VariantType='Color' and (StyleCode='' or StyleCode is null) order by SpecialPrice asc");
       
        }
        public DataTable getallsaledatadata(string SKUCategory)
        {
        
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategory + "' and SKUClassification='Normal' union select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategory + "' and VariantType='Size' and (StyleCode='' or StyleCode is null) union select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategory + "' and VariantType='Color' and (StyleCode='' or StyleCode is null)");
       
        }
        public DataTable getcategorytypeleftdata(string SKUCategoryType)
        {
       
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where SKUCategoryType like '" + SKUCategoryType + "%'");
        
        }
        public DataTable getsearchassistbranddata(string SKUBrand)
        {
            SKUBrand = SKUBrand.Replace("'", "\''");
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where SKUBrand = '" + SKUBrand + "'");
       
        }
        public DataTable getsearchassistcategorydata(string SKUCategory)
        {
       
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where SKUCategory = '" + SKUCategory + "'");
       
        }
        public DataTable getsearchassistcategorytypedata(string SKUCategoryType)
        {
        
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where SKUCategoryType = '" + SKUCategoryType + "'");
        
        }
        public DataTable getsearchassistproducttypedata(string SKUProductType)
        {
      
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where SKUProductType = '" + SKUProductType + "'");
        
        }
        public DataTable getsearchassistproductdata(string SKUName)
        {
      
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where SKUName = '" + SKUName + "'");
        
        }
        public DataTable getsearchdataoncategorypage(string categoryid, string categorytypeid)
        {
       
            return GenericDAO.getDataTable("select * from View_Product_Master where CategoryID='" + categoryid + "' and CategoryTypeID='" + categorytypeid + "' ");
        
        }
        public DataTable gethomecategorydata()
        {
        
            return GenericDAO.getDataTable("select distinct(CategoryTypeID),SKUCategoryType,CategoryTypeUrlName from View_ImageProductNew_Master where SKUCategory='Home & Decor'  and (CategoryTypeID!='' or CategoryTypeID is not null)");
       
        }
        public DataTable getmancategorydata()
        {
        
            return GenericDAO.getDataTable("select distinct(CategoryTypeID),SKUCategoryType,CategoryTypeUrlName from View_ImageProductNew_Master where SKUCategory='men'  and (CategoryTypeID!='' or CategoryTypeID is not null)");
       
        }
        public DataTable getwomencategorydata()
        {
        
            return GenericDAO.getDataTable("select distinct(CategoryTypeID),SKUCategoryType,SKUStatus,CategoryTypeUrlName from View_ImageProductNew_Master where SKUCategory='Women' and SKUStatus='Active' and (CategoryTypeID!='' or CategoryTypeID is not null)");
       
        }
        public DataTable getshopbybrandsbagsdata()
        {
        
            return GenericDAO.getDataTable("select distinct(SKUBrand) from View_ImageProductNew_Master where SKUCategoryType='Bags' and SKUCategoryType is not null and SKUCategoryType!=''");
        
        }
        public DataTable getshopbybrandsclothingsdata()
        {
        
            return GenericDAO.getDataTable("select distinct(SKUBrand) from View_ImageProductNew_Master where SKUCategoryType='Clothing' and SKUStatus='Active' and SKUCategoryType is not null and SKUCategoryType!=''");
        
        }
        public DataTable getshopbybrandsfootweardata()
        {
       
                return GenericDAO.getDataTable("select distinct(SKUBrand) from View_ImageProductNew_Master where SKUCategoryType='Footwear' and SKUStatus='Active' and RecordStatus='1' and SKUCategoryType is not null and SKUCategoryType!=''");
           
           
        }
        public DataTable getshopbybrandsaccessoriesdata()
        {
        
            return GenericDAO.getDataTable("select distinct(SKUBrand) from View_ImageProductNew_Master where SKUCategoryType='Accessories' and SKUStatus='Active' and SKUCategoryType is not null and SKUCategoryType!=''");
        
        }

        public DataTable ShortByPrice_1(string SKUCategoryTypePrise, string SKUBrandPrise, string CType, string PType, string fPrice, string sPrice)
        {
            SKUBrandPrise = SKUBrandPrise.Replace("'", "\''");
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategoryTypePrise + "' and SKUBrand like '%" + SKUBrandPrise + "' and CategoryTypeID='" + CType + "' and ProductTypeID='" + PType + "' and SKUClassification='Normal' and SpecialPrice >= " + fPrice + " and SpecialPrice <= " + sPrice + " union select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategoryTypePrise + "' and SKUBrand like '%" + SKUBrandPrise + "' and CategoryTypeID='" + CType + "' and ProductTypeID='" + PType + "' and VariantType='Size' and (StyleCode='' or StyleCode is null) and  SpecialPrice >= " + fPrice + " and SpecialPrice <= " + sPrice + " union  select * from View_ImageProductNew_Master where CategoryID = '" + SKUCategoryTypePrise + "' and SKUBrand like '%" + SKUBrandPrise + "' and CategoryTypeID='" + CType + "' and ProductTypeID='" + PType + "' and VariantType='Color' and (StyleCode='' or StyleCode is null) and  (SpecialPrice >= " + fPrice + " and SpecialPrice <= " + sPrice + ")");

        }
        public DataTable getViewImageNewMaster()
        {
            return GenericDAO.getDataTable("select Inventory,Color,WashCare,Material,ShippingReturns,SKUProductDetails,SKULongDescription,PathBackInternaldetailsSmallImage,PathLowerInternaldetailsSmallImage,PathUpperInternaldetailsSmallImage,PathInternaldetailsHoverImage,PathUpperInternaldetailsHoverImage,PathLowerInternaldetailsHoverImage,PathBackInternaldetailsHoverImage,PathInternaldetailsZoomImage,PathUpperInternaldetailsZoomImage,PathLowerInternaldetailsZoomImage,PathBackInternaldetailsZoomImage,PathBackInternaldetailsHoverImage, CategoryTypeUrlName,ImageNewID,CategoryID,CategoryTypeID,StyleCode,RecordStatus,Size,ProductTypeID,MRP,MetaKeywords,SKUCategory,SKUCategoryType,SKUStatus,SpecialPrice,SKUName,SKUBrand,SKUCode,VariantType,SKUClassification,SizeDataType,PathInternaldetailsSmallImage,SKUProductType,ColorCode from View_ImageProductNew_Master where SKUStatus='Active' and RecordStatus='1'");
        }

        public int? getProductCount(String userId)
        {
             object val=GenericDAO.scalarQuery("select COUNT(*)  from View_AddToCart_Master where UserID='" + userId + "'");
             return val == null ? null : (int?)Int32.Parse(val.ToString());
        }
    }
}