package com.dzy.springtemplate;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;

import java.util.Collections;

public class CodeGenerator {

    public static void main(String[] args) {
        // 文件覆盖配置 - 设置为 false 可以避免覆盖已存在的文件
        boolean enableFileOverride = true;

        // 数据库配置
        String url = "jdbc:mysql://10.95.16.85:3306/river_chart_luo_writ?characterEncoding=UTF8&autoReconnect=true&allowMultiQueries=true&rewriteBatchedStatements=true&serverTimezone=GMT%2B7&useSSL=false";
        String username = "dev_rw";
        String password = "z8E3SuIy.1MlCril8";

        // 项目配置
        String author = "zhuzhiwei";
        //父包名
        String parent = "com.dzy.springtemplate";

        //上述配置手动修改
        String projectPath = System.getProperty("user.dir");

        FastAutoGenerator.create(url, username, password)
                // 全局配置
                .globalConfig(builder -> {
                    builder.author(author) // 设置作者
                            .enableSwagger() // 开启 swagger 模式
                            .outputDir(projectPath + "/src/main/java") // 指定输出目录
                            .commentDate("yyyy-MM-dd"); // 注释日期
                })
                // 包配置
                .packageConfig(builder -> {
                    builder.parent(parent) // 设置父包名
                            .entity("entity") // 实体类包名
                            .service("service") // Service包名
                            .serviceImpl("service.impl") // Service实现类包名
                            .mapper("mapper") // Mapper包名
                            .controller("controller") // Controller包名
                            .pathInfo(Collections.singletonMap(OutputFile.xml,
                                    projectPath + "/src/main/resources/mapper")); // XML文件路径
                })
                // 策略配置
                .strategyConfig(builder -> {
                    builder.addInclude("user") // 设置需要生成的表名，可多个
                            .addTablePrefix("sys_", "t_") // 设置过滤表前缀

                            // Entity 策略配置
                            .entityBuilder()
                            .enableLombok() // 开启 Lombok
                            .enableTableFieldAnnotation() // 开启字段注解
                            .logicDeleteColumnName("is_deleted") // 逻辑删除字段名
                            .versionColumnName("version") // 乐观锁字段名
                            .enableFileOverride() // 根据配置决定是否覆盖文件

                            // Controller 策略配置
                            .controllerBuilder()
                            .enableHyphenStyle() // 开启驼峰转连字符
                            .enableRestStyle() // 开启生成 @RestController 控制器
                            .enableFileOverride() // 根据配置决定是否覆盖文件

                            // Service 策略配置 - 不继承任何类
                            .serviceBuilder()
                            .formatServiceFileName("%sService") // 服务类名称格式
                            .formatServiceImplFileName("%sServiceImpl")
                            .enableFileOverride() // 根据配置决定是否覆盖文件


                            // Mapper 策略配置
                            .mapperBuilder()
                            .enableMapperAnnotation() // 开启 @Mapper
                            .enableFileOverride(); // 根据配置决定是否覆盖文件
                })
                // 注入配置 - 自定义生成Dao层
                .injectionConfig(builder -> {
                    builder.beforeOutputFile((tableInfo, objectMap) -> {
                                System.out.println("tableInfo: " + tableInfo.getEntityName() + " objectMap: " + objectMap.size());
                            })
                            .customFile(builder2 -> {
                                // 生成Dao类
                                builder2.fileName("Dao.java")
                                        .templatePath("/templates/dao.java.ftl")
                                        .packageName("dao")
                                        .enableFileOverride();
                            });
                })
                // 模板引擎配置
                .templateEngine(new FreemarkerTemplateEngine())
                // 模板配置
                .templateConfig(builder -> {
                    builder.entity("/templates/entity.java.ftl")
                           .service("/templates/service.java.ftl")
                           .serviceImpl("/templates/serviceImpl.java.ftl")
                           .controller("/templates/controller.java.ftl");
                })
                .execute();
    }
}