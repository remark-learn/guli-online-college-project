/* 教学模块表结构 */
CREATE TABLE edu_subject (
    id VARCHAR(32) PRIMARY KEY COMMENT '课程分类ID',
    title VARCHAR(255) NOT NULL COMMENT '分类名称',
    parent_id VARCHAR(32) COMMENT '父级ID',
    sort INT COMMENT '排序字段',
    is_deleted TINYINT(1) DEFAULT 0 COMMENT '逻辑删除标记',
    gmt_create DATETIME COMMENT '创建时间',
    gmt_modified DATETIME COMMENT '更新时间',
    INDEX idx_parent_id (parent_id)
) COMMENT '课程科目表';

CREATE TABLE edu_teacher (
    id VARCHAR(32) PRIMARY KEY COMMENT '讲师ID',
    name VARCHAR(20) NOT NULL COMMENT '讲师姓名',
    intro VARCHAR(500) COMMENT '讲师简介',
    career VARCHAR(500) COMMENT '讲师资历',
    level INT COMMENT '头衔 1高级讲师 2首席讲师',
    avatar VARCHAR(500) COMMENT '讲师头像',
    sort INT COMMENT '排序',
    is_deleted TINYINT(1) DEFAULT 0 COMMENT '逻辑删除标记',
    gmt_create DATETIME COMMENT '创建时间',
    gmt_modified DATETIME COMMENT '更新时间'
) COMMENT '讲师表';

CREATE TABLE edu_course (
    id VARCHAR(32) PRIMARY KEY COMMENT '课程ID',
    teacher_id VARCHAR(32) NOT NULL COMMENT '讲师ID',
    subject_id VARCHAR(32) NOT NULL COMMENT '课程分类ID',
    title VARCHAR(255) NOT NULL COMMENT '课程标题',
    price DECIMAL(10,2) COMMENT '课程价格',
    lesson_num INT COMMENT '课时数',
    cover VARCHAR(500) COMMENT '课程封面图片路径',
    buy_count BIGINT DEFAULT 0 COMMENT '销售数量',
    view_count BIGINT DEFAULT 0 COMMENT '浏览数量',
    status VARCHAR(10) COMMENT '课程状态 Draft未发布  Normal已发布',
    is_deleted TINYINT(1) DEFAULT 0 COMMENT '逻辑删除标记',
    gmt_create DATETIME COMMENT '创建时间',
    gmt_modified DATETIME COMMENT '更新时间',
    INDEX idx_teacher_id (teacher_id),
    FOREIGN KEY (teacher_id) REFERENCES acl_user(id)
) COMMENT '课程表';

CREATE TABLE edu_chapter (
    id VARCHAR(32) PRIMARY KEY COMMENT '章节ID',
    course_id VARCHAR(32) NOT NULL COMMENT '课程ID',
    title VARCHAR(255) NOT NULL COMMENT '章节标题',
    sort INT COMMENT '显示排序',
    is_deleted TINYINT(1) DEFAULT 0 COMMENT '逻辑删除标记',
    gmt_create DATETIME COMMENT '创建时间',
    gmt_modified DATETIME COMMENT '更新时间',
    INDEX idx_course_id (course_id),
    FOREIGN KEY (course_id) REFERENCES edu_course(id)
) COMMENT '课程章节表';

CREATE TABLE edu_video (
    id VARCHAR(32) PRIMARY KEY COMMENT '视频ID',
    chapter_id VARCHAR(32) NOT NULL COMMENT '章节ID',
    title VARCHAR(255) NOT NULL COMMENT '视频名称',
    video_source_id VARCHAR(100) COMMENT '视频来源ID',
    video_original_name VARCHAR(255) COMMENT '原始文件名称',
    duration FLOAT COMMENT '视频时长（分钟）',
    play_count BIGINT DEFAULT 0 COMMENT '播放次数',
    is_free TINYINT(1) DEFAULT 0 COMMENT '是否可以试看：0收费 1免费',
    is_deleted TINYINT(1) DEFAULT 0 COMMENT '逻辑删除标记',
    gmt_create DATETIME COMMENT '创建时间',
    gmt_modified DATETIME COMMENT '更新时间',
    INDEX idx_chapter_id (chapter_id),
    FOREIGN KEY (chapter_id) REFERENCES edu_chapter(id)
) COMMENT '课程视频表';
- edu_course（课程表）
- edu_chapter（章节表）
- edu_video（视频表）
- edu_teacher（讲师表）
- edu_subject（课程分类表）