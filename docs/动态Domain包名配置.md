# 动态 Domain 包名配置说明

## 📋 功能概述

通过 `customMap.domainPackage` 配置，可以灵活控制所有 domain 相关类（dto、entity、req、resp、convert）的包路径。

---

## ✨ 特性

- ✅ **动态配置**: 通过 `customMap.domainPackage` 统一配置 domain 包路径
- ✅ **向下兼容**: 如果不设置 `domainPackage`，自动使用默认路径 `${package.Parent}.domain`
- ✅ **全局生效**: 一次配置，所有相关模板文件自动使用
- ✅ **类型安全**: 编译时检查，避免包名错误

---

## 🎯 使用方式

### 方式一：使用 domainPackage（推荐）

在 `CodeGenerator.java` 中配置：

```java
// 自定义变量配置
Map<String, Object> customMap = new HashMap<>();

// 配置 domain 包路径
String domainPackage = parent + ".domain";
customMap.put("domainPackage", domainPackage);

builder.customMap(customMap);
```

**生成的包结构：**
```
com.dzy.springtemplate.domain
├── dto
│   └── UserDTO.java
├── entity
│   └── User.java
├── req
│   └── UserReq.java
├── resp
│   └── UserResp.java
└── convert
    └── UserConvert.java
```

### 方式二：不设置 domainPackage（默认）

如果不设置或注释掉 `domainPackage`：

```java
Map<String, Object> customMap = new HashMap<>();
// customMap.put("domainPackage", parent + ".domain");  // 不设置
```

**默认包结构（与方式一相同）：**
```
com.dzy.springtemplate.domain
├── dto
├── entity
├── req
├── resp
└── convert
```

### 方式三：自定义包路径

可以设置为任意包路径：

```java
// 示例1: 使用自定义包名
customMap.put("domainPackage", parent + ".model");

// 示例2: 使用更深层的包结构
customMap.put("domainPackage", parent + ".core.domain");

// 示例3: 使用完全自定义的包路径
customMap.put("domainPackage", "com.example.myproject.domain");
```

---

## 📖 模板实现原理

所有相关模板文件都使用以下逻辑判断：

### 包声明（package）

```ftl
<#if customMap?? && customMap.domainPackage??>
package ${customMap.domainPackage}.dto;
<#else>
package ${package.Parent}.domain.dto;
</#if>
```

### Import 语句

```ftl
<#if customMap?? && customMap.domainPackage??>
import ${customMap.domainPackage}.dto.${entity}DTO;
<#else>
import ${package.Parent}.domain.dto.${entity}DTO;
</#if>
```

---

## 📁 已修改的模板文件

以下模板文件已支持动态 domain 包名：

| 模板文件 | 说明 | 包声明 | Import |
|---------|------|--------|--------|
| **controller.java.ftl** | 控制器 | ❌ | ✅ |
| **service.java.ftl** | 服务接口 | ❌ | ✅ |
| **serviceImpl.java.ftl** | 服务实现 | ❌ | ✅ |
| **convert.java.ftl** | 对象转换 | ✅ | ✅ |
| **dto.java.ftl** | 数据传输对象 | ✅ | ❌ |
| **req.java.ftl** | 请求对象 | ✅ | ❌ |
| **resp.java.ftl** | 响应对象 | ✅ | ❌ |

---

## 🔧 当前配置

在 `CodeGenerator.java` 中的当前配置：

```java
// Domain 包路径配置（如果不设置，模板会使用 ${package.Parent}.domain）
String domainPackage = parent + ".domain";
customMap.put("domainPackage", domainPackage);
```

**实际生成的包路径：** `com.dzy.springtemplate.domain`

---

## 🎨 配置示例

### 示例1: 标准配置（当前）

```java
String domainPackage = parent + ".domain";
customMap.put("domainPackage", domainPackage);
```

**结果：**
- UserDTO: `com.dzy.springtemplate.domain.dto.UserDTO`
- User: `com.dzy.springtemplate.domain.entity.User`
- UserConvert: `com.dzy.springtemplate.domain.convert.UserConvert`

### 示例2: 使用 model 包名

```java
String domainPackage = parent + ".model";
customMap.put("domainPackage", domainPackage);
```

**结果：**
- UserDTO: `com.dzy.springtemplate.model.dto.UserDTO`
- User: `com.dzy.springtemplate.model.entity.User`
- UserConvert: `com.dzy.springtemplate.model.convert.UserConvert`

### 示例3: 多层包结构

```java
String domainPackage = parent + ".core.domain";
customMap.put("domainPackage", domainPackage);
```

**结果：**
- UserDTO: `com.dzy.springtemplate.core.domain.dto.UserDTO`
- User: `com.dzy.springtemplate.core.domain.entity.User`
- UserConvert: `com.dzy.springtemplate.core.domain.convert.UserConvert`

### 示例4: 完全自定义

```java
String domainPackage = "com.mycompany.project.domain";
customMap.put("domainPackage", domainPackage);
```

**结果：**
- UserDTO: `com.mycompany.project.domain.dto.UserDTO`
- User: `com.mycompany.project.domain.entity.User`
- UserConvert: `com.mycompany.project.domain.convert.UserConvert`

---

## ⚙️ 修改包路径的步骤

1. **打开 CodeGenerator.java**
2. **找到 customMap 配置部分**
3. **修改 domainPackage 值：**
   ```java
   String domainPackage = parent + ".你的包名";
   customMap.put("domainPackage", domainPackage);
   ```
4. **运行代码生成器**
5. **编译验证**

---

## ✅ 编译验证

项目编译成功，所有修改已生效！

```bash
./mvnw clean compile
# [INFO] BUILD SUCCESS
```

---

## 💡 最佳实践

1. **统一配置**: 所有 domain 相关的类使用同一个包前缀
2. **简洁清晰**: 包名不宜过长，保持简洁
3. **符合规范**: 遵循 Java 包命名规范（小写字母，点分隔）
4. **团队一致**: 团队内部统一包名规范

---

## 🐛 注意事项

1. **已生成的文件**: 修改配置后，需要重新生成代码才会使用新的包路径
2. **包路径格式**: 必须使用点分隔的完整包路径，如 `com.dzy.springtemplate.domain`
3. **向下兼容**: 不设置 `domainPackage` 时，默认使用 `${package.Parent}.domain`
4. **编译检查**: 修改后务必执行编译检查，确保包路径正确

---

## 🔗 相关文件

- **CodeGenerator.java** - 配置文件
- **templates/*.ftl** - 模板文件
- **自定义变量使用指南.md** - 自定义变量详细说明
