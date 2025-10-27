package ${package.Entity}.dao;

import ${package.Entity}.${entity};
import ${package.Mapper}.${table.mapperName};
import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;

/**
* <p>
    * ${table.comment!} Dao类
    * </p>
*
* @author ${author}
* @since ${date}
*/
@Repository
public class ${entity}Dao {

    @Autowired
    private ${table.mapperName} ${table.mapperName?uncap_first};

}