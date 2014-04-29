﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SFloor.Services;


public partial class sfloor_pages_Checkout :Page
{
    public DataTable cartDT = new DataTable();
    public string total = "";
    public string subTotal = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            cartDT = HomeService.getCartDT(Session.SessionID);
            subTotal = HomeService.getTotal();
            subTotal = (float.Parse(HomeService.getTotal())+49).ToString();
        }
        catch
        {
            cartDT = new DataTable();
        }

    }
}