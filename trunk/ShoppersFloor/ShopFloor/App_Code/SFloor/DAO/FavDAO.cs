using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using SFloor.DAO.Generic;
using MFO.Commom;

/// <summary>
/// Summary description for FavDAO
/// </summary>
/// 
namespace SFloor.DAO
{
    public static class FavDAO
    {
       public static int addFav(string sku,string sessionID,string userId){
           int count = 0;
           DataTable dt = GenericDAO.getDataTable("select * from FAV_LIST where SESSION_ID='"+sessionID+"' and sku='"+sku+"'");
           if (CommonUtil.DT.isEmptyOrNull(dt))
           {
               string query = "Insert into FAV_LIST (SKU,SESSION_ID,DATE,USER_ID) values('" + sku + "','" + sessionID + "',GETDATE(),'" + userId + "')";
               count = GenericDAO.insertQuery(query);
           }
          return count;
       }
       public static DataTable getFavDT(string sessionID)
       {
           DataTable dt = new DataTable();
           string query = "Select * from FAV_LIST where SESSION_ID='"+sessionID+"' order by DATE desc";
           dt = GenericDAO.getDataTable(query);
           return dt;
       }



       public static void updateFavList(string userId, string sessionId)
       {
           IDictionary<string, string> colDic = new Dictionary<string, string>();
           colDic.Add("@SESSION_ID", sessionId);
           colDic.Add("@USER_ID", userId);
           string query = "update FAV_LIST set SESSION_ID=@SESSION_ID, USER_ID=@USER_ID)";
           GenericDAO.updateQuery(query, colDic);
       }
    }
}