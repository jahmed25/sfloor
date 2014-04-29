using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SFloor.Services;
using MFO.Commom;
using SFloor.DAO;
using MFO.Utils;

public partial class sfloor_pages_AddToCart : Page
{

    public DataTable cartDT = new DataTable();
    public string total = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        cartDT = HomeService.getCartDT(Session.SessionID);
        total = HomeService.getTotal();
    }
   
}