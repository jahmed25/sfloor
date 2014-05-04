using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SFloor.Services;
using MFO.Commom;
using MFO.Utils;
using SFloor.DAO;
using MFO.Constants;


public partial class sfloor_pages_Checkout :Page
{
    public DataTable cartDT = new DataTable();
    public string total = "";
    public string subTotal = "";
    public Dictionary<string, string> invDic = new Dictionary<string, string>();
    public DataTable shipDT = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            cartDT = HomeService.getCartDT(Session.SessionID);
            subTotal = HomeService.getTotal();
            total = (float.Parse(HomeService.getTotal()) + 49).ToString();
            invDic = AjaxService.checkInventory(cartDT, Session.SessionID);
            String userId = Session[Constant.Session.LOGED_IN_USER_ID] +"";
            if (!StringUtil.isNullOrEmpty(userId))
                shipDT = ShippingDAO.getShippinByUserID(userId);
                
        }
        catch
        {
            cartDT = new DataTable();
        }


    }
   
   
}