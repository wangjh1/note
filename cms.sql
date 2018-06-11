CREATE TABLE `cms_article_base` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `column_id` int(11) NOT NULL COMMENT '栏目ID',
  `article_title` varchar(256) NOT NULL COMMENT '标题',
  `article_sub_title` varchar(256) DEFAULT '' COMMENT '副标题',
  `article_redirect_url` varchar(256) DEFAULT '' COMMENT '跳转链接',
  `article_url_alias` varchar(256) DEFAULT '' COMMENT '别名',
  `article_thumb` varchar(256) DEFAULT '' COMMENT '缩略图',
  `article_thumbs` varchar(1024) DEFAULT '' COMMENT '缩略图(多图)',
  `article_describe` varchar(255) DEFAULT '' COMMENT '文章摘要',
  `category_id` tinyint(2)NOT NULL COMMENT '文章类型',
  `article_body` text NOT NULL COMMENT '文章摘要',
  `article_category_id` smallint(4) unsigned NOT NULL COMMENT '所属分类',
  `article_favorite_count` int(11) NOT NULL DEFAULT '0' COMMENT '收藏数',
  `article_view_count` int(11) NOT NULL DEFAULT '0' COMMENT '查看数',
  `article_comment_count` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `article_agree_count` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `article_against_count` int(11) NOT NULL DEFAULT '0' COMMENT '点踩数',
  `tag_id` int(11) DEFAULT '0' COMMENT '标签id',
  `user_id` int(11) NOT NULL COMMENT '作者ID',
  `user_name` varchar(64) DEFAULT '' COMMENT '作者',
  `article_created_at` int(11) NOT NULL COMMENT '添加时间',
  `article_updated_at` int(11) NOT NULL COMMENT '修改时间',
  `article_recommend` int(1) DEFAULT '0' COMMENT '是否推荐:0-否;1-是',
  `article_headline` int(1) DEFAULT '0' COMMENT '是否头条:0-否;1-是',
  `article_allow_comment` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许评论:0-否;1-是',
  `article_sort` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `article_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态(BOOL):0-待审核;1-已审核;2-拒绝',
  `article_template` varchar(50) NOT NULL DEFAULT '' COMMENT '模板',
  `article_seo_title` varchar(200) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `article_seo_keywords` varchar(200) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `article_seo_description` varchar(200) NOT NULL DEFAULT '' COMMENT 'SEO描述',
  PRIMARY KEY (`article_id`) USING BTREE,
  KEY `category_id` (`category_id`,`article_sort`) USING BTREE,
  KEY `article_title` (`article_title`) USING BTREE,
  KEY `category_id_3` (`category_id`,`article_status`,`article_sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='文章内容';
CREATE TABLE `cms_article_category` (
  `category_id` smallint(4) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `category_name` varchar(50) NOT NULL COMMENT '分类名称',
  `category_parent_id` int(6) NOT NULL DEFAULT '0',
  `category_image_url` varchar(100) NOT NULL,
  `category_keywords` varchar(100) NOT NULL COMMENT '分类关键词',
  `category_desc` varchar(255) NOT NULL COMMENT '分类描述',
  `category_count` smallint(4) NOT NULL COMMENT '分类内容数量',
  `category_template` varchar(255) NOT NULL COMMENT '分类模板',
  `category_alias` varchar(50) NOT NULL DEFAULT '',
  `category_order` tinyint(255) unsigned NOT NULL DEFAULT '50' COMMENT '分类排序',
  `category_buildin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '系统内置(ENUM):0-非内置;1-内置;',
  PRIMARY KEY (`category_id`) USING BTREE,
  UNIQUE KEY `category_name` (`category_name`) USING BTREE,
  KEY `category_parent_id` (`category_parent_id`,`category_order`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='文章分类';

CREATE TABLE `cms_column_base` (
 `column_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
 `column_name` varchar(256) NOT NULL COMMENT '栏目名称',
 `column_type` varchar(256) NOT NULL COMMENT '栏目类型',
 `category_id` tinyint(2)NOT NULL COMMENT '文章类型',
 `column_paraent_id` int(11) NOT NULL COMMENT '父栏目类型',
 `column_thumb` varchar(256) DEFAULT '' COMMENT '缩略图',
 `column_keywords` varchar(256) DEFAULT '' COMMENT '关键字',
 `column_describe` varchar(255) DEFAULT '' COMMENT '描述',
 `column_alias` varchar(255) DEFAULT '' COMMENT '自定义名称',
 `column_list_template` varchar(255) DEFAULT '' COMMENT '列表页模板',
 `column_detail_template` varchar(255) DEFAULT '' COMMENT '详情页模板',
 `column_page_limit` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '分页大小',
 `column_sort` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
 `column_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态(BOOL):0-不可用;1-可用',
 `column_created_at` int(11) NOT NULL COMMENT '添加时间',
 `column_updated_at` int(11) NOT NULL COMMENT '修改时间',
 PRIMARY KEY (`column_id`) USING BTREE
)ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='栏目表';

CREATE TABLE `cms_article_comment` (
  `comment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论Id',
  `article_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `comment_user_ip` varchar(100) NOT NULL DEFAULT '' COMMENT '评论者的IP地址 ',
  `comment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '评论的日期和时间',
  `comment_content` text NOT NULL COMMENT '评论内容 ',
  `comment_karma` int(11) NOT NULL DEFAULT '0' COMMENT '评论的karma值 ',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1' COMMENT '评论许可（0，1，或''spam''） ',
  `comment_agent` varchar(255) NOT NULL DEFAULT '' COMMENT '评论代理（浏览器，操作系统等） ',
  `comment_type` varchar(20) NOT NULL DEFAULT '' COMMENT '有意义的评论类型（pingback|trackback），常规评论类型时为空 ',
  `comment_parent_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '评论者登录后的用户编号（未登录则为0） ',
  `comment_helpful_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '有帮助数',
  `comment_is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示(BOOL):1-显示;0-不显示',
  PRIMARY KEY (`comment_id`) USING BTREE,
  KEY `comment_post_id` (`article_id`) USING BTREE,
  KEY `comment_approved_date_gmt` (`comment_approved`) USING BTREE,
  KEY `comment_parent` (`comment_parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='文章评论表';

CREATE TABLE `cms_article_tag` (
  `tag_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `tag_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `tag_count` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '分类内容数量',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='文章标签表';

CREATE TABLE `cms_article_tag_relationship` (
  `tag_relationship_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` mediumint(8) NOT NULL,
  `tag_id` smallint(4) NOT NULL DEFAULT '0',
  `tag_relationship_order` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tag_relationship_id`) USING BTREE,
  KEY `term_taxonomy_id` (`tag_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='文章标签关系表';

CREATE TABLE `web_page_app` (
  `app_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用编号',
  `app_name` varchar(1024) NOT NULL DEFAULT '' COMMENT '应用名称',
  `app_code` text NOT NULL COMMENT '应用代码',
  `tpl_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模板编号',
  `tpl_image` varchar(255) NOT NULL DEFAULT '',
  `store_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '所属店铺',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户',
  `subsite_id` mediumint(4) unsigned NOT NULL DEFAULT '0' COMMENT '所属分站:0-总站',
  `app_buildin` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否内置(BOOL):0-否;1-是',
  `app_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型(ENUM):1-WAP;2-PC;3-App',
  `app_tpl` text NOT NULL COMMENT '应用模板',
  `app_member_center` text NOT NULL COMMENT '个人中心',
  PRIMARY KEY (`app_id`),
  UNIQUE KEY `tpl_id` (`store_id`,`tpl_id`,`app_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='店铺风格表';

CREATE TABLE `web_page_base` (
  `page_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '页面编号',
  `page_name` varchar(20) NOT NULL DEFAULT '' COMMENT '页面名称',
  `store_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '所属店铺',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户',
  `subsite_id` mediumint(4) unsigned NOT NULL DEFAULT '0' COMMENT '所属分站:0-总站',
  `page_buildin` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否内置(BOOL):0-否;1-是',
  `page_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型(ENUM):1-WAP;2-PC;3-APP',
  `page_tpl` text NOT NULL COMMENT '页面布局模板',
  `app_id` int(10) NOT NULL DEFAULT '0' COMMENT '所属APP',
  `page_code` text NOT NULL COMMENT '页面代码',
  `page_nav` text NOT NULL,
  `page_config` varchar(255) NOT NULL DEFAULT '',
  `page_share_title` varchar(255) NOT NULL DEFAULT '',
  `page_share_image` varchar(255) NOT NULL DEFAULT '',
  `page_qrcode` varchar(255) NOT NULL DEFAULT '',
  `page_index` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否首页(BOOL):0-非首页;1-首页',
  PRIMARY KEY (`page_id`),
  KEY `store_id` (`app_id`,`store_id`,`page_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='页面表';

CREATE TABLE `web_page_module` (
  `pm_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pm_name` varchar(20) NOT NULL COMMENT '模块名称',
  `page_id` bigint(20) NOT NULL,
  `user_id` mediumint(8) NOT NULL COMMENT '所属用户',
  `pm_color` varchar(20) NOT NULL COMMENT '颜色',
  `pm_type` varchar(10) NOT NULL COMMENT '所在页面',
  `module_id` varchar(10) NOT NULL COMMENT '模版',
  `pm_utime` datetime NOT NULL COMMENT '更新时间',
  `pm_order` smallint(3) unsigned NOT NULL DEFAULT '1' COMMENT '排序',
  `pm_enable` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `pm_html` varchar(10000) NOT NULL COMMENT '模块html代码',
  `pm_json` varchar(10000) NOT NULL DEFAULT '[]' COMMENT '模块JSON代码(JSON)',
  `subsite_id` mediumint(4) NOT NULL DEFAULT '0' COMMENT '所属分站Id:0-总站',
  `pm_position` varchar(255) NOT NULL DEFAULT '' COMMENT 'column_left:content_top',
  PRIMARY KEY (`pm_id`),
  KEY `page_id` (`page_id`,`pm_enable`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='页面模块表';