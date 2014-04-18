using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using SFloor.DAO.Generic;
using MFO.Commom;
using System.Collections;

/// <summary>
/// Summary description for CartDAO
/// </summary>
/// 
namespace SFloor.DAO
{
    public static class CartDAO
    {
        public static int addToCart(string sessionId, string qty, string price, string total, string sku, string userID)
        {
            IDictionary<string, string> colDic = new Dictionary<string, string>();
            int i = 0;
            colDic.Add("@SKU", sku);
            colDic.Add("@QTY", qty);
            colDic.Add("@UNIT_PRICE", price);
            colDic.Add("@SESSION_ID", sessionId);
            colDic.Add("@TOTAL", total);
            colDic.Add("@USER_ID", userID);
            string query = "insert into CART (SKU, QTY,UNIT_PRICE,SESSION_ID,TOTAL,USER_ID) values(@SKU, @QTY,@UNIT_PRICE,@SESSION_ID,@TOTAL,@USER_ID)";
                i = GenericDAO.insertQuery(query, colDic);
            return i;
        }

        
        public static void updateCart(string userId, string sessionId)
        {
            IDictionary<string, string> colDic = new Dictionary<string, string>();
            colDic.Add("@SESSION_ID", sessionId);
            colDic.Add("@USER_ID", userId);
            string query = "update CART set SESSION_ID=@SESSION_ID, USER_ID=@USER_ID)";
            GenericDAO.updateQuery(query, colDic);
        }
    }
}