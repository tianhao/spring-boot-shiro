-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS public.sys_resource;
CREATE TABLE public.sys_resource (
  id          SERIAL,
  type        VARCHAR(255)          DEFAULT '',
  name        VARCHAR(255) NOT NULL,
  permission  VARCHAR(255) NOT NULL,
  icon        VARCHAR(255)          DEFAULT NULL,
  sort        INTEGER               DEFAULT '0',
  url         VARCHAR(255)          DEFAULT '',
  description VARCHAR(255)          DEFAULT '',
  status      SMALLINT     NOT NULL DEFAULT '1',
  parent_id   INTEGER      NOT NULL DEFAULT '0',
  create_by   INTEGER               DEFAULT NULL,
  create_at   TIMESTAMP    NOT NULL,
  update_by   INTEGER               DEFAULT NULL,
  update_at   TIMESTAMP             DEFAULT NULL,
  PRIMARY KEY (id) NOT DEFERRABLE INITIALLY IMMEDIATE,
  UNIQUE (type, permission)
)
WITHOUT OIDS;
COMMENT ON TABLE public.sys_resource IS '资源（权限）表';
COMMENT ON COLUMN public.sys_resource.type IS '权限类型：menu、button、url';
COMMENT ON COLUMN public.sys_resource.name IS '权限名称';
COMMENT ON COLUMN public.sys_resource.permission IS '权限字符串';
COMMENT ON COLUMN public.sys_resource.description IS '资源描述';
COMMENT ON COLUMN public.sys_resource.status IS '状态值';
COMMENT ON COLUMN public.sys_resource.parent_id IS '父ID';

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS public.sys_role;
CREATE TABLE public.sys_role (
  id        SERIAL,
  name      VARCHAR(255) NOT NULL,
  code      VARCHAR(255) NOT NULL,
  remark    VARCHAR(255)          DEFAULT '',
  status    SMALLINT     NOT NULL DEFAULT '1',
  parent_id INTEGER               DEFAULT NULL,
  create_by INTEGER               DEFAULT NULL,
  create_at TIMESTAMP    NOT NULL,
  update_by INTEGER               DEFAULT NULL,
  update_at TIMESTAMP             DEFAULT NULL,
  PRIMARY KEY (id) NOT DEFERRABLE INITIALLY IMMEDIATE
)
WITHOUT OIDS;

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS public.sys_role_resource;
CREATE TABLE public.sys_role_resource (
  id          SERIAL,
  role_id     INTEGER,
  resource_id INTEGER,
  PRIMARY KEY (id) NOT DEFERRABLE INITIALLY IMMEDIATE
)
WITHOUT OIDS;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS public.sys_user;
CREATE TABLE public.sys_user (
  id           SERIAL,
  mobile_phone VARCHAR(255) NOT NULL DEFAULT '',
  username     VARCHAR(50) UNIQUE,
  nickname     VARCHAR(255)          DEFAULT NULL,
  password     VARCHAR(255) NOT NULL,
  salt         VARCHAR(255)          DEFAULT '',
  signature    VARCHAR(255)          DEFAULT NULL,
  gender       SMALLINT              DEFAULT '0',
  qq           BIGINT                DEFAULT NULL,
  email        VARCHAR(255)          DEFAULT NULL,
  avatar       VARCHAR(500)          DEFAULT '',
  province     VARCHAR(50)           DEFAULT '',
  city         VARCHAR(50)           DEFAULT '',
  reg_ip       VARCHAR(50)           DEFAULT NULL,
  score        INTEGER               DEFAULT '0',
  status       INTEGER               DEFAULT '1',
  create_by    INTEGER               DEFAULT NULL,
  create_at    TIMESTAMP             DEFAULT NULL,
  update_by    INTEGER               DEFAULT NULL,
  update_at    TIMESTAMP             DEFAULT NULL,
  PRIMARY KEY (id) NOT DEFERRABLE INITIALLY IMMEDIATE
)
WITHOUT OIDS;
COMMENT ON TABLE public.sys_user IS '用户表';
COMMENT ON COLUMN public.sys_user.mobile_phone IS '手机号码';
COMMENT ON COLUMN public.sys_user.username IS '用户名';
COMMENT ON COLUMN public.sys_user.nickname IS '昵称';
COMMENT ON COLUMN public.sys_user.password IS '密码';
COMMENT ON COLUMN public.sys_user.salt IS '加密混淆字符';
COMMENT ON COLUMN public.sys_user.signature IS '个性签名';
COMMENT ON COLUMN public.sys_user.gender IS '性别';
COMMENT ON COLUMN public.sys_user.qq IS 'QQ 号码';
COMMENT ON COLUMN public.sys_user.email IS '邮箱地址';
COMMENT ON COLUMN public.sys_user.avatar IS '头像图片路径';
COMMENT ON COLUMN public.sys_user.province IS '省';
COMMENT ON COLUMN public.sys_user.city IS '市';
COMMENT ON COLUMN public.sys_user.reg_ip IS '注册时IP地址';
COMMENT ON COLUMN public.sys_user.status IS '状态：0禁用 1正常';

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS public.sys_user_role;
CREATE TABLE public.sys_user_role (
  id      SERIAL,
  user_id INTEGER NOT NULL,
  role_id INTEGER NOT NULL,
  PRIMARY KEY (id) NOT DEFERRABLE INITIALLY IMMEDIATE
)
WITHOUT OIDS;
