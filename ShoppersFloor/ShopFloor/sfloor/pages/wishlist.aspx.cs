using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SFloor.Services;
using SFloor.Pages;

public partial class sfloor_pages_wishlist : GenericPage
{
    public DataTable favDT = new DataTable();
    public override void load(object sender, EventArgs e)
    {
        try
        {
            favDT = HomeService.getFavDT(Session.SessionID);
        }
        catch
        {
            favDT = new DataTable();
        }
    }
}