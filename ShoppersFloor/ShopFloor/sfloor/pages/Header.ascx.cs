using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SFloor.Services;

public partial class Header : System.Web.UI.UserControl
{
    DataTable favDT = new DataTable();
    DataTable cartDT = new DataTable();
    string total = "";
    public DataTable FavDT
    {
        get {
            favDT=HomeService.getFavDT(Session.SessionID);
            return favDT; 
        }
    }
    public DataTable CartDT
    {
        get
        {
            cartDT=HomeService.getCartDT(Session.SessionID);
            return cartDT;
        }
    }
    public String Total
    {
        get
        {
            total=HomeService.getTotal();
            return total;
        }
    }
   

}