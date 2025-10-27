package ${package.Service};

import ${package.Entity}.${entity};
<#if table.importPackages??>
<#list table.importPackages as pkg>
import ${pkg};
</#list>
</#if>

/**
 * <p>
 * ${table.comment!} 服务类
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
<#if kotlin>
interface ${table.serviceName}
<#else>
public interface ${table.serviceName} {

}
</#if>