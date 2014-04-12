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
       public static int addFav(string sku,string sessionID){
           int count = 0;
           DataTable dt = GenericDAO.getDataTable("select * from FAV_LIST where SESSION_ID='"+sessionID+"' and sku='"+sku+"'");
           if (CommonUtil.DT.isEmptyOrNull(dt))
           {
               string query = "Insert into FAV_LIST (SKU,SESSION_ID) values('" + sku + "','" + sessionID + "')";
               count = GenericDAO.insertQuery(query);
           }
          return count;
       }
       public static DataTable getFavDT(string sessionID)
       {
           DataTable dt = new DataTable();
           string query = "Select * from FAV_LIST where SESSION_ID='"+sessionID+"'";
           dt = GenericDAO.getDataTable(query);
           return dt;
       }
    }
}