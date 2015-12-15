<?php

namespace Home\Controller;
use Think\Controller;
use Think\Page;
use Think\Upload;
use Home\Model\MemberModel;
use Admin\Model\NavModel;

class HomeController extends Controller {

    public $my;
    public $mod;
    public $act;
  
    public $pre;

    public function _initialize() {
        /* 读取站点配置 */
        $config = api('Config/lists');
        C($config); //添加配置
        
        if(!C('WEB_SITE_CLOSE')){
            $this->error('站点已经关闭，请稍后访问~');
        }
        // define(WEB_SITE_TITLE, C('WEB_SITE_TITLE'));
        // define(TONGJI, C('TONGJI'));
        C('DEFAULT_THEME',C('HOME_DEFAULT_THEME'));
      
        define(UID, is_login());
         if (UID) {    
            $this->my = D('Member')->info(UID);
            $this->assign('my', $this->my);  
        }
      
        $this->mod = MODULE_NAME;
        $this->act = CONTROLLER_NAME;
        $this->pre = C('DB_PREFIX');
     
        $this->nav();
        $this->friendlink();
        $this->hotArticle();
        $this->metatags();
        $this->searchkeyword();
        $this->support();
        $this->assign('setting', $this->setting);
        $this->assign('mod', strtolower($this->mod));
        $this->assign('act', strtolower($this->act));
        $this->assign('my', $this->my);
    }

    private function support(){
        $support = M('support')->where(array("status"=>1))->order("sort desc")->select();
        $this->assign("support", $support);
    }

    private function searchkeyword(){
        $search = M('search_keyword')->where(array("isshow"=>1))->order("times desc")->select();
        $this->assign("searchkeyword",$search);
    }

    private function metatags(){
        $home_title = C('WEB_SITE_TITLE');
        $home_keyword = C('WEB_SITE_KEYWORD');
        $home_description = C('WEB_SITE_DESCRIPTION');
        switch (CONTROLLER_NAME) {
            case 'Goods':
                if(ACTION_NAME == "cate")
                {
                    $cate = M("Category_goods")->find(I('id'));
                    if($cate)
                    {
                        $site_title = $cate["category_name"] . "-" . $home_title;
                        $site_keyword = $cate["category_name"] . "," . $home_keyword;
                        $site_description = $cate["category_name"] . "." . $home_description;
                    }
                }else if(ACTION_NAME == "info"){
                    $goods = M("goods")->find(I('id'));
                    if($goods)
                    {
                        $site_title = $goods["seo_title"] ? $goods["seo_title"] : $home_title;
                        $site_keyword = $goods["seo_keywords"] ? $goods["seo_keywords"] : $home_keyword;
                        $site_description = $goods["seo_description"] ? $goods["seo_description"] : $home_description;
                    }
                }
                break;
            case 'Page':
                $page = M("page")->find(I('id'));
                if($page)
                {
                    $site_title = $page["seo_title"] ? $page["seo_title"] : $page["name"] . "-" . $home_title;
                    $site_keyword = $page["seo_keywords"] ? $page["seo_keywords"] : $page["name"] . "-" . $home_keyword;
                    $site_description = $page["seo_description"] ? $page["seo_description"] : $page["name"] . "-" . $home_description;
                }
                break;
            default:
                $site_title = $home_title;
                $site_keyword = $home_keyword;
                $site_description = $home_description;
                break;
        }
        $this->assign('site_title', $site_title);
        $this->assign('site_keyword', $site_keyword);
        $this->assign('site_description', $site_description);
    }


    private function nav() {
        $NavModel = new NavModel(); 
        
        $nav = $NavModel->order('sort ASC')->limit(9)->select();
        
        if(!empty($_SERVER['QUERY_STRING'])){
            $this->assign('nav_url',$_SERVER['REQUEST_URI']);
           
        }
        
        $this->assign('nav', $nav);
    }

    private function friendlink() {
        
        $flink = M('friendlink')->where(array("state" => 1))->order('sort ASC')->limit(9)->select();
        
        $this->assign('flink', $flink);
    }

    private function hotArticle() {
        $where['status'] = 1;
        $where['type'] = 2;
   
        $cate = M('Category')->where($where)->limit(8)->order('`sort` DESC,cate_id DESC')->select();
        foreach ($cate as $k => $v) {
            $map['status'] = 1;
            $map['cate_id'] = $v['cate_id'];
            $article[$v['cate_id']] = M('Article')->where($map)->limit(3)->order('`sort` DESC,aid DESC')->select();
        }
        $this->assign('article', $article);
        $this->assign('cate', $cate);
    }

    public function isLogin($referer = "") {
        if (empty($this->my)) {
            if (false && $referer) {
                $this->error(L('error_member_no_login'), U('User/login', array('referer' => $referer)));
            } else {
                $this->error(L('error_member_no_login'), U('User/login'));
            }
        }
    }
 
    public function iniPage($count, $listRows = 20) {
        import('ORG.Util.Page');
        return new Page($count, $listRows);
    }

    public function saveFile($path, $size = 3145728, $exts = array('jpg', 'gif', 'png', 'jpeg')) {
        import('ORG.Net.UploadFile');
        $upload = new Upload(); // 实例化上传类
        $upload->maxSize = $size; // 设置附件上传大小
        $upload->thumb = true;
        $upload->thumbMaxWidth = "236";
        $upload->thumbMaxHeight = "150";
        $upload->allowExts = $exts; // 设置附件上传类型
        $upload->rootPath = "./Uploads/avatar_img/"; // 设置头像上传目录
        $upload->exts     = array('jpg', 'gif', 'png', 'jpeg');
        $upload->savePaht = $path.'/';
        $info   = $upload->upload($_FILES);
        
        if($info){ //文件上传成功，记录文件信息
            
        }else {
            return array('state' => -1, 'msg' => $upload->getError());
        }
       
        return array('state' => 1, 'img' => $info);
    }

    public function myCheckToken($data = '') {
        $data == '' && $data = $_POST;
        if (!M()->autoCheckToken($_POST))
            $this->myError('error_token');
    }
    /**
     * 获取控制器菜单数组,二级菜单元素位于一级菜单的'_child'元素中
     * @author 朱亚杰  <xcoolcc@gmail.com>
     */
    final public function getMenus($controller=CONTROLLER_NAME){
        // $menus  =   session('ADMIN_MENU_LIST'.$controller);
        if(empty($menus)){
            // 获取主菜单
            $where['pid']   =   0;
            $where['hide']  =   0;
            if(!C('DEVELOP_MODE')){ // 是否开发者模式
                $where['is_dev']    =   0;
            }
            $menus['main']  =   M('Menu')->where($where)->order('sort asc')->select();
    
            $menus['child'] = array(); //设置子节点
    
            //高亮主菜单
            $current = M('Menu')->where("url like '%{$controller}/".ACTION_NAME."%'")->field('id')->find();
            if($current){
                $nav = D('Menu')->getPath($current['id']);
                $nav_first_title = $nav[0]['title'];
    
                foreach ($menus['main'] as $key => $item) {
                    if (!is_array($item) || empty($item['title']) || empty($item['url']) ) {
                        $this->error('控制器基类$menus属性元素配置有误');
                    }
                    if( stripos($item['url'],MODULE_NAME)!==0 ){
                        $item['url'] = MODULE_NAME.'/'.$item['url'];
                    }
                    // 判断主菜单权限
                    if ( !IS_ROOT && !$this->checkRule($item['url'],AuthRuleModel::RULE_MAIN,null) ) {
                        unset($menus['main'][$key]);
                        continue;//继续循环
                    }
    
                    // 获取当前主菜单的子菜单项
                    if($item['title'] == $nav_first_title){
                        $menus['main'][$key]['class']='current';
                        //生成child树
                        $groups = M('Menu')->where("pid = {$item['id']}")->distinct(true)->field("`group`")->select();
                        if($groups){
                            $groups = array_column($groups, 'group');
                        }else{
                            $groups =   array();
                        }
    
                        //获取二级分类的合法url
                        $where          =   array();
                        $where['pid']   =   $item['id'];
                        $where['hide']  =   0;
                        if(!C('DEVELOP_MODE')){ // 是否开发者模式
                            $where['is_dev']    =   0;
                        }
                        $second_urls = M('Menu')->where($where)->getField('id,url');
    
                        if(!IS_ROOT){
                            // 检测菜单权限
                            $to_check_urls = array();
                            foreach ($second_urls as $key=>$to_check_url) {
                                if( stripos($to_check_url,MODULE_NAME)!==0 ){
                                    $rule = MODULE_NAME.'/'.$to_check_url;
                                }else{
                                    $rule = $to_check_url;
                                }
                                if($this->checkRule($rule, AuthRuleModel::RULE_URL,null))
                                    $to_check_urls[] = $to_check_url;
                            }
                        }
                        // 按照分组生成子菜单树
                        foreach ($groups as $g) {
                            $map = array('group'=>$g);
                            if(isset($to_check_urls)){
                                if(empty($to_check_urls)){
                                    // 没有任何权限
                                    continue;
                                }else{
                                    $map['url'] = array('in', $to_check_urls);
                                }
                            }
                            $map['pid'] =   $item['id'];
                            $map['hide']    =   0;
                            if(!C('DEVELOP_MODE')){ // 是否开发者模式
                                $map['is_dev']  =   0;
                            }
                            $menuList = M('Menu')->where($map)->field('id,pid,title,url,tip')->order('sort asc')->select();
                            $menus['child'][$g] = list_to_tree($menuList, 'id', 'pid', 'operater', $item['id']);
                        }
                        if($menus['child'] === array()){
                            //$this->error('主菜单下缺少子菜单，请去系统=》后台菜单管理里添加');
                        }
                    }
                }
            }
            // session('ADMIN_MENU_LIST'.$controller,$menus);
        }
        return $menus;
    }
    /**
     * 通用分页列表数据集获取方法
     *
     *  可以通过url参数传递where条件,例如:  index.html?name=asdfasdfasdfddds
     *  可以通过url空值排序字段和方式,例如: index.html?_field=id&_order=asc
     *  可以通过url参数r指定每页数据条数,例如: index.html?r=5
     *
     * @param sting|Model  $model   模型名或模型实例
     * @param array        $where   where查询条件(优先级: $where>$_REQUEST>模型设定)
     * @param array|string $order   排序条件,传入null时使用sql默认排序或模型属性(优先级最高);
     *                              请求参数中如果指定了_order和_field则据此排序(优先级第二);
     *                              否则使用$order参数(如果$order参数,且模型也没有设定过order,则取主键降序);
     *
     * @param array        $base    基本的查询条件
     * @param boolean      $field   单表模型用不到该参数,要用在多表join时为field()方法指定参数
     * @author 朱亚杰 <xcoolcc@gmail.com>
     *
     * @return array|false
     * 返回数据集
     */
    protected function lists ($model,$where=array(),$order='',$base = array('status'=>array('egt',0)),$field=true){
        $options    =   array();
        $REQUEST    =   (array)I('request.');
        if(is_string($model)){
            $model  =   M($model);
        }
    
        $OPT        =   new \ReflectionProperty($model,'options');
        $OPT->setAccessible(true);
    
        $pk         =   $model->getPk();
        if($order===null){
            //order置空
        }else if ( isset($REQUEST['_order']) && isset($REQUEST['_field']) && in_array(strtolower($REQUEST['_order']),array('desc','asc')) ) {
            $options['order'] = '`'.$REQUEST['_field'].'` '.$REQUEST['_order'];
        }elseif( $order==='' && empty($options['order']) && !empty($pk) ){
            $options['order'] = $pk.' desc';
        }elseif($order){
            $options['order'] = $order;
        }
        unset($REQUEST['_order'],$REQUEST['_field']);
    
        $options['where'] = array_filter(array_merge( (array)$base, /*$REQUEST,*/ (array)$where ),function($val){
            if($val===''||$val===null){
                return false;
            }else{
                return true;
            }
        });
        if( empty($options['where'])){
            unset($options['where']);
        }
        $options      =   array_merge( (array)$OPT->getValue($model), $options );
        $total        =   $model->where($options['where'])->count();
    
        if( isset($REQUEST['r']) ){
            $listRows = (int)$REQUEST['r'];
        }else{
            $listRows = C('LIST_ROWS') > 0 ? C('LIST_ROWS') : 10;
        }
        $page = new \Think\Page($total, $listRows, $REQUEST);
        if($total>$listRows){
            $page->setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');
        }
        $p =$page->show();
        $this->assign('_page', $p? $p: '');
        $this->assign('_total',$total);
        $options['limit'] = $page->firstRow.','.$page->listRows;
    
        $model->setProperty('options',$options);
    
        return $model->field($field)->select();
    }

}
