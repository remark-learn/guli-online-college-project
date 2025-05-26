/* 统计模块表结构 */
CREATE TABLE statistics_daily (
    id VARCHAR(32) PRIMARY KEY COMMENT '主键',
    date_calculated DATE COMMENT '统计日期',
    register_num INT COMMENT '注册人数',
    login_num INT COMMENT '登录人数',
    video_view_num INT COMMENT '播放视频数',
    course_num INT COMMENT '新增课程数',
    gmt_create DATETIME COMMENT '创建时间',
    gmt_modified DATETIME COMMENT '更新时间'
) COMMENT '网站统计日数据';