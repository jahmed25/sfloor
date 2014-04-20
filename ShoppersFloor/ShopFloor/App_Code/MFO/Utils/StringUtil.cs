using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for StringUtil
/// </summary>
/// 
namespace MFO.Utils
{
    public class StringUtil
    {
        public static bool isNullOrEmpty(String str)
        {
            return str == null || String.Empty.Equals(str.Trim());            
        }
        public static string urlEncode(string str)
        { 
            return str.Replace(" ", "-").Replace("&", "").Replace("--", "-");
        }

       
        public static string checkInventrory(string inventory, string qty)
        {
            int invn=0;
            String returnValue = "Sold Out";
            if (!isNullOrEmpty(inventory))
                invn = (int)float.Parse(inventory);
            if (Int32.Parse(qty) > invn)
                returnValue = "Only " + invn + " item(s) are left, Please choose quantity again.";
            else if (Int32.Parse(qty)<= invn)
            {
                returnValue = "available";
            }
            return returnValue;
        }
    }
}