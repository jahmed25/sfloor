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
    public DataTable favDT = new DataTable();
    public DataTable cartDT = new DataTable();
    public string total = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
           favDT = HomeService.getFavDT(Session.SessionID);
           cartDT = HomeService.getCartDT(Session.SessionID);
           total = HomeService.getTotal();
        }
        catch {
             favDT = new DataTable();
             cartDT = new DataTable();
        }
    }
}