/* 用户中心模块表结构 */
CREATE TABLE ucenter_member (
    id VARCHAR(32) PRIMARY KEY COMMENT '会员ID',
    openid VARCHAR(128) COMMENT '微信openid',
    mobile VARCHAR(11) COMMENT '手机号',
    nickname VARCHAR(50) COMMENT '昵称',
    avatar VARCHAR(255) COMMENT '用户头像',
    gender TINYINT(1) COMMENT '性别 1 男，2 女',
    age TINYINT COMMENT '年龄',
    email VARCHAR(50) COMMENT '邮箱',
    sign VARCHAR(100) COMMENT '用户签名',
    is_disabled TINYINT(1) DEFAULT 0 COMMENT '是否禁用',
    is_subscribe TINYINT(1) DEFAULT 0 COMMENT '是否订阅',
    reg_ip VARCHAR(45) COMMENT '注册IP',
    last_login_ip VARCHAR(45) COMMENT '最后登录IP',
    is_deleted TINYINT(1) DEFAULT 0 COMMENT '逻辑删除标记',
    gmt_create DATETIME COMMENT '创建时间',
    gmt_modified DATETIME COMMENT '更新时间',
    INDEX idx_openid (openid),
    FOREIGN KEY (id) REFERENCES acl_user(id)
) COMMENT '会员表';

CREATE TABLE ucenter_member_statistics (
    id VARCHAR(32) PRIMARY KEY COMMENT 'ID',
    member_id VARCHAR(32) NOT NULL COMMENT '会员ID',
    login_count INT DEFAULT 0 COMMENT '登录次数',
    course_count INT DEFAULT 0 COMMENT '购买课程数',
    learn_duration INT DEFAULT 0 COMMENT '学习总时长(分钟)',
    is_deleted TINYINT(1) DEFAULT 0 COMMENT '逻辑删除标记',
    gmt_create DATETIME COMMENT '创建时间',
    gmt_modified DATETIME COMMENT '更新时间',
    INDEX idx_member_id (member_id),
    FOREIGN KEY (member_id) REFERENCES ucenter_member(id)
) COMMENT '会员统计表';

/* 用户中心模块表结构 */
- ucenter_member（会员表）
- ucenter_member_statistics（会员统计表）
- ucenter_member_subscribe（课程订阅表）