<?php
namespace Home\Controller;
use User\Api\UserApi;
use Home\Model\GoodsModel;
class UserController extends HomeController{
    public function index(){
        $this->isLogin();
        $this->display();
    }

    public function unFavor(){
        $this->isLogin();
        if(IS_POST){
            $goodsId = I('id');
            if(D('Member')->delFavor(UID, $goodsId)){
                $this->success('取消成功');   
            }else{
                $this->success('您没有收藏该商品');   
            }            
        }
    }

    public function favor(){
        $this->isLogin();
        $op = ggp('op');
        if($op=='do'){
            $goods_id = ggp('id:i');
            if(D('Member')->addFavor($this->my['uid'], $goods_id)){
                $this->success('收藏成功');   
            }else{
                $this->success('您已经收藏该商品');   
            }            
        }
        $pre = getPre();
        $goods = M()->field('g.*')
                ->table("{$pre}favor f")
                        ->join("{$pre}goods g on f.goods_id=g.goods_id")
                                ->where("f.uid='{$this->my['uid']}'")
                                        ->select();
        $this->assign('goods',$goods);
        $this->display();
    }
    
   
    public function register($username = '', $password = '', $repassword = '', $email = '', $mobile = '', $verify = ''){
        if(!C('USER_ALLOW_REGISTER')){
            $this->error('注册已关闭');
        }
		if(IS_POST){ //注册用户
			
			/* 检测密码 */
			if($password != $repassword){
				$this->error('密码和重复密码不一致！');
			}			

			/* 调用注册接口注册用户 */
            $User = new UserApi;
			$uid = $User->register($username, $password, $email, $mobile);
			if(0 < $uid){ //注册成功
				//TODO: 发送验证邮件
				$this->success('注册成功！',U('login'));
			} else { //注册失败，显示错误信息
				$this->error($this->showRegError($uid));
			}

		} else { //显示注册表单
			$this->display();
		}
	}
    
    public function isSign($sign){
        return intval(date('Ymd',$sign)) == intval(date('Ymd',TIME));
    }
    
    public function sign(){
        $this->isLogin();
        $member = $this->my;
        if($this->setting['score_sign2'] && (intval(date('Ymd',$member['sign'])) - intval(date('Ymd',TIME))===1)){
            D('Member')->incJf($member['uid'],$this->setting['score_sign2']);
            D('Member')->where("uid='{$member['uid']}'")->save(array('sign'=>TIME));
            $this->success("连续签到成功,增加{$this->setting['score_sign2']}点积分");
        }else if($this->isSign($member['sign'])){
            $this->error('今天已经签过到');
        }else{
            D('Member')->incJf($member['uid'],$this->setting['score_sign']);
            D('Member')->where("uid='{$member['uid']}'")->save(array('sign'=>TIME));
            $this->success("签到成功,增加{$this->setting['score_sign']}点积分");
        }
    }

   
    public function login($username = '', $password = '', $verify = ''){
      
        if(IS_POST){
            /* 调用UC登录接口登录 */
			$user = new UserApi;
			$uid = $user->login($username, $password);
            if(0 < $uid){ //UC登录成功
				/* 登录用户 */
				$Member = D('Member');
				if($Member->login($uid)){ //登录用户
					//TODO:跳转到登录前页面
					$this->success('登录成功！',U('Home/Index/index'));
					
				} else {
					$this->error($Member->getError());
				}

			 } else { //登录失败
				switch($uid) {
					case -1: $error = '用户不存在或被禁用！'; break; //系统级别禁用
					case -2: $error = '密码错误！'; break;
					default: $error = '未知错误！'; break; // 0-接口参数错误（调试阶段使用）
				}
				$this->error($error);
			 }
        }else {
            $this->display();
        }
       
    }

    public function resetPassword(){
        $this->isLogin();
       
        if(IS_POST){
            $oldPassWord = I('oldPassWord');
            $data['password'] = I('newPassWord');
            $newPassWord2 = I('newPassWord2');
            if($data['password'] != $newPassWord2){
                $this->error('两次密码不一致');
            }
   
            $Api    =   new UserApi();
            $res    =   $Api->updateInfo(UID, $oldPassWord, $data);
            if($res['status']){
                $this->success('修改密码成功！');
                
            }else{
                $this->error($res['info']);
            }
           
        }else {
            $this->display();
        }
        
    }

    public function logout(){
        if(is_login()){
            D('Member')->logout();
            session('[destroy]');
            $this->redirect(MODULE_NAME . '/Index/index');
            // $this->success('退出成功！', U('login'));
        } else {
            $this->redirect('login');
        }
        $this->success(L('msg_member_logout_success'));
    }

    public function forgetpwd(){
        sendMail($mail,$msg);
        $this->success('新密码已发送至您注册邮箱，请及时修改密码！');
    }
    
    public function avatar(){
       
        if(IS_POST){
            if ($_FILES['avatar']['size']) {
                $dir=date('Ym');
                $info = $this->saveFile($dir);
                if ($info['state'] > 0) {
                    $p['avatar'] = './Uploads/avatar_img/'.$info['img']['avatar']['savepath'].$info['img']['avatar']['savename'];
                    
                } else {
                    $this->error($info['msg']);
                }
                D('Member')->where("uid='".UID."'")->save($p);
                $this->success('操作成功');
                  
            }
            $this->error('请上传头像');
        }else {
            $this->assign("msg",I('msg'));
            $this->display();
        }
       
    }

    private function create_rand_str($leng){
            $rand_str = "";
            $str="abcdefghijklmnopqrstuvwxyz0123456789";
            for($i=0;$i<$leng;$i++){
                    $rand_str .= $str[mt_rand(0, strlen($str)-1)];
            }
            return $rand_str;
    }

    private function create_rand_num($leng){
            $rand_str = "";
            $str="0123456789";
            for($i=0;$i<$leng;$i++){
                    $rand_str .= $str[mt_rand(0, strlen($str)-1)];
            }
            return $rand_str;
    }
    /**
     * 获取用户注册错误信息
     * @param  integer $code 错误编码
     * @return string        错误信息
     */
    private function showRegError($code = 0){
        switch ($code) {
            case -1:  $error = '用户名长度必须在16个字符以内！'; break;
            case -2:  $error = '用户名被禁止注册！'; break;
            case -3:  $error = '用户名被占用！'; break;
            case -4:  $error = '密码长度必须在6-30个字符之间！'; break;
            case -5:  $error = '邮箱格式不正确！'; break;
            case -6:  $error = '邮箱长度必须在1-32个字符之间！'; break;
            case -7:  $error = '邮箱被禁止注册！'; break;
            case -8:  $error = '邮箱被占用！'; break;
            case -9:  $error = '手机格式不正确！'; break;
            case -10: $error = '手机被禁止注册！'; break;
            case -11: $error = '手机号被占用！'; break;
            default:  $error = '未知错误';
        }
        return $error;
    }

    public function Cropavatar(){
        $img = I("img");
        $x = I("x1");
        $y = I("y1");
        $w = I("width");
        $h = I("height");echo ".".$img;
        if(file_exists(".".$img)){
            $image = new \Think\Image(); 
            $image->open(".".$img);
            $image->crop($w, $h, $x, $y)->save('./Uploads/avatar_img/'.UID.'.jpg');
            $p['avatar'] = './Uploads/avatar_img/'.UID.'.jpg';
            D('Member')->where("uid='".UID."'")->save($p);
            $this->redirect('avatar',array("msg","保存成功"));
        }
    }

    public function orders()
    {
        $orders = M('orders')->where(array('userid'=>UID))->select();
        $goodsModel = new GoodsModel();
        foreach ($orders as $k => $v) {
            $goods = $goodsModel->info($v["goods_id"]);
            $orders[$k]["pic_url"] = $goods["pic_url"];
            $orders[$k]["goods_type"] = $goods["goods_type"];
            $orders[$k]["city"] = $goods["city"];
            $orders[$k]["days"] = $goods["days"];
            $orders[$k]["traffic"] = $goods["traffic"];
            $orders[$k]["aheaddays"] = $goods["aheaddays"];
            $orders[$k]["maxdays"] = $goods["maxdays"];
            $orders[$k]["audition"] = $goods["audition"];
            $orders[$k]["invite"] = $goods["invite"];
            $orders[$k]["title"] = $orders[$k]["goods_name"];
            if($goods["goods_type"] == 2)
            {
                $orders[$k]["item_body"] = $goods["item_body"];
            }
        }
        $this->assign("orders", $orders);
        $this->display();
    }
}