/*
 Navicat MySQL Data Transfer

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : blade

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 30/04/2020 15:20:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blade_client
-- ----------------------------
DROP TABLE IF EXISTS `blade_client`;
CREATE TABLE `blade_client` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `client_id` varchar(48) NOT NULL COMMENT '客户端id',
  `client_secret` varchar(256) NOT NULL COMMENT '客户端密钥',
  `resource_ids` varchar(256) DEFAULT NULL COMMENT '资源集合',
  `scope` varchar(256) NOT NULL COMMENT '授权范围',
  `authorized_grant_types` varchar(256) NOT NULL COMMENT '授权类型',
  `web_server_redirect_uri` varchar(256) DEFAULT NULL COMMENT '回调地址',
  `authorities` varchar(256) DEFAULT NULL COMMENT '权限',
  `access_token_validity` int(11) NOT NULL COMMENT '令牌过期秒数',
  `refresh_token_validity` int(11) NOT NULL COMMENT '刷新令牌过期秒数',
  `additional_information` varchar(4096) DEFAULT NULL COMMENT '附加说明',
  `autoapprove` varchar(256) DEFAULT NULL COMMENT '自动授权',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) NOT NULL COMMENT '状态',
  `is_deleted` int(2) NOT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户端表';

-- ----------------------------
-- Records of blade_client
-- ----------------------------
BEGIN;
INSERT INTO `blade_client` VALUES (1123598811738675201, 'sword', 'sword_secret', NULL, 'all', 'refresh_token,password,authorization_code', 'http://localhost:8888', NULL, 3600, 604800, NULL, NULL, 1, '2019-03-24 10:40:55', 1, '2019-03-24 10:40:59', 1, 0);
INSERT INTO `blade_client` VALUES (1123598811738675202, 'saber', 'saber_secret', NULL, 'all', 'refresh_token,password,authorization_code', 'http://localhost:8080', NULL, 3600, 604800, NULL, NULL, 1, '2019-03-24 10:42:29', 1, '2019-03-24 10:42:32', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_code
-- ----------------------------
DROP TABLE IF EXISTS `blade_code`;
CREATE TABLE `blade_code` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `datasource_id` bigint(64) DEFAULT NULL COMMENT '数据源主键',
  `service_name` varchar(64) DEFAULT NULL COMMENT '服务名称',
  `code_name` varchar(64) DEFAULT NULL COMMENT '模块名称',
  `table_name` varchar(64) DEFAULT NULL COMMENT '表名',
  `table_prefix` varchar(64) DEFAULT NULL COMMENT '表前缀',
  `pk_name` varchar(32) DEFAULT NULL COMMENT '主键名',
  `package_name` varchar(500) DEFAULT NULL COMMENT '后端包名',
  `base_mode` int(2) DEFAULT NULL COMMENT '基础业务模式',
  `wrap_mode` int(2) DEFAULT NULL COMMENT '包装器模式',
  `api_path` varchar(2000) DEFAULT NULL COMMENT '后端路径',
  `web_path` varchar(2000) DEFAULT NULL COMMENT '前端路径',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代码生成表';

-- ----------------------------
-- Records of blade_code
-- ----------------------------
BEGIN;
INSERT INTO `blade_code` VALUES (1123598812738675201, 1123598812738675201, 'blade-demo', '通知公告', 'blade_notice', 'blade_', 'id', 'org.springblade.desktop', 1, 1, 'D:\\Develop\\WorkSpace\\Git\\SpringBlade\\blade-ops\\blade-develop', 'D:\\Develop\\WorkSpace\\Git\\Sword', 0);
INSERT INTO `blade_code` VALUES (1255735529547247618, 1123598812738675201, 'blade-desk', '学生', 'blade_student', 'blade_', 'id', 'org.springblade.modules.desk', 2, 2, '/Users/kuzan/Documents/openSource/SpringBlade', '/Users/kuzan/Documents/openSource/Saber', 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_datasource
-- ----------------------------
DROP TABLE IF EXISTS `blade_datasource`;
CREATE TABLE `blade_datasource` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `driver_class` varchar(100) DEFAULT NULL COMMENT '驱动类',
  `url` varchar(500) DEFAULT NULL COMMENT '连接地址',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='数据源配置表';

-- ----------------------------
-- Records of blade_datasource
-- ----------------------------
BEGIN;
INSERT INTO `blade_datasource` VALUES (1123598812738675201, 'mysql', 'com.mysql.cj.jdbc.Driver', 'jdbc:mysql://localhost:3306/blade?useSSL=false&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&serverTimezone=GMT%2B8&nullCatalogMeansCurrent=true&allowPublicKeyRetrieval=true', 'root', 'root', 'mysql', 1, '2019-08-14 11:43:06', 1, '2019-08-14 11:43:06', 1, 0);
INSERT INTO `blade_datasource` VALUES (1123598812738675202, 'postgresql', 'org.postgresql.Driver', 'jdbc:postgresql://127.0.0.1:5432/blade', 'postgres', '123456', 'postgresql', 1, '2019-08-14 11:43:41', 1, '2019-08-14 11:43:41', 1, 0);
INSERT INTO `blade_datasource` VALUES (1123598812738675203, 'oracle', 'oracle.jdbc.OracleDriver', 'jdbc:oracle:thin:@127.0.0.1:49161:orcl', 'BLADE', 'blade', 'oracle', 1, '2019-08-14 11:44:03', 1, '2019-08-14 11:44:03', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_dept
-- ----------------------------
DROP TABLE IF EXISTS `blade_dept`;
CREATE TABLE `blade_dept` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父主键',
  `dept_name` varchar(45) DEFAULT NULL COMMENT '部门名',
  `full_name` varchar(45) DEFAULT NULL COMMENT '部门全称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='部门表';

-- ----------------------------
-- Records of blade_dept
-- ----------------------------
BEGIN;
INSERT INTO `blade_dept` VALUES (1123598813738675201, '000000', 0, '刀锋科技', '江苏刀锋科技有限公司', 1, NULL, 0);
INSERT INTO `blade_dept` VALUES (1123598813738675202, '000000', 1123598813738675201, '常州刀锋', '常州刀锋科技有限公司', 1, NULL, 0);
INSERT INTO `blade_dept` VALUES (1123598813738675203, '000000', 1123598813738675201, '苏州刀锋', '苏州刀锋科技有限公司', 1, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_dict
-- ----------------------------
DROP TABLE IF EXISTS `blade_dict`;
CREATE TABLE `blade_dict` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父主键',
  `code` varchar(255) DEFAULT NULL COMMENT '字典码',
  `dict_key` int(2) DEFAULT NULL COMMENT '字典值',
  `dict_value` varchar(255) DEFAULT NULL COMMENT '字典名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '字典备注',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='字典表';

-- ----------------------------
-- Records of blade_dict
-- ----------------------------
BEGIN;
INSERT INTO `blade_dict` VALUES (1123598814738675201, 0, 'sex', -1, '性别', 1, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675202, 1123598814738675201, 'sex', 1, '男', 1, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675203, 1123598814738675201, 'sex', 2, '女', 2, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675204, 0, 'notice', -1, '通知类型', 2, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675205, 1123598814738675204, 'notice', 1, '发布通知', 1, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675206, 1123598814738675204, 'notice', 2, '批转通知', 2, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675207, 1123598814738675204, 'notice', 3, '转发通知', 3, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675208, 1123598814738675204, 'notice', 4, '指示通知', 4, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675209, 1123598814738675204, 'notice', 5, '任免通知', 5, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675210, 1123598814738675204, 'notice', 6, '事务通知', 6, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675211, 0, 'menu_category', -1, '菜单类型', 3, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675212, 1123598814738675211, 'menu_category', 1, '菜单', 1, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675213, 1123598814738675211, 'menu_category', 2, '按钮', 2, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675214, 0, 'button_func', -1, '按钮功能', 4, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675215, 1123598814738675214, 'button_func', 1, '工具栏', 1, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675216, 1123598814738675214, 'button_func', 2, '操作栏', 2, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675217, 1123598814738675214, 'button_func', 3, '工具操作栏', 3, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675218, 0, 'yes_no', -1, '是否', 5, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675219, 1123598814738675218, 'yes_no', 1, '否', 1, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675220, 1123598814738675218, 'yes_no', 2, '是', 2, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738777220, 0, 'post_category', -1, '岗位类型', 12, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738777221, 1123598814738777220, 'post_category', 1, '高层', 1, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738777222, 1123598814738777220, 'post_category', 2, '中层', 2, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738777223, 1123598814738777220, 'post_category', 3, '基层', 3, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738777224, 1123598814738777220, 'post_category', 4, '其他', 4, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_log_api
-- ----------------------------
DROP TABLE IF EXISTS `blade_log_api`;
CREATE TABLE `blade_log_api` (
  `id` bigint(64) NOT NULL COMMENT '编号',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `service_id` varchar(32) DEFAULT NULL COMMENT '服务ID',
  `server_host` varchar(255) DEFAULT NULL COMMENT '服务器名',
  `server_ip` varchar(255) DEFAULT NULL COMMENT '服务器IP地址',
  `env` varchar(255) DEFAULT NULL COMMENT '服务器环境',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `method` varchar(10) DEFAULT NULL COMMENT '操作方式',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `user_agent` varchar(1000) DEFAULT NULL COMMENT '用户代理',
  `remote_ip` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `method_class` varchar(255) DEFAULT NULL COMMENT '方法类',
  `method_name` varchar(255) DEFAULT NULL COMMENT '方法名',
  `params` text COMMENT '操作提交的数据',
  `time` varchar(64) DEFAULT NULL COMMENT '执行时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='接口日志表';

-- ----------------------------
-- Table structure for blade_log_error
-- ----------------------------
DROP TABLE IF EXISTS `blade_log_error`;
CREATE TABLE `blade_log_error` (
  `id` bigint(64) NOT NULL COMMENT '编号',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `service_id` varchar(32) DEFAULT NULL COMMENT '服务ID',
  `server_host` varchar(255) DEFAULT NULL COMMENT '服务器名',
  `server_ip` varchar(255) DEFAULT NULL COMMENT '服务器IP地址',
  `env` varchar(255) DEFAULT NULL COMMENT '系统环境',
  `method` varchar(10) DEFAULT NULL COMMENT '操作方式',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `user_agent` varchar(1000) DEFAULT NULL COMMENT '用户代理',
  `stack_trace` text COMMENT '堆栈',
  `exception_name` varchar(255) DEFAULT NULL COMMENT '异常名',
  `message` text COMMENT '异常信息',
  `line_number` int(11) DEFAULT NULL COMMENT '错误行数',
  `remote_ip` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `method_class` varchar(255) DEFAULT NULL COMMENT '方法类',
  `file_name` varchar(1000) DEFAULT NULL COMMENT '文件名',
  `method_name` varchar(255) DEFAULT NULL COMMENT '方法名',
  `params` text COMMENT '操作提交的数据',
  `time` varchar(64) DEFAULT NULL COMMENT '执行时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='错误日志表';

-- ----------------------------
-- Records of blade_log_error
-- ----------------------------
BEGIN;
INSERT INTO `blade_log_error` VALUES (1255739918215307265, '000000', 'blade-api', 'localhost', '192.168.10.127:80', 'dev', 'GET', '/blade-system/menu/buttons', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'java.io.IOException: Broken pipe\n	at sun.nio.ch.FileDispatcherImpl.writev0(Native Method)\n	at sun.nio.ch.SocketDispatcher.writev(SocketDispatcher.java:51)\n	at sun.nio.ch.IOUtil.write(IOUtil.java:148)\n	at sun.nio.ch.SocketChannelImpl.write(SocketChannelImpl.java:504)\n	at org.xnio.nio.NioSocketConduit.write(NioSocketConduit.java:184)\n	at io.undertow.server.protocol.http.HttpResponseConduit.write(HttpResponseConduit.java:647)\n	at org.xnio.conduits.AbstractStreamSinkConduit.write(AbstractStreamSinkConduit.java:55)\n	at org.xnio.conduits.ConduitStreamSinkChannel.write(ConduitStreamSinkChannel.java:158)\n	at io.undertow.channels.DetachableStreamSinkChannel.write(DetachableStreamSinkChannel.java:179)\n	at io.undertow.server.HttpServerExchange$WriteDispatchChannel.write(HttpServerExchange.java:2072)\n	at org.xnio.channels.Channels.writeBlocking(Channels.java:152)\n	at io.undertow.servlet.spec.ServletOutputStreamImpl.writeTooLargeForBuffer(ServletOutputStreamImpl.java:198)\n	at io.undertow.servlet.spec.ServletOutputStreamImpl.write(ServletOutputStreamImpl.java:146)\n	at com.fasterxml.jackson.core.json.UTF8JsonGenerator._flushBuffer(UTF8JsonGenerator.java:2137)\n	at com.fasterxml.jackson.core.json.UTF8JsonGenerator._writeBytes(UTF8JsonGenerator.java:1226)\n	at com.fasterxml.jackson.core.json.UTF8JsonGenerator.writeFieldName(UTF8JsonGenerator.java:288)\n	at com.fasterxml.jackson.databind.ser.BeanPropertyWriter.serializeAsField(BeanPropertyWriter.java:725)\n	at com.fasterxml.jackson.databind.ser.std.BeanSerializerBase.serializeFields(BeanSerializerBase.java:722)\n	at com.fasterxml.jackson.databind.ser.BeanSerializer.serialize(BeanSerializer.java:166)\n	at com.fasterxml.jackson.databind.ser.impl.IndexedListSerializer.serializeContents(IndexedListSerializer.java:119)\n	at com.fasterxml.jackson.databind.ser.impl.IndexedListSerializer.serialize(IndexedListSerializer.java:79)\n	at com.fasterxml.jackson.databind.ser.impl.IndexedListSerializer.serialize(IndexedListSerializer.java:18)\n	at com.fasterxml.jackson.databind.ser.BeanPropertyWriter.serializeAsField(BeanPropertyWriter.java:727)\n	at com.fasterxml.jackson.databind.ser.std.BeanSerializerBase.serializeFields(BeanSerializerBase.java:722)\n	at com.fasterxml.jackson.databind.ser.BeanSerializer.serialize(BeanSerializer.java:166)\n	at com.fasterxml.jackson.databind.ser.DefaultSerializerProvider._serialize(DefaultSerializerProvider.java:480)\n	at com.fasterxml.jackson.databind.ser.DefaultSerializerProvider.serializeValue(DefaultSerializerProvider.java:319)\n	at com.fasterxml.jackson.databind.ObjectWriter$Prefetch.serialize(ObjectWriter.java:1433)\n	at com.fasterxml.jackson.databind.ObjectWriter.writeValue(ObjectWriter.java:921)\n	at org.springblade.core.tool.jackson.AbstractReadWriteJackson2HttpMessageConverter.writeInternal(AbstractReadWriteJackson2HttpMessageConverter.java:130)\n	at org.springframework.http.converter.AbstractGenericHttpMessageConverter.write(AbstractGenericHttpMessageConverter.java:104)\n	at org.springframework.web.servlet.mvc.method.annotation.AbstractMessageConverterMethodProcessor.writeWithMessageConverters(AbstractMessageConverterMethodProcessor.java:287)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestResponseBodyMethodProcessor.handleReturnValue(RequestResponseBodyMethodProcessor.java:181)\n	at org.springframework.web.method.support.HandlerMethodReturnValueHandlerComposite.handleReturnValue(HandlerMethodReturnValueHandlerComposite.java:82)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:123)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:879)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:793)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1040)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:943)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:898)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:503)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:590)\n	at io.undertow.servlet.handlers.ServletHandler.handleRequest(ServletHandler.java:74)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:129)\n	at com.github.xiaoymin.knife4j.spring.filter.ProductionSecurityFilter.doFilter(ProductionSecurityFilter.java:53)\n	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131)\n	at com.github.xiaoymin.knife4j.spring.filter.SecurityBasicAuthFilter.doFilter(SecurityBasicAuthFilter.java:90)\n	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131)\n	at org.springblade.core.tool.support.xss.XssFilter.doFilter(XssFilter.java:48)\n	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131)\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131)\n	at org.springframework.boot.actuate.metrics.web.servlet.WebMvcMetricsFilter.doFilterInternal(WebMvcMetricsFilter.java:109)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131)\n	at io.undertow.servlet.handlers.FilterHandler.handleRequest(FilterHandler.java:84)\n	at io.undertow.servlet.handlers.security.ServletSecurityRoleHandler.handleRequest(ServletSecurityRoleHandler.java:62)\n	at io.undertow.servlet.handlers.ServletChain$1.handleRequest(ServletChain.java:68)\n	at io.undertow.servlet.handlers.ServletDispatchingHandler.handleRequest(ServletDispatchingHandler.java:36)\n	at io.undertow.servlet.handlers.RedirectDirHandler.handleRequest(RedirectDirHandler.java:68)\n	at io.undertow.servlet.handlers.security.SSLInformationAssociationHandler.handleRequest(SSLInformationAssociationHandler.java:132)\n	at io.undertow.servlet.handlers.security.ServletAuthenticationCallHandler.handleRequest(ServletAuthenticationCallHandler.java:57)\n	at io.undertow.server.handlers.PredicateHandler.handleRequest(PredicateHandler.java:43)\n	at io.undertow.security.handlers.AbstractConfidentialityHandler.handleRequest(AbstractConfidentialityHandler.java:46)\n	at io.undertow.servlet.handlers.security.ServletConfidentialityConstraintHandler.handleRequest(ServletConfidentialityConstraintHandler.java:64)\n	at io.undertow.security.handlers.AuthenticationMechanismsHandler.handleRequest(AuthenticationMechanismsHandler.java:60)\n	at io.undertow.servlet.handlers.security.CachedAuthenticatedSessionHandler.handleRequest(CachedAuthenticatedSessionHandler.java:77)\n	at io.undertow.security.handlers.AbstractSecurityContextAssociationHandler.handleRequest(AbstractSecurityContextAssociationHandler.java:43)\n	at io.undertow.server.handlers.PredicateHandler.handleRequest(PredicateHandler.java:43)\n	at io.undertow.server.handlers.PredicateHandler.handleRequest(PredicateHandler.java:43)\n	at io.undertow.servlet.handlers.ServletInitialHandler.handleFirstRequest(ServletInitialHandler.java:269)\n	at io.undertow.servlet.handlers.ServletInitialHandler.access$100(ServletInitialHandler.java:78)\n	at io.undertow.servlet.handlers.ServletInitialHandler$2.call(ServletInitialHandler.java:133)\n	at io.undertow.servlet.handlers.ServletInitialHandler$2.call(ServletInitialHandler.java:130)\n	at io.undertow.servlet.core.ServletRequestContextThreadSetupAction$1.call(ServletRequestContextThreadSetupAction.java:48)\n	at io.undertow.servlet.core.ContextClassLoaderSetupAction$1.call(ContextClassLoaderSetupAction.java:43)\n	at io.undertow.servlet.handlers.ServletInitialHandler.dispatchRequest(ServletInitialHandler.java:249)\n	at io.undertow.servlet.handlers.ServletInitialHandler.access$000(ServletInitialHandler.java:78)\n	at io.undertow.servlet.handlers.ServletInitialHandler$1.handleRequest(ServletInitialHandler.java:99)\n	at io.undertow.server.Connectors.executeRootHandler(Connectors.java:376)\n	at io.undertow.server.HttpServerExchange$1.run(HttpServerExchange.java:830)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	at java.lang.Thread.run(Thread.java:748)\n', 'java.io.IOException', 'Broken pipe', -2, '127.0.0.1', 'sun.nio.ch.FileDispatcherImpl', 'FileDispatcherImpl.java', 'writev0', '', NULL, 'admin', '2020-04-30 14:05:02');
INSERT INTO `blade_log_error` VALUES (1255741404798279682, '000000', 'blade-api', 'localhost', '192.168.10.127:80', 'dev', 'POST', '/blade-desk/student/submit', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'org.springframework.dao.DataIntegrityViolationException: \n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'sex\' at row 1\n### The error may exist in org/springblade/modules/desk/mapper/StudentMapper.java (best guess)\n### The error may involve org.springblade.modules.desk.mapper.StudentMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO blade_student (no, name, sex, birthday, create_user, create_time, update_user, update_time, status, is_deleted) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'sex\' at row 1\n; Data truncation: Data too long for column \'sex\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'sex\' at row 1\n	at org.springframework.jdbc.support.SQLStateSQLExceptionTranslator.doTranslate(SQLStateSQLExceptionTranslator.java:104)\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:72)\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:81)\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:81)\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:88)\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:440)\n	at com.sun.proxy.$Proxy144.insert(Unknown Source)\n	at org.mybatis.spring.SqlSessionTemplate.insert(SqlSessionTemplate.java:271)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.execute(MybatisMapperMethod.java:60)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:96)\n	at com.sun.proxy.$Proxy161.insert(Unknown Source)\n	at com.baomidou.mybatisplus.extension.service.IService.save(IService.java:59)\n	at org.springblade.core.mp.base.BaseServiceImpl.save(BaseServiceImpl.java:54)\n	at org.springblade.core.mp.base.BaseServiceImpl.save(BaseServiceImpl.java:37)\n	at com.baomidou.mybatisplus.extension.service.impl.ServiceImpl.saveOrUpdate(ServiceImpl.java:146)\n	at com.baomidou.mybatisplus.extension.service.impl.ServiceImpl$$FastClassBySpringCGLIB$$76535273.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:771)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.validation.beanvalidation.MethodValidationInterceptor.invoke(MethodValidationInterceptor.java:120)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:366)\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:118)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:691)\n	at org.springblade.modules.desk.service.impl.StudentServiceImpl$$EnhancerBySpringCGLIB$$471e5b21.saveOrUpdate(<generated>)\n	at org.springblade.modules.desk.controller.StudentController.submit(StudentController.java:114)\n	at org.springblade.modules.desk.controller.StudentController$$FastClassBySpringCGLIB$$2b730146.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:771)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\n	at org.springblade.core.boot.logger.RequestLogAspect.aroundApi(RequestLogAspect.java:143)\n	at sun.reflect.GeneratedMethodAccessor253.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:95)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:691)\n	at org.springblade.modules.desk.controller.StudentController$$EnhancerBySpringCGLIB$$999d225e.submit(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:105)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:879)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:793)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1040)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:943)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:523)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:590)\n	at io.undertow.servlet.handlers.ServletHandler.handleRequest(ServletHandler.java:74)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:129)\n	at com.github.xiaoymin.knife4j.spring.filter.ProductionSecurityFilter.doFilter(ProductionSecurityFilter.java:53)\n	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131)\n	at com.github.xiaoymin.knife4j.spring.filter.SecurityBasicAuthFilter.doFilter(SecurityBasicAuthFilter.java:90)\n	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131)\n	at org.springblade.core.tool.support.xss.XssFilter.doFilter(XssFilter.java:48)\n	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131)\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131)\n	at org.springframework.boot.actuate.metrics.web.servlet.WebMvcMetricsFilter.doFilterInternal(WebMvcMetricsFilter.java:109)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131)\n	at io.undertow.servlet.handlers.FilterHandler.handleRequest(FilterHandler.java:84)\n	at io.undertow.servlet.handlers.security.ServletSecurityRoleHandler.handleRequest(ServletSecurityRoleHandler.java:62)\n	at io.undertow.servlet.handlers.ServletChain$1.handleRequest(ServletChain.java:68)\n	at io.undertow.servlet.handlers.ServletDispatchingHandler.handleRequest(ServletDispatchingHandler.java:36)\n	at io.undertow.servlet.handlers.RedirectDirHandler.handleRequest(RedirectDirHandler.java:68)\n	at io.undertow.servlet.handlers.security.SSLInformationAssociationHandler.handleRequest(SSLInformationAssociationHandler.java:132)\n	at io.undertow.servlet.handlers.security.ServletAuthenticationCallHandler.handleRequest(ServletAuthenticationCallHandler.java:57)\n	at io.undertow.server.handlers.PredicateHandler.handleRequest(PredicateHandler.java:43)\n	at io.undertow.security.handlers.AbstractConfidentialityHandler.handleRequest(AbstractConfidentialityHandler.java:46)\n	at io.undertow.servlet.handlers.security.ServletConfidentialityConstraintHandler.handleRequest(ServletConfidentialityConstraintHandler.java:64)\n	at io.undertow.security.handlers.AuthenticationMechanismsHandler.handleRequest(AuthenticationMechanismsHandler.java:60)\n	at io.undertow.servlet.handlers.security.CachedAuthenticatedSessionHandler.handleRequest(CachedAuthenticatedSessionHandler.java:77)\n	at io.undertow.security.handlers.AbstractSecurityContextAssociationHandler.handleRequest(AbstractSecurityContextAssociationHandler.java:43)\n	at io.undertow.server.handlers.PredicateHandler.handleRequest(PredicateHandler.java:43)\n	at io.undertow.server.handlers.PredicateHandler.handleRequest(PredicateHandler.java:43)\n	at io.undertow.servlet.handlers.ServletInitialHandler.handleFirstRequest(ServletInitialHandler.java:269)\n	at io.undertow.servlet.handlers.ServletInitialHandler.access$100(ServletInitialHandler.java:78)\n	at io.undertow.servlet.handlers.ServletInitialHandler$2.call(ServletInitialHandler.java:133)\n	at io.undertow.servlet.handlers.ServletInitialHandler$2.call(ServletInitialHandler.java:130)\n	at io.undertow.servlet.core.ServletRequestContextThreadSetupAction$1.call(ServletRequestContextThreadSetupAction.java:48)\n	at io.undertow.servlet.core.ContextClassLoaderSetupAction$1.call(ContextClassLoaderSetupAction.java:43)\n	at io.undertow.servlet.handlers.ServletInitialHandler.dispatchRequest(ServletInitialHandler.java:249)\n	at io.undertow.servlet.handlers.ServletInitialHandler.access$000(ServletInitialHandler.java:78)\n	at io.undertow.servlet.handlers.ServletInitialHandler$1.handleRequest(ServletInitialHandler.java:99)\n	at io.undertow.server.Connectors.executeRootHandler(Connectors.java:376)\n	at io.undertow.server.HttpServerExchange$1.run(HttpServerExchange.java:830)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	at java.lang.Thread.run(Thread.java:748)\nCaused by: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'sex\' at row 1\n	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:104)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:953)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.execute(ClientPreparedStatement.java:370)\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.execute(DruidPooledPreparedStatement.java:497)\n	at sun.reflect.GeneratedMethodAccessor232.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.apache.ibatis.logging.jdbc.PreparedStatementLogger.invoke(PreparedStatementLogger.java:59)\n	at com.sun.proxy.$Proxy253.execute(Unknown Source)\n	at org.apache.ibatis.executor.statement.PreparedStatementHandler.update(PreparedStatementHandler.java:47)\n	at org.apache.ibatis.executor.statement.RoutingStatementHandler.update(RoutingStatementHandler.java:74)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\n	at com.sun.proxy.$Proxy251.update(Unknown Source)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.apache.ibatis.plugin.Invocation.proceed(Invocation.java:49)\n	at org.springblade.core.mp.plugins.SqlLogInterceptor.intercept(SqlLogInterceptor.java:117)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:61)\n	at com.sun.proxy.$Proxy251.update(Unknown Source)\n	at com.baomidou.mybatisplus.core.executor.MybatisSimpleExecutor.doUpdate(MybatisSimpleExecutor.java:54)\n	at org.apache.ibatis.executor.BaseExecutor.update(BaseExecutor.java:117)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.update(DefaultSqlSession.java:197)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.insert(DefaultSqlSession.java:184)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:426)\n	... 117 more\n', 'org.springframework.dao.DataIntegrityViolationException', '\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'sex\' at row 1\n### The error may exist in org/springblade/modules/desk/mapper/StudentMapper.java (best guess)\n### The error may involve org.springblade.modules.desk.mapper.StudentMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO blade_student (no, name, sex, birthday, create_user, create_time, update_user, update_time, status, is_deleted) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'sex\' at row 1\n; Data truncation: Data too long for column \'sex\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'sex\' at row 1', 104, '127.0.0.1', 'org.springframework.jdbc.support.SQLStateSQLExceptionTranslator', 'SQLStateSQLExceptionTranslator.java', 'doTranslate', '', NULL, 'admin', '2020-04-30 14:10:56');
INSERT INTO `blade_log_error` VALUES (1255741675934867458, '000000', 'blade-api', 'localhost', '192.168.10.127:80', 'dev', 'POST', '/blade-desk/student/submit', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'org.springframework.dao.DataIntegrityViolationException: \n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n### The error may exist in org/springblade/modules/desk/mapper/StudentMapper.java (best guess)\n### The error may involve org.springblade.modules.desk.mapper.StudentMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO blade_student (no, name, sex, birthday, create_user, create_time, update_user, update_time, status, is_deleted) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:247)\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:72)\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:88)\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:440)\n	at com.sun.proxy.$Proxy144.insert(Unknown Source)\n	at org.mybatis.spring.SqlSessionTemplate.insert(SqlSessionTemplate.java:271)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.execute(MybatisMapperMethod.java:60)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:96)\n	at com.sun.proxy.$Proxy161.insert(Unknown Source)\n	at com.baomidou.mybatisplus.extension.service.IService.save(IService.java:59)\n	at org.springblade.core.mp.base.BaseServiceImpl.save(BaseServiceImpl.java:54)\n	at org.springblade.core.mp.base.BaseServiceImpl.save(BaseServiceImpl.java:37)\n	at com.baomidou.mybatisplus.extension.service.impl.ServiceImpl.saveOrUpdate(ServiceImpl.java:146)\n	at com.baomidou.mybatisplus.extension.service.impl.ServiceImpl$$FastClassBySpringCGLIB$$76535273.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:771)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.validation.beanvalidation.MethodValidationInterceptor.invoke(MethodValidationInterceptor.java:120)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:366)\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:118)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:691)\n	at org.springblade.modules.desk.service.impl.StudentServiceImpl$$EnhancerBySpringCGLIB$$471e5b21.saveOrUpdate(<generated>)\n	at org.springblade.modules.desk.controller.StudentController.submit(StudentController.java:114)\n	at org.springblade.modules.desk.controller.StudentController$$FastClassBySpringCGLIB$$2b730146.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:771)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\n	at org.springblade.core.boot.logger.RequestLogAspect.aroundApi(RequestLogAspect.java:143)\n	at sun.reflect.GeneratedMethodAccessor253.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:95)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:691)\n	at org.springblade.modules.desk.controller.StudentController$$EnhancerBySpringCGLIB$$999d225e.submit(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:105)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:879)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:793)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1040)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:943)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:523)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:590)\n	at io.undertow.servlet.handlers.ServletHandler.handleRequest(ServletHandler.java:74)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:129)\n	at com.github.xiaoymin.knife4j.spring.filter.ProductionSecurityFilter.doFilter(ProductionSecurityFilter.java:53)\n	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131)\n	at com.github.xiaoymin.knife4j.spring.filter.SecurityBasicAuthFilter.doFilter(SecurityBasicAuthFilter.java:90)\n	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131)\n	at org.springblade.core.tool.support.xss.XssFilter.doFilter(XssFilter.java:48)\n	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131)\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131)\n	at org.springframework.boot.actuate.metrics.web.servlet.WebMvcMetricsFilter.doFilterInternal(WebMvcMetricsFilter.java:109)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131)\n	at io.undertow.servlet.handlers.FilterHandler.handleRequest(FilterHandler.java:84)\n	at io.undertow.servlet.handlers.security.ServletSecurityRoleHandler.handleRequest(ServletSecurityRoleHandler.java:62)\n	at io.undertow.servlet.handlers.ServletChain$1.handleRequest(ServletChain.java:68)\n	at io.undertow.servlet.handlers.ServletDispatchingHandler.handleRequest(ServletDispatchingHandler.java:36)\n	at io.undertow.servlet.handlers.RedirectDirHandler.handleRequest(RedirectDirHandler.java:68)\n	at io.undertow.servlet.handlers.security.SSLInformationAssociationHandler.handleRequest(SSLInformationAssociationHandler.java:132)\n	at io.undertow.servlet.handlers.security.ServletAuthenticationCallHandler.handleRequest(ServletAuthenticationCallHandler.java:57)\n	at io.undertow.server.handlers.PredicateHandler.handleRequest(PredicateHandler.java:43)\n	at io.undertow.security.handlers.AbstractConfidentialityHandler.handleRequest(AbstractConfidentialityHandler.java:46)\n	at io.undertow.servlet.handlers.security.ServletConfidentialityConstraintHandler.handleRequest(ServletConfidentialityConstraintHandler.java:64)\n	at io.undertow.security.handlers.AuthenticationMechanismsHandler.handleRequest(AuthenticationMechanismsHandler.java:60)\n	at io.undertow.servlet.handlers.security.CachedAuthenticatedSessionHandler.handleRequest(CachedAuthenticatedSessionHandler.java:77)\n	at io.undertow.security.handlers.AbstractSecurityContextAssociationHandler.handleRequest(AbstractSecurityContextAssociationHandler.java:43)\n	at io.undertow.server.handlers.PredicateHandler.handleRequest(PredicateHandler.java:43)\n	at io.undertow.server.handlers.PredicateHandler.handleRequest(PredicateHandler.java:43)\n	at io.undertow.servlet.handlers.ServletInitialHandler.handleFirstRequest(ServletInitialHandler.java:269)\n	at io.undertow.servlet.handlers.ServletInitialHandler.access$100(ServletInitialHandler.java:78)\n	at io.undertow.servlet.handlers.ServletInitialHandler$2.call(ServletInitialHandler.java:133)\n	at io.undertow.servlet.handlers.ServletInitialHandler$2.call(ServletInitialHandler.java:130)\n	at io.undertow.servlet.core.ServletRequestContextThreadSetupAction$1.call(ServletRequestContextThreadSetupAction.java:48)\n	at io.undertow.servlet.core.ContextClassLoaderSetupAction$1.call(ContextClassLoaderSetupAction.java:43)\n	at io.undertow.servlet.handlers.ServletInitialHandler.dispatchRequest(ServletInitialHandler.java:249)\n	at io.undertow.servlet.handlers.ServletInitialHandler.access$000(ServletInitialHandler.java:78)\n	at io.undertow.servlet.handlers.ServletInitialHandler$1.handleRequest(ServletInitialHandler.java:99)\n	at io.undertow.server.Connectors.executeRootHandler(Connectors.java:376)\n	at io.undertow.server.HttpServerExchange$1.run(HttpServerExchange.java:830)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	at java.lang.Thread.run(Thread.java:748)\nCaused by: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:129)\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:97)\n	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:953)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.execute(ClientPreparedStatement.java:370)\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.execute(DruidPooledPreparedStatement.java:497)\n	at sun.reflect.GeneratedMethodAccessor232.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.apache.ibatis.logging.jdbc.PreparedStatementLogger.invoke(PreparedStatementLogger.java:59)\n	at com.sun.proxy.$Proxy253.execute(Unknown Source)\n	at org.apache.ibatis.executor.statement.PreparedStatementHandler.update(PreparedStatementHandler.java:47)\n	at org.apache.ibatis.executor.statement.RoutingStatementHandler.update(RoutingStatementHandler.java:74)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\n	at com.sun.proxy.$Proxy251.update(Unknown Source)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.apache.ibatis.plugin.Invocation.proceed(Invocation.java:49)\n	at org.springblade.core.mp.plugins.SqlLogInterceptor.intercept(SqlLogInterceptor.java:117)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:61)\n	at com.sun.proxy.$Proxy251.update(Unknown Source)\n	at com.baomidou.mybatisplus.core.executor.MybatisSimpleExecutor.doUpdate(MybatisSimpleExecutor.java:54)\n	at org.apache.ibatis.executor.BaseExecutor.update(BaseExecutor.java:117)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.update(DefaultSqlSession.java:197)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.insert(DefaultSqlSession.java:184)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:426)\n	... 117 more\n', 'org.springframework.dao.DataIntegrityViolationException', '\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n### The error may exist in org/springblade/modules/desk/mapper/StudentMapper.java (best guess)\n### The error may involve org.springblade.modules.desk.mapper.StudentMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO blade_student (no, name, sex, birthday, create_user, create_time, update_user, update_time, status, is_deleted) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', 247, '127.0.0.1', 'org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator', 'SQLErrorCodeSQLExceptionTranslator.java', 'doTranslate', '', NULL, 'admin', '2020-04-30 14:12:01');
COMMIT;

-- ----------------------------
-- Table structure for blade_log_usual
-- ----------------------------
DROP TABLE IF EXISTS `blade_log_usual`;
CREATE TABLE `blade_log_usual` (
  `id` bigint(64) NOT NULL COMMENT '编号',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `service_id` varchar(32) DEFAULT NULL COMMENT '服务ID',
  `server_host` varchar(255) DEFAULT NULL COMMENT '服务器名',
  `server_ip` varchar(255) DEFAULT NULL COMMENT '服务器IP地址',
  `env` varchar(255) DEFAULT NULL COMMENT '系统环境',
  `log_level` varchar(10) DEFAULT NULL COMMENT '日志级别',
  `log_id` varchar(100) DEFAULT NULL COMMENT '日志业务id',
  `log_data` text COMMENT '日志数据',
  `method` varchar(10) DEFAULT NULL COMMENT '操作方式',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `remote_ip` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `method_class` varchar(255) DEFAULT NULL COMMENT '方法类',
  `method_name` varchar(255) DEFAULT NULL COMMENT '方法名',
  `user_agent` varchar(1000) DEFAULT NULL COMMENT '用户代理',
  `params` text COMMENT '操作提交的数据',
  `time` datetime DEFAULT NULL COMMENT '执行时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='通用日志表';

-- ----------------------------
-- Table structure for blade_menu
-- ----------------------------
DROP TABLE IF EXISTS `blade_menu`;
CREATE TABLE `blade_menu` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父级菜单',
  `code` varchar(255) DEFAULT NULL COMMENT '菜单编号',
  `name` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `alias` varchar(255) DEFAULT NULL COMMENT '菜单别名',
  `path` varchar(255) DEFAULT NULL COMMENT '请求地址',
  `source` varchar(255) DEFAULT NULL COMMENT '菜单资源',
  `sort` int(2) DEFAULT NULL COMMENT '排序',
  `category` int(2) DEFAULT NULL COMMENT '菜单类型',
  `action` int(2) DEFAULT '0' COMMENT '操作按钮类型',
  `is_open` int(2) DEFAULT '1' COMMENT '是否打开新页面',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='菜单表';

-- ----------------------------
-- Records of blade_menu
-- ----------------------------
BEGIN;
INSERT INTO `blade_menu` VALUES (1123598812738675202, 1123598815738675201, 'student', '学生', 'menu', '/desk/student', 'iconfont iconicon_sms', 1, 1, 0, 1, '', 0);
INSERT INTO `blade_menu` VALUES (1123598812738675203, 1123598812738675202, 'student_add', '新增', 'add', '/desk/student/add', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598812738675204, 1123598812738675202, 'student_edit', '修改', 'edit', '/desk/student/edit', 'form', 2, 2, 1, 2, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598812738675205, 1123598812738675202, 'student_delete', '删除', 'delete', '/api/blade-desk/student/remove', 'delete', 3, 2, 1, 3, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598812738675206, 1123598812738675202, 'student_view', '查看', 'view', '/desk/student/view', 'file-text', 4, 2, 1, 2, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675201, 0, 'desk', '工作台', 'menu', '/desk', 'iconfont iconicon_airplay', 1, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675202, 1123598815738675201, 'notice', '通知公告', 'menu', '/desk/notice', 'iconfont iconicon_sms', 1, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675203, 0, 'system', '系统管理', 'menu', '/system', 'iconfont iconicon_setting', 2, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675204, 1123598815738675203, 'user', '用户管理', 'menu', '/system/user', 'iconfont iconicon_principal', 1, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675205, 1123598815738675203, 'dept', '部门管理', 'menu', '/system/dept', 'iconfont iconicon_group', 2, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675206, 1123598815738675203, 'dict', '字典管理', 'menu', '/system/dict', 'iconfont iconicon_addresslist', 3, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675207, 1123598815738675203, 'menu', '菜单管理', 'menu', '/system/menu', 'iconfont iconicon_subordinate', 4, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675208, 1123598815738675203, 'role', '角色管理', 'menu', '/system/role', 'iconfont iconicon_boss', 5, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675209, 1123598815738675203, 'param', '参数管理', 'menu', '/system/param', 'iconfont iconicon_community_line', 6, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675210, 0, 'monitor', '系统监控', 'menu', '/monitor', 'iconfont icon-yanzhengma', 3, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675211, 1123598815738675210, 'doc', '接口文档', 'menu', 'http://localhost/doc.html', 'iconfont iconicon_study', 1, 1, 0, 2, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675212, 1123598815738675210, 'admin', '服务治理', 'menu', 'http://localhost:7002', 'iconfont icon-canshu', 2, 1, 0, 2, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675213, 1123598815738675210, 'log', '日志管理', 'menu', '/monitor/log', 'iconfont iconicon_doc', 3, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675214, 1123598815738675213, 'log_usual', '通用日志', 'menu', '/monitor/log/usual', NULL, 1, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675215, 1123598815738675213, 'log_api', '接口日志', 'menu', '/monitor/log/api', NULL, 2, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675216, 1123598815738675213, 'log_error', '错误日志', 'menu', '/monitor/log/error', NULL, 3, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675217, 0, 'tool', '研发工具', 'menu', '/tool', 'iconfont icon-wxbgongju', 4, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675218, 1123598815738675217, 'code', '代码生成', 'menu', '/tool/code', 'iconfont iconicon_savememo', 1, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675219, 1123598815738675202, 'notice_add', '新增', 'add', '/desk/notice/add', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675220, 1123598815738675202, 'notice_edit', '修改', 'edit', '/desk/notice/edit', 'form', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675221, 1123598815738675202, 'notice_delete', '删除', 'delete', '/api/blade-desk/notice/remove', 'delete', 3, 2, 3, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675222, 1123598815738675202, 'notice_view', '查看', 'view', '/desk/notice/view', 'file-text', 4, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675223, 1123598815738675204, 'user_add', '新增', 'add', '/system/user/add', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675224, 1123598815738675204, 'user_edit', '修改', 'edit', '/system/user/edit', 'form', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675225, 1123598815738675204, 'user_delete', '删除', 'delete', '/api/blade-user/remove', 'delete', 3, 2, 3, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675226, 1123598815738675204, 'user_role', '角色配置', 'role', NULL, 'user-add', 4, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675227, 1123598815738675204, 'user_reset', '密码重置', 'reset-password', '/api/blade-user/reset-password', 'retweet', 5, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675228, 1123598815738675204, 'user_view', '查看', 'view', '/system/user/view', 'file-text', 6, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675229, 1123598815738675205, 'dept_add', '新增', 'add', '/system/dept/add', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675230, 1123598815738675205, 'dept_edit', '修改', 'edit', '/system/dept/edit', 'form', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675231, 1123598815738675205, 'dept_delete', '删除', 'delete', '/api/blade-system/dept/remove', 'delete', 3, 2, 3, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675232, 1123598815738675205, 'dept_view', '查看', 'view', '/system/dept/view', 'file-text', 4, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675233, 1123598815738675206, 'dict_add', '新增', 'add', '/system/dict/add', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675234, 1123598815738675206, 'dict_edit', '修改', 'edit', '/system/dict/edit', 'form', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675235, 1123598815738675206, 'dict_delete', '删除', 'delete', '/api/blade-system/dict/remove', 'delete', 3, 2, 3, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675236, 1123598815738675206, 'dict_view', '查看', 'view', '/system/dict/view', 'file-text', 4, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675237, 1123598815738675207, 'menu_add', '新增', 'add', '/system/menu/add', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675238, 1123598815738675207, 'menu_edit', '修改', 'edit', '/system/menu/edit', 'form', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675239, 1123598815738675207, 'menu_delete', '删除', 'delete', '/api/blade-system/menu/remove', 'delete', 3, 2, 3, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675240, 1123598815738675207, 'menu_view', '查看', 'view', '/system/menu/view', 'file-text', 4, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675241, 1123598815738675208, 'role_add', '新增', 'add', '/system/role/add', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675242, 1123598815738675208, 'role_edit', '修改', 'edit', '/system/role/edit', 'form', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675243, 1123598815738675208, 'role_delete', '删除', 'delete', '/api/blade-system/role/remove', 'delete', 3, 2, 3, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675244, 1123598815738675208, 'role_view', '查看', 'view', '/system/role/view', 'file-text', 4, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675245, 1123598815738675209, 'param_add', '新增', 'add', '/system/param/add', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675246, 1123598815738675209, 'param_edit', '修改', 'edit', '/system/param/edit', 'form', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675247, 1123598815738675209, 'param_delete', '删除', 'delete', '/api/blade-system/param/remove', 'delete', 3, 2, 3, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675248, 1123598815738675209, 'param_view', '查看', 'view', '/system/param/view', 'file-text', 4, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675249, 1123598815738675214, 'log_usual_view', '查看', 'view', '/monitor/log/usual/view', 'file-text', 4, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675250, 1123598815738675215, 'log_api_view', '查看', 'view', '/monitor/log/api/view', 'file-text', 4, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675251, 1123598815738675216, 'log_error_view', '查看', 'view', '/monitor/log/error/view', 'file-text', 4, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675252, 1123598815738675218, 'code_add', '新增', 'add', '/tool/code/add', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675253, 1123598815738675218, 'code_edit', '修改', 'edit', '/tool/code/edit', 'form', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675254, 1123598815738675218, 'code_delete', '删除', 'delete', '/api/blade-system/code/remove', 'delete', 3, 2, 3, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675255, 1123598815738675218, 'code_view', '查看', 'view', '/tool/code/view', 'file-text', 4, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675256, 1123598815738675203, 'tenant', '租户管理', 'menu', '/system/tenant', 'iconfont icon-quanxian', 7, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675257, 1123598815738675256, 'tenant_add', '新增', 'add', '/system/tenant/add', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675258, 1123598815738675256, 'tenant_edit', '修改', 'edit', '/system/tenant/edit', 'form', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675259, 1123598815738675256, 'tenant_delete', '删除', 'delete', '/api/blade-system/tenant/remove', 'delete', 3, 2, 3, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675260, 1123598815738675256, 'tenant_view', '查看', 'view', '/system/tenant/view', 'file-text', 4, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675261, 1123598815738675203, 'client', '应用管理', 'menu', '/system/client', 'iconfont iconicon_mobilephone', 8, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675262, 1123598815738675261, 'client_add', '新增', 'add', '/system/client/add', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675263, 1123598815738675261, 'client_edit', '修改', 'edit', '/system/client/edit', 'form', 2, 2, 2, 2, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675264, 1123598815738675261, 'client_delete', '删除', 'delete', '/api/blade-system/client/remove', 'delete', 3, 2, 3, 3, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675265, 1123598815738675261, 'client_view', '查看', 'view', '/system/client/view', 'file-text', 4, 2, 2, 2, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675266, 1123598815738675217, 'datasource', '数据源管理', 'menu', '/tool/datasource', 'iconfont icon-caidanguanli', 2, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675267, 1123598815738675266, 'datasource_add', '新增', 'add', '/tool/datasource/add', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675268, 1123598815738675266, 'datasource_edit', '修改', 'edit', '/tool/datasource/edit', 'form', 2, 2, 2, 2, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675269, 1123598815738675266, 'datasource_delete', '删除', 'delete', '/api/blade-develop/datasource/remove', 'delete', 3, 2, 3, 3, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675270, 1123598815738675266, 'datasource_view', '查看', 'view', '/tool/datasource/view', 'file-text', 4, 2, 2, 2, NULL, 0);
INSERT INTO `blade_menu` VALUES (1164733389668962251, 1123598815738675203, 'post', '岗位管理', 'menu', '/system/post', 'iconfont iconicon_message', 2, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1164733389668962252, 1164733389668962251, 'post_add', '新增', 'add', '/system/post/add', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1164733389668962253, 1164733389668962251, 'post_edit', '修改', 'edit', '/system/post/edit', 'form', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1164733389668962254, 1164733389668962251, 'post_delete', '删除', 'delete', '/api/blade-system/post/remove', 'delete', 3, 2, 3, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1164733389668962255, 1164733389668962251, 'post_view', '查看', 'view', '/system/post/view', 'file-text', 4, 2, 2, 1, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_notice
-- ----------------------------
DROP TABLE IF EXISTS `blade_notice`;
CREATE TABLE `blade_notice` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `category` int(11) DEFAULT NULL COMMENT '类型',
  `release_time` datetime DEFAULT NULL COMMENT '发布时间',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='通知公告表';

-- ----------------------------
-- Records of blade_notice
-- ----------------------------
BEGIN;
INSERT INTO `blade_notice` VALUES (1123598818738675223, '000000', '测试公告', 3, '2018-12-31 20:03:31', '222', 1123598821738675201, '2018-12-05 20:03:31', 1123598821738675201, '2018-12-28 11:10:51', 1, 0);
INSERT INTO `blade_notice` VALUES (1123598818738675224, '000000', '测试公告2', 1, '2018-12-05 20:03:31', '333', 1123598821738675201, '2018-12-28 10:32:26', 1123598821738675201, '2018-12-28 11:10:34', 1, 0);
INSERT INTO `blade_notice` VALUES (1123598818738675225, '000000', '测试公告3', 6, '2018-12-29 00:00:00', '11111', 1123598821738675201, '2018-12-28 11:03:44', 1123598821738675201, '2018-12-28 11:10:28', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_param
-- ----------------------------
DROP TABLE IF EXISTS `blade_param`;
CREATE TABLE `blade_param` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `param_name` varchar(255) DEFAULT NULL COMMENT '参数名',
  `param_key` varchar(255) DEFAULT NULL COMMENT '参数键',
  `param_value` varchar(255) DEFAULT NULL COMMENT '参数值',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='参数表';

-- ----------------------------
-- Records of blade_param
-- ----------------------------
BEGIN;
INSERT INTO `blade_param` VALUES (1123598819738675201, '是否开启注册功能', 'account.registerUser', 'true', '开启注册', 1123598821738675201, '2018-12-28 12:19:01', 1123598821738675201, '2018-12-28 12:19:01', 1, 0);
INSERT INTO `blade_param` VALUES (1123598819738675202, '账号初始密码', 'account.initPassword', '123456', '初始密码', 1123598821738675201, '2018-12-28 12:19:01', 1123598821738675201, '2018-12-28 12:19:01', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_post
-- ----------------------------
DROP TABLE IF EXISTS `blade_post`;
CREATE TABLE `blade_post` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `category` int(11) DEFAULT NULL COMMENT '岗位类型',
  `post_code` varchar(12) DEFAULT NULL COMMENT '岗位编号',
  `post_name` varchar(64) DEFAULT NULL COMMENT '岗位名称',
  `sort` int(2) DEFAULT NULL COMMENT '岗位排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '岗位描述',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='岗位表';

-- ----------------------------
-- Records of blade_post
-- ----------------------------
BEGIN;
INSERT INTO `blade_post` VALUES (1123598817738675201, '000000', 1, 'ceo', '首席执行官', 1, '总经理', 1123598821738675201, 1123598813738675201, '2020-04-01 00:00:00', 1123598821738675201, '2020-04-01 00:00:00', 1, 0);
INSERT INTO `blade_post` VALUES (1123598817738675202, '000000', 1, 'coo', '首席运营官', 2, '常务总经理', 1123598821738675201, 1123598813738675201, '2020-04-01 00:00:00', 1123598821738675201, '2020-04-01 00:00:00', 1, 0);
INSERT INTO `blade_post` VALUES (1123598817738675203, '000000', 1, 'cfo', '首席财务官', 3, '财务总经理', 1123598821738675201, 1123598813738675201, '2020-04-01 00:00:00', 1123598821738675201, '2020-04-01 00:00:00', 1, 0);
INSERT INTO `blade_post` VALUES (1123598817738675204, '000000', 1, 'cto', '首席技术官', 4, '技术总监', 1123598821738675201, 1123598813738675201, '2020-04-01 00:00:00', 1123598821738675201, '2020-04-01 00:00:00', 1, 0);
INSERT INTO `blade_post` VALUES (1123598817738675205, '000000', 1, 'cio', '首席信息官', 5, '信息总监', 1123598821738675201, 1123598813738675201, '2020-04-01 00:00:00', 1123598821738675201, '2020-04-01 00:00:00', 1, 0);
INSERT INTO `blade_post` VALUES (1123598817738675206, '000000', 2, 'pm', '技术经理', 6, '研发和产品是永远的朋友', 1123598821738675201, 1123598813738675201, '2020-04-01 00:00:00', 1123598821738675201, '2020-04-01 00:00:00', 1, 0);
INSERT INTO `blade_post` VALUES (1123598817738675207, '000000', 2, 'hrm', '人力经理', 7, '人力资源部门工作管理者', 1123598821738675201, 1123598813738675201, '2020-04-01 00:00:00', 1123598821738675201, '2020-04-01 00:00:00', 1, 0);
INSERT INTO `blade_post` VALUES (1123598817738675208, '000000', 3, 'staff', '普通员工', 8, '普通员工', 1123598821738675201, 1123598813738675201, '2020-04-01 00:00:00', 1123598821738675201, '2020-04-01 00:00:00', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_role
-- ----------------------------
DROP TABLE IF EXISTS `blade_role`;
CREATE TABLE `blade_role` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父主键',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `role_alias` varchar(255) DEFAULT NULL COMMENT '角色别名',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Records of blade_role
-- ----------------------------
BEGIN;
INSERT INTO `blade_role` VALUES (1123598816738675201, '000000', 0, '超级管理员', 1, 'administrator', 0);
INSERT INTO `blade_role` VALUES (1123598816738675202, '000000', 0, '用户', 2, 'user', 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `blade_role_menu`;
CREATE TABLE `blade_role_menu` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `menu_id` bigint(64) DEFAULT NULL COMMENT '菜单id',
  `role_id` bigint(64) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色菜单表';

-- ----------------------------
-- Records of blade_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `blade_role_menu` VALUES (1255739836556402690, 1123598815738675201, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836577374210, 1123598812738675202, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836594151426, 1123598812738675203, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836602540034, 1123598812738675204, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836615122945, 1123598812738675205, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836627705857, 1123598812738675206, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836644483073, 1123598815738675202, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836657065985, 1123598815738675219, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836673843202, 1123598815738675220, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836686426114, 1123598815738675221, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836699009026, 1123598815738675222, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836707397634, 1123598815738675203, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836719980546, 1123598815738675204, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836736757762, 1123598815738675223, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836749340674, 1123598815738675224, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836761923585, 1123598815738675225, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836774506498, 1123598815738675226, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836787089410, 1123598815738675227, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836803866625, 1123598815738675228, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836816449537, 1123598815738675205, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836824838145, 1123598815738675229, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836837421058, 1123598815738675230, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836850003969, 1123598815738675231, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836862586881, 1123598815738675232, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836879364097, 1123598815738675206, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836887752705, 1123598815738675233, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836900335618, 1123598815738675234, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836912918529, 1123598815738675235, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836921307138, 1123598815738675236, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836938084353, 1123598815738675207, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836950667266, 1123598815738675237, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836963250178, 1123598815738675238, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836975833089, 1123598815738675239, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739836984221698, 1123598815738675240, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837000998914, 1123598815738675208, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837009387521, 1123598815738675241, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837021970433, 1123598815738675242, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837034553345, 1123598815738675243, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837042941954, 1123598815738675244, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837055524866, 1123598815738675209, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837072302081, 1123598815738675245, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837080690690, 1123598815738675246, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837089079298, 1123598815738675247, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837101662209, 1123598815738675248, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837114245122, 1123598815738675256, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837122633729, 1123598815738675257, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837139410945, 1123598815738675258, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837147799554, 1123598815738675259, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837156188161, 1123598815738675260, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837168771073, 1123598815738675261, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837181353986, 1123598815738675262, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837189742594, 1123598815738675263, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837202325505, 1123598815738675264, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837214908417, 1123598815738675265, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837223297025, 1164733389668962251, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837235879938, 1164733389668962252, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837244268546, 1164733389668962253, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837256851457, 1164733389668962254, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837269434370, 1164733389668962255, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837282017281, 1123598815738675210, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837294600194, 1123598815738675211, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837307183106, 1123598815738675212, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837319766018, 1123598815738675213, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837328154626, 1123598815738675214, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837340737537, 1123598815738675249, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837353320449, 1123598815738675215, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837365903362, 1123598815738675250, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837374291969, 1123598815738675216, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837386874881, 1123598815738675251, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837403652098, 1123598815738675217, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837412040706, 1123598815738675218, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837428817921, 1123598815738675252, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837437206530, 1123598815738675253, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837449789441, 1123598815738675254, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837458178049, 1123598815738675255, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837470760961, 1123598815738675266, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837483343873, 1123598815738675267, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837491732482, 1123598815738675268, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837504315394, 1123598815738675269, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1255739837516898305, 1123598815738675270, 1123598816738675201);
COMMIT;

-- ----------------------------
-- Table structure for blade_student
-- ----------------------------
DROP TABLE IF EXISTS `blade_student`;
CREATE TABLE `blade_student` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `no` varchar(64) DEFAULT NULL COMMENT '学号',
  `name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(64) DEFAULT NULL COMMENT '性别',
  `birthday` datetime DEFAULT NULL COMMENT '出生日期',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学生表';

-- ----------------------------
-- Records of blade_student
-- ----------------------------
BEGIN;
INSERT INTO `blade_student` VALUES (34657457657, '000000', '1', '1', '1', '2020-04-30 14:07:07', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `blade_student` VALUES (1255742878534090753, '000000', '1', 'kuzank', 'man', '2020-04-21 12:00:00', 1123598821738675201, NULL, '2020-04-30 14:16:47', 1123598821738675201, '2020-04-30 14:16:47', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_tenant
-- ----------------------------
DROP TABLE IF EXISTS `blade_tenant`;
CREATE TABLE `blade_tenant` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) NOT NULL COMMENT '租户ID',
  `tenant_name` varchar(50) NOT NULL COMMENT '租户名称',
  `linkman` varchar(20) DEFAULT NULL COMMENT '联系人',
  `contact_number` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='租户表';

-- ----------------------------
-- Records of blade_tenant
-- ----------------------------
BEGIN;
INSERT INTO `blade_tenant` VALUES (1123598820738675201, '000000', '管理组', 'admin', '666666', '管理组', 1123598821738675201, '2019-01-01 00:00:39', 1123598821738675201, '2019-01-01 00:00:39', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_user
-- ----------------------------
DROP TABLE IF EXISTS `blade_user`;
CREATE TABLE `blade_user` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `code` varchar(12) DEFAULT NULL COMMENT '用户编号',
  `account` varchar(45) DEFAULT NULL COMMENT '账号',
  `password` varchar(45) DEFAULT NULL COMMENT '密码',
  `name` varchar(20) DEFAULT NULL COMMENT '昵称',
  `real_name` varchar(10) DEFAULT NULL COMMENT '真名',
  `avatar` varchar(2000) DEFAULT NULL COMMENT '头像',
  `email` varchar(45) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(45) DEFAULT NULL COMMENT '手机',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `sex` smallint(6) DEFAULT NULL COMMENT '性别',
  `role_id` varchar(1000) DEFAULT NULL COMMENT '角色id',
  `dept_id` varchar(1000) DEFAULT NULL COMMENT '部门id',
  `post_id` varchar(1000) DEFAULT NULL COMMENT '岗位id',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of blade_user
-- ----------------------------
BEGIN;
INSERT INTO `blade_user` VALUES (1123598821738675201, '000000', NULL, 'admin', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', '管理员', '管理员', '', 'admin@bladex.vip', '22233322', '2018-08-08 00:00:00', 1, '1123598816738675201', '1123598813738675201', '1123598817738675201', 1123598821738675201, '2018-08-08 00:00:00', 1123598821738675201, '2018-08-08 00:00:00', 1, 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
