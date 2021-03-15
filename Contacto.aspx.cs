using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contacto : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        try
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(txtMail.Text);
            mail.From = new MailAddress("josefloresvasquez@gmail.com");
            mail.Subject = "Proyecto Store ASP.NET";

            string Body = string.Format("Estimado(a) {0}, le informamos que hemos recibido exitosamente su mensaje, lo analizaremos y contestaremos con la mayor brevedad posible.<br> ", txtNombre.Text);
            Body += "------------------------------------------------------------------ <br>";
            Body += "Su mensaje: <br>";
            Body += txtMsj.Text;
            mail.Body = Body;

            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com"; //Or Your SMTP Server Address
            smtp.Credentials = new System.Net.NetworkCredential
                 ("josefloresvasquez@gmail.com", "pelusarufo");

            smtp.EnableSsl = true;
            smtp.Send(mail);
            Response.Redirect(Request.Url.AbsoluteUri);
        }
        catch
        {
            error.Visible = true;
        }
    }
}