package mail;


import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;

public class EnviadorMail {

    final String miCorreo = "franzvalo@gmail.com";
    final String miContraseņa = "gotareal";
    final String servidorSMTP = "smtp.gmail.com";
    final String puertoEnvio = "465";
    	
	String mailReceptor = null;
    	String asunto = null;
    	String cuerpo = null;

    public EnviadorMail(String mailReceptor, String asunto, String cuerpo) {
        
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

    public class autentificadorSMTP extends javax.mail.Authenticator {

        public PasswordAuthentication getPasswordAuthentication() { return new PasswordAuthentication(miCorreo, miContraseņa); }
    }

    /**
     * @param args
     */

  /*  public static void main(String[] args) {
  
        EnviadorMail EnviadorMail = new EnviadorMail("fhernandezl1101@alumno.ipn.mx","Este es el asunto de mi correo", "Este es el cuerpo de mi correo");
    }*/

}