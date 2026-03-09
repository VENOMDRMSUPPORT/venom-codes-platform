<?php

use WHMCS\ClientArea;

define('CLIENTAREA', true);

require __DIR__ . '/init.php';

$ca = new ClientArea();
$ca->setPageTitle('Terms of Service');
$ca->addToBreadCrumb('index.php', Lang::trans('globalsystemname'));
$ca->addToBreadCrumb('terms.php', 'Terms of Service');
$ca->initPage();
$ca->setTemplate('terms');
$ca->output();
