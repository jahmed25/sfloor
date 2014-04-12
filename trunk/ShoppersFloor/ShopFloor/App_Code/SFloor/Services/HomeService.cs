using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MFO.Common;
using MFO.Constants;
using MFO.Loggers;
using MFO.Services;
using SFloor.DTO;
using MFO.Utils;
using SFloor.DAO;
using MFO.Commom;

/// <summary>
/// Summary description for HomeServices
/// </summary>
/// 
namespace SFloor.Services
{
    public static class HomeService
    {
       public static List<MenuDTO> getMenuDT(String menuType) 
       {

           if (HttpContext.Current.Application[menuType] != null)
               return HttpContext.Current.Application[menuType] as List<MenuDTO>;

           DataTable dt = GenericService.getVewImageNewMasterDT();
            IEnumerable<DataRow> query =
                from dr in dt.AsEnumerable()
                where dr.Field<String>("SKUCategory") == menuType
                    && dr.Field<String>("CategoryTypeID") != null
                    && dr.Field<String>("CategoryTypeID") != String.Empty
                orderby dr.Field<String>("SKUCategory")
                select dr;
           try
           {
               query = query.Distinct(new DistictComparer("CategoryTypeID"));
               dt = query.CopyToDataTable<DataRow>();
               
           }
           catch (InvalidOperationException e)
           {
               Logger.Error("Exception occur HomeService.getMenuDT()", e);
               dt = new DataTable();
           }
           List<MenuDTO> dtos = new List<MenuDTO>();
           for (int i=0; i < dt.Rows.Count; i++)
           {
               MenuDTO dto= new MenuDTO();
               dto.Heading = dt.Rows[i]["SKUCategoryType"] + "";
               dto.Url = ConfigUtil.hostURL()+""+ dt.Rows[i]["CategoryTypeUrlName"] + "";
               DataTable dt1 = CategoriesService.getDistictProductByCatType(dt.Rows[i]["CategoryTypeID"] + "");
               for (int j = 0; j <dt1.Rows.Count; j++)
               {
                   MenuDTO subDto = new MenuDTO();
                   subDto.Heading = dt1.Rows[j]["SKUProductType"]+"";
                   string str = StringUtil.urlEncode(dt1.Rows[j]["SKUProductType"] + "");
                   subDto.Url = dto.Url + "/" + str;
                   dto.addContent(subDto);
               }
               dtos.Add(dto);
               HttpContext.Current.Application[menuType] = dtos;
           }
           return dtos;
       }

       public static List<MenuDTO> getBrandMenuDT()
       {

           if (HttpContext.Current.Application[Constant.Application.BRAND_MENU] != null)
               return HttpContext.Current.Application[Constant.Application.BRAND_MENU] as List<MenuDTO>;

           DataTable dt = GenericService.getVewImageNewMasterDT();
           IEnumerable<DataRow> query =
               from dr in dt.AsEnumerable()
               select dr;
           try
           {
               query = query.Distinct(new DistictComparer("SKUCategory"));
               dt = query.CopyToDataTable<DataRow>();

           }
           catch (InvalidOperationException e)
           {
               Logger.Error("Exception occur HomeService.getMenuDT()", e);
               dt = new DataTable();
           }
           List<MenuDTO> dtos = new List<MenuDTO>();
           for (int i = 0; i < dt.Rows.Count; i++)
           {
               MenuDTO dto = new MenuDTO();
               dto.Heading = dt.Rows[i]["SKUCategory"] + "";
               dto.Url = ConfigUtil.hostURL() + "" + dt.Rows[i]["SKUCategory"] + "";
               DataTable dt1 = CategoriesService.getDistictProductByCat(dt.Rows[i]["SKUCategory"] + "");
               for (int j = 0; j < dt1.Rows.Count; j++)
               {
                   MenuDTO subDto = new MenuDTO();
                   subDto.Heading = dt1.Rows[j]["SKUBrand"] + "";
                       subDto.Url = ConfigUtil.hostURL() + "Shop-By-Brand/" + dt1.Rows[j]["SKUCategoryType"] + "?Brand=" + dt1.Rows[j]["SKUBrand"];
                   dto.addContent(subDto);
               }
               dtos.Add(dto);
               if(dtos!=null)
                HttpContext.Current.Application[Constant.Application.BRAND_MENU] = dtos;
           }
           return dtos;
       }

       public static DataTable getFavDT(string sessionId)
       {
           DataTable dt1 = new DataTable();
           if (HttpContext.Current.Session[Constant.Session.FAV_LIST] != null)
           {
               dt1= HttpContext.Current.Session[Constant.Session.FAV_LIST] as DataTable;
           }
           else
           {
               dt1 = FavDAO.getFavDT(sessionId);
               String str = "";
               if (!CommonUtil.DT.isEmptyOrNull(dt1))
               {
                   for (int i=0; i < dt1.Rows.Count; i++)
                   {
                       str += dt1.Rows[i]["SKU"] + ",";
                   }
                   DataTable dt = GenericService.getVewImageNewMasterDT();
                   str = str.Substring(0, str.Length - 1);
                   IEnumerable<DataRow> query =
                   from dr in dt.AsEnumerable()
                   where str.Contains(dr.Field<String>("SKUCode"))
                   select dr;
                   try
                   {
                       dt1= query.CopyToDataTable<DataRow>();
                   }
                   catch (InvalidOperationException e)
                   {
                       Logger.Error("Exception occur HomeService.getMenuDT()", e);
                       dt1 = new DataTable();
                   }
               }
           }
           return dt1;
       }
    }
}