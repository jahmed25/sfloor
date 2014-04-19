using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MFO.Common;
using MFO.Loggers;

/// <summary>
/// Summary description for CatDetailsService
/// </summary>
/// 
namespace SFloor.Services
{
    public static class CatDetailsService
    {
        public static DataTable getSizeDT(string style,bool isStyle) {
            DataTable dt = GenericService.getVewImageNewMasterDT();
            IEnumerable<DataRow> query = null;
            if (isStyle)
            {
                query =
                     from dr in dt.AsEnumerable()
                     where dr.Field<String>("StyleCode") == style
                     orderby dr.Field<String>("Size")
                     select dr;
            }
            else {
                query =
                     from dr in dt.AsEnumerable()
                     where dr.Field<String>("StyleCode") == style
                     orderby dr.Field<String>("Size")
                     select dr;
            }
            try
            {
                query = query.Distinct(new DistictComparer("Size"));
                dt = query.CopyToDataTable<DataRow>();
            }
            catch (InvalidOperationException e)
            {
                Logger.Error("Exception ocuur CatDetailsService.getSizeDT()", e);
                dt = new DataTable();
                return dt;

            }
            return dt;
        }
        public static DataTable getColorDT(string style, bool isStyle)
        {
            DataTable dt = GenericService.getVewImageNewMasterDT();
            IEnumerable<DataRow> query = null;
            if (isStyle)
            {
                query =
                     from dr in dt.AsEnumerable()
                     where dr.Field<String>("StyleCode") == style
                     select dr;
            }
            else
            {
                query =
                     from dr in dt.AsEnumerable()
                     where dr.Field<String>("SKUCode") == style
                     select dr;
            }
            try
            {
                query = query.Distinct(new DistictComparer("Color"));
                dt = query.CopyToDataTable<DataRow>();
            }
            catch (InvalidOperationException e)
            {
                Logger.Error("Exception ocuur CatDetailsService.getColorDT()", e);
                dt = new DataTable();
                return dt;

            }
            return dt;
        }

        public static DataTable getRelProductDT(string pType)
        {
            DataTable dt = GenericService.getVewImageNewMasterDT();
            IEnumerable<DataRow> query =
                from dr in dt.AsEnumerable()
                where dr.Field<String>("SKUProductType") == pType
                    && dr.Field<String>("StyleCode") == String.Empty
                select dr;
            try
            {
                dt =query.CopyToDataTable<DataRow>();
            }
            catch (InvalidOperationException e)
            {
                Logger.Error("Exception occur CatService.getRelProductDT()", e);
                dt = new DataTable();
            }
            return dt;
        }
    }
}