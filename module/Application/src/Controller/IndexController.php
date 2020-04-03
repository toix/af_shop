<?php
/**
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2016 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Application\Controller;

use Application\model\ArticlesModel;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class IndexController extends AbstractActionController
{
    public function indexAction()
    {
        $articles = ArticlesModel::get_article_list();

        $view_vars = [
            'articles'  => $articles,
        ];

        $view_model = new ViewModel($view_vars);
        $view_model->setTemplate('application/article_list.phtml');
        return $view_model;
    }

    public function detailAction()
    {
        $id = $this->params()->fromPost('id');
        $articles = ArticlesModel::get_article_detail($id);

        $view_vars = [
            'articles'  => $articles,
        ];

        $view_model = new ViewModel($view_vars);
        $view_model->setTemplate('application/article_detail.phtml');
        return $view_model;
    }
}
