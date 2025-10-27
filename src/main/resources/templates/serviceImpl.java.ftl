package ${package.ServiceImpl};

import ${package.Parent}.dao.${entity}Dao;
import ${package.Service}.${table.serviceName};
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * <p>
 * ${table.comment!} 服务实现类
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
@Service
<#if kotlin>
open class ${table.serviceImplName} : ${table.serviceName} {

}
<#else>
public class ${table.serviceImplName} implements ${table.serviceName} {

    @Autowired
    private ${entity}Dao ${entity?uncap_first}Dao;

}
</#if>