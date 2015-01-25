using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using SFloor.DAO.Generic;
using MFO.Commom;

/// <summary>
/// Summary description for RegisterDAO
/// </summary>
/// 
namespace SFloor.DAO
{
    public static class RegisterDAO
    {
        public static int register(IDictionary<String, String> colDic) 
        {
            int i = 0;
            string query = "select * from USER_REGISTER where EMAIL='" + colDic["@EMAIL"] + "'";
            DataTable dt = GenericDAO.getDataTable(query);
            if (!CommonUtil.DT.isEmptyOrNull(dt))
                throw new NotSupportedException("Email already registerd");
            else {
                query = "insert into USER_REGISTER (EMAIL, MOBILE,SESSION_ID,GENDER,PASSWORD) values(@EMAIL, @MOBILE,@SESSION_ID,@GENDER,@PASSWORD)";
                i = GenericDAO.insertQuery(query, colDic);
            }
            return i;
        }
        public static DataTable getUser(string email) 
        {
            string query = "select * from USER_REGISTER where EMAIL=@EMAIL";
            Dictionary<string,string> param= new Dictionary<string,string>();
            param.Add("@EMAIL",email);
            return GenericDAO.getDataTableByParam(query, param);
        }

    }
}