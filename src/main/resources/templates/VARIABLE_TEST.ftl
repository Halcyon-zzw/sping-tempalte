/**
 * ========================================
 * MyBatis-Plus Generator 变量测试文件
 * ========================================
 *
 * 这个文件用于测试和查看所有可用的变量
 * 生成后可以查看实际的变量值
 */

// ============ 包相关变量 ============
// package.Parent: ${package.Parent}
// package.Entity: ${package.Entity}
// package.Mapper: ${package.Mapper}
// package.Service: ${package.Service}
// package.ServiceImpl: ${package.ServiceImpl}
// package.Controller: ${package.Controller}

// ============ 表相关变量 ============
// table.name: ${table.name}
// table.comment: ${table.comment!}
// table.entityName: ${table.entityName}
// table.entityPath: ${table.entityPath}
// table.serviceName: ${table.serviceName}
// table.mapperName: ${table.mapperName}
// table.controllerName: ${table.controllerName}

// ============ 实体类名（简写） ============
// entity: ${entity}

// ============ 全局配置变量 ============
// author: ${author}
// date: ${date}
// swagger: ${swagger?c}
// kotlin: ${kotlin?c}

// ============ 自定义变量 ============
<#if customMap??>
  <#if customMap.projectName??>
// customMap.projectName: ${customMap.projectName}
  </#if>
  <#if customMap.moduleName??>
// customMap.moduleName: ${customMap.moduleName}
  </#if>
  <#if customMap.apiVersion??>
// customMap.apiVersion: ${customMap.apiVersion}
  </#if>
  <#if customMap.enableCache??>
// customMap.enableCache: ${customMap.enableCache?c}
  </#if>
  <#if customMap.enableLog??>
// customMap.enableLog: ${customMap.enableLog?c}
  </#if>
  <#if customMap.companyName??>
// customMap.companyName: ${customMap.companyName}
  </#if>
  <#if customMap.copyright??>
// customMap.copyright: ${customMap.copyright}
  </#if>
<#else>
// customMap 未定义
</#if>

// ============ 字段信息 ============
<#list table.fields as field>
// 字段 ${field_index + 1}:
//   - name: ${field.name}
//   - propertyName: ${field.propertyName}
//   - propertyType: ${field.propertyType}
//   - comment: ${field.comment!}
//   - keyFlag: ${field.keyFlag?c}
//   - keyIdentityFlag: ${field.keyIdentityFlag?c}

</#list>

// ============ 使用示例 ============

/**
 * 项目: <#if customMap?? && customMap.projectName??>${customMap.projectName}<#else>未设置</#if>
 * 模块: <#if customMap?? && customMap.moduleName??>${customMap.moduleName}<#else>未设置</#if>
 * 作者: ${author}
 * 日期: ${date}
 * 公司: <#if customMap?? && customMap.companyName??>${customMap.companyName}<#else>未设置</#if>
 * 版权: <#if customMap?? && customMap.copyright??>${customMap.copyright}<#else>未设置</#if>
 */

<#if customMap?? && customMap.enableLog?? && customMap.enableLog>
// 启用日志功能
import lombok.extern.slf4j.Slf4j;

@Slf4j
</#if>

<#if customMap?? && customMap.enableCache?? && customMap.enableCache>
// 启用缓存功能
import org.springframework.cache.annotation.Cacheable;
</#if>

public class ${entity}VariableTest {

    /**
     * 表名: ${table.name}
     * 表注释: ${table.comment!}
     * 实体类: ${entity}
     * API版本: <#if customMap?? && customMap.apiVersion??>${customMap.apiVersion}<#else>未设置</#if>
     */

}
