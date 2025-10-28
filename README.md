# Spring Template

一个基于 Spring Boot 3.x 的现代化 Web 应用模板项目，集成了最新的技术栈和最佳实践，提供完整的代码生成解决方案。

## 📋 项目特性

- 🚀 **现代化技术栈**: 基于 Spring Boot 3.3.5 + Java 17
- 🔧 **智能代码生成**: 基于 MyBatis-Plus 的自动化代码生成器
- 📝 **完整的 CRUD 操作**: 自动生成 Controller、Service、DAO 层代码
- 🎯 **DTO 模式**: 完整的实体与 DTO 转换，保证 API 安全性
- ✅ **数据校验**: 基于 Jakarta Validation 的自动校验注解生成
- 🔄 **对象映射**: 集成 MapStruct 实现高性能对象转换
- 📚 **API 文档**: 集成 SpringDoc OpenAPI 3.0，自动生成 Swagger 文档
- 🏗️ **分层架构**: 清晰的分层架构设计（Controller -> Service -> DAO -> Entity）
- 🛠️ **开发友好**: 支持 Lombok，减少样板代码

## 🛠️ 技术栈

### 核心框架
- **Spring Boot**: 3.3.5
- **Java**: 17
- **Maven**: 项目构建工具

### 数据访问层
- **MyBatis-Plus**: 3.5.7 (Spring Boot 3 专用版本)
- **MySQL**: 数据库
- **HikariCP**: 数据库连接池 (Spring Boot 默认)

### Web 层
- **Spring Web**: RESTful API 开发
- **Spring Validation**: 数据校验

### 代码生成与映射
- **MyBatis-Plus Generator**: 3.5.7
- **MapStruct**: 1.5.0.Final / 1.5.5.Final (处理器)
- **FreeMarker**: 2.3.33 (模板引擎)

### API 文档
- **SpringDoc OpenAPI**: 2.6.0 (替代 Springfox，支持 Spring Boot 3)

### 开发工具
- **Lombok**: 1.18.30 (减少样板代码)
- **Spring Boot DevTools**: 开发时热重载

## 📁 项目结构

```
spring-template/
├── src/main/java/com/dzy/springtemplate/
│   ├── controller/          # 控制器层
│   │   └── UserController.java
│   ├── service/            # 服务接口层
│   │   └── UserService.java
│   │   └── impl/           # 服务实现层
│   │       └── UserServiceImpl.java
│   ├── dao/                # 数据访问层
│   │   └── UserDao.java
│   ├── entity/             # 实体类
│   │   └── User.java
│   ├── dto/                # 数据传输对象
│   │   └── UserDTO.java
│   ├── convert/            # 对象转换接口
│   │   └── UserConvert.java
│   └── mapper/             # MyBatis Mapper 接口
│       └── UserMapper.java
├── src/main/resources/
│   ├── mapper/             # MyBatis XML 映射文件
│   │   └── UserMapper.xml
│   └── templates/          # 代码生成模板
│       ├── controller.java.ftl
│       ├── service.java.ftl
│       ├── serviceImpl.java.ftl
│       ├── dao.java.ftl
│       ├── entity.java.ftl
│       ├── dto.java.ftl
│       └── convert.java.ftl
└── src/test/java/
    └── CodeGenerator.java  # 代码生成器
```

## 🚀 快速开始

### 环境要求
- Java 17+
- Maven 3.6+
- MySQL 8.0+

### 1. 克隆项目
```bash
git clone <repository-url>
cd spring-template
```

### 2. 配置数据库
修改 `CodeGenerator.java` 中的数据库连接信息：
```java
String url = "jdbc:mysql://localhost:3306/your_database";
String username = "your_username";
String password = "your_password";
```

### 3. 运行代码生成器
```bash
mvn test-compile exec:java -Dexec.mainClass="com.dzy.springtemplate.CodeGenerator" -Dexec.classpathScope=test
```

### 4. 启动应用
```bash
mvn spring-boot:run
```

### 5. 访问 API 文档
应用启动后，访问 Swagger UI：
- http://localhost:8080/swagger-ui/index.html

## 📊 生成的 API 接口

### 用户管理 API

| 方法 | 路径 | 描述 | 请求体 | 响应体 |
|------|------|------|--------|--------|
| GET | `/user/{id}` | 获取用户信息 | - | UserDTO |
| POST | `/user` | 创建用户 | UserDTO | UserDTO |
| PUT | `/user/{id}` | 更新用户 | UserDTO | UserDTO |
| DELETE | `/user/{id}` | 删除用户 | - | Boolean |

### 请求示例

#### 创建用户
```bash
curl -X POST http://localhost:8080/user \
  -H "Content-Type: application/json" \
  -d '{
    "username": "john_doe",
    "email": "john@example.com",
    "realName": "John Doe"
  }'
```

#### 获取用户
```bash
curl -X GET http://localhost:8080/user/1
```

## 🔧 代码生成配置

### 文件覆盖控制
在 `CodeGenerator.java` 中可以控制是否覆盖已存在的文件：
```java
// 设置为 false 可以避免覆盖已存在的文件
boolean enableFileOverride = true;
```

### 支持的表配置
```java
builder.addInclude("user", "order", "product") // 设置需要生成的表名
       .addTablePrefix("sys_", "t_")            // 设置过滤表前缀
```

## ✨ 主要特性详解

### 1. DTO 自动校验
生成的 DTO 类自动包含校验注解：
```java
@Data
@Schema(name = "UserDTO", description = "用户表 DTO")
public class UserDTO {

    @NotBlank(message = "用户名不能为空")
    @Size(min = 3, max = 64, message = "用户名长度必须在3-64个字符之间")
    private String username;

    @NotBlank(message = "邮箱不能为空")
    @Email(message = "邮箱格式不正确")
    private String email;
}
```

### 2. MapStruct 对象转换
自动生成高性能的对象转换接口：
```java
@Mapper(componentModel = "spring")
public interface UserConvert {
    UserDTO toUserDTO(User user);
    User toUser(UserDTO userDTO);
    List<UserDTO> toUserDTOList(List<User> userList);
    List<User> toUserList(List<UserDTO> userDTOList);
}
```

### 3. 分层架构
- **Controller**: 只处理 HTTP 请求和响应，使用 DTO
- **Service**: 处理业务逻辑和 DTO ↔ Entity 转换
- **DAO**: 数据访问操作，使用 Entity
- **Entity**: 数据库实体映射

### 4. 自动 API 文档
使用 SpringDoc OpenAPI 自动生成：
- 接口文档自动生成
- 请求/响应模型自动映射
- 在线测试功能

### 5. 接口规范
使用 SpringDoc OpenAPI 自动生成：
- 标准CRUD：使用特定HTTP方法（GET/POST/PUT/DELETE）
- 复杂业务操作：使用POST + 动作名词
- 查询操作：统一使用GET；命名：查询单个数据（getById）、查询列表（listXxx）、查询分页数据（pageXxx）
  





## 🔄 版本兼容性

本项目专门针对 Spring Boot 3.x 进行优化：
- ✅ 使用 Jakarta EE 规范（jakarta.*）
- ✅ MyBatis-Plus Spring Boot 3 专用 starter
- ✅ SpringDoc OpenAPI 3（替代 Springfox）
- ✅ Jakarta Validation API

## 📝 开发建议

1. **代码生成**: 首次生成时设置 `enableFileOverride = true`，后续增量更新设置为 `false`
2. **数据校验**: 根据业务需求在 DTO 模板中调整校验规则
3. **API 设计**: 遵循 RESTful 设计原则
4. **错误处理**: 建议添加全局异常处理器
5. **日志配置**: 建议配置适当的日志级别

## 🤝 贡献

欢迎提交 Issue 和 Pull Request 来改进这个项目。

## 📄 许可证

本项目采用 MIT 许可证。详情请查看 [LICENSE](LICENSE) 文件。