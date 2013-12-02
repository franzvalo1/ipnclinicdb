package mail;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mail.EnviadorMail.autentificadorSMTP;

/**
 * Servlet implementation class MailSender
 */
@WebServlet("/MailSender")
public class MailSender extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MailSender() {
        super();
        
        // TODO Auto-generated constructor stub
    }
    final String miCorreo = "franzvalo@gmail.com";
    final String miContraseña = "gotareal";
    final String servidorSMTP = "smtp.gmail.com";
    final String puertoEnvio = "465";
    	
	String mailReceptor = null;
    	String asunto = null;
    	String cuerpo = null;
    
    public MailSender(String mailReceptor, String asunto, String cuerpo){
    	
    	this.mailReceptor = mailReceptor;
        this.asunto = asunto;
        this.cuerpo = cuerpo;

        Properties props = new Properties();
        props.put("mail.smtp.user", miCorreo);
        props.put("mail.smtp.host", servidorSMTP);
        props.put("mail.smtp.port", puertoEnvio);
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.socketFactory.port", puertoEnvio);
        props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false");

        SecurityManager security = System.getSecurityManager();

        try {

            Authenticator auth = new autentificadorSMTP();
            Session session = Session.getInstance(props, auth);
            // session.setDebug(true);

            MimeMessage msg = new MimeMessage(session);
            msg.setText(cuerpo);
            msg.setSubject(asunto);
            msg.setFrom(new InternetAddress(miCorreo));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(mailReceptor));
            Transport.send(msg);

        } catch (Exception mex) { mex.printStackTrace();}

    
    }
    private class autentificadorSMTP extends javax.mail.Authenticator {

        public PasswordAuthentication getPasswordAuthentication() { return new PasswordAuthentication(miCorreo, miContraseña); }
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
