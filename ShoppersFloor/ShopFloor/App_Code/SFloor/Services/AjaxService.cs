using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SFloor.DAO;
using System.Data;
using MFO.Common;
using MFO.Commom;

/// <summary>
/// Summary description for AjaxService
/// </summary>
/// 

namespace SFloor.Services
{
    public static class AjaxService
    {
        public static int register(IDictionary<String, String> colDic)
        {
            return RegisterDAO.register(colDic);
        }
        public static DataTable getUser(string email)
        {
            return RegisterDAO.getUser(email);
        }
        public static Dictionary<string, string> addFav(string sku, string sessionID,string userID)
        {
            Dictionary<string, string> dic = new Dictionary<string, string>();
            
            int count=FavDAO.addFav(sku, sessionID,userID);
            if(count>0){
                 DataTable dt = GenericService.getVewImageNewMasterDT();
                IEnumerable<DataRow> query =
                from dr in dt.AsEnumerable() 
                    where dr.Field<String>("SKUCode") == sku
                select dr;
                try{
                 dt = query.CopyToDataTable<DataRow>();
                }catch{}
                
                if(!CommonUtil.DT.isEmptyOrNull(dt)){
                    dic.Add("brand",dt.Rows[0]["SKUBrand"]+"");
                    dic.Add("sku",dt.Rows[0]["SKUCode"]+"");
                    dic.Add("name",dt.Rows[0]["SKUName"]+"");
                    dic.Add("mrp",dt.Rows[0]["MRP"]+"");
                    dic.Add("price",dt.Rows[0]["SpecialPrice"]+"");
                    dic.Add("image",dt.Rows[0]["PathInternaldetailsSmallImage"]+"");
                }
            }
            return dic;

        }

        public static void clearCart(string sessionId)
        {
            CartDAO.clearCart(sessionId);
        }

        public static void clearFav(string sessionId)
        {
            FavDAO.clearFav(sessionId);
        }
    }
}