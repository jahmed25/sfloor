using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SFloor.DAO;
using System.Data;
using MFO.Common;
using MFO.Commom;
using MFO.Constants;
using MFO.Loggers;
using System.Collections;

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
        public static DataTable getProdBySKU(string sku) 
        {
            DataTable dt = GenericService.getVewImageNewMasterDT();
            IEnumerable<DataRow> query =
            from dr in dt.AsEnumerable()
                where dr.Field<String>("SKUCode") == sku
            select dr;
            try
            {
                dt = query.CopyToDataTable<DataRow>();
            }
            catch { }
            return dt; 
        }
        public static DataTable getVarientProd(string style,string size,string color)
        {
            DataTable dt = GenericService.getVewImageNewMasterDT();
            IEnumerable<DataRow> query =
            from dr in dt.AsEnumerable()
                where dr.Field<String>("StyleCode") == style
                    && dr.Field<String>("Color") == color
                    && dr.Field<String>("Size") == size
            select dr;
            try
            {
                dt = query.CopyToDataTable<DataRow>();
            }
            catch { }
            return dt;
        }

        public static List<string> getPinDT(string like)
        {
            DataTable dt = new DataTable();
            List<string> pinList = new List<string>();
            if (HttpContext.Current.Application[Constant.Application.PIN_DT] != null)
                dt = HttpContext.Current.Application[Constant.Application.PIN_DT] as DataTable;
            else
                dt = PinDAO.getPinDT();
               var v =(from DataRow dr in dt.Rows
                  where dr.Field<String>("PinCodeLocation_PinCode").StartsWith(like)
                  select (string)dr["PinCodeLocation_PinCode"]);
            try
            {

                pinList=v.ToList<string>();
            }
            catch { }
            return pinList;
        }

        public static Dictionary<string,string> getCityState(string pin)
        {
            DataTable dt = new DataTable();
            List<string> pinList = new List<string>();
            if (HttpContext.Current.Application[Constant.Application.PIN_DT] != null)
                dt = HttpContext.Current.Application[Constant.Application.PIN_DT] as DataTable;
            else
                dt = PinDAO.getPinDT();
            IEnumerable<DataRow> query = from DataRow dr in dt.Rows
                where dr.Field<String>("PinCodeLocation_PinCode").Equals(pin)
                select dr;
            dt=query.CopyToDataTable<DataRow>();
            Dictionary<string, string> dic = new Dictionary<string,string>();
            if(!CommonUtil.DT.isEmptyOrNull(dt))
            {
                dic.Add("city",dt.Rows[0]["PinCodeLocation_City"]+"");
                dic.Add("state",dt.Rows[0]["PinCodeLocation_State"]+"");
            }
            return dic;

        }

        public static List<string> getStateDT(string startWith)
        {
            DataTable dt = new DataTable();
            List<string> pinList = new List<string>();
            if (HttpContext.Current.Application[Constant.Application.PIN_DT] != null)
                dt = HttpContext.Current.Application[Constant.Application.PIN_DT] as DataTable;
            else
                dt = PinDAO.getPinDT();
            var v = (from DataRow dr in dt.Rows
                     where dr.Field<String>("PinCodeLocation_State").ToLower().StartsWith(startWith.ToLower())
                     select (string)dr["PinCodeLocation_State"]);
            try
            {

                pinList = v.ToList<string>().Distinct().ToList();
            }
            catch { }
            return pinList;
        }

        public static List<string> getCityDT(string startWith)
        {
            DataTable dt = new DataTable();
            List<string> pinList = new List<string>();
            if (HttpContext.Current.Application[Constant.Application.PIN_DT] != null)
                dt = HttpContext.Current.Application[Constant.Application.PIN_DT] as DataTable;
            else
                dt = PinDAO.getPinDT();
            var v = (from DataRow dr in dt.Rows
                     where dr.Field<String>("PinCodeLocation_City").ToLower().StartsWith(startWith.ToLower())
                     select (string)dr["PinCodeLocation_City"]);
            try
            {
                pinList = v.ToList<string>().Distinct().ToList();
            }
            catch { }
            return pinList;
        }
    }
   
}