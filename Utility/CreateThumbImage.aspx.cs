using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;

public partial class Pages_Utility_CreateThumbImage : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["imgMain"] != null)
        {
            try
            {
                string imgMain = Server.MapPath("~/Images/TerrorPhoto/" + Request["imgMain"].ToString());
                byte[] bt = File.ReadAllBytes(imgMain);

                MemoryStream strm = new MemoryStream();
                strm.Write(bt, 0, bt.Length);
                System.Drawing.Image img = System.Drawing.Image.FromStream(strm);
                double width = img.Width;
                double height = img.Height;
                int thumb_w = 100;
                int thumb_h = Convert.ToInt32((height / width) * thumb_w);
                img = img.GetThumbnailImage(thumb_w, thumb_h, null, new IntPtr());
                img.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
            }
            catch
            {
            }                   
        }
    }
}
