package com.book.shop.utils;

import java.security.GeneralSecurityException;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.util.MailSSLSocketFactory;

/**
 * 邮件发送工具类
 *
 *
 */
public class MailUitls {
	/**
	 * 发送邮件的方法
	 * @param to	:收件人
	 * @param code	:激活码
	 * @throws GeneralSecurityException
	 */
	public static void sendMail(String to,String code) throws GeneralSecurityException{
		/**
		 * 1.获得一个Session对象.
		 * 2.创建一个代表邮件的对象Message.
		 * 3.发送邮件Transport
		 */
		// 1.获得连接对象
		Properties props = new Properties();
		// 开启debug调试
		props.setProperty("mail.debug", "true");
		// 发送服务器需要身份验证
		props.setProperty("mail.smtp.auth", "true");
		// 设置邮件服务器主机名
		props.setProperty("mail.host", "smtp.qq.com");
		// 发送邮件协议名称
		props.setProperty("mail.transport.protocol", "smtp");

		MailSSLSocketFactory sf = new MailSSLSocketFactory();
		sf.setTrustAllHosts(true);
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.socketFactory", sf);
		// 创建会话
		Session session = Session.getInstance(props);
		// 2.创建邮件对象:
		Message message = new MimeMessage(session);
		// 设置发件人:
		try {
			message.setFrom(new InternetAddress("1185630400@qq.com"));
			// 设置收件人:
			message.addRecipient(RecipientType.TO, new InternetAddress(to));
			// 抄送 CC   密送BCC
			// 设置标题
			message.setSubject("来自书城小驿官方激活邮件");
			// 设置邮件正文:
			message.setContent("<h1>书城小驿官方激活邮件!点下面链接完成激活操作!</h1><h3><a href='http://10.2.217.177:8080/bookShop/user_active.action?code="+code+"'>"
					+ "http://10.2.217.177:8080/bookShop/user_active.action?code="+code+"</a></h3>", "text/html;charset=UTF-8");
			// 3.发送邮件:

			Transport transport = session.getTransport();
			transport.connect("smtp.qq.com", "1185630400@qq.com",
					"rgeumojcountgbhc");// 密码不是登录邮箱的密码，是开启SMTP时的授权码
			// 发送消息
			transport.sendMessage(message, new Address[] { new InternetAddress(
					to) });
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}

	}

	public static void main(String[] args) throws GeneralSecurityException {
		sendMail("595696893@qq.com","111111111111");
	}
}
