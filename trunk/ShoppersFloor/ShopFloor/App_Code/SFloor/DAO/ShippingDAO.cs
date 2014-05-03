using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SFloor.DAO.Generic;

/// <summary>
/// Summary description for ShippingDAO
/// </summary>
/// 
namespace SFloor.DAO
{
    public static class ShippingDAO
    {

        public static bool add(string email, string name, string phone, string pin, string city, string state,string address,string sessionId, string userId)
        {
            IDictionary<string, string> colDic = new Dictionary<string, string>();
            colDic.Add("@SESSION_ID", sessionId);
            colDic.Add("@USER_ID", userId);
            colDic.Add("@MOBILE", phone);
            colDic.Add("@PIN", pin);
            colDic.Add("@CITY", city);
            colDic.Add("@STATE", state);
            colDic.Add("@EMAIL", email);
            colDic.Add("@NAME", name);
            colDic.Add("@ADDRESS", address);
            string query = "insert into SHIPPING_MASTER (SESSION_ID, USER_ID,MOBILE,PIN,CITY,STATE,EMAIL,NAME,ADDRESS) values(@SESSION_ID, @USER_ID,@MOBILE,@PIN,@CITY,@STATE,@EMAIL,@NAME,@ADDRESS)";
            return GenericDAO.insertQuery(query, colDic) >0?true:false;
        }
    }
}