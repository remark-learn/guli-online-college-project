/* CMS模块表结构 */
CREATE TABLE crm_banner (
    id VARCHAR(32) PRIMARY KEY COMMENT 'ID',
    title VARCHAR(255) COMMENT '标题',
    image_url VARCHAR(500) COMMENT '图片地址',
    link_url VARCHAR(500) COMMENT '链接地址',
    sort INT COMMENT '排序',
    is_deleted TINYINT(1) DEFAULT 0 COMMENT '逻辑删除标记',
    gmt_create DATETIME COMMENT '创建时间',
    gmt_modified DATETIME COMMENT '更新时间'
) COMMENT '首页banner表';