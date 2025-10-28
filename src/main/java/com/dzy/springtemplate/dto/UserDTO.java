package com.dzy.springtemplate.dto;

import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;

/**
 * <p>
 * 用户表 DTO
 * </p>
 *
 * @author zhuzhiwei
 * @since 2025-10-28
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Schema(name = "UserDTO", description = "用户表 DTO")
public class UserDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户ID，主键
     */
    @Schema(description = "用户ID，主键", example = "1")
    private Long id;

    /**
     * 用户名，唯一
     */
    @Schema(description = "用户名，唯一")
    @NotBlank(message = "用户名不能为空")
    @Size(min = 3, max = 64, message = "用户名长度必须在3-64个字符之间")
    private String username;

    /**
     * 邮箱，唯一
     */
    @Schema(description = "邮箱，唯一")
    @NotBlank(message = "邮箱不能为空")
    @Email(message = "邮箱格式不正确")
    private String email;

    /**
     * 手机号
     */
    @Schema(description = "手机号")
    @Pattern(regexp = "^1[3-9]\\d{9}$", message = "手机号格式不正确")
    private String phone;

    /**
     * 加密后的密码
     */
    @Schema(description = "加密后的密码")
    private String passwordHash;

    /**
     * 真实姓名
     */
    @Schema(description = "真实姓名")
    @NotBlank(message = "姓名不能为空")
    @Size(max = 50, message = "姓名长度不能超过50个字符")
    private String realName;

    /**
     * 昵称
     */
    @Schema(description = "昵称")
    private String nickname;

    /**
     * 头像URL
     */
    @Schema(description = "头像URL")
    private String avatar;

    /**
     * 状态：0-禁用，1-启用，2-锁定
     */
    @Schema(description = "状态：0-禁用，1-启用，2-锁定")
    private Byte status;

    /**
     * 删除标志：0-未删除，1-已删除
     */
    @Schema(description = "删除标志：0-未删除，1-已删除")
    private Byte isDeleted;

    /**
     * 角色：SUPER_ADMIN-超级管理员, ADMIN-管理员, USER-普通用户
     */
    @Schema(description = "角色：SUPER_ADMIN-超级管理员, ADMIN-管理员, USER-普通用户")
    private String role;

    /**
     * 额外权限配置，JSON格式
     */
    @Schema(description = "额外权限配置，JSON格式")
    private String permissions;

    /**
     * 最后登录时间
     */
    @Schema(description = "最后登录时间")
    private LocalDateTime lastLoginTime;

    /**
     * 最后登录IP
     */
    @Schema(description = "最后登录IP")
    private String lastLoginIp;

    /**
     * 密码最后修改时间
     */
    @Schema(description = "密码最后修改时间")
    private LocalDateTime passwordUpdateTime;

    /**
     * 账号过期时间
     */
    @Schema(description = "账号过期时间")
    private LocalDateTime accountExpireTime;

    /**
     * 创建人ID
     */
    @Schema(description = "创建人ID")
    private Long createdBy;

    /**
     * 更新人ID
     */
    @Schema(description = "更新人ID")
    private Long updatedBy;

    /**
     * 创建时间
     */
    @Schema(description = "创建时间")
    private LocalDateTime createdTime;

    /**
     * 更新时间
     */
    @Schema(description = "更新时间")
    private LocalDateTime updatedTime;

}