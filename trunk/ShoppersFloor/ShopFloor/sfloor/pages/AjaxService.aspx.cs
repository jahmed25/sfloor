using System;
using MFO.Utils;
using System.Collections.Generic;
using MFO.Commom;
using SFloor.Services;
using MFO.Constants;
using System.Data;
using System.Web.Script.Serialization;
using SFloor.DTO;
using MFO.DAO;
using SFloor.DAO.Generic;
using MFO.services;
using SFloor.DAO;

public partial class sfloor_pages_AjaxService : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String action = Request.Params["action"];
        switch (action)
        {
            case "login":           login(); break;
            case "register":        register(); break;
            case "checkEmail":      checkMail(); break;
            case "checkRegEmail":   checkRegMail(); break;
            case "logout":          logout(); break;
            case "addFav":          addFav(); break;
            case "addToCart":       addToCart(); break;
            case "clearCart":       clearCart(); break;
            case "clearFav":        clearFav(); break;
            case "updateQty":       updateQty(); break;
            case "removeFromCart":  removeFromCart(); break;
        }
    }
    private void removeFromCart()
    {
        CartDAO.removeFromCart(Session.SessionID, Request.Params["sku"]);
        Session.Remove(Constant.Session.CART_ITEMS);
        Session.Remove(Constant.Session.TOTAL);
        Dictionary<string, string> dic = new Dictionary<string, string>();
        dic.Add("success", "success");
        sendResponse(dic);
    }
    private void updateQty()
    {
        string sku = Request.Params["sku"];
        string qty = Request.Params["qty"];
        Dictionary<string, string> dic = new Dictionary<string, string>();
        DataTable dt=CartDAO.getCartDT(Session.SessionID, sku);
        if (!CommonUtil.DT.isEmptyOrNull(dt))
        {
            int inventory = 0;
            if (StringUtil.isNullOrEmpty(dt.Rows[0]["Inventory"] + ""))
                inventory = 0;
            else
                inventory = (int)float.Parse(dt.Rows[0]["Inventory"] as String);
            if (inventory == 0)
            {
                dic.Add("error", "Oops!! Sorry, Items is Sold Out");
            }
            else if (inventory < Int32.Parse(qty))
            {
                string msg = "Only " + inventory + " Item(s) are left in inventory!!";
                dic.Add("error", msg);
            }
            else
            {
                int quantity = Int32.Parse(qty);
                int uPrice = Convert.ToInt32(dt.Rows[0]["UNIT_PRICE"] + "");
                int subTotal = quantity * uPrice;
                CartDAO.updateQuantity(quantity + "", Session.SessionID, sku, subTotal + "");
                Session.Remove(Constant.Session.CART_ITEMS);
                Session.Remove(Constant.Session.TOTAL);
                HomeService.getCartDT(Session.SessionID);
                string total = HomeService.getTotal();
                dic.Add("subTotal", subTotal + "");
                dic.Add("total", total);    
            }
        }
        sendResponse(dic);
    }
    private void sendResponse(Dictionary<string, string> dic)
    {
        JavaScriptSerializer ser = new JavaScriptSerializer();
        string errorStr = ser.Serialize(dic);
        Response.Write(errorStr);
        Response.AddHeader("Content-Length", errorStr.Length.ToString());
        Response.ContentType = "application/json";
        Response.Flush();
        Response.Close();
    }
    private void clearCart()
    {
        AjaxService.clearCart(Session.SessionID);
        Session.Remove(Constant.Session.CART_ITEMS);
        Session.Remove(Constant.Session.TOTAL);
        Dictionary<string, string> dic = new Dictionary<string, string>();
        dic.Add("status", "done");
        sendResponse(dic);
    }
    private void clearFav()
    {
        AjaxService.clearFav(Session.SessionID);
        Session.Remove(Constant.Session.FAV_LIST);
    }
    private void addFav()
    {
        Session.Remove(Constant.Session.FAV_LIST);
        string sku =Request.Params["sku"];
        JavaScriptSerializer ser = new JavaScriptSerializer();
        string userId = "";
        if (Session[Constant.Session.LOGED_IN_USER_ID] != null)
            userId = Session[Constant.Session.LOGED_IN_USER_ID] + "";
        Dictionary<string, string> dic = AjaxService.addFav(sku, Session.SessionID,userId);
        if (dic.Count == 0)
        {
            dic = new Dictionary<string, string>();
            dic.Add("error", "Exist");
        }
        sendResponse(dic);
    }
    private void logout()
    {
        try
        {
            Session.Remove(Constant.Session.LOGED_IN_EMAIL);
            Session.Remove(Constant.Session.LOGED_IN_USER_ID);
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
                        updateSessionIdInTable();
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
    private void updateSessionIdInTable()
    {
        CartDAO.updateCart(Session[Constant.Session.LOGED_IN_USER_ID] + "",Session.SessionID);
        FavDAO.updateFavList(Session[Constant.Session.LOGED_IN_USER_ID] + "",Session.SessionID);
        Session.Remove(Constant.Session.CART_ITEMS);
        Session.Remove(Constant.Session.FAV_LIST);
        Session.Remove(Constant.Session.TOTAL);
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
    protected void addToCart()
    {
        string qty = Request.QueryString["qty"];
        string style = Request.QueryString["sku"];
        string size = Request.QueryString["size"] == null ? "" : Request.QueryString["size"].Trim();
        string color = Request.QueryString["color"] == null ? "" : Request.QueryString["color"].Trim();
        Dictionary<string, string> dic = new Dictionary<string, string>();
        DataTable dt = AjaxService.getProdBySKU(style);
        if (!"Normal".Equals(dt.Rows[0]["SKUClassification"] + ""))
        {
            if (validateProduct().Count > 0)
            {
                sendResponse(dic);
                return;
            }
            else {
                if ("Variant".Equals(dt.Rows[0]["SKUClassification"] + ""))
                    style = dt.Rows[0]["StyleCode"]+"";    
                dt = AjaxService.getVarientProd(style, size, color);
            }
        }
        DataTable dt1 = GenericDAO.getDataTable("select * from CART where SESSION_ID='" + Session.SessionID + "' and  SKU ='" + dt.Rows[0]["SKUCode"] + "'");
        if (!CommonUtil.DT.isEmptyOrNull(dt1))
        {
            int cartQuantity = Int32.Parse(dt1.Rows[0]["QTY"]+"");
            int t = Convert.ToInt32(qty) + cartQuantity;
            int u = Convert.ToInt32(dt1.Rows[0]["UNIT_PRICE"]+"");
            int TotalPrice = t * u;
            checkInventroy(t.ToString(),dic,dt,cartQuantity.ToString());
            if (dic.Count > 0)
            {
                GenericDAO.updateQuery("update CART set QTY ='" + t + "', TOTAL='" + TotalPrice + "' where SESSION_ID='" + Session.SessionID + "' and SKU ='" + dt1.Rows[0]["SKU"] + "'");
                Session.Remove(Constant.Session.CART_ITEMS);
                Session.Remove(Constant.Session.TOTAL);
                dic.Add("success", "done");
            }
        }
        else
        {
            checkInventroy(qty, dic, dt,null);
            if(dic.Count==0){
                string userID = "";
                int price = Convert.ToInt32("" + dt.Rows[0]["SpecialPrice"]);
                int Total = price * Int32.Parse(qty);
                if (Session[Constant.Session.LOGED_IN_EMAIL] != null)
                    userID = Session[Constant.Session.LOGED_IN_EMAIL].ToString();
                CartDAO.addToCart(Session.SessionID, qty, price.ToString(), Total.ToString(), dt.Rows[0]["SKUCode"] + "", userID);
                Session.Remove(Constant.Session.CART_ITEMS);
                Session.Remove(Constant.Session.TOTAL);
                dic.Add("success", "success");
            }
        }
        sendResponse(dic);
    }

    private static void checkInventroy(string qty, Dictionary<string, string> dic, DataTable dt,string addQTY)
    {
        int inventory = 0;
        if (StringUtil.isNullOrEmpty(dt.Rows[0]["Inventory"] + ""))
            inventory = 0;
        else
            inventory = (int)float.Parse(dt.Rows[0]["Inventory"] as String);
        if (inventory == 0)
        {
            dic.Add("error", "Product is Sold Out!!");
        }
        else if (inventory < Int32.Parse(qty))
        {
            string msg = "Only " + inventory + " Product(s) are left in inventory!!";
            if (!StringUtil.isNullOrEmpty(addQTY))
                msg += "You already added " + addQTY + " Items(s) in Your Cart";
            dic.Add("error", msg);
        }
    }
    private Dictionary<string, string> validateProduct()
    {
        
        Dictionary<string, string> dic = new Dictionary<string, string>();
        string size = Request.QueryString["size"];
        string color = Request.QueryString["color"];
        string isSize = Request.QueryString["isSize"];
        string isColor = Request.QueryString["isColor"];
        string isSku = Request.QueryString["isSku"];
        string style = Request.QueryString["sku"];
        FrontViewProductDetailsDAO fvpd = new FrontViewProductDetailsDAO();
        DataTable  dt = null;
        if ("true".Equals(isColor) && "true".Equals(isSize))
        {
            if (StringUtil.isNullOrEmpty(color))
                dic.Add("error", "Please select the color");
            else if (StringUtil.isNullOrEmpty(size))
                dic.Add("error", "Please select the Size");
            else
            {
                if ("true".Equals(isSku))
                    dt = fvpd.getProdBySkuColorSize(style, color, size);
                else
                    dt = fvpd.getProdByStyleColorSize(style, color, size);
            }
        }
        else if ("true".Equals(isColor))
        {
            if (StringUtil.isNullOrEmpty(color))
            {
                dic.Add("error", "Please select the color");
            }
            else
            {
                if ("true".Equals(isSku))
                    dt = fvpd.getProdBySkuColor(style, color);
                else
                    dt = fvpd.getProdByStyleColor(style, color);
            }
        }
        else if ("true".Equals(isSize))
        {
            if (StringUtil.isNullOrEmpty(size))
            {
                dic.Add("error", "Please select the size");
            }
            else
            {
                if ("true".Equals(isSku))
                    dt = fvpd.getProdBySkuSize(style, size);
                else
                    dt = fvpd.getProdByStyleSize(style, size);
            }
        }
        return dic;
    }
}