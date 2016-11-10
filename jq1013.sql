/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/10/13 10:27:53                          */
/*==============================================================*/


drop table if exists CommentLog;

drop table if exists Users;

drop table if exists ViewPoint;

drop table if exists ViewSpace;

/*============================================================8888888888888888888==*/
/* Table: CommentLog                                            */
/*==============================================================*/
create table CommentLog
(
   logId                int not null auto_increment,
   spaceId              int not null,
   ip                   varchar(50),
   commentType          int,
   primary key (logId)
);

/*==============================================================*/
/* Table: Users                                                 */
/*==============================================================*/
create table Users
(
   userId               int not null auto_increment,
   userName             varchar(50),
   password             varchar(50),
   lastLoginTime        date,
   lastLoginIp          varchar(50),
   primary key (userId)
);

/*==============================================================*/
/* Table: ViewPoint                                             */
/*==============================================================*/
create table ViewPoint
(
   pointId              int not null auto_increment,
   spaceId              int,
   pointName            varchar(100),
   ticketPrice          float(8,2),
   imgFile              varchar(100),
   pointDescription     text,
   primary key (pointId)
);

/*==============================================================*/
/* Table: ViewSpace                                             */
/*==============================================================*/
create table ViewSpace
(
   spaceId              int not null auto_increment,
   userId               int,
   spaceName            varchar(50),
   spacedDescription    text,
   website              varchar(100),
   address              varchar(100),
   wantNum              int,
   beenNum              int,
   notWantNum           int,
   primary key (spaceId)
);

alter table CommentLog add constraint FK_Relationship_3 foreign key (spaceId)
      references ViewSpace (spaceId) on delete restrict on update restrict;

alter table ViewPoint add constraint FK_Relationship_2 foreign key (spaceId)
      references ViewSpace (spaceId) on delete restrict on update restrict;

alter table ViewSpace add constraint FK_Relationship_1 foreign key (userId)
      references Users (userId) on delete restrict on update restrict;

