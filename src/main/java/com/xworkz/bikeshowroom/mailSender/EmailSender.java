package com.xworkz.bikeshowroom.mailSender;

import lombok.extern.slf4j.Slf4j;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
@Slf4j
public class EmailSender {
    public static boolean sendEmail(String email, String generatedOtp) {

        final String username = "keerthisr.xworkz@gmail.com";
        final String password = "ohxr ubph atwv syda";

        Properties pro = new Properties();
        pro.put("mail.smtp.host", "smtp.gmail.com");
        pro.put("mail.smtp.port", "587");
        pro.put("mail.smtp.auth", "true");
        pro.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(pro, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });


        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(email));
            message.setSubject("Your OTP for login into Honda showroom");


            String htmlContent = "<h3>Your One-Time Password (OTP)</h3>" +
                    "<p>OTP: <strong>" + generatedOtp + "</strong></p>" +
                    "<p>Valid for 5 minutes only</p>";

            message.setContent(htmlContent, "text/html");

            Transport.send(message);
            log.info("Email sent successfully to: {}", email);

        } catch (MessagingException e) {
            log.error("Email sending failed to {}: {}", email, e.getMessage());
            e.printStackTrace();

        }
        return true;
    }
}