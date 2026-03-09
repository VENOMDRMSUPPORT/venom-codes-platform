<?php

use WHMCS\ClientArea;

define('CLIENTAREA', true);

require __DIR__ . '/init.php';

$ca = new ClientArea();
$ca->setPageTitle('Privacy Policy');
$ca->addToBreadCrumb('index.php', Lang::trans('globalsystemname'));
$ca->addToBreadCrumb('privacy.php', 'Privacy Policy');
$ca->initPage();
$ca->setTemplate('privacy');
$ca->output();
