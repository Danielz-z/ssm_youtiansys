# 智慧油田感传控管理系统

这是一个基于 SSM 的 Java Web 管理系统示例，主要用于学习、课程设计或毕业设计参考。项目包含用户管理、油田基本信息、传感器类型、传感器数据、安全信息、公告、报警类型、报警统计和每日报警等模块。

> 注意：本项目依赖较旧，且仍有部分历史代码和安全问题，建议仅作为学习项目使用，不建议直接用于生产环境。

## 技术栈

- JDK 8
- Maven
- Spring MVC 4.3.5
- MyBatis 3.3.0
- Hibernate 3.6.9
- JSP / JSTL
- MySQL
- Tomcat 8/9
- H-ui、Layui、ECharts、My97DatePicker

## 项目结构

```text
src/main/java/com/edu
├── controller        # Spring MVC 控制层
├── service           # 业务接口
├── service/impl      # 业务实现
├── mapper            # MyBatis Mapper 接口和 XML
├── model             # 实体类
└── util              # 工具类

src/main/resources
├── ApplicationContext.xml
├── jdbc.properties   # 数据库连接配置
├── mybatis-config.xml
├── hibernate.cfg.xml
└── message_zh_CN.properties

src/main/webapp
├── admin             # 后台 JSP 页面
├── common            # 公共 JSP、CSS、JS 和第三方前端资源
├── login.jsp
├── register.jsp
└── WEB-INF/web.xml
```

## 本地运行

1. 创建 MySQL 数据库并导入脚本：

```sql
CREATE DATABASE ssm_youtiansys DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
```

然后导入：

```text
docs/database.sql
```

2. 复制数据库连接配置模板：

```bash
cp src/main/resources/jdbc.properties.example src/main/resources/jdbc.properties
```

Windows PowerShell 可以使用：

```powershell
Copy-Item src/main/resources/jdbc.properties.example src/main/resources/jdbc.properties
```

然后修改数据库连接配置：

```text
src/main/resources/jdbc.properties
```

默认配置为：

```properties
jdbc.driver=com.mysql.cj.jdbc.Driver
jdbc.url=jdbc:mysql://127.0.0.1:3306/ssm_youtiansys?useSSL=false&serverTimezone=Asia/Shanghai&useUnicode=true&characterEncoding=UTF-8&allowPublicKeyRetrieval=true
jdbc.username=your_mysql_username
jdbc.password=your_mysql_password
```

请按自己的 MySQL 环境修改。Spring MVC 和历史 Hibernate 工具类都会读取这一份配置。

3. 使用 Maven 打包：

```bash
mvn clean package
```

4. 将生成的 WAR 部署到 Tomcat：

```text
target/ssm_youtiansys.war
```

5. 访问系统：

```text
http://localhost:8080/ssm_youtiansys/
```

## 默认账号

数据库脚本中包含一个管理员账号：

```text
账号：admin
密码：admin
```

当前登录逻辑默认使用明文密码比较。如果你启用 MD5 登录，需要同步调整初始化密码和相关登录代码。

## 数据库说明

初始化脚本位于：

```text
docs/database.sql
```

脚本是根据现有 MyBatis Mapper 和实体字段整理出来的基础版本，包含主要业务表和少量演示数据。不同 MySQL 版本下，如遇到大小写表名问题，请保持表名与 Mapper XML 中一致。

## 开源前注意事项

- 多个 Mapper XML 使用 `${fieldValue}` 做查询拼接，存在 SQL 注入风险，生产环境应改为 `#{}` 参数绑定或白名单查询。
- 依赖版本较旧，例如 Spring、Shiro、Log4j、commons-fileupload 等，公开后建议说明“学习用途”。
- 中文内容可能存在历史编码问题，如页面乱码，请统一检查文件编码和服务器编码。
- 本仓库未附带正式开源许可证。公开到 GitHub 前请根据你的用途选择 MIT、Apache-2.0 或其他许可证。

## 免责声明

本项目仅供学习和交流使用。请勿将其直接部署到公网生产环境。
