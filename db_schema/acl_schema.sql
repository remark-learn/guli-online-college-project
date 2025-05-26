/* 权限管理模块表结构 */
CREATE TABLE acl_permission (
    id VARCHAR(32) PRIMARY KEY COMMENT 'ID',
    pid VARCHAR(32) COMMENT '父级ID',
    name VARCHAR(255) NOT NULL COMMENT '名称',
    type TINYINT(1) NOT NULL COMMENT '类型(1:菜单,2:按钮)',
    permission_value VARCHAR(100) COMMENT '权限值',
    path VARCHAR(200) COMMENT '访问路径',
    component VARCHAR(100) COMMENT '组件路径',
    icon VARCHAR(50) COMMENT '图标',
    status TINYINT(1) DEFAULT 0 COMMENT '状态(0:禁止,1:正常)',
    is_deleted TINYINT(1) DEFAULT 0 COMMENT '逻辑删除标记',
    gmt_create DATETIME COMMENT '创建时间',
    gmt_modified DATETIME COMMENT '更新时间'
) COMMENT '权限表';

CREATE TABLE acl_role (
    id VARCHAR(32) PRIMARY KEY COMMENT 'ID',
    role_name VARCHAR(20) NOT NULL COMMENT '角色名称',
    role_code VARCHAR(20) COMMENT '角色编码',
    remark VARCHAR(255) COMMENT '备注',
    is_deleted TINYINT(1) DEFAULT 0 COMMENT '逻辑删除标记',
    gmt_create DATETIME COMMENT '创建时间',
    gmt_modified DATETIME COMMENT '更新时间'
) COMMENT '角色表';

CREATE TABLE acl_user (
    id VARCHAR(32) PRIMARY KEY COMMENT 'ID',
    username VARCHAR(20) NOT NULL COMMENT '用户名',
    password VARCHAR(100) NOT NULL COMMENT '密码',
    nick_name VARCHAR(50) COMMENT '昵称',
    salt VARCHAR(32) COMMENT '加密盐值',
    avatar VARCHAR(500) COMMENT '用户头像',
    phone VARCHAR(11) COMMENT '手机号',
    email VARCHAR(50) COMMENT '邮箱',
    is_disabled TINYINT(1) DEFAULT 0 COMMENT '是否禁用',
    is_deleted TINYINT(1) DEFAULT 0 COMMENT '逻辑删除标记',
    gmt_create DATETIME COMMENT '创建时间',
    gmt_modified DATETIME COMMENT '更新时间'
) COMMENT '用户表';

CREATE TABLE acl_role_permission (
    id VARCHAR(32) PRIMARY KEY COMMENT 'ID',
    role_id VARCHAR(32) NOT NULL COMMENT '角色ID',
    permission_id VARCHAR(32) NOT NULL COMMENT '权限ID',
    is_deleted TINYINT(1) DEFAULT 0 COMMENT '逻辑删除标记',
    gmt_create DATETIME COMMENT '创建时间',
    gmt_modified DATETIME COMMENT '更新时间',
    UNIQUE INDEX idx_role_permission (role_id, permission_id)
) COMMENT '角色权限关系表';

CREATE TABLE acl_user_role (
    id VARCHAR(32) PRIMARY KEY COMMENT 'ID',
    user_id VARCHAR(32) NOT NULL COMMENT '用户ID',
    role_id VARCHAR(32) NOT NULL COMMENT '角色ID',
    is_deleted TINYINT(1) DEFAULT 0 COMMENT '逻辑删除标记',
    gmt_create DATETIME COMMENT '创建时间',
    gmt_modified DATETIME COMMENT '更新时间',
    UNIQUE INDEX idx_user_role (user_id, role_id)
) COMMENT '用户角色关系表';