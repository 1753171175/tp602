<?php
namespace app\controller;

use app\BaseController;
use think\facade\Request;
use think\facade\View;
use think\facade\Db;

class Auth extends BaseController
{
    public function login()
    {
    	if($this->is_post()){
	    	$username = Request::param('username','');
	    	$password = Request::param('password','');
	    	$admin = Db::table('admin')->where('username',$username)->find();//var_dump($admin);exit;
	    	if(!empty($admin) && $admin->id>0){
	    		var_dump($admin);exit;
	    	}else{
	    		return $this->over(200,'操作成功鸟了啊',2000,'http://www.baidu.com','info');
	    	}
    	}
    	//$userId = Db::name('user')->insertGetId($data);
    	View::assign('bl01','第一个变量');
    	View::assign('list',['zhangsan','李四','今天天气不错','abd']);
    	return View::fetch();
    }
}
