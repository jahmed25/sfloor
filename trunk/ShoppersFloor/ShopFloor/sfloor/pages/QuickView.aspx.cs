using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Drawing;
using System.Collections.Specialized;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Collections.Generic;
using MFO.DAO;
using MFO.Commom;
using MFO.services;
using MFO.Services;
using MFO.Constants;
using MFO.Utils;
using MFO.Common;

public partial class QuickView : System.Web.UI.Page
{
    public string style;
    public string SKUClassification, VariantType;
    public string qty;
    public string size;
    public string color;
    public string isSize;
    public string isColor;
    public string isSku;

    DataTable dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        style = Request.QueryString["sku"];
        string action = Request.QueryString["action"];
        qty = Request.QueryString["qty"];
        size = Request.QueryString["size"];
        color = Request.QueryString["color"];
        isSize = Request.QueryString["isSize"];
        isColor = Request.QueryString["isColor"];
        isSku = Request.QueryString["isSku"];

        if (!StringUtil.isNullOrEmpty(action))
        {
            switch (action)
            {
                case "addToCart":
                    addToCart(style, qty, size, color, isSize, isColor, isSku);
                    break;
            }
        }
        else
        {
            updateRecentView(style);
            if (!IsPostBack)
            {
                dt = CategoryDetailsService.getDTBySKU(style);
                fillhoverimages();
                fillsmallimages();
                fillproductdetails();
            }
        }

    }
    private void updateRecentView(string skuOrStyle)
    {
        int? pId = new FrontViewProductDetailsDAO().getProductIDBySkuOrStyle(skuOrStyle);
        String userId = Session["UserID"] == null ? "" : Session["UserID"].ToString();
        String ip = CommonUtil.GetUser_IP();
        RecentViewDAO.addRecentViewItems(pId, userId, ip, DateTime.Now);
    }
    protected void addToCart(string style, string qty, string size, string color, string isSize, string isColor, string isSku)
    {
        Session.Remove("sessExpire");
        FrontViewProductDetailsDAO fvpd = new FrontViewProductDetailsDAO();
        Session.Remove(Constant.Session.PRODUCT_COUNT);
        DataTable dt = null;
        if ("true".Equals(isColor) && "true".Equals(isSize))
        {
            if (StringUtil.isNullOrEmpty(color))
            {
                Response.Write("<error>please select the color<error>");
                Response.Flush();
                Response.Close();
                return;
            }
            else if (StringUtil.isNullOrEmpty(size))
            {
                Response.Write("<error>please select the size<error>");
                Response.Flush();
                Response.Close();
                return;
            }
            else
            {
                if ("true".Equals(isSku))
                {
                    dt = fvpd.getProdBySkuColorSize(style, color, size);
                }
                else
                {
                    dt = fvpd.getProdByStyleColorSize(style, color, size);
                }
            }

        }
        else if ("true".Equals(isColor))
        {
            if (StringUtil.isNullOrEmpty(color))
            {
                Response.Write("<error>please select the color<error>");
                Response.Flush();
                Response.Close();
                return;
            }
            else
            {
                if ("true".Equals(isSku))
                {
                    dt = fvpd.getProdBySkuColor(style, color);
                }
                else
                {
                    dt = fvpd.getProdByStyleColor(style, color);
                }


            }
        }
        else if ("true".Equals(isSize))
        {
            if (StringUtil.isNullOrEmpty(size))
            {
                Response.Write("<error>please select the size<error>");
                Response.Flush();
                Response.Close();
                return;
            }
            else
            {
                if ("true".Equals(isSku))
                {
                    dt = fvpd.getProdBySkuSize(style, size);
                }
                else
                {
                    dt = fvpd.getProdByStyleSize(style, size);
                }

            }
        }
        else
        {
            dt = GenericDAO.getDataTable("select * from View_ImageProductNew_Master where SKUCode='" + style + "'");
        }
        string skuCode = dt.Rows[0]["SKUCode"] + "";
        DataTable dt1 = GenericDAO.getDataTable("select * from View_AddToCart_Master where UserID='" + Session["UserID"] + "' and  ProductSKUCode ='" + skuCode + "'");

        if (!CommonUtil.DT.isEmptyOrNull(dt1))
        {
            int cartQuantity = Int32.Parse(dt1.Rows[0]["Quantity"] as string);
            int t = Convert.ToInt32(qty) + cartQuantity;
            int u = Convert.ToInt32(dt1.Rows[0]["UnitPrice"] as string);
            int TotalPrice = t * u;
            if (t <= 20)
            {
                GenericDAO.updateQuery("update   View_AddToCart_Master set Quantity ='" + t + "', TotalPrice='" + TotalPrice + "' where UserID='" + Session["UserID"] + "' and ProductSKUCode ='" + skuCode + "'");
                Response.Write("success");
                Response.Flush();
                Response.Close();
            }
            else
            {
                Response.Write("<error>Item is More Than 20</error>");
                Response.Flush();
                Response.Close();
            }
        }
        else
        {
            AddToCartServices.addToCart(dt, qty, Session);
            Response.Write("success");
            Response.Flush();
            Response.Close();
        }
    }
    public void sizepopup()
    {
        string typeId = dt.Rows[0]["ProductTypeID"].ToString();
        switch (typeId)
        {
            case "MEJP":
                pnl_Men_Pant.Visible = true;
                break;
            case "MESH":
                pnl_Men_Shirt.Visible = true;
                break;
            case "METS":
                pnl_Men_Tshirts.Visible = true;
                break;
            case "MEFSS":
                pnl_Men_Shoes.Visible = true;
                break;
            case "MELF":
                pnl_Men_Shoes.Visible = true;
                break;
            case "WOCLJ":
                {
                    lbl_sizeguide.Visible = true;
                    pnl_Women_bottom.Visible = true;
                }
                break;
            case "WOF":
                {
                    lbl_sizeguide.Visible = true;
                    pnl_Women_Shoes.Visible = true;
                }
                break;
            case "WOTK":
                {
                    lbl_sizeguide.Visible = true;
                    pnl_Women_Top.Visible = true;
                }
                break;
            case "WOCD":
                {
                    lbl_sizeguide.Visible = true;
                    pnl_Women_dress.Visible = true;
                }
                break;
            case "WOJS":
                {
                    lbl_sizeguide.Visible = true;
                    pnl_Women_Top.Visible = true;
                }
                break;
            case "WOPT":
                {
                    lbl_sizeguide.Visible = true;
                    pnl_Women_bottom.Visible = true;
                }
                break;
            case "WOCLS":
                {
                    lbl_sizeguide.Visible = true;
                    pnl_Women_bottom.Visible = true;
                }
                break;
            case "WONU":
                {
                    lbl_sizeguide.Visible = true;
                    pnl_Women_Jumpsuit.Visible = true;
                }
                break;
            default:
                {
                    lbl_sizeguide.Visible = false;
                    img_size.Visible = false;
                }
                break;
        }

    }
    public void fillhoverimages()
    {
        //FrontViewProductDetailsDAO fvpd = new FrontViewProductDetailsDAO();
        //        DataTable dt = fvpd.gethoverimage(FirstNameValue.ToString());
        if (!CommonUtil.DT.isEmptyOrNull(dt))
        {
            DataGrid_Small.DataSource = dt;
            DataGrid_Small.DataBind();
        }
        sizepopup();

    }
    public void fillsmallimages()
    {
        if (!CommonUtil.DT.isEmptyOrNull(dt))
        {
            ImageButton1.Src = ConfigUtil.getServerPath() + dt.Rows[0]["PathInternaldetailsSmallImage"].ToString();
            if (dt.Rows[0]["PathUpperInternaldetailsSmallImage"].ToString() != "")
            {
                ImageButton2.Src = ConfigUtil.getServerPath() + dt.Rows[0]["PathUpperInternaldetailsSmallImage"].ToString();
            }
            else
            {
                ImageButton2.Visible = false;
            }
            if (dt.Rows[0]["PathLowerInternaldetailsSmallImage"].ToString() != "")
            {
                ImageButton3.Src = ConfigUtil.getServerPath() + dt.Rows[0]["PathLowerInternaldetailsSmallImage"].ToString();
            }
            else
            {
                ImageButton3.Visible = false;
            }
            if (dt.Rows[0]["PathBackInternaldetailsSmallImage"].ToString() != "")
            {
                ImageButton4.Src = ConfigUtil.getServerPath() + dt.Rows[0]["PathBackInternaldetailsSmallImage"].ToString();
            }
            else
            {
                ImageButton4.Visible = false;
            }
        }
    }
    public void fillproductdetails()
    {
        string selecteSKU = "";
        DataTable dt = CategoryDetailsService.getDTBySKUORStyle(style.ToString(), style.ToString());
        if (!CommonUtil.DT.isEmptyOrNull(dt))
        {
            if (!StringUtil.isNullOrEmpty(dt.Rows[0]["StyleCode"] + ""))
            {
                style = dt.Rows[0]["StyleCode"] + "";
                isSku = "false";
            }
            else
            {
                selecteSKU = style = dt.Rows[0]["SKUCode"] + "";
                isSku = "true";
            }
            //lnkbtn_brandname.Text = dt.Rows[0]["SKUBrand"] + "";

            lbl_category.Text = dt.Rows[0]["SKUCategory"].ToString();
            if (StringUtil.isNullOrEmpty(dt.Rows[0]["Color"] + ""))
            {
                lbl_colortext.Visible = false;
                lbl_txtcolor.Visible = false;
                lbl_productcolor.Visible = false;
            }
            else
            {
                isColor = "true";
                color = lbl_color.Text = dt.Rows[0]["Color"] + "";
                lbl_productcolor.Text = dt.Rows[0]["Color"].ToString();
            }
            //  lbl_productname.Text = dt.Rows[0]["SKUName"].ToString();
            lbl_descproductname.Text = dt.Rows[0]["SKUName"].ToString();
            lbl_productdescription.Text = dt.Rows[0]["SKULongDescription"].ToString();
            lbl_productprice.Text = dt.Rows[0]["SpecialPrice"].ToString();
            lbl_crosprice.Text = dt.Rows[0]["MRP"].ToString();
            lbl_returnpolicy.Text = dt.Rows[0]["ShippingReturns"].ToString();
            lbl_tabreturnpolicy.Text = dt.Rows[0]["ShippingReturns"].ToString();
            lbl_SizeDataType.Text = dt.Rows[0]["SizeDataType"].ToString();
            Session["SKUCategory"] = dt.Rows[0]["SKUCategory"].ToString();
            Session["lnkbtn_categorytype"] = dt.Rows[0]["SKUCategoryType"].ToString();
            if (lbl_productprice.Text == lbl_crosprice.Text)
            {
                lbl_crosprice.Visible = false;
                image_crossprize.Visible = false;
            }
            else
            {
                lbl_crosprice.Visible = false;
                image_crossprize.Visible = false;
            }
            lbl_ataglance.Text = dt.Rows[0]["SKUProductDetails"].ToString();
            lbl_productbrand.Text = dt.Rows[0]["SKUBrand"].ToString();
            if (StringUtil.isNullOrEmpty(dt.Rows[0]["Material"] + ""))
            {
                lbl_txtmaterial.Visible = false;
                lbl_productmaterial.Visible = false;
            }
            else
            {
                lbl_productmaterial.Text = dt.Rows[0]["Material"].ToString();
            }
            if ("Style".Equals(dt.Rows[0]["SKUClassification"] + "") || "Variant".Equals(dt.Rows[0]["SKUClassification"] + ""))
            {
                ChangeColorImage();
                SelectSizeImage();
            }
            else
            {
                size = dt.Rows[0]["Size"].ToString();
                if (!StringUtil.isNullOrEmpty(size))
                {
                    isSize = "true";
                }
                else
                {
                    isSize = "false";
                }
            }
            int? quantity = null;
            if (StringUtil.isNullOrEmpty(dt.Rows[0]["Inventory"] + ""))
                quantity = 0;
            else
                quantity = (int)float.Parse(dt.Rows[0]["Inventory"] as String);
            if (quantity < 20)
            {
                if (quantity == 0)
                {
                    quantityP.Controls.Clear();
                    quantityP.InnerHtml = "<span style='width:100%;float:left;padding-top:10px;font:bold 15px/100% Georgia, Calibri;text-align:left;color:#878787;'>Sold Out<span>";
                    btn_addtocart.Visible = false;
                    btn_addtocart1.Visible = false;
                    lnkbtn_ctaddtowaitlist.Text = "Notify Me";
                }
                dd_quantity.Items.Clear();
                for (int i = 1; i <= quantity; i++)
                {
                    dd_quantity.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }
            }
        }
    }
    public void sendEmail()
    {
        try
        {
            SmtpClient client = new SmtpClient();
            MailMessage message = new MailMessage();
            client.Host = "mail.megafactoryoutlet.com";
            client.Port = 25;
            client.UseDefaultCredentials = true;
            //client.Credentials = new System.Net.NetworkCredential("info@megafactoryoutlet.com", "Info#123");
            client.Credentials = new System.Net.NetworkCredential("info@megafactoryoutlet.com", "sairam#321");
            client.EnableSsl = false;
            MailAddress SendFrom = new MailAddress("info@megafactoryoutlet.com", "MegaFactoryOutlet");
            MailAddress SendTo = new MailAddress("rakesh@megafactoryoutlet.com");
            message = new MailMessage(SendFrom, SendTo);
            message.Subject = "Registration";
            //message.Body = "<html><body><table width=900px cellpadding=10><tr><td><img src = 'http://testing.megafactoryoutlet.com/images/magalogo19.png' /></td></tr></table></body></html>";
            message.Body = "<html><body><table width=900px cellpadding=10><tr><td><table width=100% border=0 ><tr><td align=center bgcolor=FFF3F8 height=70px><font face=Candara, Arial, Helvetica, sans-serif color=#888888 size=2>If you are unable to see this message,<a href='#'><font face='Candara, Arial, Helvetica, sans-serif' color='#888888' size='2'> click here</a> to view.<br />To ensure delivery to your inbox, please add <a href='#'>asadullah@megafactoryoutlet.com</a> to your address book. </font></td></tr><tr><td width='100%' height='80px' style='background-color:#313131;color:#F5F5F5;'><table ><tr><td width='350px'><h1><a href='http://web3.128.210.new.ocpwebserver.com/'><img src = 'http://testing.megafactoryoutlet.com/images/magalogo19.png' /></a></h1></td><td width='100px' ><font face='Candara, Arial, Helvetica, sans-serif' color='#FFF' size='4'><b>Women</b></font></td><td width='100px'><font face='Candara, Arial, Helvetica, sans-serif' color='#FFF' size='4'><b>Men</b></font></td><td width='130px'><font face='Candara, Arial, Helvetica, sans-serif' color='#FFF' size='4'><b>Baby & Kids</b></font></td><td width='130px'><font face='Candara, Arial, Helvetica, sans-serif' color='#FFF' size='4'><b>Home & Decor</b></font></td></tr></table></td></tr><tr><td height='10px'></td></tr><tr><td width='900px' bgcolor='#EBEBE8'><table cellpadding='10' ><tr><td width='650px' ><font face='Candara, Arial, Helvetica, sans-serif' color='#313131' size='6'>Asad Shared a Style with you</font></td><td width='250px' ><table><tr><td width='180px' height='30px' align='center' bgcolor='#F54D96'><a href='#'><font face='Candara, Arial, Helvetica, sans-serif' color='#FFF' size='3'><b>Buy Now</b></font></a></td></tr></table></td></tr></table></td></tr><tr><td><table bgcolor='#EBEBE8' ><tr><td width='600px'><table cellspacing='10'><tr><td><font face='Candara, Arial, Helvetica, sans-serif' color='#313131' size='3'><b>Messege from Asad</b></font><br /><br /><font face='Candara, Arial, Helvetica, sans-serif' color='#313131' size='3'>hi ! Hello</font></td></tr><tr><td><img width='180px' height='240px' src='Images/arrival2.jpg' /></td><td><a><font face='Candara, Arial, Helvetica, sans-serif' color='#313131' size='3'>Mega factory</font></a><br /><a><font face='Candara, Arial, Helvetica, sans-serif' color='#313131' size='3'>Bags</font></a><br /><a><font face='Candara, Arial, Helvetica, sans-serif' color='#313131' size='3'>Mega Price Rs. 1200</font></a><br /><a><font face='Candara, Arial, Helvetica, sans-serif' color='#313131' size='3'>Original Price Rs. 1800</font></a><br /><br /><table cellspacing='2' ><tr><td width='160px' height='24px' align='center' bgcolor='#F54D96'><a href='#'><font face='Candara, Arial, Helvetica, sans-serif' color='#FFF' size='3'>Buy Now</font></a></td></tr></table><br /><br /><br /></td></tr><tr><td colspan='2' cellpadding='5' ><font face='Candara, Arial, Helvetica, sans-serif' color='#313131' size='3'><b>Hurry before its too late !</b></font><br /><br /><font face='Candara, Arial, Helvetica, sans-serif' color='#313131' size='3'>This item is not reserved until you add it to your cart</font></td></tr><tr><td colspan='2' width='100%' height='240px'></td></tr></table></td><td><table border='1px' bordercolor='#ECECEC' width='px' height='640px'></table></td><td width='290px' cellpadding='0' cellspacing='15'><table><br /><tr><td border='1'><font face='Candara, Arial, Helvetica, sans-serif' color='#313131' size='3'><b>You may also like</b></font><br /><br /><img width='200px' height='140px' src='Images/arrival2.jpg' /><br /><br /><a href='#'><font face='Candara, Arial, Helvetica, sans-serif' color='#F54D96' size='3'>Buyers' Picks</font></a><br /><br /><img width='200px' height='140px' src='Images/arrival2.jpg' /><br /><br /><a href='#'><font face='Candara, Arial, Helvetica, sans-serif' color='#F54D96' size='3'>Buyers' Picks</font><br /></a><br /><img width='200px' height='140px' src='Images/arrival2.jpg' /><br /><br /><a href='#'><font face='Candara, Arial, Helvetica, sans-serif' color='#F54D96' size='3'>Buyers' Picks</font></a><br /><font face='Candara, Arial, Helvetica, sans-serif' color='#313131' size='2'>Everything you need to look sharp at the office or for a night</font></td></tr></table></td></tr><tr><td rowspan='2'></td></tr></table></td><td></td></tr><tr><td bgcolor='#FFF3F8' align='center' height='80px'><font face='Candara, Arial, Helvetica, sans-serif' color='#888888' size='2'>To unsubscribe from email advertisements from MEGA, please <a href='#'><font face='Candara, Arial, Helvetica, sans-serif' color='#888888' size='2'>click here.</font></a></font><br /><br /><font face='Candara, Arial, Helvetica, sans-serif' color='#888888' size='2'>Mega<br /> Pace city - II , Gurgaon, Haryana, India</font></td></tr></table></td></tr></table></body></html>";
            //string mbody = "<html><body><table width=900px cellpadding=10><tr><td><table width=100% border=0 ><tr><td align=center bgcolor=FFF3F8 height=70px><font face=Candara, Arial, Helvetica, sans-serif color=#888888 size=2>If you are unable to see this message,<a href='#'><font face='Candara, Arial, Helvetica, sans-serif' color='#888888' size='2'> click here</a> to view.<br />To ensure delivery to your inbox, please add <a href='#'>asadullah@megafactoryoutlet.com</a> to your address book. </font></td></tr><tr><td width='100%' height='80px' style='background-color:#313131;color:#F5F5F5;'><table ><tr><td width='350px'><h1><img width='180' height='60' src='Images/logo.png' /></h1></td><td width='100px' ><font face='Candara, Arial, Helvetica, sans-serif' color='#FFF' size='4'><b>Women</b></font></td><td width='100px'><font face='Candara, Arial, Helvetica, sans-serif' color='#FFF' size='4'><b>Men</b></font></td><td width='130px'><font face='Candara, Arial, Helvetica, sans-serif' color='#FFF' size='4'><b>Baby & Kids</b></font></td><td width='130px'><font face='Candara, Arial, Helvetica, sans-serif' color='#FFF' size='4'><b>Home & Decor</b></font></td></tr></table></td></tr><tr><td height='10px'></td></tr><tr><td width='900px' bgcolor='#EBEBE8'><table cellpadding='10' ><tr><td width='650px' ><font face='Candara, Arial, Helvetica, sans-serif' color='#313131' size='6'>Asad Shared a Style with you</font></td><td width='250px' ><table><tr><td width='180px' height='30px' align='center' bgcolor='#F54D96'><a href='#'><font face='Candara, Arial, Helvetica, sans-serif' color='#FFF' size='3'><b>Buy Now</b></font></a></td></tr></table></td></tr></table></td></tr><tr><td><table bgcolor='#EBEBE8' ><tr><td width='600px'><table cellspacing='10'><tr><td><font face='Candara, Arial, Helvetica, sans-serif' color='#313131' size='3'><b>Messege from Asad</b></font><br /><br /><font face='Candara, Arial, Helvetica, sans-serif' color='#313131' size='3'>hi ! Hello</font></td></tr><tr><td><img width='180px' height='240px' src='Images/arrival2.jpg' /></td><td><a><font face='Candara, Arial, Helvetica, sans-serif' color='#313131' size='3'>Mega factory</font></a><br /><a><font face='Candara, Arial, Helvetica, sans-serif' color='#313131' size='3'>Bags</font></a><br /><a><font face='Candara, Arial, Helvetica, sans-serif' color='#313131' size='3'>Mega Price Rs. 1200</font></a><br /><a><font face='Candara, Arial, Helvetica, sans-serif' color='#313131' size='3'>Original Price Rs. 1800</font></a><br /><br /><table cellspacing='2' ><tr><td width='160px' height='24px' align='center' bgcolor='#F54D96'><a href='#'><font face='Candara, Arial, Helvetica, sans-serif' color='#FFF' size='3'>Buy Now</font></a></td></tr></table><br /><br /><br /></td></tr><tr><td colspan='2' cellpadding='5' ><font face='Candara, Arial, Helvetica, sans-serif' color='#313131' size='3'><b>Hurry before its too late !</b></font><br /><br /><font face='Candara, Arial, Helvetica, sans-serif' color='#313131' size='3'>This item is not reserved until you add it to your cart</font></td></tr><tr><td colspan='2' width='100%' height='240px'></td></tr></table></td><td><table border='1px' bordercolor='#ECECEC' width='px' height='640px'></table></td><td width='290px' cellpadding='0' cellspacing='15'><table><br /><tr><td border='1'><font face='Candara, Arial, Helvetica, sans-serif' color='#313131' size='3'><b>You may also like</b></font><br /><br /><img width='200px' height='140px' src='Images/arrival2.jpg' /><br /><br /><a href='#'><font face='Candara, Arial, Helvetica, sans-serif' color='#F54D96' size='3'>Buyers' Picks</font></a><br /><br /><img width='200px' height='140px' src='Images/arrival2.jpg' /><br /><br /><a href='#'><font face='Candara, Arial, Helvetica, sans-serif' color='#F54D96' size='3'>Buyers' Picks</font><br /></a><br /><img width='200px' height='140px' src='Images/arrival2.jpg' /><br /><br /><a href='#'><font face='Candara, Arial, Helvetica, sans-serif' color='#F54D96' size='3'>Buyers' Picks</font></a><br /><font face='Candara, Arial, Helvetica, sans-serif' color='#313131' size='2'>Everything you need to look sharp at the office or for a night</font></td></tr></table></td></tr><tr><td rowspan='2'></td></tr></table></td><td></td></tr><tr><td bgcolor='#FFF3F8' align='center' height='80px'><font face='Candara, Arial, Helvetica, sans-serif' color='#888888' size='2'>To unsubscribe from email advertisements from MEGA, please <a href='#'><font face='Candara, Arial, Helvetica, sans-serif' color='#888888' size='2'>click here.</font></a></font><br /><br /><font face='Candara, Arial, Helvetica, sans-serif' color='#888888' size='2'>Mega<br /> Pace city - II , Gurgaon, Haryana, India</font></td></tr></table></td></tr></table></body></html>";
            message.IsBodyHtml = true;
            message.Priority = MailPriority.High;
            client.Send(message);
            lbl_erremailsignup.Visible = true;
            lbl_erremailsignup.Text = "Your Information Send Successfully";
        }
        catch (Exception ex)
        {
            lbl_erremailsignup.Text = ex.ToString();
        }
    }
    private void ChangeColorImage()
    {
        DataTable dt = CategoryDetailsService.getDTByStyleAndColor(style);
        if (!CommonUtil.DT.isEmptyOrNull(dt))
        {
            isColor = "true";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string src = ConfigUtil.getServerPath() + dt.Rows[i]["PathInternaldetailsSmallImage"].ToString();
                string imgBtn = "<img style='height:60px;width:50px;' onclick=\"quickView('" + dt.Rows[i]["SKUCode"].ToString() + "')\"class='imgbtn_color' id='img_color_btn' name='imgbtn_color_btn' src='" + src + "' sku='" + dt.Rows[i]["SKUCode"].ToString() + "'/>";
                colorDiv.InnerHtml += imgBtn;
            }
        }
    }
    private void SelectSizeImage()
    {
        DataTable dt = CategoryDetailsService.getDTByStyle(style);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            isSize = "true";
            String btn = "<input type='button' class='btn_size50' id='sizeBtn' onclick='selectSize(" + dt.Rows[i]["Size"].ToString() + ")' namespace='sizeBtn' value='" + dt.Rows[i]["Size"].ToString() + "' >";
            sizeDiv.InnerHtml += btn;
        }
    }


}
