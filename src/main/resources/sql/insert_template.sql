-- 插入10条用户测试数据
-- 密码统一使用: 123456 的 BCrypt 哈希值: $2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTV2UiC

INSERT INTO `user` (
    `username`, `email`, `phone`, `password_hash`, `real_name`, `nickname`, `avatar`,
    `status`, `role`, `permissions`, `last_login_time`, `last_login_ip`
) VALUES
-- 超级管理员
('super_admin', 'super_admin@example.com', '13800000001', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTV2UiC', '张超级', '超级管理员', 'https://example.com/avatars/admin.jpg', 1, 'SUPER_ADMIN', '["*:*:*"]', '2025-10-27 10:00:00', '192.168.1.100'),

-- 管理员
('admin_li', 'admin_li@example.com', '13800000002', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTV2UiC', '李管理员', '李管理', 'https://example.com/avatars/li.jpg', 1, 'ADMIN', '["user:read","user:write","system:read"]', '2025-10-27 09:30:00', '192.168.1.101'),

-- 普通用户
('zhangsan', 'zhangsan@example.com', '13800000003', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTV2UiC', '张三', '张三丰', 'https://example.com/avatars/zhangsan.jpg', 1, 'USER', '["user:read","order:read"]', '2025-10-27 08:15:00', '192.168.1.102'),
('lisi', 'lisi@example.com', '13800000004', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTV2UiC', '李四', '李四光', 'https://example.com/avatars/lisi.jpg', 1, 'USER', '["user:read","order:read"]', '2025-10-26 16:45:00', '192.168.1.103'),
('wangwu', 'wangwu@example.com', '13800000005', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTV2UiC', '王五', '王老五', 'https://example.com/avatars/wangwu.jpg', 1, 'USER', '["user:read","order:read"]', '2025-10-26 14:20:00', '192.168.1.104'),
('zhaoliu', 'zhaoliu@example.com', '13800000006', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTV2UiC', '赵六', '赵六郎', 'https://example.com/avatars/zhaoliu.jpg', 1, 'USER', '["user:read","order:read"]', '2025-10-25 11:30:00', '192.168.1.105'),
('sunqi', 'sunqi@example.com', '13800000007', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTV2UiC', '孙七', '孙小七', 'https://example.com/avatars/sunqi.jpg', 1, 'USER', '["user:read","order:read"]', '2025-10-25 10:00:00', '192.168.1.106'),

-- 禁用用户
('disabled_user', 'disabled@example.com', '13800000008', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTV2UiC', '禁用用户', '禁用账号', 'https://example.com/avatars/disabled.jpg', 0, 'USER', '[]', '2025-10-20 09:00:00', '192.168.1.107'),

-- 锁定用户
('locked_user', 'locked@example.com', '13800000009', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTV2UiC', '锁定用户', '锁定账号', 'https://example.com/avatars/locked.jpg', 2, 'USER', '[]', '2025-10-15 08:30:00', '192.168.1.108'),

-- VIP用户
('vip_user', 'vip@example.com', '13800000010', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTV2UiC', 'VIP用户', 'VIP会员', 'https://example.com/avatars/vip.jpg', 1, 'USER', '["user:read","order:read","vip:privilege"]', '2025-10-27 11:00:00', '192.168.1.109');