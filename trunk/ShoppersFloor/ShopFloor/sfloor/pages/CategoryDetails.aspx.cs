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
using SFloor.Pages;

public partial class CategoryDetails : GenericPage
{
    
    string  styleCodeParam;
    string SKUClassification, VariantType;
    DataTable dt;
    #region Page Load
    public override void load(object sender, EventArgs e)
    {
        moreThanFiveSpan.Visible = false;
        NameValueCollection n = Request.QueryString;
        string skuStyle = Request.QueryString["htm"];
        updateRecentView(skuStyle);
        if (n.HasKeys())
        {
            styleCodeParam = n.Get(0);
        }
        if (!IsPostBack)
        {
            dt = CategoryDetailsService.getDTBySKU(styleCodeParam.ToString());
            fillhoverimages();
            fillsmallimages();
            fillproductdetails();
            fillrelatedproductdetails();
            fillRecentView();
            
            
            base.Master.Page.Title = "Buy " + Session["TitleBrand"].ToString() + " " + Session["TitleProductName"].ToString() + " online at Megafactoryoutlet.com | " + ViewState["SKUCode"].ToString() + " ";
            base.Master.Page.MetaDescription = @"Shop " + Session["TitleBrand"].ToString() + " " + Session["TitleProductName"].ToString() + " online at best price in India on Megafactoryoutlet.com. Branded Prodcts. Free Shipping. Cash on Delivery. 15 Days Return Policy. Customer Support(24x7).";
            base.Master.Page.MetaKeywords = @"" + Session["TitleProductName"].ToString() + ", " + Session["TitleBrand"].ToString() + " " + Session["TitleProductName"].ToString() + ", " + Session["TitleBrand"].ToString() + ", Mega factory outlet, Megafactoryoutlet.com ";
        }
       
        if (Session["sizeError"] != null)
        {
            lbl_selectsizemssge.Visible = true;
            lbl_selectsizemssge.Text = "Please select a size.";
            Session.Remove("sizeError");
        }
        if (Session["quatityError"] != null)
        {
            moreThanFiveSpan.Visible = true;
            Session.Remove("quatityError");
        }
    }

    private void fillRecentView()
    {
        DataTable td=null;
        String userId = "" + Session["UserID"];
        td = RecentViewDAO.getRecentItemsByUserId(userId, CommonUtil.GetUser_IP());
        

        if (td != null && td.Rows.Count > 0)
        {
            //recentViewDiv.Visible = true;
            recentViewGrid.DataSource = td;
            recentViewGrid.DataBind();

        }

    }

    private void updateRecentView(string skuOrStyle)
    {
        int? pId = new FrontViewProductDetailsDAO().getProductIDBySkuOrStyle(skuOrStyle);
        String userId=Session["UserID"]==null?"" : Session["UserID"].ToString();
        String ip=CommonUtil.GetUser_IP();
        RecentViewDAO.addRecentViewItems(pId,userId,ip,DateTime.Now);
       
    }

   
  
    public void sizepopup()
    {
        Label sizemessage = new Label();
        sizemessage.Text = "";
        sizemessage.Text = Session["ProductTypeID"].ToString();
        if (sizemessage.Text == "MEJP")
        {
            pnl_Men_Pant.Visible = true;
            pnl_Men_Shirt.Visible = false;
            pnl_Men_Shoes.Visible = false;
            pnl_Men_Tshirts.Visible = false;
            pnl_Women_bottom.Visible = false;
            pnl_Women_Shoes.Visible = false;
            pnl_Women_Top.Visible = false;
        }
        else if (sizemessage.Text == "MESH")
        {
            pnl_Men_Pant.Visible = false;
            pnl_Men_Shirt.Visible = true;
            pnl_Men_Shoes.Visible = false;
            pnl_Men_Tshirts.Visible = false;
            pnl_Women_bottom.Visible = false;
            pnl_Women_Shoes.Visible = false;
            pnl_Women_Top.Visible = false;
            pnl_Women_Jumpsuit.Visible = false;
        }
        else if (sizemessage.Text == "METS")
        {
            pnl_Men_Pant.Visible = false;
            pnl_Men_Shirt.Visible = false;
            pnl_Men_Shoes.Visible = false;
            pnl_Men_Tshirts.Visible = true;
            pnl_Women_bottom.Visible = false;
            pnl_Women_Shoes.Visible = false;
            pnl_Women_Top.Visible = false;
        }
        else if (sizemessage.Text == "MEFSS")
        {
            pnl_Men_Pant.Visible = false;
            pnl_Men_Shirt.Visible = false;
            pnl_Men_Shoes.Visible = true;
            pnl_Men_Tshirts.Visible = false;
            pnl_Women_bottom.Visible = false;
            pnl_Women_Shoes.Visible = false;
            pnl_Women_Top.Visible = false;
        }
        else if (sizemessage.Text == "MEFFS")
        {
            pnl_Men_Pant.Visible = false;
            pnl_Men_Shirt.Visible = false;
            pnl_Men_Shoes.Visible = true;
            pnl_Men_Tshirts.Visible = false;
            pnl_Women_bottom.Visible = false;
            pnl_Women_Shoes.Visible = false;
            pnl_Women_Top.Visible = false;
        }
        else if (sizemessage.Text == "MELF")
        {
            pnl_Men_Pant.Visible = false;
            pnl_Men_Shirt.Visible = false;
            pnl_Men_Shoes.Visible = true;
            pnl_Men_Tshirts.Visible = false;
            pnl_Women_bottom.Visible = false;
            pnl_Women_Shoes.Visible = false;
            pnl_Women_Top.Visible = false;
        }
        else if (sizemessage.Text == "WOCLJ")
        {
            lbl_sizeguide.Visible = true;
            pnl_Men_Pant.Visible = false;
            pnl_Men_Shirt.Visible = false;
            pnl_Men_Shoes.Visible = false;
            pnl_Men_Tshirts.Visible = false;
            pnl_Women_bottom.Visible = true;
            pnl_Women_Shoes.Visible = false;
            pnl_Women_Top.Visible = false;
        }
        else if (sizemessage.Text == "WOF")
        {
            lbl_sizeguide.Visible = true;
            pnl_Men_Pant.Visible = false;
            pnl_Men_Shirt.Visible = false;
            pnl_Men_Shoes.Visible = false;
            pnl_Men_Tshirts.Visible = false;
            pnl_Women_bottom.Visible = false;
            pnl_Women_Shoes.Visible = true;
            pnl_Women_Top.Visible = false;
        }
        else if (sizemessage.Text == "WOTK")
        {
            lbl_sizeguide.Visible = true;
            pnl_Men_Pant.Visible = false;
            pnl_Men_Shirt.Visible = false;
            pnl_Men_Shoes.Visible = false;
            pnl_Men_Tshirts.Visible = false;
            pnl_Women_bottom.Visible = false;
            pnl_Women_Shoes.Visible = false;
            pnl_Women_Top.Visible = true;
        }
        else if (sizemessage.Text == "WOCD")
        {
            lbl_sizeguide.Visible = true;
            pnl_Women_dress.Visible = true;
            pnl_Men_Pant.Visible = false;
            pnl_Men_Shirt.Visible = false;
            pnl_Men_Shoes.Visible = false;
            pnl_Men_Tshirts.Visible = false;
            pnl_Women_bottom.Visible = false;
            pnl_Women_Shoes.Visible = false;
            pnl_Women_Top.Visible = false;
        }
        else if (sizemessage.Text == "WOJS")
        {
           lbl_sizeguide.Visible = true;
            pnl_Men_Pant.Visible = false;
            pnl_Men_Shirt.Visible = false;
            pnl_Men_Shoes.Visible = false;
            pnl_Men_Tshirts.Visible = false;
            pnl_Women_bottom.Visible = false;
            pnl_Women_Shoes.Visible = false;
            pnl_Women_Top.Visible = false;
            pnl_Women_Jumpsuit.Visible = true;
        }
        else if (sizemessage.Text == "WOJS")
        {
            lbl_sizeguide.Visible = true;
            pnl_Men_Pant.Visible = false;
            pnl_Men_Shirt.Visible = false;
            pnl_Men_Shoes.Visible = false;
            pnl_Men_Tshirts.Visible = false;
            pnl_Women_bottom.Visible = false;
            pnl_Women_Shoes.Visible = false;
            pnl_Women_Top.Visible = true;
        }
        else if (sizemessage.Text == "WOPT")
        {
            lbl_sizeguide.Visible = true;
            pnl_Men_Pant.Visible = false;
            pnl_Men_Shirt.Visible = false;
            pnl_Men_Shoes.Visible = false;
            pnl_Men_Tshirts.Visible = false;
            pnl_Women_bottom.Visible = true;
            pnl_Women_Shoes.Visible = false;
            pnl_Women_Top.Visible = false;
        }
        else if (sizemessage.Text == "WOCLS")
        {
            lbl_sizeguide.Visible = true;
            pnl_Men_Pant.Visible = false;
            pnl_Men_Shirt.Visible = false;
            pnl_Men_Shoes.Visible = false;
            pnl_Men_Tshirts.Visible = false;
            pnl_Women_bottom.Visible = true;
            pnl_Women_Shoes.Visible = false;
            pnl_Women_Top.Visible = false;
        }
        else if (sizemessage.Text == "WOTK")
        {
            lbl_sizeguide.Visible = true;
            pnl_Men_Pant.Visible = false;
            pnl_Men_Shirt.Visible = false;
            pnl_Men_Shoes.Visible = false;
            pnl_Men_Tshirts.Visible = false;
            pnl_Women_bottom.Visible = false;
            pnl_Women_Shoes.Visible = false;
            pnl_Women_Top.Visible = true;
        }
        else if (sizemessage.Text == "WONU")
        {
            lbl_sizeguide.Visible = true;
            pnl_Men_Pant.Visible = false;
            pnl_Men_Shirt.Visible = false;
            pnl_Men_Shoes.Visible = false;
            pnl_Men_Tshirts.Visible = false;
            pnl_Women_bottom.Visible = false;
            pnl_Women_Shoes.Visible = false;
            pnl_Women_Top.Visible = false;
            pnl_Women_Jumpsuit.Visible = true;
        }
        else
        {
            lbl_sizeguide.Visible = false;
            img_size.Visible = false;
        }

    }
    #endregion
    #region FillAllImages
    public void fillhoverimages()
    {
        //FrontViewProductDetailsDAO fvpd = new FrontViewProductDetailsDAO();
//        DataTable dt = fvpd.gethoverimage(FirstNameValue.ToString());
       
        CommonUtil.DtNullCheck(dt);
        if (dt.Rows.Count > 0)
        {
            DataGrid_Small.DataSource = dt;
            DataGrid_Small.DataBind();
            ViewState["SKUProductType"] = dt.Rows[0]["SKUProductType"].ToString();
            Session["ProductTypeID"] = dt.Rows[0]["ProductTypeID"].ToString();
            ViewState["SKUProductType"] = dt.Rows[0]["SKUProductType"].ToString();
        }
        sizepopup();       

    }
    public void fillsmallimages()
    {
        //FrontViewProductDetailsDAO fvpd = new FrontViewProductDetailsDAO();
       // DataTable dt = fvpd.getsmallimage(FirstNameValue.ToString());
        CommonUtil.DtNullCheck(dt);
        if (dt.Rows.Count > 0)
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
    #endregion
    #region fillproductdetails
    public void fillproductdetails()
    {
        string selecteSKU = "";
        //FrontViewProductDetailsDAO fvpd = new FrontViewProductDetailsDAO();
        // DataTable dt = fvpd.getcategorydetails(FirstNameValue.ToString(), FirstNameValue.ToString());
         DataTable dt = CategoryDetailsService.getDTBySKUORStyle(styleCodeParam.ToString(), styleCodeParam.ToString());
        CommonUtil.DtNullCheck(dt);
        if (dt.Rows.Count > 0)
        {

            if (dt.Rows[0]["StyleCode"] != "" && null != dt.Rows[0]["StyleCode"])
            {
                Session.Add("PSKUCode", dt.Rows[0]["StyleCode"] as String);
            }
            else
            {
                Session.Add("PSKUCode", dt.Rows[0]["SKUCode"] as String);

            }
            if (dt.Rows.Count > 0)
            {
                //lnkbtn_brandname.Text = dt.Rows[0]["SKUBrand"].ToString();
                Session["TitleBrand"] = dt.Rows[0]["SKUBrand"].ToString();
                lbl_color.Text = dt.Rows[0]["Color"].ToString();
                lbl_category.Text = dt.Rows[0]["SKUCategory"].ToString();
                if (lbl_color.Text == "")
                {
                    lbl_colortext.Visible = false;
                }

                Session["SKUCode"] = dt.Rows[0]["SKUCode"].ToString();
                selecteSKU = dt.Rows[0]["SKUCode"].ToString();
                //lbl_productname.Text = dt.Rows[0]["SKUName"].ToString();
                Session["SKUName"] = dt.Rows[0]["SKUName"].ToString();
                Session["TitleProductName"] = dt.Rows[0]["SKUName"].ToString();
                lbl_descproductname.Text = dt.Rows[0]["SKUName"].ToString();
                lbl_productdescription.Text = dt.Rows[0]["SKULongDescription"].ToString();
                lbl_productprice.Text = dt.Rows[0]["SpecialPrice"].ToString();
                lbl_crosprice.Text = dt.Rows[0]["MRP"].ToString();
                lbl_returnpolicy.Text = dt.Rows[0]["ShippingReturns"].ToString();
                lbl_tabreturnpolicy.Text = dt.Rows[0]["ShippingReturns"].ToString();
                lbl_SizeDataType.Text = dt.Rows[0]["SizeDataType"].ToString();
               // lnkbtn_category.InnerText = dt.Rows[0]["SKUCategory"].ToString();
                Session["SKUCategory"] = dt.Rows[0]["SKUCategory"].ToString();            //Using CashonDelevery Page
                //lnkbtn_categorytype.InnerText = dt.Rows[0]["SKUCategoryType"].ToString();
                Session["lnkbtn_categorytype"] = dt.Rows[0]["SKUCategoryType"].ToString();
                //lnkbtn_producttype.InnerText = dt.Rows[0]["SKUProductType"].ToString();
                //lbl_sitemapproductname.Text = dt.Rows[0]["SKUName"].ToString();

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
            lbl_washcare.Text = dt.Rows[0]["WashCare"].ToString();
            if (dt.Rows[0]["WashCare"].ToString() == null)
                lbl_washcare.Visible = false;
            ViewState["ShowColor"] = dt.Rows[0]["Color"].ToString();
            if (ViewState["ShowColor"] == null || ViewState["ShowColor"] == "")
            {
                lbl_txtcolor.Visible = false;
                lbl_productcolor.Visible = false;
                Session.Add("isColor", "false");
            }
            else
            {
                Session.Add("isColor", "true");
                lbl_productcolor.Text = dt.Rows[0]["Color"].ToString();
                Session.Add("pColor", dt.Rows[0]["Color"].ToString());
            }
            ViewState["ShowMaterial"] = dt.Rows[0]["Material"].ToString();
            if (ViewState["ShowMaterial"] == null || ViewState["ShowMaterial"] == "")
            {
                lbl_txtmaterial.Visible = false;
                lbl_productmaterial.Visible = false;
            }
            else
            {
                lbl_productmaterial.Text = dt.Rows[0]["Material"].ToString();
            }
            ViewState["StyleCode"] = dt.Rows[0]["StyleCode"].ToString();
            if (ViewState["StyleCode"] == null || ViewState["StyleCode"] == "")
            {
                ViewState["SKUCode"] = dt.Rows[0]["SKUCode"].ToString();
            }
            else
            {
                ViewState["SKUCode"] = dt.Rows[0]["StyleCode"].ToString();
            }
            ViewState["SKUClassification"] = dt.Rows[0]["SKUClassification"].ToString();
            if (ViewState["SKUClassification"].ToString() == "Style" || ViewState["SKUClassification"].ToString() == "Variant")
            {
                ChangeColorImage();
                SelectSizeImage();
            }
            else
            {
                string sizez = dt.Rows[0]["Size"].ToString();
                if ((sizez != "") && (sizez != null))
                {
                    btn_skusize1.Visible = true;
                    btn_skusize1.Text = dt.Rows[0]["Size"].ToString();
                    Session.Add("isSize", "true");
                    Session.Add("pSize", dt.Rows[0]["Size"].ToString());
                }
                else
                {
                    Session.Add("isSize", "false");
                    pnl_size.Visible = false;
                }
                string colorr = dt.Rows[0]["Color"].ToString();
                if ((colorr != "") && (colorr != null))
                {
                    lbl_color.Text = dt.Rows[0]["Color"].ToString();
                    Session.Add("isColor", "true");
                    Session.Add("pColor", dt.Rows[0]["Color"].ToString());
                }
                else
                {
                    lbl_colortext.Visible = false;
                    Session.Add("isColor", "false");
                }            

              }
        }
        else
        {
            Response.Redirect(ConfigUtil.hostURL());
        }
        subCatUrl();
        catUrl();
        productTypeUrl();
        DataTable sizeDT = this.dt; //fvpd.getcategorydetails(selecteSKU);
        if (sizeDT.Rows.Count > 0)
        {
            int? quantity = null;
            if (sizeDT.Rows[0]["SKUCode"] != null && !"".Equals(sizeDT.Rows[0]["SKUCode"]))
            {
                if (null == sizeDT.Rows[0]["Inventory"] || "".Equals(sizeDT.Rows[0]["Inventory"]))
                    quantity = 0;
                else
                    quantity =(int) float.Parse (sizeDT.Rows[0]["Inventory"] as String);
            }
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
        else
        {
            Response.Redirect(ConfigUtil.hostURL() + "404.aspx");
        }


    }
    #endregion
    #region FillRelatedProductDetails
    public void fillrelatedproductdetails()
    {
        //FrontViewProductDetailsDAO fvpd = new FrontViewProductDetailsDAO();
        //DataTable dt = fvpd.getcategorydetailsscrolldata();
        DataTable dt = CategoryDetailsService.getDTByProductType(ViewState["SKUProductType"].ToString());
        CommonUtil.DtNullCheck(dt);
        if (dt.Rows.Count > 0)
        {
            DataGrid_ImageSlider.DataSource = dt;
            DataGrid_ImageSlider.DataBind();
          
        }
    }
    protected void imgbtn_bag_Command(object sender, CommandEventArgs e)
    {
        string sku = e.CommandArgument.ToString();
        DataTable dt =CategoryDetailsService.getDTBySKU(sku);
        string name="";
        CommonUtil.DtNullCheck(dt);
        if(null != dt && dt.Rows.Count>0)
        {
           name= dt.Rows[0]["SKUBrand"].ToString() + "-";
           name = Regex.Replace(name, "[^a-zA-Z0-9]", "-");
           name += dt.Rows[0]["SKUName"].ToString();
           name = Regex.Replace(name, "[^a-zA-Z0-9]", "-");
           

        }
        Response.Redirect(name+"?htm="+sku);
    }

    #endregion
    #region AddToCart
    protected void btn_addtocart_Command(object sender, CommandEventArgs e)
    {
        Session.Remove("sessExpire");
        Session.Remove(Constant.Session.PRODUCT_COUNT);
        String str = AddToCartServices.initAddToCart(Context, Request.Params["htm"], dd_quantity.SelectedValue);
        if (AddToCartServices.SIZE_NOT_DEFINE.Equals(str))
        {
            Session["sizeError"] = "true";
            Response.Redirect(Request.UrlReferrer.ToString());

        }
        else if (AddToCartServices.MORE_THAN_FIVE_ITEM.Equals(str))
        {
            Session["quatityError"] = "true";
            Response.Redirect(Request.UrlReferrer.ToString());
        }
         
    }
   
   
    #endregion
    #region AddToWaitList
    protected void lnkbtn_ctaddtowaitlist_Click(object sender, EventArgs e)
    {
        if (Session["UserID"] != null)
        {
            FrontendCartDAO fec = new FrontendCartDAO();
            DataTable dt = CategoryDetailsService.getDTBySKU(styleCodeParam.ToString());
            CommonUtil.DtNullCheck(dt);
            if (dt.Rows.Count > 0)
            {
                SKUClassification = dt.Rows[0]["SKUClassification"].ToString();
                VariantType = dt.Rows[0]["VariantType"].ToString();
                if (VariantType == "Size")
                {
                    if (ViewState["SelectStyleSize"] == null)
                    {
                        lbl_selectsizemssge.Visible = true;
                        lbl_selectsizemssge.Text = "Please select a size.";
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Call my function", "document.getElementById('light_addlist').style.display='block';document.getElementById('fade_addlist').style.display='block'", true);
                        filladdtowishlistdetailsvarient();
                    }
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Call my function", "document.getElementById('light_addlist').style.display='block';document.getElementById('fade_addlist').style.display='block'", true);
                    filladdtowishlistdetailsnormal();
                }
            }
        }
        else
        {
            Session["account"] = "account";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Call my function", "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'", true);
        }
    }
    public void filladdtowishlistdetailsvarient()
    {
        //FrontViewProductDetailsDAO fvpd = new FrontViewProductDetailsDAO();
        DataTable dt =CategoryDetailsService.getDTBySKU(ViewState["ProductSKUWIthSize"].ToString());
        if (dt.Rows.Count > 0)
        {
            ViewState["ProductID"] = dt.Rows[0]["ImageNewID"].ToString();
            img_product.ImageUrl = ConfigUtil.getServerPath() + dt.Rows[0]["PathInternaldetailsSmallImage"].ToString();
            lbl_brandtype.Text = dt.Rows[0]["SKUBrand"].ToString();
            lbl_productnamee.Text = dt.Rows[0]["SKUName"].ToString();

            ViewState["ImagePath"] = dt.Rows[0]["PathInternaldetailsSmallImage"].ToString();
            ViewState["BrandType"] = dt.Rows[0]["SKUBrand"].ToString();
            ViewState["ProductName"] = dt.Rows[0]["SKUName"].ToString();
            ViewState["ProductColor"] = dt.Rows[0]["Color"].ToString();
            ViewState["ProductSize"] = dt.Rows[0]["Size"].ToString();
            ViewState["ProductPrize"] = dt.Rows[0]["SpecialPrice"].ToString();
        }
    }
    public void filladdtowishlistdetailsnormal()
    {
        //FrontViewProductDetailsDAO fvpd = new FrontViewProductDetailsDAO();
        DataTable dt = this.dt;
        if (dt.Rows.Count > 0)
        {
            ViewState["ProductID"] = dt.Rows[0]["ImageNewID"].ToString();
            img_product.ImageUrl = ConfigUtil.getServerPath() + dt.Rows[0]["PathInternaldetailsSmallImage"].ToString();
            lbl_brandtype.Text = dt.Rows[0]["SKUBrand"].ToString();
            lbl_productnamee.Text = dt.Rows[0]["SKUName"].ToString();

            ViewState["ImagePath"] = dt.Rows[0]["PathInternaldetailsSmallImage"].ToString();
            ViewState["BrandType"] = dt.Rows[0]["SKUBrand"].ToString();
            ViewState["ProductName"] = dt.Rows[0]["SKUName"].ToString();
            ViewState["ProductColor"] = dt.Rows[0]["Color"].ToString();
            ViewState["ProductSize"] = dt.Rows[0]["Size"].ToString();
            ViewState["ProductPrize"] = dt.Rows[0]["SpecialPrice"].ToString();
        }
    }
    protected void btn_addtowaitlist_Click(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Call my function", "document.getElementById('emptywaitlist_light').style.display='block';document.getElementById('emptywaitlist_fade').style.display='block'", true);
        AddToWaitListProductByUser();
    }
    private void AddToWaitListProductByUser()
    {
        int t = Convert.ToInt32(dd_waitlistquantity.SelectedItem.ToString());
        int u = Convert.ToInt32(ViewState["ProductPrize"].ToString());
        int TotalPrice = t * u;
        FrontendCartDAO fec = new FrontendCartDAO();

        Dictionary<string, string> paramDic = new Dictionary<string, string>();
        paramDic.Add("@AddToWaitList_UserID", Session["UserID"].ToString());
        paramDic.Add("@AddToWaitList_ProductID", ViewState["ImageNewID"].ToString());
        paramDic.Add("@AddToWaitList_AddToWaitListName", "UserName");
        paramDic.Add("@AddToWaitList_ImagePath", ViewState["ImagePath"].ToString());
        paramDic.Add("@AddToWaitList_BrandName", ViewState["BrandType"].ToString());
        paramDic.Add("@AddToWaitList_ProductName", ViewState["ProductName"].ToString());
        paramDic.Add("@AddToWaitList_Color", ViewState["ProductColor"].ToString());
        paramDic.Add("@AddToWaitList_Size", ViewState["ProductSize"].ToString());
        paramDic.Add("@AddToWaitList_EstimatedDelivery", "03/12/13 - 03/18/13");
        paramDic.Add("@AddToWaitList_TimeRemainning", "This item is no longer reserved.");
        paramDic.Add("@AddToWaitList_UnitPrice", ViewState["ProductPrize"].ToString());
        paramDic.Add("@AddToWaitList_Quantity", dd_quantity.SelectedItem.ToString());
        paramDic.Add("@AddToWaitList_TotalPrice", ViewState["ProductPrize"].ToString());
        paramDic.Add("@AddToWaitList_Description", "International orders are final sale and non-returnable.");
        paramDic.Add("@AddToWaitList_CreatedName", "MegaFactoryOutlet");
        paramDic.Add("@AddToWaitList_RecordStatus", "1");
        paramDic.Add("@AddToWaistList_ProductSKUCode", ViewState["SKUCode"].ToString());
        fec.AddToWishlistByUser(paramDic);
    }
    protected void lnkbtn_continue_Click(object sender, EventArgs e)
    {
        Response.Redirect(ConfigUtil.hostURL());
    }
    protected void lnkbtn_continueshopping_Click(object sender, EventArgs e)
    {
        Response.Redirect("Index.aspx");
    }
    protected void lnkbtn_waitlist_Click(object sender, EventArgs e)
    {
        Session["waitlist"] = "waitlist";
        Session.Remove("orders");
        Session.Remove("returnexchange");
        Session.Remove("credits");
        Session.Remove("shippingaddress");
        Session.Remove("accountsetting");
        Session.Remove("invitefriends");
        Session.Remove("facebook");
        Response.Redirect("Account.aspx");
    }
    #endregion
    #region SendEmail
    protected void btn_emailsubmit_OnClick(object Source, EventArgs e)
    {
        sendEmail();
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
    #endregion
    #region ChangeColorImage
  
    protected void imgbtn_color1_Command(object sender, CommandEventArgs e)
    {
        String reqUrl=Request.UrlReferrer.ToString();
        reqUrl=reqUrl.Substring(0,reqUrl.LastIndexOf('?'));
        reqUrl+="?htm="+ ViewState["ColorSKUID1"];
        Response.Redirect(reqUrl);   
    }
    private void getdifferentcolorimage2()
    {
        FrontViewProductDetailsDAO fvpd = new FrontViewProductDetailsDAO();
        DataTable dt = fvpd.getsmallimagedifferentcolordata(ViewState["SKUCode"].ToString(), ViewState["Color2"].ToString());
        CommonUtil.DtNullCheck(dt);
        if (dt.Rows.Count > 0)
        {
            imgbtn_color2.ImageUrl = ConfigUtil.getServerPath() + dt.Rows[0]["PathInternaldetailsSmallImage"].ToString();
            ViewState["ColorSKUID2"] = dt.Rows[0]["SKUCode"].ToString();
            ViewState["SKUCode1"] = dt.Rows[0]["SKUCode"].ToString();
        }
    }
    protected void imgbtn_color2_Command(object sender, CommandEventArgs e)
    {
        String reqUrl = Request.UrlReferrer.ToString();
        reqUrl = reqUrl.Substring(0, reqUrl.LastIndexOf('?'));
        reqUrl += "?htm=" + ViewState["ColorSKUID2"];
        Response.Redirect(reqUrl);
    }
    private void getdifferentcolorimage3()
    {
        FrontViewProductDetailsDAO fvpd = new FrontViewProductDetailsDAO();
        DataTable dt = fvpd.getsmallimagedifferentcolordata(ViewState["SKUCode"].ToString(), ViewState["Color3"].ToString());
        CommonUtil.DtNullCheck(dt);
        if (dt.Rows.Count > 0)
        {
            imgbtn_color3.ImageUrl = ConfigUtil.getServerPath() + dt.Rows[0]["PathInternaldetailsSmallImage"].ToString();
            ViewState["ColorSKUID3"] = dt.Rows[0]["SKUCode"].ToString();
            ViewState["SKUCode1"] = dt.Rows[0]["SKUCode"].ToString();
        }
    }
    protected void imgbtn_color3_Command(object sender, CommandEventArgs e)
    {
        String reqUrl = Request.UrlReferrer.ToString();
        reqUrl = reqUrl.Substring(0, reqUrl.LastIndexOf('?'));
        reqUrl += "?htm=" + ViewState["ColorSKUID3"];
        Response.Redirect(reqUrl);
    }
    private void getdifferentcolorimage4()
    {
        FrontViewProductDetailsDAO fvpd = new FrontViewProductDetailsDAO();
        DataTable dt = fvpd.getsmallimagedifferentcolordata(ViewState["SKUCode"].ToString(), ViewState["Color4"].ToString());
        CommonUtil.DtNullCheck(dt);
        if (dt.Rows.Count > 0)
        {
            imgbtn_color4.ImageUrl = ConfigUtil.getServerPath() + dt.Rows[0]["PathInternaldetailsSmallImage"].ToString();
            ViewState["ColorSKUID4"] = dt.Rows[0]["SKUCode"].ToString();
            ViewState["SKUCode1"] = dt.Rows[0]["SKUCode"].ToString();
        }
    }
    protected void imgbtn_color4_Command(object sender, CommandEventArgs e)
    {
        String reqUrl = Request.UrlReferrer.ToString();
        reqUrl = reqUrl.Substring(0, reqUrl.LastIndexOf('?'));
        reqUrl += "?htm=" + ViewState["ColorSKUID4"];
        Response.Redirect(reqUrl);
    }

    protected void imgbtn_color5_Command(object sender, CommandEventArgs e)
    {
        String reqUrl = Request.UrlReferrer.ToString();
        reqUrl = reqUrl.Substring(0, reqUrl.LastIndexOf('?'));
        reqUrl += "?htm=" + ViewState["ColorSKUID5"];
        Response.Redirect(reqUrl);
    }
    protected void imgbtn_color6_Command(object sender, CommandEventArgs e)
    {
        String reqUrl = Request.UrlReferrer.ToString();
        reqUrl = reqUrl.Substring(0, reqUrl.LastIndexOf('?'));
        reqUrl += "?htm=" + ViewState["ColorSKUID6"];
        Response.Redirect(reqUrl);
    }
    protected void imgbtn_color7_Command(object sender, CommandEventArgs e)
    {
        String reqUrl = Request.UrlReferrer.ToString();
        reqUrl = reqUrl.Substring(0, reqUrl.LastIndexOf('?'));
        reqUrl += "?htm=" + ViewState["ColorSKUID7"];
        Response.Redirect(reqUrl);
    }
    protected void imgbtn_color8_Command(object sender, CommandEventArgs e)
    {
        String reqUrl = Request.UrlReferrer.ToString();
        reqUrl = reqUrl.Substring(0, reqUrl.LastIndexOf('?'));
        reqUrl += "?htm=" + ViewState["ColorSKUID8"];
        Response.Redirect(reqUrl);
    }
    protected void imgbtn_color9_Command(object sender, CommandEventArgs e)
    {
        String reqUrl = Request.UrlReferrer.ToString();
        reqUrl = reqUrl.Substring(0, reqUrl.LastIndexOf('?'));
        reqUrl += "?htm=" + ViewState["ColorSKUID9"];
        Response.Redirect(reqUrl);
    }
    protected void imgbtn_color10_Command(object sender, CommandEventArgs e)
    {
        String reqUrl = Request.UrlReferrer.ToString();
        reqUrl = reqUrl.Substring(0, reqUrl.LastIndexOf('?'));
        reqUrl += "?htm=" + ViewState["ColorSKUID9"];
        Response.Redirect(reqUrl);
    }
    private void ChangeColorImage()
    {
       // FrontViewProductDetailsDAO fvpd = new FrontViewProductDetailsDAO();
        //DataTable dt = fvpd.getcoloralldata(ViewState["SKUCode"].ToString());
        DataTable dt = CategoryDetailsService.getDTByStyleAndColor(ViewState["SKUCode"].ToString());
        CommonUtil.DtNullCheck(dt);
        for (int i = 1; i <= 10; i++)
            pnl_color.FindControl("imgbtn_color" + i).Visible = false;

        if (dt.Rows.Count > 0)
        {
            Session["isColor"] = "true";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ImageButton imgBtn=(ImageButton)pnl_color.FindControl("imgbtn_color" + (i + 1));
                imgBtn.Visible = true;
                imgBtn.ImageUrl = ConfigUtil.getServerPath() + dt.Rows[i]["PathInternaldetailsSmallImage"].ToString();
                ViewState["Color" + (i + 1)] = dt.Rows[i]["Color"].ToString();
                ViewState["ColorSKUID" + (i + 1)] = dt.Rows[i]["SKUCode"].ToString();
                ViewState["SKUCode1"] = dt.Rows[i]["SKUCode"].ToString();
            }
        }
      
    }
    
    #endregion
    #region Select Size
    private void SelectSizeImage()
    {
       // FrontViewProductDetailsDAO fvpd = new FrontViewProductDetailsDAO();
        if (ViewState["SKUClassification"].ToString() == "Style" || ViewState["SKUClassification"].ToString() == "Variant")
        {
             DataTable dt = CategoryDetailsService.getDTByStyle(ViewState["SKUCode"].ToString());
                CommonUtil.DtNullCheck(dt);
                for (int i = 0; i < dt.Rows.Count;i++ )
                {
                    Session["isSize"] = "true";
                    //Button b = (Button)updatepanel1.FindControl("btn_skusize" + (i + 1));
                    //b.Visible = true;
                    ////b.Text = dt.Rows[i]["Size"].ToString();
                }
        }
        else
        {
            lbl_choosesize.Visible = false;
            lbl_category.Visible = false;
            lbl_sizeguide.Visible = false;
        }
    }
    private void getskuidwithsize()
    {
        //FrontViewProductDetailsDAO fvpd = new FrontViewProductDetailsDAO();
       
        if (Session!=null && Session["SKUCode"]!= null && Session["SKUCode"].ToString() != styleCodeParam.ToString())
        {
            DataTable dt = CategoryDetailsService.getDTBySkuAndStyle(Session["SKUCode"].ToString(), styleCodeParam.ToString());
            CommonUtil.DtNullCheck(dt);
            if (dt.Rows.Count > 0)
            {
        
                ViewState["ProductSKUWIthSize"] = dt.Rows[0]["SKUCode"].ToString();
                Session["ProductSKUWIthSize"] = dt.Rows[0]["SKUCode"].ToString();
                ViewState["SKUCode1"] = dt.Rows[0]["SKUCode"].ToString();
                ViewState["SizeProductID"] = dt.Rows[0]["ImageNewID"].ToString();
                ViewState["SizeSKUName"] = dt.Rows[0]["SKUName"].ToString();
                ViewState["SizeSpecialPrice"] = dt.Rows[0]["SpecialPrice"].ToString();
                Session["Size"] = dt.Rows[0]["Size"].ToString();
                Session["SizeColor"] = dt.Rows[0]["Color"].ToString();
                ViewState["SizeColor"] = dt.Rows[0]["Color"].ToString();
            }
        }
        else
        {
            DataTable dt = CategoryDetailsService.getDTBySKU(styleCodeParam.ToString()); 
            CommonUtil.DtNullCheck(dt);
            if (dt.Rows.Count > 0)
            {
                ViewState["ProductSKUWIthSize"] = dt.Rows[0]["SKUCode"].ToString();
                ViewState["SKUCode1"] = dt.Rows[0]["SKUCode"].ToString();
                ViewState["SizeProductID"] = dt.Rows[0]["ImageNewID"].ToString();
                ViewState["SizeSKUName"] = dt.Rows[0]["SKUName"].ToString();
                ViewState["SizeSpecialPrice"] = dt.Rows[0]["SpecialPrice"].ToString();
                Session["Size"] = dt.Rows[0]["Size"].ToString();
                Session["SizeColor"] = dt.Rows[0]["Color"].ToString();
                ViewState["SizeColor"] = dt.Rows[0]["Color"].ToString();
            }
        }
    }

    #endregion
    #region Size 1 To 10
    protected void btn_skusize1_Click(object sender, EventArgs e)
    {
        Session.Add("pSize", ((Button)sender).Text);
        Session.Add("isSize", "true");
        btn_skusize1.BackColor = System.Drawing.ColorTranslator.FromHtml("#464646");
        btn_skusize1.ForeColor = Color.White;
        btn_skusize2.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize2.ForeColor = Color.Black;
        btn_skusize3.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize3.ForeColor = Color.Black;
        btn_skusize4.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize4.ForeColor = Color.Black;
        btn_skusize5.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize5.ForeColor = Color.Black;
        btn_skusize6.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize6.ForeColor = Color.Black;
        btn_skusize7.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize7.ForeColor = Color.Black;
        btn_skusize8.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize8.ForeColor = Color.Black;
        btn_skusize9.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize9.ForeColor = Color.Black;
        btn_skusize10.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize10.ForeColor = Color.Black;
        ViewState["SelectStyleSize"] = btn_skusize1.Text;
        Session["pSize"] = btn_skusize1.Text;
        getskuidwithsize();
    }
    protected void btn_skusize2_Click(object sender, EventArgs e)
    {
        Session.Add("pSize", ((Button)sender).Text);
        Session.Add("isSize", "true");
        btn_skusize2.BackColor = System.Drawing.ColorTranslator.FromHtml("#464646");
        btn_skusize2.ForeColor = Color.White;
        btn_skusize3.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize3.ForeColor = Color.Black;
        btn_skusize1.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize1.ForeColor = Color.Black;
        btn_skusize4.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize4.ForeColor = Color.Black;
        btn_skusize5.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize5.ForeColor = Color.Black;
        btn_skusize6.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize6.ForeColor = Color.Black;
        btn_skusize7.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize7.ForeColor = Color.Black;
        btn_skusize8.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize8.ForeColor = Color.Black;
        btn_skusize9.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize9.ForeColor = Color.Black;
        btn_skusize10.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize10.ForeColor = Color.Black;
        ViewState["SelectStyleSize"] = btn_skusize2.Text;
        Session["pSize"] = btn_skusize2.Text;
        getskuidwithsize();
    }
    protected void btn_skusize3_Click(object sender, EventArgs e)
    {
        Session.Add("pSize", ((Button)sender).Text);
        Session.Add("isSize", "true");
        btn_skusize3.BackColor = System.Drawing.ColorTranslator.FromHtml("#464646");
        btn_skusize3.ForeColor = Color.White;
        btn_skusize1.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize1.ForeColor = Color.Black;
        btn_skusize2.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize2.ForeColor = Color.Black;
        btn_skusize4.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize4.ForeColor = Color.Black;
        btn_skusize5.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize5.ForeColor = Color.Black;
        btn_skusize6.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize6.ForeColor = Color.Black;
        btn_skusize7.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize7.ForeColor = Color.Black;
        btn_skusize8.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize8.ForeColor = Color.Black;
        btn_skusize9.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize9.ForeColor = Color.Black;
        btn_skusize10.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize10.ForeColor = Color.Black;
        ViewState["SelectStyleSize"] = btn_skusize3.Text;
        Session["pSize"] = btn_skusize3.Text;
        getskuidwithsize();
    }
    protected void btn_skusize4_Click(object sender, EventArgs e)
    {
        Session.Add("pSize", ((Button)sender).Text);
        Session.Add("isSize", "true");
        btn_skusize4.BackColor = System.Drawing.ColorTranslator.FromHtml("#464646");
        btn_skusize4.ForeColor = Color.White;
        btn_skusize3.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize3.ForeColor = Color.Black;
        btn_skusize1.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize1.ForeColor = Color.Black;
        btn_skusize2.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize2.ForeColor = Color.Black;
        btn_skusize5.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize5.ForeColor = Color.Black;
        btn_skusize6.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize6.ForeColor = Color.Black;
        btn_skusize7.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize7.ForeColor = Color.Black;
        btn_skusize8.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize8.ForeColor = Color.Black;
        btn_skusize9.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize9.ForeColor = Color.Black;
        btn_skusize10.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize10.ForeColor = Color.Black;
        ViewState["SelectStyleSize"] = btn_skusize4.Text;
        Session["pSize"] = btn_skusize4.Text;
        getskuidwithsize();
    }
    protected void btn_skusize5_Click(object sender, EventArgs e)
    {
        Session.Add("pSize", ((Button)sender).Text);
        Session.Add("isSize", "true");
        btn_skusize5.BackColor = System.Drawing.ColorTranslator.FromHtml("#464646");
        btn_skusize5.ForeColor = Color.White;
        btn_skusize4.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize4.ForeColor = Color.Black;
        btn_skusize3.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize3.ForeColor = Color.Black;
        btn_skusize1.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize1.ForeColor = Color.Black;
        btn_skusize2.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize2.ForeColor = Color.Black;
        btn_skusize6.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize6.ForeColor = Color.Black;
        btn_skusize7.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize7.ForeColor = Color.Black;
        btn_skusize8.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize8.ForeColor = Color.Black;
        btn_skusize9.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize9.ForeColor = Color.Black;
        btn_skusize10.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize10.ForeColor = Color.Black;
        ViewState["SelectStyleSize"] = btn_skusize5.Text;
        Session["pSize"] = btn_skusize5.Text;
        getskuidwithsize();
    }
    protected void btn_skusize6_Click(object sender, EventArgs e)
    {
        Session.Add("pSize", ((Button)sender).Text);
        Session.Add("isSize", "true");
        btn_skusize6.BackColor = System.Drawing.ColorTranslator.FromHtml("#464646");
        btn_skusize6.ForeColor = Color.White;
        btn_skusize5.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize5.ForeColor = Color.Black;
        btn_skusize4.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize4.ForeColor = Color.Black;
        btn_skusize3.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize3.ForeColor = Color.Black;
        btn_skusize1.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize1.ForeColor = Color.Black;
        btn_skusize2.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize2.ForeColor = Color.Black;
        btn_skusize7.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize7.ForeColor = Color.Black;
        btn_skusize8.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize8.ForeColor = Color.Black;
        btn_skusize9.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize9.ForeColor = Color.Black;
        btn_skusize10.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize10.ForeColor = Color.Black;
        ViewState["SelectStyleSize"] = btn_skusize6.Text;
        Session["pSize"] = btn_skusize6.Text;
        getskuidwithsize();
    }
    protected void btn_skusize7_Click(object sender, EventArgs e)
    {
        Session.Add("pSize", ((Button)sender).Text);
        Session.Add("isSize", "true");
        btn_skusize7.BackColor = System.Drawing.ColorTranslator.FromHtml("#464646");
        btn_skusize7.ForeColor = Color.White;
        btn_skusize6.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize6.ForeColor = Color.Black;
        btn_skusize5.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize5.ForeColor = Color.Black;
        btn_skusize4.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize4.ForeColor = Color.Black;
        btn_skusize3.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize3.ForeColor = Color.Black;
        btn_skusize1.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize1.ForeColor = Color.Black;
        btn_skusize2.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize2.ForeColor = Color.Black;
        btn_skusize8.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize8.ForeColor = Color.Black;
        btn_skusize9.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize9.ForeColor = Color.Black;
        btn_skusize10.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize10.ForeColor = Color.Black;
        ViewState["SelectStyleSize"] = btn_skusize7.Text;
        Session["pSize"] = btn_skusize7.Text;
        getskuidwithsize();
    }
    protected void btn_skusize8_Click(object sender, EventArgs e)
    {
        Session.Add("pSize", ((Button)sender).Text);
        Session.Add("isSize", "true");
        btn_skusize8.BackColor = System.Drawing.ColorTranslator.FromHtml("#464646");
        btn_skusize8.ForeColor = Color.White;
        btn_skusize7.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize7.ForeColor = Color.Black;
        btn_skusize6.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize6.ForeColor = Color.Black;
        btn_skusize5.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize5.ForeColor = Color.Black;
        btn_skusize4.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize4.ForeColor = Color.Black;
        btn_skusize3.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize3.ForeColor = Color.Black;
        btn_skusize1.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize1.ForeColor = Color.Black;
        btn_skusize2.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize2.ForeColor = Color.Black;
        btn_skusize9.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize9.ForeColor = Color.Black;
        btn_skusize10.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize10.ForeColor = Color.Black;
        ViewState["SelectStyleSize"] = btn_skusize8.Text;
        Session["pSize"] = btn_skusize8.Text;
        getskuidwithsize();
    }
    protected void btn_skusize9_Click(object sender, EventArgs e)
    {
        Session.Add("pSize", ((Button)sender).Text);
        Session.Add("isSize", "true");
        btn_skusize9.BackColor = System.Drawing.ColorTranslator.FromHtml("#464646");
        btn_skusize9.ForeColor = Color.White;
        btn_skusize8.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize8.ForeColor = Color.Black;
        btn_skusize7.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize7.ForeColor = Color.Black;
        btn_skusize6.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize6.ForeColor = Color.Black;
        btn_skusize5.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize5.ForeColor = Color.Black;
        btn_skusize4.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize4.ForeColor = Color.Black;
        btn_skusize3.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize3.ForeColor = Color.Black;
        btn_skusize1.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize1.ForeColor = Color.Black;
        btn_skusize2.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize2.ForeColor = Color.Black;
        btn_skusize10.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize10.ForeColor = Color.Black;
        ViewState["SelectStyleSize"] = btn_skusize9.Text;
        Session["pSize"] = btn_skusize9.Text;
        getskuidwithsize();
    }
    protected void btn_skusize10_Click(object sender, EventArgs e)
    {
        Session.Add("pSize", ((Button)sender).Text);
        Session.Add("isSize", "true");
        btn_skusize10.BackColor = System.Drawing.ColorTranslator.FromHtml("#464646");
        btn_skusize10.ForeColor = Color.White;
        btn_skusize9.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize9.ForeColor = Color.Black;
        btn_skusize8.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize8.ForeColor = Color.Black;
        btn_skusize7.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize7.ForeColor = Color.Black;
        btn_skusize6.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize6.ForeColor = Color.Black;
        btn_skusize5.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize5.ForeColor = Color.Black;
        btn_skusize4.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize4.ForeColor = Color.Black;
        btn_skusize3.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize3.ForeColor = Color.Black;
        btn_skusize1.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize1.ForeColor = Color.Black;
        btn_skusize2.BackColor = System.Drawing.ColorTranslator.FromHtml("#EBEBEB");
        btn_skusize2.ForeColor = Color.Black;
        ViewState["SelectStyleSize"] = btn_skusize10.Text;
        Session["pSize"] = btn_skusize10.Text;
        getskuidwithsize();
    }
    #endregion
    
    #region sitemap
   
    public void subCatUrl()
    {
        //String first = lnkbtn_category.InnerText.Replace(" ", "-").Replace("&", "").Replace("--", "-");
        //String sec = lnkbtn_categorytype.InnerText.Replace(" ", "-").Replace("&", "").Replace("--", "-");
    //    if ("Home-Furnishing".Equals(first.Trim()))
    //        first = "Bedding-Bath";
    //    else if ("Storage".Equals(first.Trim()))
    //        first = "Home-Storage";
    //    if ("Home-Furnishing".Equals(sec.Trim()))
    //        sec = "Bedding-Bath";
    //    else if ("Storage".Equals(sec.Trim()))
    //        sec = "Home-Storage";
    //    lnkbtn_categorytype.HRef = ConfigUtil.hostURL() + first + "/" + sec;
    }
    public void productTypeUrl()
    {
    //    String first = lnkbtn_category.InnerText.Replace(" ", "-").Replace("&", "").Replace("--", "-");
    //    String sec = lnkbtn_categorytype.InnerText.Replace(" ", "-").Replace("&", "").Replace("--", "-");
    //    String third = lnkbtn_producttype.InnerText.Replace(" ", "-").Replace("&", "").Replace("--", "-");
        //if ("Home-Furnishing".Equals(first.Trim()))
        //    first = "Bedding-Bath";
        //else if ("Storage".Equals(first.Trim()))
        //    first = "Home-Storage";
        //if ("Home-Furnishing".Equals(sec.Trim()))
        //    sec = "Bedding-Bath";
        //else if ("Storage".Equals(sec.Trim()))
        //    sec = "Home-Storage";
        //if ("Home-Furnishing".Equals(sec.Trim()))
        //    third = "Bedding-Bath";
        //else if ("Storage".Equals(sec.Trim()))
        //    third = "Home-Storage";

        //lnkbtn_producttype.HRef = ConfigUtil.hostURL() + first + "/" + sec + "/" + third;
    }
    public void catUrl()
    {
        try
        {
            string catUrl = ConfigUtil.hostURL();
            BindSiteMapAllData();
            if (ViewState["SiteCategoryID"].ToString() == "WO")
            {
                catUrl += "Women";
            }
            else if (ViewState["SiteCategoryID"].ToString() == "ME")
            {
                catUrl += "Men";

            }
            else if (ViewState["SiteCategoryID"].ToString() == "BNK")
            {
                catUrl += "Baby";

            }
            else if (ViewState["SiteCategoryID"].ToString() == "HND")
            {
                catUrl += "Home-Decor";
            }
            else
            {
                catUrl += "Home";
            }
            //lnkbtn_category.HRef = catUrl;
        }
        catch (Exception)
        {
            
            Response.Redirect(ConfigUtil.hostURL() + "PageNotFound");
        }
    }
  
    private void BindSiteMapAllData()
    {
       // FrontViewProductDetailsDAO fvpd = new FrontViewProductDetailsDAO();
        DataTable dt = this.dt;
        CommonUtil.DtNullCheck(dt);    
        if (dt.Rows.Count > 0)
        {
            ViewState["SiteCategoryID"] = dt.Rows[0]["CategoryID"].ToString();
            ViewState["SiteCategoryTypeID"] = dt.Rows[0]["CategoryTypeID"].ToString();
            ViewState["SiteProductTypeID"] = dt.Rows[0]["ProductTypeID"].ToString();
            ViewState["SiteSKUBrand"] = dt.Rows[0]["SKUBrand"].ToString();


            ViewState["SiteSKUCategory"] = dt.Rows[0]["SKUCategory"].ToString();
            ViewState["SiteSKUCategoryType"] = dt.Rows[0]["SKUCategoryType"].ToString();
            ViewState["SiteSKUProductType"] = dt.Rows[0]["SKUProductType"].ToString();
        }
        else
        {
            
        }
    }
    #endregion

}