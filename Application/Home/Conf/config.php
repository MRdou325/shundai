<?php
return array(
	/* 模板相关配置 */
    'TMPL_PARSE_STRING' => array(
        '__STATIC__' => __ROOT__ . '/Public/static',
        '__THEMES__' => __ROOT__ . '/Public/' ,
        '__MODULE__' => __ROOT__ . '/Public/' . MODULE_NAME,
        '__ADDONS__' => __ROOT__ . '/Public/' . MODULE_NAME . '/Addons',
        '__IMG__'    => __ROOT__ . '/Public/' . MODULE_NAME . '/images',
        '__CSS__'    => __ROOT__ . '/Public/' . MODULE_NAME . '/css',
        '__JS__'     => __ROOT__ . '/Public/' . MODULE_NAME . '/js',
        '__SIMPLEBOOT__'     => __ROOT__ . '/Public/' . MODULE_NAME . '/simpleboot',
        '__BS__'     => __ROOT__ . '/Public/' . MODULE_NAME . '/bootstrap',
        '__BS_CSS__'     => __ROOT__ . '/Public/' . MODULE_NAME . '/bootstrap/css',
        '__BS_JS__'     => __ROOT__ . '/Public/' . MODULE_NAME . '/bootstrap/js',
		'__NEW_JS__'     => __ROOT__ . '/Public/' . MODULE_NAME . '/New/js',
		'__NEW_CSS__'     => __ROOT__ . '/Public/' . MODULE_NAME . '/New/css',
        '__NEW_IMG__'     => __ROOT__ . '/Public/' . MODULE_NAME . '/New/images',

    ),
    'TMPL_ACTION_ERROR'     =>  'Public:jump', // 默认错误跳转对应的模板文件
    'TMPL_ACTION_SUCCESS'   =>  'Public:jump', // 默认成功跳转对应的模板文件
    // 'TMPL_EXCEPTION_FILE'   =>  THINK_PATH.'Tpl/think_exception.tpl',// 异常页面的模板文件
    /* 图片上传相关配置 */
    'PICTURE_UPLOAD' => array(
        'mimes'    => '', //允许上传的文件MiMe类型
        'maxSize'  => 2*1024*1024, //上传的文件大小限制 (0-不做限制)
        'exts'     => 'jpg,gif,png,jpeg,ico', //允许上传的文件后缀
        'autoSub'  => false, //自动子目录保存文件
        'subName'  => '', //子目录创建方式，[0]-函数名，[1]-参数，多个参数使用数组
        'rootPath' => './Uploads/avatar_img/', //保存根路径
        'savePath' => '', //保存路径
        'saveName' => array('uniqid', ''), //上传文件命名规则，[0]-函数名，[1]-参数，多个参数使用数组
        'saveExt'  => '', //文件保存后缀，空则使用原后缀
        'replace'  => false, //存在同名是否覆盖
        'hash'     => true, //是否生成hash编码
        'callback' => false, //检测文件是否存在回调函数，如果存在返回文件信息数组
    ), //图片上传相关配置（文件上传类配置）
    'PICTURE_UPLOAD_DRIVER'=>'local',
    //本地上传文件驱动配置
    'UPLOAD_LOCAL_CONFIG'=>array(),
);