<%@ Application Language="C#" %>

<script runat="server">

    HttpApplicationState application;
    void Application_Start(object sender, EventArgs e)
    {
		if ("true".Equals(MFO.Utils.ConfigUtil.getValue("cacheEnable").ToString().ToLower()))
		{
			MFO.Loggers.Logger.Info("Caching is Enable");
            int cacheExpireHour = Int32.Parse(MFO.Utils.ConfigUtil.getValue("cacheExpireHour").ToString());
            MFO.DAO.MenuUserDAO dao = new MFO.DAO.MenuUserDAO();
            System.Data.DataTable dt = dao.getViewImageNewMaster();
            HttpContext.Current.Application[MFO.Constants.Constant.Table.VIEW_IMAGE_NEW_MASTER] = dt;
            application = HttpContext.Current.Application;
			System.Timers.Timer timer = new System.Timers.Timer((1000*60*cacheExpireHour));
			timer.Elapsed += Timer_Tick;
			timer.Enabled =true;
			timer.Start();
		}else{
			MFO.Loggers.Logger.Info("Caching is not Enable");
		}
	}
	void Timer_Tick(object sender, EventArgs e)
	{
		MFO.Loggers.Logger.Info("START TIMER TO LOAD PRODUCTS DATA");
		MFO.DAO.MenuUserDAO dao= new MFO.DAO.MenuUserDAO();
		System.Data.DataTable dt= dao.getViewImageNewMaster();
        application[MFO.Constants.Constant.Table.VIEW_IMAGE_NEW_MASTER] = dt;
		MFO.Loggers.Logger.Info("END TIMER TOTAL ROWS ARE :- "+dt.Rows.Count);
	}
	void Application_Error(object sender, EventArgs e)
	{
		Exception exception = Server.GetLastError();
		// ... log error here
		MFO.Loggers.Logger.Error("Exception Occur "+exception);
		var httpEx = exception as HttpException;    

		if (httpEx != null && httpEx.GetHttpCode() == 403)
			Response.Redirect("/sfloor/pages/Error500.aspx", true);
		else if (httpEx != null && httpEx.GetHttpCode() == 404)
			Response.Redirect("/sfloor/pages/Error404.aspx", true);
		else
			Response.Redirect("/sfloor/pages/Error500.aspx", true);
	}

</script>