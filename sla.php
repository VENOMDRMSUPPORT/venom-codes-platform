<?php

use WHMCS\ClientArea;

define('CLIENTAREA', true);

require __DIR__ . '/init.php';

$ca = new ClientArea();
$ca->setPageTitle('Service Level Agreement');
$ca->addToBreadCrumb('index.php', Lang::trans('globalsystemname'));
$ca->addToBreadCrumb('sla.php', 'Service Level Agreement');
$ca->initPage();
$ca->setTemplate('sla');
$ca->output();
