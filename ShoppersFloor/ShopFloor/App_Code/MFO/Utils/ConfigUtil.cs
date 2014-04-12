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

/// <summary>
/// Summary description for ConfigUtil
/// </summary>
public class ConfigUtil
{

    private static string hostUrl = null;
    private static string adminUrl = null;
    private static string dbConnectionString;
    private static string sitename;
    private static string staticPath;

    static ConfigUtil()
    {
        dbConnectionString = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
        sitename = ConfigurationManager.AppSettings["SiteName"];
    }

    public static string getServerPath()
    {
        if (adminUrl == null)
        {
            adminUrl = ConfigurationManager.AppSettings["adminServerPath"];
        }
        return adminUrl;
    }
    public static string StaticPath()
    {
        if (staticPath == null)
        {
            staticPath = ConfigurationManager.AppSettings["staticPath"];
        }
        return staticPath;
    }
    public static string hostURL()
    {
        if (hostUrl == null)
        {
            hostUrl = ConfigurationManager.AppSettings["hostUrl"];
        }
        return hostUrl;
    }
    public static string DbConnectionString
    {
        get
        {
            return dbConnectionString;
        }
    }
    public static string MailServer
    {
        get
        {
            return ConfigurationManager.AppSettings["MailServer"];
        }
    }

    public static string MailUsername
    {
        get
        {
            return ConfigurationManager.AppSettings["MailUsername"];
        }
    }
    public static string MailPassword
    {
        get
        {
            return ConfigurationManager.AppSettings["MailPassword"];
        }
    }

    public static string MailFrom
    {
        get
        {
            return ConfigurationManager.AppSettings["MailFrom"];
        }
    }
    public static bool EnableErrorLogEmail
    {
        get
        {
            return bool.Parse(ConfigurationManager.AppSettings
            ["EnableErrorLogEmail"]);
        }
    }
    public static string ErrorLogEmail
    {
        get
        {
            return ConfigurationManager.AppSettings["ErrorLogEmail"];
        }
    }
    public static string getValue(String key)
    {
        return ConfigurationManager.AppSettings[key];
    }
}