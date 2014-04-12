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
/// Summary description for FrontendCart
/// </summary>
/// 
namespace MFO.DAO
{
    public class FrontendCartDAO
    {

        public void UpdateOrderInProductTable(String userID)
        {
            DataTable dt = getaddtocartByUserId(userID);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                updateProductMaster(dt.Rows[i]["ProductSKUCode"].ToString(), dt.Rows[i]["Quantity"].ToString());
            }
        }

        #region AddToCartByUser
        public int? AddToCartByUser(Dictionary<string, string> paramDic)
        {
            return GenericDAO.executeProcedure("sp_FrontEnd_AddToCart_Master", paramDic);
        }
        #endregion
        #region AddToWishlistByUser
        public int? AddToWishlistByUser(Dictionary<string, string> paramDic)
        {
            return GenericDAO.executeProcedure("sp_FrontEnd_AddToWaitList_Master", paramDic);
        }
        #endregion
        #region checkout
        public DataTable getcheckoutdetails(int UserID)
        {
            return GenericDAO.getDataTable("select * from View_AddToCart_Master where UserID='" + UserID + "'");
        }
        #endregion
        public DataTable getaddtocartproductdetails(int UserID)
        {
            return GenericDAO.getDataTable("select * from View_AddToCart_Master where UserID='" + UserID + "'");
        }

        public int? DeleteAddToCartOfUser(String id)
        {
            return GenericDAO.deleteQuery("delete from AddToCart_Master where AddToCart_UserID='" + id + "'");
        }
        public DataTable getaddtocartproductfornew(int UserID, string SKUCode)
        {
            return GenericDAO.getDataTable("select * from View_AddToCart_Master where UserID='" + UserID + "' and  ProductSKUCode ='" + SKUCode + "'");
        }
        public DataTable getaddtocartByUserId(String UserID)
        {
            return GenericDAO.getDataTable("select * from View_AddToCart_Master where UserID='" + UserID + "'");

        }
        public void updateProductMaster(String SKUCode, String quantity)
        {
            String query = "select Inventory from View_ImageProductNew_Master where SKUCode='" + SKUCode + "'";
            String totalQuantity = GenericDAO.scalarQuery(query) as string;

            int balance = Int32.Parse(totalQuantity) - Int32.Parse(quantity);
            String updateQuery = "update View_ImageProductNew_Master set Inventory='" + balance + "' where SKUCode = '" + SKUCode + "'";
            int? c = GenericDAO.updateQuery(updateQuery);

        }

        public int? updateaddtocartproductdetails(String userId, string SKUCode, int q, int totalPrice)
        {
            return GenericDAO.updateQuery("update   View_AddToCart_Master set Quantity ='" + q + "', TotalPrice='" + totalPrice + "' where UserID='" + userId + "' and ProductSKUCode ='" + SKUCode + "'");

        }
        public DataTable getproductdetails(string productskuid)
        {
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where SKUCode='" + productskuid + "'");
        }

        public DataTable getaddtocartdetails(int productid)
        {
            return GenericDAO.getDataTable("select * from View_AddToCart_Master where ProductID='" + productid + "'");
        }
        public DataTable getskusizeproductidofuser(string stylecode, string size)
        {
            return GenericDAO.getDataTable("select * from View_ImageProductNew_Master where StyleCode='" + stylecode + "' and Size='" + size + "'");
        }

    }
}