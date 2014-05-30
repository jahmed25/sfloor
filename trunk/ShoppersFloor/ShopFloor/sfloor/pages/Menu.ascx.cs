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
    List<MenuDTO> womenDTO;
    List<MenuDTO> menDTO;
    List<MenuDTO> hdDTO;
    List<MenuDTO> brandDTO;
    List<MenuDTO> offerDTO;

    public List<MenuDTO> WomenDTO
    {
        get {
            womenDTO = HomeService.getMenuDT(Constant.ColumnValue.WOMEN);
            return womenDTO; 
        }
        
    }
    public List<MenuDTO> MenDTO
    {
        get {
            menDTO = HomeService.getMenuDT(Constant.ColumnValue.MEN);
            return menDTO; 
        }

    }
    public List<MenuDTO> HdDTO
    {
        get {
            hdDTO=HomeService.getMenuDT(Constant.ColumnValue.HOME_DECOR);
            return hdDTO; 
        }

    }
    public List<MenuDTO> BrandDTO
    {
        get {
            brandDTO = HomeService.getBrandMenuDT();
            return brandDTO; 
        }

    }
    public List<MenuDTO> OfferDTO
    {
        get { return offerDTO; }

    }
}