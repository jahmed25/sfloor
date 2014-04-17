using System;
using MFO.Utils;
using System.Collections.Generic;
using MFO.Commom;
using SFloor.Services;
using MFO.Constants;
using System.Data;
using System.Web.Script.Serialization;
using SFloor.DTO;

public partial class sfloor_pages_AjaxService : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String action = Request.Params["action"];
        
        switch (action)
        {
            case "login":
                login();
                break;
            case "register":
                register();
                break;
            case "checkEmail":
                  checkMail();
                  break;
            case "checkRegEmail":
                  checkRegMail();
                  break;
            case "logout":
                  logout();
                  break;
            case "addFav":
                  addFav();
                  break;
        }
    }

    
    private void addFav()
    {
        Session.Remove(Constant.Session.FAV_LIST);
        string sku =Request.Params["sku"];
        Dictionary<string, string> dic = AjaxService.addFav(sku, Session.SessionID);
        if (dic.Count > 0)
        {
            JavaScriptSerializer ser = new JavaScriptSerializer();
            string json = ser.Serialize(dic);
            Response.Write(json);
            Response.AddHeader("Content-Length", json.Length.ToString());
        }
        else {
            string json = "Exist";
            Response.Write(json);
            Response.AddHeader("Content-Length", json.Length.ToString());
        }
        Response.Flush();
        Response.Close();

    }

    private void logout()
    {
        try
        {
            Session.Remove(Constant.Session.LOGED_IN_EMAIL);
            Session.Remove(Constant.Session.LOGED_IN_USER_ID);
            Session.Remove(Constant.Session.PRODUCT_COUNT);
        }
        catch { }
        Response.Redirect(ConfigUtil.hostURL()+"sfloor/pages/Home.aspx");
    }

    private void checkMail()
    {
        Errors errors = new Errors();
        if (StringUtil.isNullOrEmpty(Request.Params["email"]))
        {
            errors.addError("email", "Email is required");
        }
        else if (!CommonUtil.isValidEmail(Request.Params["email"]))
        {
            errors.addError("email", "Email id is not valid");
        }
        if (errors.errors.Count == 0) 
        {
            DataTable dt = AjaxService.getUser(Request.Params["email"]);
            if (!CommonUtil.DT.isEmptyOrNull(dt))
            {
                errors.addError("info", "Congrats!! Emaild id is Exist ");
            }
            else {
                errors.addError("email", "Oops!! Email is not Registerd");
            }
        }
        if(errors.errors.Count>0){
            JavaScriptSerializer ser = new JavaScriptSerializer();
            string errorStr = ser.Serialize(errors);
            Response.Write(errorStr);
            Response.AddHeader("Content-Length", errorStr.Length.ToString());
        }
        Response.ContentType = "application/json";
        Response.Flush();
        Response.Close();
    }
    private void checkRegMail()
    {
        Errors errors = new Errors();
        if (StringUtil.isNullOrEmpty(Request.Params["email"]))
        {
            errors.addError("email", "Email is required");
        }
        else if (!CommonUtil.isValidEmail(Request.Params["email"]))
        {
            errors.addError("email", "Email id is not valid");
        }
        if (errors.errors.Count == 0)
        {
            DataTable dt = AjaxService.getUser(Request.Params["email"]);
            if (!CommonUtil.DT.isEmptyOrNull(dt))
            {
                errors.addError("email", "Oops!! Email is already registerd");
            }
            else
            {
                errors.addError("info", "Congrats!! Email id is available ");
            }
        }
        if (errors.errors.Count > 0)
        {
            JavaScriptSerializer ser = new JavaScriptSerializer();
            string errorStr = ser.Serialize(errors);
            Response.Write(errorStr);
            Response.AddHeader("Content-Length", errorStr.Length.ToString());
        }
        Response.ContentType = "application/json";
        Response.Flush();
        Response.Close();
    }


    private void register()
    {
        Dictionary<String, String> param= new Dictionary<String, String>();
        Errors errors = validateRegister(param);
        if (errors.errors.Count==0)
        {
            try
            {
                param.Add("@SESSION_ID", Session.SessionID);
                int userId = AjaxService.register(param);
                Session[Constant.Session.LOGED_IN_USER_ID] = userId.ToString();
                Session[Constant.Session.LOGED_IN_EMAIL] = Request.Params["email"];
                JavaScriptSerializer ser = new JavaScriptSerializer();
                Dictionary<string, string> d = new Dictionary<string, string>();
                d.Add("info", "success");
                string errorStr = ser.Serialize(d);
                Response.Write(errorStr);
                Response.AddHeader("Content-Length", errorStr.Length.ToString());


            }
            catch (NotSupportedException e)
            {
                errors.addError("email", "Email id is already Registerd");
            }
            catch {
                errors.addError("system", "Oops!! internal server error, Please try again!");
            }
        }
        if(errors.errors.Count>0){
            JavaScriptSerializer ser = new JavaScriptSerializer();
            string errorStr = ser.Serialize(errors);
            Response.Write(errorStr);
            Response.AddHeader("Content-Length", errorStr.Length.ToString());
        }
        Response.ContentType = "application/json";
        Response.Flush();
        Response.Close();
    }

    private Errors validateRegister(Dictionary<String, String> param)
    {
        Errors errors = new Errors();
        if (StringUtil.isNullOrEmpty(Request.Params["email"]))
        {
            errors.addError("email", "Email is required");
        }
        else if (!CommonUtil.isValidEmail(Request.Params["email"]))
        {
            errors.addError("email", "Email id is not valid");
        }
        else
            param.Add("@EMAIL", Request.Params["email"]);

        if (StringUtil.isNullOrEmpty(Request.Params["mobile"]))
        {
            errors.addError("mobile", "Mobile No is required");
        }
        else if (Request.Params["mobile"].Length != 10)
        {
            errors.addError("mobile", "Mobile No must have 10 digit");
        }
        else
            param.Add("@MOBILE", Request.Params["mobile"]);

        if (StringUtil.isNullOrEmpty(Request.Params["gender"]))
        {
            errors.addError("gender", "Gender is required");
        }
        else
            param.Add("@GENDER", Request.Params["gender"]);

        if (StringUtil.isNullOrEmpty(Request.Params["pwd"]))
        {
            errors.addError("pwd", "Password is required");
        }
        else if (Request.Params["pwd"].Length < 8 || Request.Params["pwd"].Length > 20)
        {
            errors.addError("pwd", "Password length must be 8 to 20 character");
        }
        else
            param.Add("@PASSWORD", Request.Params["pwd"]);
        return errors;
    }

    private void login()
    {
        Errors errors = validateLogin();
        if (errors.errors.Count == 0)
        {
            try
            {
                DataTable dt = AjaxService.getUser(Request.Params["email"]);
                if (!CommonUtil.DT.isEmptyOrNull(dt))
                {
                    if (Request.Params["pwd"].Equals(dt.Rows[0]["PASSWORD"]))
                    {
                        Session[Constant.Session.LOGED_IN_USER_ID] = dt.Rows[0]["ID"];
                        Session[Constant.Session.LOGED_IN_EMAIL] = dt.Rows[0]["EMAIL"];
                        JavaScriptSerializer ser = new JavaScriptSerializer();
                        Dictionary<string, string> d = new Dictionary<string, string>();
                        d.Add("info", "success");
                        string errorStr = ser.Serialize(d);
                        Response.Write(errorStr);
                        Response.AddHeader("Content-Length", errorStr.Length.ToString());

                    }
                    else {
                        errors.addError("pwd", "Opps!! You typed wrong password");
                    }
                }
                else {
                    errors.addError("email", "Opps!! Email id is not Registerd");
                }
            }
            catch
            {
                errors.addError("system", "Oops!! internal server error, Please try again!");
            }
        }
        if (errors.errors.Count > 0)
        {
            JavaScriptSerializer ser = new JavaScriptSerializer();
            string errorStr = ser.Serialize(errors);
            Response.Write(errorStr);
            Response.AddHeader("Content-Length", errorStr.Length.ToString());

        }
        Response.ContentType = "application/json";
        Response.Flush();
        Response.Close();

    }

    private Errors validateLogin()
    {
        Errors errors = new Errors();
        if (StringUtil.isNullOrEmpty(Request.Params["email"]))
        {
            errors.addError("email", "Email is required");
        }
        else if (!CommonUtil.isValidEmail(Request.Params["email"]))
        {
            errors.addError("email", "Email id is not valid");
        }

        if (StringUtil.isNullOrEmpty(Request.Params["pwd"]))
        {
            errors.addError("pwd", "Password is required");
        }
        else if (Request.Params["pwd"].Length < 8 || Request.Params["pwd"].Length > 20)
        {
            errors.addError("pwd", "Password length must be 8 to 20 character");
        }
        return errors;
    }
}