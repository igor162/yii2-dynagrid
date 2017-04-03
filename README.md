yii2-dynagrid
=================
The **yii2-dynagrid**  module is a great complementary addition to the [igor162/yii2-grid](https://github.com/igor162/yii2-grid) module, enhancing
it with personalization features. It turbo charges your grid view by making it dynamic and personalized for each user. It allows users the ability to 
set and save their own grid configuration.
Installation
------------

The preferred way to install this extension is through [composer](http://getcomposer.org/download/).

Either run

```
php composer.phar require --prefer-dist igor162/yii2-dynagrid "*"
```

or add

```
"igor162/yii2-dynagrid": "*"
```

to the require section of your `composer.json` file.


Usage
-----

Once the extension is installed, simply use it in your code by  :

```php
<?= \igor162\dynagrid\DynaGrid::widget(); ?>```