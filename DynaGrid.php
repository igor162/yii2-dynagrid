<?php
/**
 * Created by PhpStorm.
 * User: igor
 * Date: 12.03.17
 * Time: 22:41
 */

namespace igor162\dynagrid;

use Yii;

use igor162\grid\GridView;

use kartik\dynagrid\DynaGrid as KartikDynaGrid;
use kartik\dynagrid\DynaGridStore as KartikDynaGridStore;

use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\web\JsExpression;

class DynaGrid extends KartikDynaGrid
{

    /**
     * @inheritdoc
     */
    public function run()
    {
        echo Html::tag('div', GridView::widget($this->gridOptions), $this->options);
        parent::run();
    }

    /**
     * Sets the personalization toggle button
     *
     * @param string $cat the category 'grid', 'filter', or 'sort'
     */
    protected function setToggleButton($cat)
    {
        $setting = 'toggleButton' . ucfirst($cat);
        $btnClass = ($this->matchPanelStyle && $cat == 'grid' && !empty($this->gridOptions['panel'])) ?
            'btn btn-' . ArrayHelper::getValue($this->gridOptions['panel'], 'type', 'default') :
            'btn btn-default';
        Html::addCssClass($this->$setting, $btnClass.' btn-sm');
        if ($cat == KartikDynaGridStore::STORE_GRID) {
            $this->toggleButtonGrid = ArrayHelper::merge([
                'label' => '<i class="glyphicon glyphicon-cog"></i>',
                'title' => Yii::t('kvdynagrid', 'Personalize grid settings'),
                'data-pjax' => false
            ], $this->toggleButtonGrid);
        } else {
            $this->$setting = ArrayHelper::merge([
                'label' => "<i class='glyphicon glyphicon-{$cat}'></i>",
                'title' => Yii::t('kvdynagrid', "Save / edit grid {category}", ['category' => static::getCat($cat)]),
                'data-pjax' => false
            ], $this->$setting);
        }
    }

}