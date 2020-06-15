<?php
declare (strict_types = 1);

namespace app;

use think\App;
use think\exception\ValidateException;
use think\Validate;
use think\facade\Session;
use think\facade\Request;
use think\facade\View;

/**
 * 控制器基础类
 */
abstract class BaseController
{
    /**
     * Request实例
     * @var \think\Request
     */
    protected $request;

    /**
     * 应用实例
     * @var \think\App
     */
    protected $app;

    /**
     * 是否批量验证
     * @var bool
     */
    protected $batchValidate = false;

    /**
     * 控制器中间件
     * @var array
     */
    protected $middleware = [];

    /**
     * 构造方法
     * @access public
     * @param  App  $app  应用对象
     */
    public function __construct(App $app)
    {
    	echo 'BaseController __construct() ~~~~<br/>';
        $this->app     = $app;
        $this->request = $this->app->request;
        
        // 控制器初始化
        $this->initialize();
    }

    // 初始化
    protected function initialize()
    {
    	echo 'BaseController initialize() 333 ~~~~<br/>';
    }

    /**
     * 验证数据
     * @access protected
     * @param  array        $data     数据
     * @param  string|array $validate 验证器名或者验证规则数组
     * @param  array        $message  提示信息
     * @param  bool         $batch    是否批量验证
     * @return array|string|true
     * @throws ValidateException
     */
    protected function validate(array $data, $validate, array $message = [], bool $batch = false)
    {
        if (is_array($validate)) {
            $v = new Validate();
            $v->rule($validate);
        } else {
            if (strpos($validate, '.')) {
                // 支持场景
                [$validate, $scene] = explode('.', $validate);
            }
            $class = false !== strpos($validate, '\\') ? $validate : $this->app->parseClass('validate', $validate);
            $v     = new $class();
            if (!empty($scene)) {
                $v->scene($scene);
            }
        }

        $v->message($message);

        // 是否批量验证
        if ($batch || $this->batchValidate) {
            $v->batch(true);
        }

        return $v->failException(true)->check($data);
    }
    
    
    protected function check_session_admin()
    {
    	$admin = $this->get_session_admin();
    	if(!empty($admin) && $admin['id']>0)
    	{
    		return $admin;
    	}else{
    		return false;
    	}
    }
    
    
    protected function get_session_admin()
    {
    	return Session::get('admin');
    }
    
    
    protected function is_post()
    {
    	$post = Request::param('dopost',false);
    	if($post==true || $post==1){
    		return true;
    	}return false;
    }
    
    /**
     * 消息提示
     * @param number $code 大于0表示操作成功，小于0表示操作失败
     * @param string $info 提示文字信息
     * @param number $time 停留时间
     * @param string $link 跳转地址
     * @param string $ico 图标
     * @return 消息提示页面
     */
    protected function over($code=-200,$info='操作失败',$time=3000,$link='',$ico='error')
    {
    	View::assign('code',$code);
    	View::assign('info',$info);
    	View::assign('time',$time);
    	View::assign('link',$link);
    	View::assign('ico',$ico);
    	return View::fetch('/over');
    }

}
