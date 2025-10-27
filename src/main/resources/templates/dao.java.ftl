package ${package.Entity}.dao;

import ${package.Entity}.${entity};
import ${package.Mapper}.${table.mapperName};
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Repository;

/**
* <p>
    * ${table.comment!} Dao类
    * </p>
*
* @author ${author}
* @since ${date}
*/
@Repository
public class ${entity}Dao extends ServiceImpl<${table.mapperName}, ${entity}> {

}