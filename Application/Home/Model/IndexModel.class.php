<?phpnamespace Home\Model;use Think\Model;class IndexModel extends Model{    public function __construct($name = '') {        parent::__construct($name);            }        static function I(){        return new IndexModel;    }    public function getAllSort($num=10,$type='1'){        $where['state'] = 1;        $where['type'] = $type;        $result = M('sort')->where($where)->limit($num)->order('`order` DESC')->select();        return $result;    }        public function getArticleList($sort_id,$num){        if(!$sort_id || !$num) return false;        $where['state'] = 1;        $where['sort_id'] = $sort_id;        $result = M('article')->where($where)->limit($num)->order('`order` DESC')->select();        return $result;    }        public function getIndexArticle($num){        $where['state'] = 1;        $where['tuijian'] = 1;        $result = M('article')->where($where)->limit($num)->order('`order` DESC,aid DESC')->select();        return $result;    }}