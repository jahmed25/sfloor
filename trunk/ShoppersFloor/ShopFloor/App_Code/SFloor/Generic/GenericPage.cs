using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Text;
using System.IO;

namespace SFloor.Pages
{
    public class GenericPage : Page
    {
        string header;
        string footer;
        string head;
        public String Header
        {
            get { return header; }
        }
        public String Footer
        {
            get { return footer; }
        }
        public String Head
        {
            get { return head; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //load Header
            Control c = LoadControl("~/Header.ascx");
            header = RenderControl(c);

            c = LoadControl("~/Footer.ascx");
            footer = RenderControl(c);

            c = LoadControl("~/Head.ascx");
            head = RenderControl(c);
            load(sender, e);
        }

        private string RenderControl(Control control)
        {
            StringBuilder sb = new StringBuilder();
            StringWriter sw = new StringWriter(sb);
            HtmlTextWriter writer = new HtmlTextWriter(sw);

            control.RenderControl(writer);
            return sb.ToString();
        }
        public virtual void load(object sender, EventArgs e)
        {
        }
    }
}