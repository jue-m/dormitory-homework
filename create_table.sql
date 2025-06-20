# 高校宿舍管理系统数据库初始化

-- 创建库
create database if not exists dormitory;

-- 切换库
use dormitory;

-- 用户表
create table if not exists user
(
    id           bigint auto_increment comment 'id' primary key,
    userAccount  varchar(256)                           not null comment '账号',
    userPassword varchar(512)                           not null comment '密码',
    unionId      varchar(256)                           null comment '统一id',
    userName     varchar(256)                           null comment '用户名',
    userAvatar   varchar(1024)                          null comment '用户头像',
    userProfile  varchar(512)                           null comment '用户简介',
    userRole     varchar(256)                           not null comment '用户角色',
    createTime   datetime     default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime   datetime     default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete     tinyint      default 0                 not null comment '是否删除',
    index idx_unionId (unionId)
) comment '用户表' collate = utf8mb4_unicode_ci;

-- 角色表
create table if not exists role
(
    id        bigint auto_increment comment 'id' primary key,
    roleName  varchar(256)                           not null comment '角色名',
    isDelete  tinyint      default 0                 not null comment '是否删除',
    index idx_roleName (roleName)
) comment '角色表' collate = utf8mb4_unicode_ci;

-- 权限表
create table if not exists permission
(
    id          bigint auto_increment comment 'id' primary key,
    permName    varchar(256)                           not null comment '权限名',
    permCode    varchar(256)                           not null comment '权限码',
    description varchar(256)                           null comment '描述',
    isDelete    tinyint      default 0                 not null comment '是否删除',
    index idx_permCode (permCode)
) comment '权限表' collate = utf8mb4_unicode_ci;

-- 学生表
create table if not exists student
(
    id          bigint auto_increment comment 'id' primary key,
    studentNo   varchar(256)                           not null comment '学号',
    grade       int                                    not null comment '年级',
    name        varchar(256)                           not null comment '姓名',
    gender      tinyint                                not null comment '性别',
    college     varchar(256)                           not null comment '学院',
    major       varchar(256)                           not null comment '专业',
    className   varchar(256)                           not null comment '班级',
    dormitoryNo varchar(256)                           not null comment '寝室号',
    isDelete    tinyint      default 0                 not null comment '是否删除',
    index idx_studentNo (studentNo)
) comment '学生表' collate = utf8mb4_unicode_ci;


-- 学生表：存储学生基本信息及宿舍分配情况
create table if not exists student
(
    id          bigint auto_increment comment '主键ID' primary key,
    studentNo   varchar(256)                           not null comment '学号(唯一)',
    name        varchar(256)                           not null comment '姓名',
    gender      tinyint                                not null comment '性别(0-女,1-男)',
    college     varchar(256)                           not null comment '所属学院',
    major       varchar(256)                           not null comment '专业',
    className   varchar(256)                           not null comment '班级',
    apartmentId bigint                                 null comment '宿舍ID(外键)',
    userId      bigint                                 not null comment '关联用户ID(外键)',
    isDelete    tinyint      default 0                 not null comment '是否删除(0-未删除,1-已删除)',
    createTime  datetime    default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime  datetime    default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    index idx_studentNo (studentNo),
    constraint uk_studentNo unique (studentNo),
    foreign key (apartmentId) references apartment(id) on delete set null,
    foreign key (userId) references user(id) on delete cascade
) comment '学生信息表' collate = utf8mb4_unicode_ci;

-- 教师表：存储教师基本信息
create table if not exists teacher
(
    id          bigint auto_increment comment '主键ID' primary key,
    teacherNo   varchar(256)                           not null comment '工号(唯一)',
    name        varchar(256)                           not null comment '姓名',
    gender      tinyint                                not null comment '性别(0-女,1-男)',
    college     varchar(256)                           not null comment '所属学院',
    title       varchar(256)                           not null comment '职称',
    phone       varchar(256)                           not null comment '联系电话',
    userId      bigint                                 not null comment '关联用户ID(外键)',
    isDelete    tinyint      default 0                 not null comment '是否删除(0-未删除,1-已删除)',
    createTime  datetime    default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime  datetime    default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    index idx_teacherNo (teacherNo),
    constraint uk_teacherNo unique (teacherNo),
    foreign key (userId) references user(id) on delete cascade
) comment '教师信息表' collate = utf8mb4_unicode_ci;

-- 管理员表
create table if not exists administrator
(
    id          bigint auto_increment comment 'id' primary key,
    name        varchar(256)                           not null comment '管理员名字',
    phone       varchar(256)                           not null comment '管理员电话',
    index idx_name (name)
) comment '管理员表' collate = utf8mb4_unicode_ci;

-- 宿管表：存储宿舍管理员信息
create table if not exists houseparents
(
    id          bigint auto_increment comment '主键ID' primary key,
    name        varchar(256)                           not null comment '宿管姓名',
    phone       varchar(256)                           not null comment '联系电话(唯一)',
    parkName    varchar(256)                           not null comment '负责园区',
    userId      bigint                                 not null comment '关联用户ID(外键)',
    isDelete    tinyint      default 0                 not null comment '是否删除(0-未删除,1-已删除)',
    createTime  datetime    default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime  datetime    default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    index idx_parkName (parkName),
    constraint uk_phone unique (phone),
    foreign key (userId) references user(id) on delete cascade
) comment '宿舍管理员信息表' collate = utf8mb4_unicode_ci;

-- 维修人员表
create table if not exists repairer
(
    id          bigint auto_increment comment 'id' primary key,
    name        varchar(256)                           not null comment '名字',
    phone       varchar(256)                           not null comment '电话',
    parkName    varchar(256)                           not null comment '管理园区',
    userId      bigint                                 not null comment '关联用户ID',
    isDelete    tinyint      default 0                 not null comment '是否删除',
    createTime  datetime    default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime  datetime    default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    index idx_parkName (parkName),
    foreign key (userId) references user(id)
) comment '维修人员表' collate = utf8mb4_unicode_ci;

-- 公寓表
create table if not exists apartment
(
    id          bigint auto_increment comment 'id' primary key,
    parkName    varchar(256)                           not null comment '园区',
    buildingNo  int                                    not null comment '楼栋',
    roomNo      varchar(256)                           not null comment '房间',
    bedNo       int                                    not null comment '床位号',
    roomType    varchar(256)                           not null comment '房间类型',
    capacity    int                                    not null comment '居住人数',
    isFull      tinyint      default 0                 not null comment '是否住满',
    isDelete    tinyint      default 0                 not null comment '是否删除',
    index idx_parkName (parkName)
) comment '公寓表' collate = utf8mb4_unicode_ci;