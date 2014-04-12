using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MFO.Constants;
using SFloor.Services;
using SFloor.DTO;



public partial class Menu : System.Web.UI.UserControl
{
    protected List<MenuDTO> womenDTO;
    protected List<MenuDTO> menDTO;
    protected List<MenuDTO> hdDTO;
    protected List<MenuDTO> brandDTO;
    protected List<MenuDTO> offerDTO;

    protected void Page_Load(object sender, EventArgs e)
    {
        
        womenDTO = HomeService.getMenuDT(Constant.ColumnValue.WOMEN);
        menDTO = HomeService.getMenuDT(Constant.ColumnValue.MEN);
        hdDTO = HomeService.getMenuDT(Constant.ColumnValue.HOME_DECOR);
        brandDTO = HomeService.getBrandMenuDT();
       // offerDTO = HomeService.getMenuDT(Constant.ColumnValue.WOMEN);
    }

}