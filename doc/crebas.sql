/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2019/2/25 16:59:25                           */
/*==============================================================*/


drop table if exists h_seekhelp;

drop table if exists h_seekhelp_type;

drop table if exists p_complaint;

drop table if exists p_evaluate;

drop table if exists p_message;

drop table if exists p_order;

drop table if exists p_order_type;

drop table if exists p_range;

drop table if exists u_address;

drop table if exists u_worker;

drop table if exists usr_attribute;

/*==============================================================*/
/* Table: h_seekhelp                                            */
/*==============================================================*/
create table h_seekhelp
(
   id                   int(11) not null,
   uuid                 varchar(32),
   title                varchar(100),
   content              varchar(1000),
   createtime           date,
   seekId               int(11),
   seektype             int(11),
   statu                int(11),
   paytype              int(11),
   moneyreward          double,
   starTime             date,
   endTime              date,
   province             varchar(50),
   city                 varchar(50),
   area                 varchar(50),
   address              varchar(200),
   primary key (id)
);

/*==============================================================*/
/* Table: h_seekhelp_type                                       */
/*==============================================================*/
create table h_seekhelp_type
(
   id                   int(11) not null,
   name                 varchar(32),
   primary key (id)
);

/*==============================================================*/
/* Table: p_complaint                                           */
/*==============================================================*/
create table p_complaint
(
   id                   int(11) not null,
   complainant          int(11),
   source_type          int(11),
   source_num           varchar(32),
   content              varchar(255),
   state                int(11),
   remarks              varchar(255),
   respondent           int(11),
   date                 date,
   primary key (id)
);

/*==============================================================*/
/* Table: p_evaluate                                            */
/*==============================================================*/
create table p_evaluate
(
   id                   int(11),
   source_num           varchar(32),
   user_id              int(11),
   content              varchar(255),
   sourceid             int(11)
);

/*==============================================================*/
/* Table: p_message                                             */
/*==============================================================*/
create table p_message
(
   id                   int(11),
   user_id              int(11),
   receive_id           int(11),
   content              varchar(255)
);

/*==============================================================*/
/* Table: p_order                                               */
/*==============================================================*/
create table p_order
(
   id                   int(11) not null,
   number               varchar(32),
   stau                 int(11),
   orderType            int(11),
   undertakes           int(11),
   source_nuk           varchar(32),
   creatid              int(11),
   source_type          int(11),
   primary key (id)
);

/*==============================================================*/
/* Table: p_order_type                                          */
/*==============================================================*/
create table p_order_type
(
   id                   int(11) not null,
   name                 varchar(32),
   primary key (id)
);

/*==============================================================*/
/* Table: p_range                                               */
/*==============================================================*/
create table p_range
(
   id                   int(11),
   name                 varchar(50)
);

/*==============================================================*/
/* Table: u_address                                             */
/*==============================================================*/
create table u_address
(
   id                   int(11),
   province             varchar(50),
   city                 varhcar(50),
   area                 varchar(50),
   address              varchar(200),
   isdefault            int(11),
   tel                  varchar(22)
);

/*==============================================================*/
/* Table: u_worker                                              */
/*==============================================================*/
create table u_worker
(
   id                   int(11),
   user_id              int(11),
   scopeservice         int(11),
   province             varchar(50),
   city                 varchar(50),
   area                 varchar(50),
   address              varchar(100)
);

/*==============================================================*/
/* Table: usr_attribute                                         */
/*==============================================================*/
create table usr_attribute
(
   id                   int(11),
   headurl              varchar(100),
   Nickname             varchar(100),
   name                 varchcar(32),
   tel                  varchar(22),
   isMerchant           int(11),
   work                 int(11)
);

