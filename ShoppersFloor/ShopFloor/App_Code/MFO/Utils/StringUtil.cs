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
    }
}