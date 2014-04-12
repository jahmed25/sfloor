using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{
    [WebMethod]
    public List<string> GetData(string DName)
    {
        List<string> result = new List<string>();
        using (SqlConnection con = new SqlConnection("Data Source=180.179.202.53,2499;database=MEGA_DB;user id=sa;password=pe3aGYK4DECdwTs"))
        {
            using (SqlCommand cmd = new SqlCommand("select SKUBrand from View_ImageProductNew_Master where " + "SKUBrand like @SearchText + '%' union select SKUCategory from View_ImageProductNew_Master where " + "SKUCategory like @SearchText + '%' union select SKUCategoryType from View_ImageProductNew_Master where " + "SKUCategoryType like @SearchText + '%' union select SKUProductType from View_ImageProductNew_Master where " + "SKUProductType like @SearchText + '%' union select SKUName from View_ImageProductNew_Master where " + "SKUName like @SearchText + '%'", con))
            //using (SqlCommand cmd = new SqlCommand("select SKUBrand from View_ImageProductNew_Master where " + "SKUBrand like @SearchText + '%' union select SKUCategory from View_ImageProductNew_Master where " + "SKUCategory like @SearchText + '%' union select SKUCategoryType from View_ImageProductNew_Master where " + "SKUCategoryType like @SearchText + '%' union select SKUProductType from View_ImageProductNew_Master where " + "SKUProductType like @SearchText + '%' union select SKUName from View_ImageProductNew_Master where " + "SKUName like @SearchText + '%'", con))
            {
                con.Open();
                cmd.Parameters.AddWithValue("@SearchText", DName);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    result.Add(dr["SKUBrand"].ToString());
                }
                return result;
            }
        }
    }
}
