<?php
namespace app;

use think\App;
use app\BaseController;

class SafeController extends BaseController
{
    /**
     * 构造方法
     * @access public
     * @param  App  $app  应用对象
     */
	public function __construct(App $app)
	{
		echo 'SafeController __construct() ~~~~<br/>';
		parent::__construct($app);
    	$admin = $this->check_session_admin();
    	if (!empty($admin) && $admin['id']>0)
    	{
    		return true;
    	}else{
    		header('Location: http://localhost/tp602/public/index.php/auth/login');exit;
    		//header('Location: http://www.thinkphp.cn');exit;
    	}
    }
}
