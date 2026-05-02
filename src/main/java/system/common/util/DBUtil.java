package system.common.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.io.InputStream;
import java.util.Properties;

public class DBUtil {

	private static SessionFactory factory;
	static {
		try {
			Configuration cfg = new Configuration().configure();
			Properties jdbc = loadJdbcProperties();
			cfg.setProperty("hibernate.connection.driver_class", jdbc.getProperty("jdbc.driver"));
			cfg.setProperty("hibernate.connection.url", jdbc.getProperty("jdbc.url"));
			cfg.setProperty("hibernate.connection.username", jdbc.getProperty("jdbc.username"));
			cfg.setProperty("hibernate.connection.password", jdbc.getProperty("jdbc.password"));
			factory = cfg.buildSessionFactory();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static Properties loadJdbcProperties() throws Exception {
		Properties properties = new Properties();
		InputStream inputStream = DBUtil.class.getClassLoader().getResourceAsStream("jdbc.properties");
		if (inputStream == null) {
			throw new IllegalStateException("jdbc.properties not found in classpath");
		}
		try {
			properties.load(inputStream);
		} finally {
			inputStream.close();
		}
		return properties;
	}

	public static SessionFactory getSessionFactory() {
			return factory;
	}

	public static Session getSession() {
			return factory.openSession();
	}

	public static void closeSession(Session session) {
		if (session != null) {
			if (session.isOpen()) {
				session.close();
			}
		}
	}
	
	public void saveObject(Object object) {
		Session session = null;
		try {
			session = DBUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			session.save(object);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
	}

}
