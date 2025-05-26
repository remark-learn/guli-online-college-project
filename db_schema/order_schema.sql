/* 订单模块表结构 */
CREATE TABLE t_order (
    id VARCHAR(32) PRIMARY KEY COMMENT '主键',
    order_no VARCHAR(255) COMMENT '订单号',
    course_id VARCHAR(32) COMMENT '课程ID',
    course_title VARCHAR(255) COMMENT '课程名称',
    course_cover VARCHAR(500) COMMENT '课程封面',
    teacher_name VARCHAR(50) COMMENT '讲师名称',
    member_id VARCHAR(32) COMMENT '会员ID',
    nickname VARCHAR(50) COMMENT '会员昵称',
    email VARCHAR(50) COMMENT '会员邮箱',
    total_fee DECIMAL(10,2) COMMENT '订单金额',
    pay_type TINYINT COMMENT '支付类型',
    status TINYINT COMMENT '订单状态',
    is_deleted TINYINT(1) DEFAULT 0 COMMENT '逻辑删除',
    gmt_create DATETIME COMMENT '创建时间',
    gmt_modified DATETIME COMMENT '更新时间'
) COMMENT '订单表';

CREATE TABLE t_pay_log (
    id VARCHAR(32) PRIMARY KEY,
    order_no VARCHAR(255) COMMENT '订单号',
    pay_time DATETIME COMMENT '支付时间',
    total_fee DECIMAL(10,2) COMMENT '支付金额',
    transaction_id VARCHAR(255) COMMENT '交易流水号',
    trade_state VARCHAR(50) COMMENT '交易状态',
    pay_type TINYINT COMMENT '支付类型',
    attr TEXT COMMENT '其他属性',
    is_deleted TINYINT(1) DEFAULT 0 COMMENT '逻辑删除',
    gmt_create DATETIME COMMENT '创建时间',
    gmt_modified DATETIME COMMENT '更新时间'
) COMMENT '支付日志表';