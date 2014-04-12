using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MFO.DTO;
using MFO.Commom;
using MFO.DAO;
using MFO.Loggers;
using MFO.Constants;

/// <summary>
/// Summary description for IndexService
/// </summary>
/// 
namespace MFO.services
{
    public static class IndexService
    {
        private static FrontViewProductDetailsDAO fvDao = new FrontViewProductDetailsDAO();

        public static DataTable getBanarDT()
        {
            Logger.Info("START IndexService.getBanarDT()");
            try
            {
                if (CommonUtil.isCached(Constant.Application.INDEX_BANAR_DT))
                {
                    Logger.Info("Fetching DT " + Constant.Application.INDEX_BANAR_DT + " from Application cache");
                    return ((DataCacheDTO)HttpContext.Current.Application[Constant.Application.INDEX_BANAR_DT]).Dt;
                }
                else
                {
                    Logger.Info("Fetching DT " + Constant.Application.INDEX_BANAR_DT + " from DB");
                    DataTable dt = fvDao.getallhomepagebanner();
                    CommonUtil.DtNullCheck(dt);
                    DataCacheDTO cache = new DataCacheDTO();
                    cache.CacheTime = DateTime.Now;
                    cache.Dt = dt;
                    HttpContext.Current.Application[Constant.Application.INDEX_BANAR_DT] = cache;
                    Logger.Info("END IndexService.getBanarDT()");
                    return dt;
                }
            }
            catch (Exception e)
            {
                Logger.Error("Error occuer IndexService.getBanarDT() ", e);
            }
            Logger.Info("END IndexService.getBanarDT()");

            return null;
        }

    }
}