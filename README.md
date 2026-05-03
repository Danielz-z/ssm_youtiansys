# Smart Oilfield Sensing and Control Management System

This is a Java Web management system based on the classic SSM stack. It is mainly intended for learning, coursework, and graduation project reference.

The system includes modules for user management, oilfield information, sensor types, sensor data, safety information, announcements, alarm types, alarm statistics, and daily alarms.

> Note: This project uses older dependencies and still contains legacy code and known security risks. It is recommended for learning purposes only and should not be deployed directly to production.

## Tech Stack

- JDK 8
- Maven
- Spring MVC 4.3.5
- MyBatis 3.3.0
- Hibernate 3.6.9
- JSP / JSTL
- MySQL
- Tomcat 8/9
- H-ui, Layui, ECharts, My97DatePicker

## Project Structure

```text
src/main/java/com/edu
├── controller        # Spring MVC controllers
├── service           # Service interfaces
├── service/impl      # Service implementations
├── mapper            # MyBatis mapper interfaces and XML files
├── model             # Entity classes
└── util              # Utility classes

src/main/resources
├── ApplicationContext.xml
├── jdbc.properties   # Local database connection config
├── mybatis-config.xml
├── hibernate.cfg.xml
└── message_zh_CN.properties

src/main/webapp
├── admin             # Admin JSP pages
├── common            # Shared JSP, CSS, JS, and third-party frontend assets
├── login.jsp
├── register.jsp
└── WEB-INF/web.xml
```

## Local Setup

1. Create the MySQL database and import the initialization script:

```sql
CREATE DATABASE ssm_youtiansys DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
```

Then import:

```text
docs/database.sql
```

2. Copy the database configuration template:

```bash
cp src/main/resources/jdbc.properties.example src/main/resources/jdbc.properties
```

On Windows PowerShell:

```powershell
Copy-Item src/main/resources/jdbc.properties.example src/main/resources/jdbc.properties
```

Then edit:

```text
src/main/resources/jdbc.properties
```

Default template:

```properties
jdbc.driver=com.mysql.cj.jdbc.Driver
jdbc.url=jdbc:mysql://127.0.0.1:3306/ssm_youtiansys?useSSL=false&serverTimezone=Asia/Shanghai&useUnicode=true&characterEncoding=UTF-8&allowPublicKeyRetrieval=true
jdbc.username=your_mysql_username
jdbc.password=your_mysql_password
```

Spring MVC and the legacy Hibernate utility class both read this same configuration file.

3. Build the project with Maven:

```bash
mvn clean package
```

4. Deploy the generated WAR file to Tomcat:

```text
target/ssm_youtiansys.war
```

5. Open the application:

```text
http://localhost:8080/ssm_youtiansys/
```

## Default Account

The database script includes one administrator account:

```text
username: admin
password: admin
```

The current login logic compares passwords in plain text by default. If you enable MD5 login, update both the initial database password and the related login code.

## Database

The initialization script is located at:

```text
docs/database.sql
```

This script was reconstructed from the existing MyBatis mapper files and entity fields. It includes the main business tables and a small set of demo data.

If you encounter table-name case sensitivity issues on different MySQL platforms, keep table names consistent with the MyBatis XML files.

## Notes Before Publishing

- Several MyBatis XML files use `${fieldValue}` for query string interpolation, which may cause SQL injection risks. For production use, replace it with safe parameter binding or whitelist-based queries.
- Some dependencies are old, including Spring, Shiro, Log4j, and commons-fileupload. Treat this repository as a learning project.
- Some Chinese text may have historical encoding issues. If pages display incorrectly, check file encoding and server encoding.
- This repository is released under the MIT License.

## License

This project is licensed under the [MIT License](LICENSE).

## Disclaimer

This project is for learning and reference only. Do not deploy it directly to a public production environment.
