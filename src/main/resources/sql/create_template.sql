-- 创建数据库
CREATE DATABASE IF NOT EXISTS `river_chart_luo_writ`

USE `river_chart_luo_writ`;

-- 用户表
CREATE TABLE `user` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '用户ID，主键',
    `username` VARCHAR(64) NOT NULL UNIQUE COMMENT '用户名，唯一',
    `email` VARCHAR(128) UNIQUE COMMENT '邮箱，唯一',
    `phone` VARCHAR(20) DEFAULT NULL COMMENT '手机号',
    `password_hash` VARCHAR(255) NOT NULL COMMENT '加密后的密码',
    `real_name` VARCHAR(64) DEFAULT NULL COMMENT '真实姓名',
    `nickname` VARCHAR(64) DEFAULT NULL COMMENT '昵称',
    `avatar` VARCHAR(500) DEFAULT NULL COMMENT '头像URL',

    -- 状态相关字段
    `status` TINYINT NOT NULL DEFAULT 1 COMMENT '状态：0-禁用，1-启用，2-锁定',
    `is_deleted` TINYINT NOT NULL DEFAULT 0 COMMENT '删除标志：0-未删除，1-已删除',

    -- 权限相关
    `role` VARCHAR(32) NOT NULL DEFAULT 'USER' COMMENT '角色：SUPER_ADMIN-超级管理员, ADMIN-管理员, USER-普通用户',
    `permissions` JSON DEFAULT NULL COMMENT '额外权限配置，JSON格式',

    -- 时间戳
    `last_login_time` DATETIME DEFAULT NULL COMMENT '最后登录时间',
    `last_login_ip` VARCHAR(64) DEFAULT NULL COMMENT '最后登录IP',
    `password_update_time` DATETIME DEFAULT NULL COMMENT '密码最后修改时间',
    `account_expire_time` DATETIME DEFAULT NULL COMMENT '账号过期时间',

    -- 审计字段
    `created_by` BIGINT DEFAULT NULL COMMENT '创建人ID',
    `updated_by` BIGINT DEFAULT NULL COMMENT '更新人ID',
    `created_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_username` (`username`),
    KEY `idx_phone` (`phone`),
    KEY `idx_created_time` (`created_time`)
) ENGINE=InnoDB COMMENT='用户表';