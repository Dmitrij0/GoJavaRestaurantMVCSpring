/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     13.10.2016 14:57:23                          */
/*==============================================================*/



-- Type package declaration
create or replace package PDTypes  
as
    TYPE ref_cursor IS REF CURSOR;
end;
/

-- Integrity package declaration
create or replace package IntegrityPackage AS
 procedure InitNestLevel;
 function GetNestLevel return number;
 procedure NextNestLevel;
 procedure PreviousNestLevel;
 end IntegrityPackage;
/

-- Integrity package definition
create or replace package body IntegrityPackage AS
 NestLevel number;

-- Procedure to initialize the trigger nest level
 procedure InitNestLevel is
 begin
 NestLevel := 0;
 end;


-- Function to return the trigger nest level
 function GetNestLevel return number is
 begin
 if NestLevel is null then
     NestLevel := 0;
 end if;
 return(NestLevel);
 end;

-- Procedure to increase the trigger nest level
 procedure NextNestLevel is
 begin
 if NestLevel is null then
     NestLevel := 0;
 end if;
 NestLevel := NestLevel + 1;
 end;

-- Procedure to decrease the trigger nest level
 procedure PreviousNestLevel is
 begin
 NestLevel := NestLevel - 1;
 end;

 end IntegrityPackage;
/


drop trigger "CompoundDeleteTrigger_dish"
/

drop trigger "CompoundInsertTrigger_dish"
/

drop trigger "CompoundUpdateTrigger_dish"
/

drop trigger "tib_dish"
/

drop trigger "CompoundDeleteTrigger_dish_of_"
/

drop trigger "CompoundInsertTrigger_dish_of_"
/

drop trigger "CompoundUpdateTrigger_dish_of_"
/

drop trigger "tib_dish_of_orders"
/

drop trigger "CompoundDeleteTrigger_employee"
/

drop trigger "CompoundInsertTrigger_employee"
/

drop trigger "CompoundUpdateTrigger_employee"
/

drop trigger "tib_employee"
/

drop trigger "CompoundDeleteTrigger_ingredie"
/

drop trigger "CompoundInsertTrigger_ingredie"
/

drop trigger "CompoundUpdateTrigger_ingredie"
/

drop trigger "tib_ingredient"
/

drop trigger "CompoundDeleteTrigger_menu"
/

drop trigger "CompoundInsertTrigger_menu"
/

drop trigger "CompoundUpdateTrigger_menu"
/

drop trigger "tib_menu"
/

drop trigger "CompoundDeleteTrigger_orders"
/

drop trigger "CompoundInsertTrigger_orders"
/

drop trigger "CompoundUpdateTrigger_orders"
/

drop trigger "tib_orders"
/

drop trigger "CompoundDeleteTrigger_position"
/

drop trigger "CompoundInsertTrigger_position"
/

drop trigger "CompoundUpdateTrigger_position"
/

drop trigger "tib_positions"
/

drop trigger "CompoundDeleteTrigger_prepared"
/

drop trigger "CompoundInsertTrigger_prepared"
/

drop trigger "CompoundUpdateTrigger_prepared"
/

drop trigger "tib_prepared_dishes"
/

alter table COOK
   drop constraint FK_COOK_REFERENCE_EMPLOYEE
/

alter table COOK
   drop constraint FK_COOK_REFERENCE_PREPARED
/

alter table DISHES_OF_MENU
   drop constraint FK_DISHES_O_REFERENCE_MENU
/

alter table DISHES_OF_MENU
   drop constraint FK_DISHES_O_REFERENCE_DISH
/

alter table DISH_OF_ORDERS
   drop constraint FK_DISH_OF__REFERENCE_ORDERS
/

alter table DISH_OF_ORDERS
   drop constraint FK_DISH_OF__REFERENCE_DISH
/

alter table INGREDIENTS_OF_DISH
   drop constraint FK_INGREDIE_REFERENCE_DISH
/

alter table INGREDIENTS_OF_DISH
   drop constraint FK_INGREDIE_REFERENCE_INGREDIE
/

alter table ORDERS
   drop constraint FK_ORDERS_REFERENCE_EMPLOYEE
/

alter table POSITION_OF_EMPLOYEE
   drop constraint FK_POSITION_REFERENCE_EMPLOYEE
/

alter table POSITION_OF_EMPLOYEE
   drop constraint FK_POSITION_REFERENCE_POSITION
/

alter table PREPARED_DISHES
   drop constraint FK_PREPARED_REFERENCE_DISH_OF_
/

alter table STOCK
   drop constraint FK_STOCK_REFERENCE_INGREDIE
/

drop index I_COOK_PRD_ID
/

drop table COOK cascade constraints
/

drop index UI_DSH_NAME_CATEGORY
/

drop table DISH cascade constraints
/

drop index I_DOM_DSH_ID
/

drop table DISHES_OF_MENU cascade constraints
/

drop index I_DOD_DSH_ID
/

drop index I_DOD_ORD_ID
/

drop table DISH_OF_ORDERS cascade constraints
/

drop table EMPLOYEE cascade constraints
/

drop index UI_ING_NAME
/

drop table INGREDIENT cascade constraints
/

drop index I_IOD_ING_ID
/

drop table INGREDIENTS_OF_DISH cascade constraints
/

drop index UI_MNU_NAME
/

drop table MENU cascade constraints
/

drop index UI_ORD_NUMBER_WAITER
/

drop table ORDERS cascade constraints
/

drop index UI_PST_NAME
/

drop table POSITIONS cascade constraints
/

drop index I_POE_PST_ID
/

drop table POSITION_OF_EMPLOYEE cascade constraints
/

drop index I_PRD_DOD_ID
/

drop index UI_PRD_NUMBER
/

drop table PREPARED_DISHES cascade constraints
/

drop table STOCK cascade constraints
/

drop sequence SEQ_DISH
/

drop sequence SEQ_DISH_OF_ORDERS
/

drop sequence SEQ_EMPLOYEE
/

drop sequence SEQ_INGREDIENT
/

drop sequence SEQ_MENU
/

drop sequence SEQ_ORDERS
/

drop sequence SEQ_POSITIONS
/

drop sequence SEQ_PREPARED_DISHES
/

create sequence SEQ_DISH
/

create sequence SEQ_DISH_OF_ORDERS
/

create sequence SEQ_EMPLOYEE
/

create sequence SEQ_INGREDIENT
/

create sequence SEQ_MENU
/

create sequence SEQ_ORDERS
/

create sequence SEQ_POSITIONS
/

create sequence SEQ_PREPARED_DISHES
/

/*==============================================================*/
/* Table: COOK                                                  */
/*==============================================================*/
create table COOK 
(
   EMP_ID               INTEGER              not null,
   PRD_ID               INTEGER              not null,
   constraint PK_COOK primary key (EMP_ID, PRD_ID)
)
/

/*==============================================================*/
/* Index: I_COOK_PRD_ID                                         */
/*==============================================================*/
create index I_COOK_PRD_ID on COOK (
   PRD_ID ASC
)
/

/*==============================================================*/
/* Table: DISH                                                  */
/*==============================================================*/
create table DISH 
(
   DSH_ID               INTEGER              not null,
   DSH_NAME             VARCHAR2(255)        not null,
   DSH_CATEGORY         VARCHAR2(255)        not null,
   DSH_WEIGHT           NUMBER(5)            not null,
   constraint PK_DISH primary key (DSH_ID)
)
/

/*==============================================================*/
/* Index: UI_DSH_NAME_CATEGORY                                  */
/*==============================================================*/
create unique index UI_DSH_NAME_CATEGORY on DISH (
   DSH_NAME ASC,
   DSH_CATEGORY ASC
)
/

/*==============================================================*/
/* Table: DISHES_OF_MENU                                        */
/*==============================================================*/
create table DISHES_OF_MENU 
(
   MNU_ID               INTEGER              not null,
   DSH_ID               INTEGER              not null,
   DOM_COST             NUMBER(10,2)         not null,
   constraint PK_DISHES_OF_MENU primary key (MNU_ID, DSH_ID)
)
/

/*==============================================================*/
/* Index: I_DOM_DSH_ID                                          */
/*==============================================================*/
create index I_DOM_DSH_ID on DISHES_OF_MENU (
   DSH_ID ASC
)
/

/*==============================================================*/
/* Table: DISH_OF_ORDERS                                        */
/*==============================================================*/
create table DISH_OF_ORDERS 
(
   DOD_ID               INTEGER              not null,
   ORD_ID               INTEGER              not null,
   DSH_ID               INTEGER              not null,
   constraint PK_DISH_OF_ORDERS primary key (DOD_ID)
)
/

/*==============================================================*/
/* Index: I_DOD_ORD_ID                                          */
/*==============================================================*/
create index I_DOD_ORD_ID on DISH_OF_ORDERS (
   ORD_ID ASC
)
/

/*==============================================================*/
/* Index: I_DOD_DSH_ID                                          */
/*==============================================================*/
create index I_DOD_DSH_ID on DISH_OF_ORDERS (
   DSH_ID ASC
)
/

/*==============================================================*/
/* Table: EMPLOYEE                                              */
/*==============================================================*/
create table EMPLOYEE 
(
   EMP_ID               INTEGER              not null,
   EMP_LAST_NAME        VARCHAR2(50)         not null,
   EMP_FIRST_NAME       VARCHAR2(50)         not null,
   EMP_BIRTHDAY         DATE                 not null,
   EMP_PHONE            VARCHAR2(20)         not null,
   constraint PK_EMPLOYEE primary key (EMP_ID)
)
/

/*==============================================================*/
/* Table: INGREDIENT                                            */
/*==============================================================*/
create table INGREDIENT 
(
   ING_ID               INTEGER              not null,
   ING_NAME             VARCHAR2(255)        not null,
   constraint PK_INGREDIENT primary key (ING_ID)
)
/

/*==============================================================*/
/* Index: UI_ING_NAME                                           */
/*==============================================================*/
create unique index UI_ING_NAME on INGREDIENT (
   ING_NAME ASC
)
/

/*==============================================================*/
/* Table: INGREDIENTS_OF_DISH                                   */
/*==============================================================*/
create table INGREDIENTS_OF_DISH 
(
   DSH_ID               INTEGER              not null,
   ING_ID               INTEGER              not null,
   IOD_WEIGHT           NUMBER(5,3)          not null,
   constraint PK_INGREDIENTS_OF_DISH primary key (DSH_ID, ING_ID)
)
/

/*==============================================================*/
/* Index: I_IOD_ING_ID                                          */
/*==============================================================*/
create index I_IOD_ING_ID on INGREDIENTS_OF_DISH (
   ING_ID ASC
)
/

/*==============================================================*/
/* Table: MENU                                                  */
/*==============================================================*/
create table MENU 
(
   MNU_ID               INTEGER              not null,
   MNU_NAME             VARCHAR2(255)        not null,
   constraint PK_MENU primary key (MNU_ID)
)
/

/*==============================================================*/
/* Index: UI_MNU_NAME                                           */
/*==============================================================*/
create unique index UI_MNU_NAME on MENU (
   MNU_NAME ASC
)
/

/*==============================================================*/
/* Table: ORDERS                                                */
/*==============================================================*/
create table ORDERS 
(
   ORD_ID               INTEGER              not null,
   ORD_NUMBER           VARCHAR2(25)         not null,
   ORD_TABLE            INTEGER              not null,
   EMP_ID               INTEGER              not null,
   ORD_DATE             DATE                 not null,
   constraint PK_ORDERS primary key (ORD_ID)
)
/

/*==============================================================*/
/* Index: UI_ORD_NUMBER_WAITER                                  */
/*==============================================================*/
create unique index UI_ORD_NUMBER_WAITER on ORDERS (
   ORD_NUMBER ASC,
   EMP_ID ASC
)
/

/*==============================================================*/
/* Table: POSITIONS                                             */
/*==============================================================*/
create table POSITIONS 
(
   PST_ID               INTEGER              not null,
   PST_NAME             VARCHAR2(255)        not null,
   constraint PK_POSITIONS primary key (PST_ID)
)
/

/*==============================================================*/
/* Index: UI_PST_NAME                                           */
/*==============================================================*/
create unique index UI_PST_NAME on POSITIONS (
   PST_NAME ASC
)
/

/*==============================================================*/
/* Table: POSITION_OF_EMPLOYEE                                  */
/*==============================================================*/
create table POSITION_OF_EMPLOYEE 
(
   EMP_ID               INTEGER              not null,
   PST_ID               INTEGER              not null,
   POE_SALARY           NUMBER(10,2)         not null,
   constraint PK_POSITION_OF_EMPLOYEE primary key (EMP_ID, PST_ID)
)
/

/*==============================================================*/
/* Index: I_POE_PST_ID                                          */
/*==============================================================*/
create index I_POE_PST_ID on POSITION_OF_EMPLOYEE (
   PST_ID ASC
)
/

/*==============================================================*/
/* Table: PREPARED_DISHES                                       */
/*==============================================================*/
create table PREPARED_DISHES 
(
   PRD_ID               INTEGER              not null,
   PRD_NUMBER           VARCHAR2(25)         not null,
   DOD_ID               INTEGER              not null,
   PRD_DATE             DATE                 not null,
   constraint PK_PREPARED_DISHES primary key (PRD_ID)
)
/

/*==============================================================*/
/* Index: UI_PRD_NUMBER                                         */
/*==============================================================*/
create unique index UI_PRD_NUMBER on PREPARED_DISHES (
   PRD_NUMBER ASC
)
/

/*==============================================================*/
/* Index: I_PRD_DOD_ID                                          */
/*==============================================================*/
create index I_PRD_DOD_ID on PREPARED_DISHES (
   DOD_ID ASC
)
/

/*==============================================================*/
/* Table: STOCK                                                 */
/*==============================================================*/
create table STOCK 
(
   ING_ID               Integer              not null,
   STK_QUANTITY         NUMBER(10,3)         not null,
   constraint PK_STOCK primary key (ING_ID)
)
/

alter table COOK
   add constraint FK_COOK_REFERENCE_EMPLOYEE foreign key (EMP_ID)
      references EMPLOYEE (EMP_ID)
/

alter table COOK
   add constraint FK_COOK_REFERENCE_PREPARED foreign key (PRD_ID)
      references PREPARED_DISHES (PRD_ID)
/

alter table DISHES_OF_MENU
   add constraint FK_DISHES_O_REFERENCE_MENU foreign key (MNU_ID)
      references MENU (MNU_ID)
/

alter table DISHES_OF_MENU
   add constraint FK_DISHES_O_REFERENCE_DISH foreign key (DSH_ID)
      references DISH (DSH_ID)
/

alter table DISH_OF_ORDERS
   add constraint FK_DISH_OF__REFERENCE_ORDERS foreign key (ORD_ID)
      references ORDERS (ORD_ID)
/

alter table DISH_OF_ORDERS
   add constraint FK_DISH_OF__REFERENCE_DISH foreign key (DSH_ID)
      references DISH (DSH_ID)
/

alter table INGREDIENTS_OF_DISH
   add constraint FK_INGREDIE_REFERENCE_DISH foreign key (DSH_ID)
      references DISH (DSH_ID)
/

alter table INGREDIENTS_OF_DISH
   add constraint FK_INGREDIE_REFERENCE_INGREDIE foreign key (ING_ID)
      references INGREDIENT (ING_ID)
/

alter table ORDERS
   add constraint FK_ORDERS_REFERENCE_EMPLOYEE foreign key (EMP_ID)
      references EMPLOYEE (EMP_ID)
/

alter table POSITION_OF_EMPLOYEE
   add constraint FK_POSITION_REFERENCE_EMPLOYEE foreign key (EMP_ID)
      references EMPLOYEE (EMP_ID)
/

alter table POSITION_OF_EMPLOYEE
   add constraint FK_POSITION_REFERENCE_POSITION foreign key (PST_ID)
      references POSITIONS (PST_ID)
/

alter table PREPARED_DISHES
   add constraint FK_PREPARED_REFERENCE_DISH_OF_ foreign key (DOD_ID)
      references DISH_OF_ORDERS (DOD_ID)
/

alter table STOCK
   add constraint FK_STOCK_REFERENCE_INGREDIE foreign key (ING_ID)
      references INGREDIENT (ING_ID)
/


create or replace trigger "CompoundDeleteTrigger_dish"
for delete on DISH compound trigger
--  Declaration
--  Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END;
/


create or replace trigger "CompoundInsertTrigger_dish"
for insert on DISH compound trigger
--  Declaration
--  Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END;
/


create or replace trigger "CompoundUpdateTrigger_dish"
for update on DISH compound trigger
--  Declaration
--  Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END;
/


create trigger "tib_dish" before insert
on DISH for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "DSH_ID" uses sequence SEQ_DISH
    select SEQ_DISH.NEXTVAL INTO :new.DSH_ID from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger "CompoundDeleteTrigger_dish_of_"
for delete on DISH_OF_ORDERS compound trigger
--  Declaration
--  Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END;
/


create or replace trigger "CompoundInsertTrigger_dish_of_"
for insert on DISH_OF_ORDERS compound trigger
--  Declaration
--  Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END;
/


create or replace trigger "CompoundUpdateTrigger_dish_of_"
for update on DISH_OF_ORDERS compound trigger
--  Declaration
--  Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END;
/


create trigger "tib_dish_of_orders" before insert
on DISH_OF_ORDERS for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "DOD_ID" uses sequence SEQ_DISH_OF_ORDERS
    select SEQ_DISH_OF_ORDERS.NEXTVAL INTO :new.DOD_ID from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger "CompoundDeleteTrigger_employee"
for delete on EMPLOYEE compound trigger
--  Declaration
--  Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END;
/


create or replace trigger "CompoundInsertTrigger_employee"
for insert on EMPLOYEE compound trigger
--  Declaration
--  Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END;
/


create or replace trigger "CompoundUpdateTrigger_employee"
for update on EMPLOYEE compound trigger
--  Declaration
--  Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END;
/


create trigger "tib_employee" before insert
on EMPLOYEE for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "EMP_ID" uses sequence SEQ_EMPLOYEE
    select SEQ_EMPLOYEE.NEXTVAL INTO :new.EMP_ID from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger "CompoundDeleteTrigger_ingredie"
for delete on INGREDIENT compound trigger
--  Declaration
--  Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END;
/


create or replace trigger "CompoundInsertTrigger_ingredie"
for insert on INGREDIENT compound trigger
--  Declaration
--  Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END;
/


create or replace trigger "CompoundUpdateTrigger_ingredie"
for update on INGREDIENT compound trigger
--  Declaration
--  Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END;
/


create trigger "tib_ingredient" before insert
on INGREDIENT for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "ING_ID" uses sequence SEQ_INGREDIENT
    select SEQ_INGREDIENT.NEXTVAL INTO :new.ING_ID from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger "CompoundDeleteTrigger_menu"
for delete on MENU compound trigger
--  Declaration
--  Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END;
/


create or replace trigger "CompoundInsertTrigger_menu"
for insert on MENU compound trigger
--  Declaration
--  Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END;
/


create or replace trigger "CompoundUpdateTrigger_menu"
for update on MENU compound trigger
--  Declaration
--  Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END;
/


create trigger "tib_menu" before insert
on MENU for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "MNU_ID" uses sequence SEQ_MENU
    select SEQ_MENU.NEXTVAL INTO :new.MNU_ID from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger "CompoundDeleteTrigger_orders"
for delete on ORDERS compound trigger
--  Declaration
--  Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END;
/


create or replace trigger "CompoundInsertTrigger_orders"
for insert on ORDERS compound trigger
--  Declaration
--  Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END;
/


create or replace trigger "CompoundUpdateTrigger_orders"
for update on ORDERS compound trigger
--  Declaration
--  Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END;
/


create trigger "tib_orders" before insert
on ORDERS for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "ORD_ID" uses sequence SEQ_ORDERS
    select SEQ_ORDERS.NEXTVAL INTO :new.ORD_ID from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger "CompoundDeleteTrigger_position"
for delete on POSITIONS compound trigger
--  Declaration
--  Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END;
/


create or replace trigger "CompoundInsertTrigger_position"
for insert on POSITIONS compound trigger
--  Declaration
--  Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END;
/


create or replace trigger "CompoundUpdateTrigger_position"
for update on POSITIONS compound trigger
--  Declaration
--  Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END;
/


create trigger "tib_positions" before insert
on POSITIONS for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "PST_ID" uses sequence SEQ_POSITIONS
    select SEQ_POSITIONS.NEXTVAL INTO :new.PST_ID from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger "CompoundDeleteTrigger_prepared"
for delete on PREPARED_DISHES compound trigger
--  Declaration
--  Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END;
/


create or replace trigger "CompoundInsertTrigger_prepared"
for insert on PREPARED_DISHES compound trigger
--  Declaration
--  Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END;
/


create or replace trigger "CompoundUpdateTrigger_prepared"
for update on PREPARED_DISHES compound trigger
--  Declaration
--  Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END;
/


create trigger "tib_prepared_dishes" before insert
on PREPARED_DISHES for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "PRD_ID" uses sequence SEQ_PREPARED_DISHES
    select SEQ_PREPARED_DISHES.NEXTVAL INTO :new.PRD_ID from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/

