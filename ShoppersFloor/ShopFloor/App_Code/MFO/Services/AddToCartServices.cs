using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Data;
using MFO.DAO;

/// <summary>
/// Summary description for AddToCartBusissness
/// </summary>
/// 
namespace MFO.services
{
    public class AddToCartServices
    {
        private AddToCartServices() { }

        public const String MORE_THAN_FIVE_ITEM = "MORE_THAN_FIVE_ITEM";
        public const String SIZE_NOT_DEFINE = "SIZE_NOT_DEFINE";
        public const String SUCCESS = "SUCCESS";
        public const String FAIL = "FAIL";


        public static String initAddToCart(HttpContext context, String htm, string quantity)
        {
            HttpSessionState Session = context.Session;
            HttpResponse Response = context.Response;
            HttpRequest Request = context.Request;
            String finalSkuCode = "";
            DataTable dtSku = null;
            FrontendCartDAO fec1 = new FrontendCartDAO();
            FrontViewProductDetailsDAO fvpd = new FrontViewProductDetailsDAO();
            if (("true".Equals(Session["isSize"]) && "true".Equals(Session["isColor"])) || (Session["pSize"] != null && Session["pColor"] != null))
            {
                dtSku = fvpd.getProdBySkuColorSize(Session["PSKUCode"] as String, Session["pColor"] as String, Session["pSize"] as String);
                if (dtSku.Rows.Count == 0)
                {
                    dtSku = fvpd.getProdBySkuColorSize(Session["PSKUCode"] as String, Session["pColor"] as String, Session["pSize"] as String);
                }
            }
            else if (("true".Equals(Session["isSize"]) && !"true".Equals(Session["isColor"])) || (Session["pSize"] != null && Session["pColor"] == null))
            {
                dtSku = fvpd.getProdByStyleSize(Session["PSKUCode"] as String, Session["pSize"] as String);
                if (dtSku.Rows.Count == 0)
                {
                    dtSku = fvpd.getSkuCodeBySize1(Session["PSKUCode"] as String, Session["pColor"] as String);
                }
            }
            else if ((!"true".Equals(Session["isSize"]) && "true".Equals(Session["isColor"])) || (Session["pSize"] == null && Session["pColor"] != null))
            {
                dtSku = fvpd.getProdByStyleColor(Session["PSKUCode"] as String, Session["pColor"] as String);
                if (dtSku.Rows.Count == 0)
                {
                    dtSku = fvpd.getSkuCodeByColor1(Session["PSKUCode"] as String, Session["pColor"] as String);
                }
            }
            if (null != dtSku && dtSku.Rows.Count > 0)
            {
                finalSkuCode = dtSku.Rows[0]["SKUCode"] as String;
            }
            if ("".Equals(finalSkuCode) || null == finalSkuCode)
            {
                finalSkuCode = htm;
            }
            if (null == dtSku || dtSku.Rows.Count > 0)
            {
                dtSku = fec1.getproductdetails(finalSkuCode);
            }
            if (Session["UserID"] == null)
            {
                Response.Redirect(Request.UrlReferrer.ToString());
            }
            DataTable dt_addToCart = fec1.getaddtocartproductfornew(Convert.ToInt32(Session["UserID"].ToString()), finalSkuCode);
            if (dt_addToCart.Rows.Count > 0)
            {
                int cartQuantity = Int32.Parse(dt_addToCart.Rows[0]["Quantity"] as string);
                int t = Convert.ToInt32(quantity) + cartQuantity;
                int u = Convert.ToInt32(dt_addToCart.Rows[0]["UnitPrice"] as string);
                int TotalPrice = t * u;
                if (t <= 20)
                {
                    fec1.updateaddtocartproductdetails(Session["UserID"].ToString() as string, finalSkuCode, t, TotalPrice);
                    Response.Redirect(ConfigUtil.hostURL() + "Add-To-Cart");
                }
                else
                {
                    return MORE_THAN_FIVE_ITEM;
                }
            }
            else if (dtSku.Rows.Count > 0)
            {
                if ("Size".Equals(dtSku.Rows[0]["VariantType"]))
                {
                    if (Session["pSize"] == null)
                    {
                        return SIZE_NOT_DEFINE;
                    }
                    else
                    {
                        addToCart(dtSku, quantity, Session);
                        Response.Redirect(ConfigUtil.hostURL() + "Add-To-Cart");
                    }
                }
                else
                {
                    addToCart(dtSku, quantity, Session);
                    Response.Redirect(ConfigUtil.hostURL() + "Add-To-Cart");

                }
            }
            return SIZE_NOT_DEFINE;
        }

        public static void addToCart(DataTable dtSku, String q, System.Web.SessionState.HttpSessionState Session)
        {
            int t = Convert.ToInt32(q);
            int u = Convert.ToInt32("" + dtSku.Rows[0]["SpecialPrice"]);
            int TotalPrice = t * u;
            FrontendCartDAO fec = new FrontendCartDAO();
            Dictionary<string, string> paramDic = new Dictionary<string, string>();
            paramDic.Add("@AddToCart_UserID", Session["UserID"].ToString());
            paramDic.Add("@AddToCart_ProductID", dtSku.Rows[0]["ImageNewID"] + "");
            paramDic.Add("@AddToCart_AddToCartName", "" + Session["UserName"]);
            paramDic.Add("@AddToCart_ImagePath", ConfigUtil.getServerPath() + dtSku.Rows[0]["PathInternaldetailsSmallImage"]);
            paramDic.Add("@AddToCart_BrandName", "" + dtSku.Rows[0]["SKUBrand"]);
            paramDic.Add("@AddToCart_ProductName", "" + dtSku.Rows[0]["SKUName"]);
            paramDic.Add("@AddToCart_Color", "" + dtSku.Rows[0]["Color"]);
            paramDic.Add("@AddToCart_Size", "" + dtSku.Rows[0]["Size"]);
            paramDic.Add("@AddToCart_EstimatedDelivery", "2-5 days");
            paramDic.Add("@AddToCart_TimeRemainning", "This item is no longer reserved.");
            paramDic.Add("@AddToCart_UnitPrice", "" + dtSku.Rows[0]["SpecialPrice"]);
            paramDic.Add("@AddToCart_Quantity", "" + t);
            paramDic.Add("@AddToCart_TotalPrice", TotalPrice.ToString());
            paramDic.Add("@AddToCart_Description", "International orders are final sale and non-returnable.");
            paramDic.Add("@AddToCart_CreatedName", "" + Session["UserName"]);
            paramDic.Add("@AddToCart_RecordStatus", "1");
            paramDic.Add("@AddToCart_ProductSKUCode", "" + dtSku.Rows[0]["SKUCode"]);
            paramDic.Add("@AddToCart_ShippingReturns", "" + dtSku.Rows[0]["ShippingReturns"]);
            fec.AddToCartByUser(paramDic);
        }


        public static String addToWishList(String sku, string quantity, string userId, String Size)
        {

            FrontViewProductDetailsDAO fvpd = new FrontViewProductDetailsDAO();
            DataTable dt = fvpd.getaddtowishlistdetails(sku);
            if (dt.Rows.Count > 0)
            {
                string VariantType = dt.Rows[0]["VariantType"].ToString();
                if (VariantType == "Size" && Size == null)
                {
                    return SIZE_NOT_DEFINE;
                }
                int t = Convert.ToInt32(quantity);
                int u = Convert.ToInt32(dt.Rows[0]["SpecialPrice"].ToString());
                int TotalPrice = t * u;
                FrontendCartDAO fec = new FrontendCartDAO();
                Dictionary<string, string> paramDic = new Dictionary<string, string>();
                paramDic.Add("@AddToWaitList_UserID", userId);
                paramDic.Add("@AddToWaitList_ProductID", dt.Rows[0]["ImageNewID"].ToString());
                paramDic.Add("@AddToWaitList_AddToWaitListName", userId);
                paramDic.Add("@AddToWaitList_ImagePath", dt.Rows[0]["PathInternaldetailsSmallImage"].ToString());
                paramDic.Add("@AddToWaitList_BrandName", dt.Rows[0]["SKUBrand"].ToString());
                paramDic.Add("@AddToWaitList_ProductName", dt.Rows[0]["SKUName"].ToString());
                paramDic.Add("@AddToWaitList_Color", dt.Rows[0]["Color"].ToString());
                paramDic.Add("@AddToWaitList_Size", dt.Rows[0]["Size"].ToString());
                paramDic.Add("@AddToWaitList_EstimatedDelivery", "03/12/13 - 03/18/13");
                paramDic.Add("@AddToWaitList_TimeRemainning", "This item is no longer reserved.");
                paramDic.Add("@AddToWaitList_UnitPrice", dt.Rows[0]["SpecialPrice"].ToString());
                paramDic.Add("@AddToWaitList_Quantity", quantity);
                paramDic.Add("@AddToWaitList_TotalPrice", TotalPrice.ToString());
                paramDic.Add("@AddToWaitList_Description", "International orders are final sale and non-returnable.");
                paramDic.Add("@AddToWaitList_CreatedName", "MegaFactoryOutlet");
                paramDic.Add("@AddToWaitList_RecordStatus", "1");
                paramDic.Add("@AddToWaistList_ProductSKUCode", sku);
                fec.AddToWishlistByUser(paramDic);
                return SUCCESS;
            }
            return FAIL;
        }
    }
}