<?php
namespace Home\Controller;
use Think\Controller;
use Think\Page;
class AppInterfaceController extends Controller {
	protected $pagesize = 1;
	/*
	 * 登录
	 */
	public function login(){
		$array = array();
		$array['code'] = 0;
		$array['msg'] = '成功';
		$nickname = I("nickname");
		$qq = I("qq");
		$platform = I("platform");
		$email = I("email");
		$phone = I("phone");
		if(empty($nickname)){
			$array['code'] = 1;
			$array['msg'] = '用户昵称不能为空';
			echo json_encode($array);exit;
		}
	    if(empty($platform)){
			$array['code'] = 1;
			$array['msg'] = '平台类型不能为空';
			echo json_encode($array);exit;
		}
	   if($platform!='1'&&$platform!=2){
			$array['code'] = 1;
			$array['msg'] = '平台类型参数错误';
			echo json_encode($array);exit;
		}
		$data = array();
		$data['userName'] = $nickname;
                $data['userPwd'] = md5($nickname);
		$data['qq'] = $qq;
		$data['platform'] = $platform;
		$data['phone'] = $phone;
		$data['email'] = $email;
		$data['createTime'] = time();
		$user = D("user");
		if(!$this->is_login($nickname, $platform)){			
		    $result = $user->create($data);
		}else{
			$condition = array();
			$condition['userName'] = $nickname;
			$condition['platform'] = $platform;
		    $updatedata['loginTime'] = time();
		    $result = $user->where($condition)->save($updatedata);
		}
		
		if($result){
			$result = $this->getUserInfo($nickname);
			$array['data'] = $result;
		}
		echo json_encode($array);exit;
		
	}
	/*
	 * 检查是否用户是否存在
	 */
	public function is_login($nickname,$platform){
		$user = D("user");
		$where = array();
		if(!empty($nickname)){
		  $where['username'] = $nickname;
		}
	   if(!empty($platform)){
		  $where['platform'] = $platform;
		}
		$result = $user->where($where)->select();
		if($result){
		   return true;
		}else{
		   return false;
		}
		
	}
	/*
	 * 根据userName 获取用户信息
	 */
	public function getUserInfo($nickname){
		$user = D("user");
		$where = array();
		if(!empty($nickname)){
		   $where['userName'] = $nickname;
		}
		$result = $user->where($where)->select();
		return $result;
		
	}
    /*
     * 获取活动列表
     */
    public function activityList(){
    	$array = array('code'=>0,'msg'=>'成功');
    	$result = array();
    	$userid = I("userid");
    	$curentpage = I("curentpage",1);   	
    	$type = I("type",0);
        $where = array();
        if($type!=0&&$type!=1&&$type!=2){
          $array['code'] = 1;
          $array['msg'] = '活动类型参数不合法';
          echo json_encode($array);
          exit;
        }
        $where['type'] = array('eq',$type);
        if(!empty($userid)){
           $where['useid'] = array('eq',$userid);
        }
        $activity = M("activity");
        // 进行分页数据查询 注意page方法的参数的前面部分是当前的页数使用 $_GET[p]获取
		$list = $activity->where($where)->order('createtime')->page($curentpage.",".$this->pagesize)->select();
		$count = $activity->where($where)->count();// 查询满足要求的总记录数
		$result = $array;
		$result['data'] = $list;
		$result['totalRow'] = $count;
		$result['curentpage'] =$curentpage;
        echo json_encode($result);
        exit;
    	
    }
    /*
     * 获取活动分类
     */
    public function activityCategory(){
    	$array = array('code'=>0,'msg'=>'成功');
    	$result = array();
    	$feed = I("feed",0);
    	$userid = I("userid");
        if($feed!=0&&$feed!=1){
        	$array['code'] = 1;
	        $array['msg'] = '活动类型参数不合法';
	        echo json_encode($array);
	        exit;
        } 
        
        if($feed ==1&&!empty($userid)){
            $yql_feed = D("feed");
            $category = D("category");
            $result = array();
            $feed_where = array('userid'=>$userid);
            $feed_result = $yql_feed->where($feed_where)->select();
            $result['code'] = 0;
            $result['msg'] ='成功';
             foreach ($feed_result as $key=>$value){
                $feed_condition = array('categoryid'=>$value['categoryid']);
                $list[$key] = $category->where($feed_condition)->field('categoryname,categoryid')->find(); 
                $result['data'][$key] = $list[$key];
            }
           echo json_encode($result);
           exit;
            
        }else{ 
            $category = D("category");
            $list = $category->select();  
            $result = $array;
            $result['data'] = $list;
            echo json_encode($result);
            exit;
         }
            
    }
        
    	
    /*
     * 活动内容保存
     */
    public function saveActivity(){
    	$array = array('code'=>0,'msg'=>'成功');
    	$result = array();
    	$userid = I("userid");
    	$activityid = I("activityid");
    	$categoryid = I("categoryid");
    	$address = I("address");
    	$starttime = I("starttime");
    	$endtime = I("endtime");
    	$content = I("content");
    	$phone = I("phone");
    	$province = I("province");
    	$city = I("city");
    	$area = I("area");
    	$cost = I("cost");
        if(empty($userid)){
                $array['code'] = 1;
	        $array['msg'] = '你还未登录';
	        echo json_encode($array);
	        exit;
        }
    	if(empty($categoryid)){
                $array['code'] = 1;
	        $array['msg'] = '活动类别不能为空';
	        echo json_encode($array);
	        exit;	
    	}
        if(empty($address)){
                $array['code'] = 1;
	        $array['msg'] = '活动详细地点不能为空';
	        echo json_encode($array);
	        exit;	
    	}
        if(empty($starttime)){
                $array['code'] = 1;
	        $array['msg'] = '活动开始时间不能为空';
	        echo json_encode($array);
	        exit;	
    	}
        if(empty($endtime)){
                $array['code'] = 1;
	        $array['msg'] = '活动结束时间不能为空';
	        echo json_encode($array);
	        exit;	
    	}
        if(empty($content)){
                $array['code'] = 1;
	        $array['msg'] = '活动内容不能为空';
	        echo json_encode($array);
	        exit;	
    	}
       if(empty($province)){
                $array['code'] = 1;
	        $array['msg'] = '活动省信息不能为空';
	        echo json_encode($array);
	        exit;	
    	}
       if(empty($city)){
                $array['code'] = 1;
	        $array['msg'] = '活动城市信息不能为空';
	        echo json_encode($array);
	        exit;	
    	}
       if(empty($area)){
                $array['code'] = 1;
	        $array['msg'] = '活动区县信息不能为空';
	        echo json_encode($array);
	        exit;	
    	}
    	
    	$activity = D("activity");
    	$data = array(  'activityid'=>$activityid,
                        'categoryid'=>$categoryid,
                        'address'   =>$address,
                        'starttime' =>$starttime,
                        'endtime'   =>$endtime,
                        'content'   =>$content,
                        'phone'     =>$phone,
                        'province'  =>$province,
                        'city'      =>$city,
                        'area'      =>$area,
                        'cost'      =>$cost
                );
        
        if(empty($userid)){			
		    $result = $activity->create($data);
		}else{
			$condition = array();
			$condition['userid'] = $userid;
			$condition['activityid'] = $activityid;
		    $result = $activity->where($condition)->save($data);
		}
                echo json_encode($array);
                exit;
                
    }
    /*
     * 获取活动详情
     */
    public function activityDetail(){
        $array = array('code'=>0,'msg'=>'成功');
        $userid = I("userid");
        $activityid = I("activityid");
        if(empty($userid)){
            $array['code'] = 1;
            $array['msg'] = '你未登录';
            echo json_encode($array);
            exit;
        }
        if(empty($activityid)){
            $array['code'] = 1;
            $array['msg'] = '活动参数错误';
            echo json_encode($array);
            exit;
        }
        $activity = D("activity");
        $where = array();
        $where['activityid'] = array('eq',$activityid);
        $where['userid'] = array('eq',$userid);
        $result = $activity->where($where)->select();
        $array['data'] = $result;
        echo json_encode($array);
        exit;
         	
    }
        /*
	 * 获取省市区
	 */
   public function getArea(){
   	$array = array();
        $array['code'] = 0;
        $array['msg'] ='获取成功';
   	$parentid = I("addressid",0);
   	$where = array('parentid'=>$parentid);
        $address = D("address");
        $result=$address->field('id,addressname,parentid')->where($where)->select();
        if(empty($result)){
           $array['code'] = 1;
           $array['msg'] = '获取失败';
           echo json_encode($array);exit;
        }
        $array['data'] = $result;
        echo json_encode($array);
        exit;
    }
    /*
     * 获取个人资料
     */
    public function userInfo(){
        $array = array('code'=>0,'msg'=>'成功');
        $userid = I("userid");
        if(empty($userid)){
            $array['code'] = 1;
            $array['msg'] = '你未登录';
            echo json_encode($array);
            exit;
        }
        $user = D("user");
        $where = array();
        $where['userid'] = array('eq',$userid);
        $result = $user->where($where)->select();
        $array['data'] = $result;
        echo json_encode($array);
        exit;
    	
    }
    /*
     * 订阅管理
     */
    public function feedManage(){
    	
    }
    /*
     * 我的消息
     */
    public function myMessage(){
    	
    }
    /*
     * 个人资料修改
     */
    public function saveUserInfo(){
     $array = array('code'=>0,'msg'=>'保存成功');
        $userid = I("userid");
        $photo = I("photo");
        $signature = I("signature");
        $nickname = I("nickname");
        $sex = I("sex");
        $telephone = I("telephone");
        if(empty($userid)){
            $array['code'] = 1;
            $array['msg'] = '你未登录';
            echo json_encode($array);
            exit;
        }
        $data = array();
        if(!empty($photo)){
            $data['photo'] = $photo;
        }
        if(!empty($signature)){
            $data['signature'] = $signature;
        }
        if(!empty($nickname)){
            $data['nickname'] = $nickname;
        }
        if(!empty($sex)){
            $data['sex'] = $sex;
        }
        if(!empty($telephone)){
            $data['telephone'] = $telephone;
        }
        $user = D("user");
        $where = array();
        $where['userid'] = array('eq',$userid);
        $result = $user->where($where)->save($data);
        if($result){
            echo json_encode($array);
            exit;
        }else{
            $array['code'] = 1;
            $array['msg'] = '保存失败';
            echo json_encode($array);
            exit;
        }
        
    }
    /*
     * 推送设置
     */
    public function pushManage(){
        $array = array('code'=>0,'msg'=>'设置成功');
        $data = array();
        $userid = I("userid");
        $starttime = I("starttime");
        $endtime = I("endtime");
        $push = I("push");
         if(empty($userid)){
            $array['code'] = 1;
            $array['msg'] = '你未登录';
            echo json_encode($array);
            exit;
        }
        if($push ==1){
            if(empty($starttime)){
                
            }
            if(empty($endtime)){
                
            }
        }
        $config = D("config");
        $user = D("user");
        if(!$this->is_login($nickname, $platform)){			
		    $result = $config->create($data);
		}else{
			$condition = array();
			$condition['userName'] = $nickname;
			$condition['platform'] = $platform;
		    $updatedata = array(
                          'starttime'=>$starttime,
                          'endtime'=>  $endtime,
                          'push' =>$push
                    );
		    $result = $user->where($condition)->save($updatedata);
		}
		
		if($result){
			echo json_encode($array);
                        exit;
                        
		}  else {
                    $array['code'] = 1;
                    $array['msg'] = '保存失败！';
                    echo json_encode($array);
                    exit;
                }
		
    }
    /*
     * 意见反馈
     */
    public function saveAdvice(){
    	$array = array('code'=>0,'msg'=>'发表成功');
        $userid = I("userid");
        if(empty($userid)){
            $array['code'] = 1;
            $array['msg'] = '你未登录';
            echo json_encode($array);
            exit;
        }
        $message = I("message");
        if(empty($message)){
            $array['code'] = 1;
            $array['msg'] = '意见反馈内容不能为空';
            echo json_encode($array);
            exit;
        }
        $data = array('userid' => $userid,
                      'message'=>$message,
                      'time'=>time()
            );
        $feedback = D("feedback");
        $where = array('userid'=>$where);
        $result = $feedback->where($where)->save($data);
        if($result){
            echo json_encode($array);
            exit;
        }  else {
            $array['code'] = 1;
            $array['msg'] = '保存失败';
            echo json_encode($array);
            exit;
        }
        
          
    }
    /*
     * 评论
     */
    public function saveComment(){
    	
    }
    /*
     * 活动加入、退出
     */
    public function activityManage(){
    	
    }
    /*
     * 好友列表/粉丝列表
     */
    public function friendList(){
    	
    }
    /*
     * 加入黑名单
     */
    public function addBlacklist(){
    	
    }
    /*
     * 关注/取消关注
     */
    public function fllowManage(){
    	$array = array('code' => 0, 'msg' => '操作成功');
    }
    /*
     * 关于我们
     */
    public function aboutus(){
    	$about = D("about");
    	$array = array('code' => 0, 'msg' => '获取成功');
    	$result = $about->where('aboutid=1')->select();
    	if($result){
    	  $array['data'] = $result;
    	  echo json_encode($array);
    	  exit;
    	}else{
    	  $array['code'] = 1;
    	  $array['msg'] = '获取失败';
    	  echo json_encode($array);
    	  exit;
    	}
    	
    
    }
    /*
     * 保存软件评分
     */
    public function grade(){
       $array = array('code'=>0,'msg'=>'保存成功');
       $userid = I("userid");
       $grade = I("grade");
       if(empty($userid)){
           $array['code'] = 1;
           $array['msg'] = '你还未登录';
           echo json_encode($array);
           exit;
       } 
       if(empty($grade)){
           $array['code'] = 1;
           $array['msg'] = '评分为空';
           echo json_encode($array);
           exit;
       } 
       $yql_grade = D("grade");
       $data = array(
           'userid'=>$userid,
           'grade'=>$grade
           );
       $result = $yql_grade->create($data);
       if($result){
           echo json_encode($array);
           exit;
       }else{
           $array['code'] = 1;
           $array['msg'] = '保存失败';
           echo json_encode($array);
           exit;
       }
    
    }
    /*
     * 获取软件评分信息
     */
    public function appInfo(){
        $array = array('code'=>0,'msg'=>'获取成功');
        $userid = I("userid");
        if(empty($userid)){
           $array['code'] = 1;
           $array['msg'] = '你还未登录';
           echo json_encode($array);
           exit;
       } 
       $yql_grade = D("grade");
       $result = $yql_grade->select();
        $num = 0;
       for($i=0;$i<count($result);$i++){
           $num = $result[$i]['grade']+$num;
       }
       $grade = array();
       $grade['grade'] = $num/count($result);
       $array['data'] = $grade;
       echo json_encode($array);
       exit;
    	
    }
}