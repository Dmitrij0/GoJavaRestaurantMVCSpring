/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     05.11.2016 15:34:22                          */
/*==============================================================*/


drop table if exists COOK;

drop table if exists DISH;

drop table if exists DISHES_OF_MENU;

drop table if exists DISH_OF_ORDERS;

drop table if exists EMPLOYEE;

drop table if exists INGREDIENT;

drop table if exists INGREDIENTS_OF_DISH;

drop table if exists MENU;

drop table if exists ORDERS;

drop table if exists POSITIONS;

drop table if exists POSITION_OF_EMPLOYEE;

drop table if exists PREPARED_DISHES;

drop table if exists ROLE;

drop table if exists ROLE_OF_EMPLOYEE;

drop table if exists STOCK;

/*==============================================================*/
/* Table: COOK                                                  */
/*==============================================================*/
create table COOK
(
   EMP_ID               int not null,
   PRD_ID               int not null,
   primary key (EMP_ID, PRD_ID)
);

/*==============================================================*/
/* Index: I_COOK_PRD_ID                                         */
/*==============================================================*/
create index I_COOK_PRD_ID on COOK
(
   PRD_ID
);

/*==============================================================*/
/* Table: DISH                                                  */
/*==============================================================*/
create table DISH
(
   DSH_ID               int not null auto_increment,
   DSH_NAME             varchar(255) not null,
   DSH_CATEGORY         varchar(255) not null,
   DSH_WEIGHT           int not null,
   primary key (DSH_ID)
);

/*==============================================================*/
/* Index: UI_DSH_NAME_CATEGORY                                  */
/*==============================================================*/
create unique index UI_DSH_NAME_CATEGORY on DISH
(
   DSH_NAME,
   DSH_CATEGORY
);

/*==============================================================*/
/* Table: DISHES_OF_MENU                                        */
/*==============================================================*/
create table DISHES_OF_MENU
(
   MNU_ID               int not null,
   DSH_ID               int not null,
   DOM_COST             int not null,
   primary key (MNU_ID, DSH_ID)
);

/*==============================================================*/
/* Index: I_DOM_DSH_ID                                          */
/*==============================================================*/
create index I_DOM_DSH_ID on DISHES_OF_MENU
(
   DSH_ID
);

/*==============================================================*/
/* Table: DISH_OF_ORDERS                                        */
/*==============================================================*/
create table DISH_OF_ORDERS
(
   DOD_ID               int not null auto_increment,
   ORD_ID               int not null,
   DSH_ID               int not null,
   primary key (DOD_ID)
);

/*==============================================================*/
/* Index: I_DOD_ORD_ID                                          */
/*==============================================================*/
create index I_DOD_ORD_ID on DISH_OF_ORDERS
(
   ORD_ID
);

/*==============================================================*/
/* Index: I_DOD_DSH_ID                                          */
/*==============================================================*/
create index I_DOD_DSH_ID on DISH_OF_ORDERS
(
   DSH_ID
);

/*==============================================================*/
/* Table: EMPLOYEE                                              */
/*==============================================================*/
create table EMPLOYEE
(
   EMP_ID               int not null auto_increment,
   EMP_LAST_NAME        varchar(50) not null,
   EMP_FIRST_NAME       varchar(50) not null,
   EMP_NICKNAME         varchar(10) not null,
   EMP_PASSWORD         varchar(10) not null,
   EMP_BIRTHDAY         datetime not null,
   EMP_PHONE            varchar(20) not null,
   primary key (EMP_ID)
);

/*==============================================================*/
/* Index: UI_EMP_NICKNAME                                       */
/*==============================================================*/
create unique index UI_EMP_NICKNAME on EMPLOYEE
(
   EMP_NICKNAME
);

/*==============================================================*/
/* Table: INGREDIENT                                            */
/*==============================================================*/
create table INGREDIENT
(
   ING_ID               int not null auto_increment,
   ING_NAME             varchar(255) not null,
   primary key (ING_ID)
);

/*==============================================================*/
/* Index: UI_ING_NAME                                           */
/*==============================================================*/
create unique index UI_ING_NAME on INGREDIENT
(
   ING_NAME
);

/*==============================================================*/
/* Table: INGREDIENTS_OF_DISH                                   */
/*==============================================================*/
create table INGREDIENTS_OF_DISH
(
   DSH_ID               int not null,
   ING_ID               int not null,
   IOD_WEIGHT           int not null,
   primary key (DSH_ID, ING_ID)
);

/*==============================================================*/
/* Index: I_IOD_ING_ID                                          */
/*==============================================================*/
create index I_IOD_ING_ID on INGREDIENTS_OF_DISH
(
   ING_ID
);

/*==============================================================*/
/* Table: MENU                                                  */
/*==============================================================*/
create table MENU
(
   MNU_ID               int not null auto_increment,
   MNU_NAME             varchar(255) not null,
   primary key (MNU_ID)
);

/*==============================================================*/
/* Index: UI_MNU_NAME                                           */
/*==============================================================*/
create unique index UI_MNU_NAME on MENU
(
   MNU_NAME
);

/*==============================================================*/
/* Table: ORDERS                                                */
/*==============================================================*/
create table ORDERS
(
   ORD_ID               int not null auto_increment,
   ORD_NUMBER           varchar(25) not null,
   ORD_TABLE            int not null,
   EMP_ID               int not null,
   ORD_DATE             datetime not null,
   primary key (ORD_ID)
);

/*==============================================================*/
/* Index: UI_ORD_NUMBER_WAITER                                  */
/*==============================================================*/
create unique index UI_ORD_NUMBER_WAITER on ORDERS
(
   ORD_NUMBER,
   EMP_ID
);

/*==============================================================*/
/* Table: POSITIONS                                             */
/*==============================================================*/
create table POSITIONS
(
   PST_ID               int not null auto_increment,
   PST_NAME             varchar(255) not null,
   primary key (PST_ID)
);

/*==============================================================*/
/* Index: UI_PST_NAME                                           */
/*==============================================================*/
create unique index UI_PST_NAME on POSITIONS
(
   PST_NAME
);

/*==============================================================*/
/* Table: POSITION_OF_EMPLOYEE                                  */
/*==============================================================*/
create table POSITION_OF_EMPLOYEE
(
   EMP_ID               int not null,
   PST_ID               int not null,
   POE_SALARY           int not null,
   primary key (EMP_ID, PST_ID)
);

/*==============================================================*/
/* Index: I_POE_PST_ID                                          */
/*==============================================================*/
create index I_POE_PST_ID on POSITION_OF_EMPLOYEE
(
   PST_ID
);

/*==============================================================*/
/* Table: PREPARED_DISHES                                       */
/*==============================================================*/
create table PREPARED_DISHES
(
   PRD_ID               int not null auto_increment,
   PRD_NUMBER           varchar(25) not null,
   DOD_ID               int not null,
   PRD_DATE             datetime not null,
   primary key (PRD_ID)
);

/*==============================================================*/
/* Index: UI_PRD_NUMBER                                         */
/*==============================================================*/
create unique index UI_PRD_NUMBER on PREPARED_DISHES
(
   PRD_NUMBER
);

/*==============================================================*/
/* Index: I_PRD_DOD_ID                                          */
/*==============================================================*/
create index I_PRD_DOD_ID on PREPARED_DISHES
(
   DOD_ID
);

/*==============================================================*/
/* Table: ROLE                                                  */
/*==============================================================*/
create table ROLE
(
   RLE_ID               int not null,
   RLE_NAME             varchar(32) not null,
   primary key (RLE_ID)
);

/*==============================================================*/
/* Index: UI_RLE_NAME                                           */
/*==============================================================*/
create unique index UI_RLE_NAME on ROLE
(
   RLE_NAME
);

/*==============================================================*/
/* Table: ROLE_OF_EMPLOYEE                                      */
/*==============================================================*/
create table ROLE_OF_EMPLOYEE
(
   EMP_ID               int not null,
   RLE_ID               int not null,
   primary key (EMP_ID, RLE_ID)
);

/*==============================================================*/
/* Index: I_RLE_ID                                              */
/*==============================================================*/
create index I_RLE_ID on ROLE_OF_EMPLOYEE
(
   RLE_ID
);

/*==============================================================*/
/* Table: STOCK                                                 */
/*==============================================================*/
create table STOCK
(
   ING_ID               int not null,
   STK_QUANTITY         int not null,
   primary key (ING_ID)
);

alter table COOK add constraint FK_Reference_12 foreign key (EMP_ID)
      references EMPLOYEE (EMP_ID) on delete restrict on update restrict;

alter table COOK add constraint FK_Reference_13 foreign key (PRD_ID)
      references PREPARED_DISHES (PRD_ID) on delete restrict on update restrict;

alter table DISHES_OF_MENU add constraint FK_Reference_4 foreign key (MNU_ID)
      references MENU (MNU_ID) on delete restrict on update restrict;

alter table DISHES_OF_MENU add constraint FK_Reference_5 foreign key (DSH_ID)
      references DISH (DSH_ID) on delete restrict on update restrict;

alter table DISH_OF_ORDERS add constraint FK_Reference_6 foreign key (ORD_ID)
      references ORDERS (ORD_ID) on delete restrict on update restrict;

alter table DISH_OF_ORDERS add constraint FK_Reference_7 foreign key (DSH_ID)
      references DISH (DSH_ID) on delete restrict on update restrict;

alter table INGREDIENTS_OF_DISH add constraint FK_Reference_2 foreign key (DSH_ID)
      references DISH (DSH_ID) on delete restrict on update restrict;

alter table INGREDIENTS_OF_DISH add constraint FK_Reference_3 foreign key (ING_ID)
      references INGREDIENT (ING_ID) on delete restrict on update restrict;

alter table ORDERS add constraint FK_Reference_9 foreign key (EMP_ID)
      references EMPLOYEE (EMP_ID) on delete restrict on update restrict;

alter table POSITION_OF_EMPLOYEE add constraint FK_Reference_14 foreign key (EMP_ID)
      references EMPLOYEE (EMP_ID) on delete restrict on update restrict;

alter table POSITION_OF_EMPLOYEE add constraint FK_Reference_15 foreign key (PST_ID)
      references POSITIONS (PST_ID) on delete restrict on update restrict;

alter table PREPARED_DISHES add constraint FK_Reference_16 foreign key (DOD_ID)
      references DISH_OF_ORDERS (DOD_ID) on delete restrict on update restrict;

alter table ROLE_OF_EMPLOYEE add constraint FK_Reference_17 foreign key (EMP_ID)
      references EMPLOYEE (EMP_ID) on delete restrict on update restrict;

alter table ROLE_OF_EMPLOYEE add constraint FK_Reference_18 foreign key (RLE_ID)
      references ROLE (RLE_ID) on delete restrict on update restrict;

alter table STOCK add constraint FK_Reference_1 foreign key (ING_ID)
      references INGREDIENT (ING_ID) on delete restrict on update restrict;

