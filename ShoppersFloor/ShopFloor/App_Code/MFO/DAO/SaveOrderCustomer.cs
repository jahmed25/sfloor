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
/// Summary description for SaveOrderCustomer


namespace MFO.DAO
{
    public class SaveOrderCustomer
    {
        string constring = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;
        SqlConnection con = null;
        SqlCommand cmd = null;
        string qrystr = string.Empty;
        int x, hiorderuserid, diorderhiid, hishipcountryid, hishipstateid, hibillcountryid, hibillstateid, diproductid, diquantity, disaleprice, diproductquantity, hicodcharges,
            ditotalproductprice, hiorderno, hisuborderno, hishippingcharges, hiorderamount, hiorderdiid, hipromocodeamount, higiftcardcodeamount, hicoupancodeamount;
        string hiorderpaymentmethod, orderskucode, hicustomername, hishippingemail, hishippingcustomername,
         hishipaddress1, hishipphone, hishipcity, hishippincode, hibillemail, hibillcustomername, hibillingaddress1, hibillingphone, hibillcity, hibillpincode, hibilltransporter,
         hibilltransstatus, hibillreturnpolicy, hipromocode, higiftcardcode, hifreegiftmessge, hicoupancode, histatus, hirecordstatus;

        string diskucode, didiscount, diskudiscount, dicardnumber, diexpiremonth, diexpiryyear, disecuritycode, diproductname, diproductimagepath, diproductmfocode,
        diproductbrand, diproductcolor, diproductsize, diproductfreight, diproductsaletax, diproducttimestamp, diproductstatus, diproductrecordstatus;
        public SaveOrderCustomer()
        {
            con = new SqlConnection(constring);
            cmd = new SqlCommand();
            cmd.Connection = con;
        }
        #region Property OrderHeaderSection
        public int addhiorderuserid
        {
            get { return hiorderuserid; }
            set { hiorderuserid = value; }
        }
        public int addhiorderdiid
        {
            get { return hiorderdiid; }
            set { hiorderdiid = value; }
        }
        public string addhiorderpaymentmethod
        {
            get { return hiorderpaymentmethod; }
            set { hiorderpaymentmethod = value; }
        }
        public int addhiorderno
        {
            get { return hiorderno; }
            set { hiorderno = value; }
        }
        public int addhisuborderno
        {
            get { return hisuborderno; }
            set { hisuborderno = value; }
        }
        public int addhishippingcharges
        {
            get { return hishippingcharges; }
            set { hishippingcharges = value; }
        }
        public int addhicodcharges
        {
            get { return hicodcharges; }
            set { hicodcharges = value; }
        }
        public int addhiorderamount
        {
            get { return hiorderamount; }
            set { hiorderamount = value; }
        }
        public string addhicustomername
        {
            get { return hicustomername; }
            set { hicustomername = value; }
        }
        public string addhishippingemail
        {
            get { return hishippingemail; }
            set { hishippingemail = value; }
        }
        public string addhishippingcustomername
        {
            get { return hishippingcustomername; }
            set { hishippingcustomername = value; }
        }
        public string addhishipaddress1
        {
            get { return hishipaddress1; }
            set { hishipaddress1 = value; }
        }
        public string addhishipphone
        {
            get { return hishipphone; }
            set { hishipphone = value; }
        }
        public int addhishipcountryid
        {
            get { return hishipcountryid; }
            set { hishipcountryid = value; }
        }
        public int addhishipstateid
        {
            get { return hishipstateid; }
            set { hishipstateid = value; }
        }
        public string addhishipcity
        {
            get { return hishipcity; }
            set { hishipcity = value; }
        }
        public string addhishippincode
        {
            get { return hishippincode; }
            set { hishippincode = value; }
        }
        public string addhibillemail
        {
            get { return hibillemail; }
            set { hibillemail = value; }
        }
        public string addhibillcustomername
        {
            get { return hibillcustomername; }
            set { hibillcustomername = value; }
        }
        public string addhibillingaddress1
        {
            get { return hibillingaddress1; }
            set { hibillingaddress1 = value; }
        }
        public string addhibillingphone
        {
            get { return hibillingphone; }
            set { hibillingphone = value; }
        }
        public int addhibillcountryid
        {
            get { return hibillcountryid; }
            set { hibillcountryid = value; }
        }
        public int addhibillstateid
        {
            get { return hibillstateid; }
            set { hibillstateid = value; }
        }
        public string addhibillcity
        {
            get { return hibillcity; }
            set { hibillcity = value; }
        }
        public string addhibillpincode
        {
            get { return hibillpincode; }
            set { hibillpincode = value; }
        }
        public string addhibilltransporter
        {
            get { return hibilltransporter; }
            set { hibilltransporter = value; }
        }
        public string addhibilltransstatus
        {
            get { return hibilltransstatus; }
            set { hibilltransstatus = value; }
        }
        public string addhibillreturnpolicy
        {
            get { return hibillreturnpolicy; }
            set { hibillreturnpolicy = value; }
        }
        public string addhipromocode
        {
            get { return hipromocode; }
            set { hipromocode = value; }
        }
        public int addhipromocodeamount
        {
            get { return hipromocodeamount; }
            set { hipromocodeamount = value; }
        }
        public string addhigiftcardcode
        {
            get { return higiftcardcode; }
            set { higiftcardcode = value; }
        }
        public int addhigiftcardcodeamount
        {
            get { return higiftcardcodeamount; }
            set { higiftcardcodeamount = value; }
        }
        public string addhifreegiftmessge
        {
            get { return hifreegiftmessge; }
            set { hifreegiftmessge = value; }
        }
        public string addhicoupancode
        {
            get { return hicoupancode; }
            set { hicoupancode = value; }
        }
        public int addhicoupancodeamount
        {
            get { return hicoupancodeamount; }
            set { hicoupancodeamount = value; }
        }
        public string addhistatus
        {
            get { return histatus; }
            set { histatus = value; }
        }
        public string addhirecordstatus
        {
            get { return hirecordstatus; }
            set { hirecordstatus = value; }
        }
        #endregion
        #region Property OrderDetailSection
        public string adddiskucode
        {
            get { return diskucode; }
            set { diskucode = value; }
        }
        public int adddiquantity
        {
            get { return diquantity; }
            set { diquantity = value; }
        }
        public int adddisaleprice
        {
            get { return disaleprice; }
            set { disaleprice = value; }
        }
        public string adddidiscount
        {
            get { return didiscount; }
            set { didiscount = value; }
        }
        public string adddiskudiscount
        {
            get { return diskudiscount; }
            set { diskudiscount = value; }
        }
        public string adddicardnumber
        {
            get { return dicardnumber; }
            set { dicardnumber = value; }
        }
        public string adddiexpiremonth
        {
            get { return diexpiremonth; }
            set { diexpiremonth = value; }
        }
        public string adddiexpiryyear
        {
            get { return diexpiryyear; }
            set { diexpiryyear = value; }
        }
        public string adddisecuritycode
        {
            get { return disecuritycode; }
            set { disecuritycode = value; }
        }
        public int adddiproductid
        {
            get { return diproductid; }
            set { diproductid = value; }
        }
        public string adddiproductname
        {
            get { return diproductname; }
            set { diproductname = value; }
        }
        public string adddiproductimagepath
        {
            get { return diproductimagepath; }
            set { diproductimagepath = value; }
        }
        public string adddiproductmfocode
        {
            get { return diproductmfocode; }
            set { diproductmfocode = value; }
        }
        public string adddiproductbrand
        {
            get { return diproductbrand; }
            set { diproductbrand = value; }
        }
        public string adddiproductcolor
        {
            get { return diproductcolor; }
            set { diproductcolor = value; }
        }
        public string adddiproductsize
        {
            get { return diproductsize; }
            set { diproductsize = value; }
        }
        public int adddiproductquantity
        {
            get { return diproductquantity; }
            set { diproductquantity = value; }
        }
        public int addditotalproductprice
        {
            get { return ditotalproductprice; }
            set { ditotalproductprice = value; }
        }
        public string adddiproductfreight
        {
            get { return diproductfreight; }
            set { diproductfreight = value; }
        }
        public string adddiproductsaletax
        {
            get { return diproductsaletax; }
            set { diproductsaletax = value; }
        }
        public string adddiproducttimestamp
        {
            get { return diproducttimestamp; }
            set { diproducttimestamp = value; }
        }
        public string adddiproductstatus
        {
            get { return diproductstatus; }
            set { diproductstatus = value; }
        }
        public string adddiproductrecordstatus
        {
            get { return diproductrecordstatus; }
            set { diproductrecordstatus = value; }
        }
        #endregion
        #region AddOrderHeaderSection
        public bool FrontEndAddAddOrderHeaderSection()
        {
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_FrontEnd_ProductOrder_HI_Master";
                cmd.Parameters.AddWithValue("@ProductOrderHI_UserID", hiorderuserid);
                cmd.Parameters.AddWithValue("@ProductOrderDI_FK_ID", hiorderdiid);
                cmd.Parameters.AddWithValue("@ProductOrderHI_PaymentMethod", hiorderpaymentmethod);
                cmd.Parameters.AddWithValue("@ProductOrderHI_OrderNo", hiorderno);
                cmd.Parameters.AddWithValue("@ProductOrderHI_SubOrderNo", hisuborderno);
                cmd.Parameters.AddWithValue("@ProductOrderHI_ShippingCharges", hishippingcharges);
                cmd.Parameters.AddWithValue("@ProductOrderHi_CODCharge", hicodcharges);
                cmd.Parameters.AddWithValue("@ProductOrderHI_OrderAmount", hiorderamount);
                cmd.Parameters.AddWithValue("@ProductOrderHI_CustomerName", hicustomername);
                cmd.Parameters.AddWithValue("@ProductOrderHI_ShippingEmail", hishippingemail);
                cmd.Parameters.AddWithValue("@ProductOrderHI_ShippingCustomerName", hishippingcustomername);
                cmd.Parameters.AddWithValue("@ProductOrderHI_ShipAddress1", hishipaddress1);
                cmd.Parameters.AddWithValue("@ProductOrderHI_ShipPhone", hishipphone);
                cmd.Parameters.AddWithValue("@ProductOrderHI_FK_ShipCountry", hishipcountryid);
                cmd.Parameters.AddWithValue("@ProductOrderHI_FK_ShipState", hishipstateid);

                cmd.Parameters.AddWithValue("@ProductOrderHI_ShipCity", hishipcity);
                cmd.Parameters.AddWithValue("@ProductOrderHI_ShipPincode", hishippincode);
                cmd.Parameters.AddWithValue("@ProductOrderHI_BillingEmail", hibillemail);
                cmd.Parameters.AddWithValue("@ProductOrderHI_BillingCustomerName", hibillcustomername);
                cmd.Parameters.AddWithValue("@ProductOrderHI_BillingAddress1", hibillingaddress1);
                cmd.Parameters.AddWithValue("@ProductOrderHI_BillingPhone", hibillingphone);
                cmd.Parameters.AddWithValue("@ProductOrderHI_FK_BillingCountry", hibillcountryid);
                cmd.Parameters.AddWithValue("@ProductOrderHI_FK_BillingState", hibillstateid);
                cmd.Parameters.AddWithValue("@ProductOrderHI_BillingCity", hibillcity);
                cmd.Parameters.AddWithValue("@ProductOrderHI_BillingPincode", hibillpincode);
                cmd.Parameters.AddWithValue("@ProductOrderHI_Transporter", hibilltransporter);
                cmd.Parameters.AddWithValue("@ProductOrderHI_TransactionStatus", hibilltransstatus);
                cmd.Parameters.AddWithValue("@ProductOrderHI_ReturnPolicy", hibillreturnpolicy);

                cmd.Parameters.AddWithValue("@ProductOrderHI_PromoCode", hipromocode);
                cmd.Parameters.AddWithValue("@ProductOrderHI_PromoCodeAmount", hipromocodeamount);
                cmd.Parameters.AddWithValue("@ProductOrderHI_GiftCardCode", higiftcardcode);
                cmd.Parameters.AddWithValue("@ProductOrderHI_GiftCardCodeAmount", higiftcardcodeamount);
                cmd.Parameters.AddWithValue("@ProductOrderHI_FreeGiftMessage", hifreegiftmessge);
                cmd.Parameters.AddWithValue("@ProductOrderHI_CoupanCode", hicoupancode);
                cmd.Parameters.AddWithValue("@ProductOrderHI_CoupanCodeAmount", hicoupancodeamount);
                cmd.Parameters.AddWithValue("@ProductOrderHI_Status", histatus);
                cmd.Parameters.AddWithValue("@ProductOrderHI_RecordStatus", hirecordstatus);
                con.Open();
                x = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Error in SQL:" + ex);
            }
            finally
            {
                con.Close();
            }
            if (x > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        #endregion
        #region AddOrderDetailSection
        public bool FrontEndAddOrderDetailSection()
        {
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_FrontEnd_ProductOrder_DI_Master";
                cmd.Parameters.AddWithValue("@ProductOrderDI_SKUCode", diskucode);
                cmd.Parameters.AddWithValue("@ProductOrderDI_OrderQuantity", diquantity);
                cmd.Parameters.AddWithValue("@ProductOrderDI_SalePrice", disaleprice);
                cmd.Parameters.AddWithValue("@ProductOrderDI_Discount", didiscount);
                cmd.Parameters.AddWithValue("@ProductOrderDI_SKUDiscount", diskudiscount);
                cmd.Parameters.AddWithValue("@ProductOrderHI_CardNumber", dicardnumber);
                cmd.Parameters.AddWithValue("@ProductOrderHI_ExpireMonth", diexpiremonth);
                cmd.Parameters.AddWithValue("@ProductOrderHI_ExpireYear", diexpiryyear);
                cmd.Parameters.AddWithValue("@ProductOrderHI_SecurityCode", disecuritycode);
                cmd.Parameters.AddWithValue("@ProductOrderHI_ProductID", diproductid);
                cmd.Parameters.AddWithValue("@ProductOrderHI_ProductName", diproductname);
                cmd.Parameters.AddWithValue("@ProductOrderHI_ProductImagePath", diproductimagepath);
                cmd.Parameters.AddWithValue("@ProductOrderHI_ProductMfoCode", diproductmfocode);

                cmd.Parameters.AddWithValue("@ProductOrderHI_ProductBrand", diproductbrand);
                cmd.Parameters.AddWithValue("@ProductOrderHI_ProductColor", diproductcolor);
                cmd.Parameters.AddWithValue("@ProductOrderHI_ProductSize", diproductsize);
                cmd.Parameters.AddWithValue("@ProductOrderHI_ProductQuantity", diproductquantity);
                cmd.Parameters.AddWithValue("@ProductOrderHI_TotalProductPrice", ditotalproductprice);
                cmd.Parameters.AddWithValue("@ProductOrderHI_ProductFreight", diproductfreight);
                cmd.Parameters.AddWithValue("@ProductOrderHI_SaleTax", diproductsaletax);
                cmd.Parameters.AddWithValue("@ProductOrderHI_TimeStamp", diproducttimestamp);
                cmd.Parameters.AddWithValue("@ProductOrderDI_Status", diproductstatus);
                cmd.Parameters.AddWithValue("@ProductOrderDI_RecordStatus", diproductrecordstatus);

                con.Open();
                x = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Error in SQL:" + ex);
            }
            finally
            {
                con.Close();
            }
            if (x > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        #endregion
        #region GetShippingAddressDetailAndAddToCartDetails
        public DataTable getshippingaddressdetails(int userid)
        {
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from View_NewShippingAddress_Master where UserID='" + userid + "'";
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds.Tables[0];
            }
        }
        public DataTable getaddtocartdetails(int userid)
        {
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from View_AddToCart_Master where UserID='" + userid + "'";
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds.Tables[0];
            }
        }
        public DataTable getproductdetailsfrmproducttable(int productid)
        {
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from View_ImageProductNew_Master where ImageNewID='" + productid + "'";
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds.Tables[0];
            }
        }
        public DataTable getuseremailid(int userid)
        {
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from View_UserRegistration where UserID='" + userid + "'";
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds.Tables[0];
            }
        }
        public DataTable getsingleproductinformation(int addtocartid)
        {
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from View_AddToCart_Master where AddToCartID='" + addtocartid + "'";
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds.Tables[0];
            }
        }
        public DataTable getsuborderno(string orderno)
        {
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from View_ProductOrder where OrderNo='" + orderno + "'";
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds.Tables[0];
            }
        }
        public DataTable getsubordernordetails1(string suborderno)
        {
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from View_ProductOrder where SubOrderNo='" + suborderno + "'";
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds.Tables[0];
            }
        }
        public DataTable getsubordernordetails2(string suborderno)
        {
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from View_ProductOrder where SubOrderNo='" + suborderno + "'";
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds.Tables[0];
            }
        }


        #endregion
        #region coupon discount
        public DataTable getcouponprice(string couponcode)
        {
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from View_Coupon_Master where CouponCode='" + couponcode + "'";
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds.Tables[0];
            }
        }
        #endregion
    }
}