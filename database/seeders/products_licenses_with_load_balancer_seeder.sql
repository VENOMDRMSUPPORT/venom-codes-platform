-- =====================================================
-- Venom Codes - Products + Plans + Load Balancer Addon Seeder
-- WARNING: DEVELOPMENT / STAGING USE ONLY
-- =====================================================
-- Seeds:
-- 1) Trial License  (one-time $50, 7-day trial)
-- 2) Pro License    (monthly $100)
-- 3) Ultra License  (monthly $300)
-- 4) Additional Load Balancer addon (monthly $10, Pro only)
--
-- NOTE:
-- WHMCS products do not provide a native weekly billing cycle.
-- Trial is seeded as one-time $50 with 7-day scope in description.
--
-- Run via PowerShell:
-- Get-Content "F:\xampp\htdocs\venom-codes.test\client\database\seeders\products_licenses_with_load_balancer_seeder.sql" -Raw | & "F:\xampp\mysql\bin\mysql.exe" -h localhost -P 3306 -u admin -p"habiba77Hm@" venom-codes
-- =====================================================

START TRANSACTION;

SET @now = NOW();
SET @group_name = 'License IPTV Panel';
SET @group_slug = 'license-iptv-panel';
SET @addon_name = 'Additional Load Balancer';

-- -----------------------------------------------------
-- Ensure product group exists (or normalize it)
-- -----------------------------------------------------
SET @group_id = (
  SELECT `id`
  FROM `tblproductgroups`
  WHERE `slug` = @group_slug
  LIMIT 1
);

INSERT INTO `tblproductgroups`
(`name`, `slug`, `headline`, `tagline`, `orderfrmtpl`, `disabledgateways`, `hidden`, `order`, `icon`, `created_at`, `updated_at`)
SELECT
  @group_name,
  @group_slug,
  'Choose the license that fits your IPTV server setup',
  'Enterprise-grade control panel access for streaming infrastructure. Software licensing only.',
  'standard_cart',
  '',
  0,
  1,
  '',
  @now,
  @now
WHERE @group_id IS NULL;

SET @group_id = COALESCE(
  @group_id,
  (SELECT `id` FROM `tblproductgroups` WHERE `slug` = @group_slug LIMIT 1)
);

UPDATE `tblproductgroups`
SET
  `name` = @group_name,
  `headline` = 'Choose the license that fits your IPTV server setup',
  `tagline` = 'Enterprise-grade control panel access for streaming infrastructure. Software licensing only.',
  `orderfrmtpl` = 'standard_cart',
  `hidden` = 0,
  `order` = 1,
  `updated_at` = @now
WHERE `id` = @group_id;

-- -----------------------------------------------------
-- Cleanup previous seeded addon/pricing
-- -----------------------------------------------------
DELETE p
FROM `tblpricing` p
JOIN `tbladdons` a ON a.`id` = p.`relid`
WHERE p.`type` = 'addon'
  AND a.`name` = @addon_name;

DELETE FROM `tbladdons`
WHERE `name` = @addon_name;

-- -----------------------------------------------------
-- Cleanup previous products in this group + their pricing
-- -----------------------------------------------------
DELETE FROM `tblpricing`
WHERE `type` = 'product'
  AND `relid` IN (
    SELECT x.`id`
    FROM (SELECT `id` FROM `tblproducts` WHERE `gid` = @group_id) AS x
  );

DELETE FROM `tblproducts`
WHERE `gid` = @group_id;

-- -----------------------------------------------------
-- Trial License
-- -----------------------------------------------------
INSERT INTO `tblproducts` (
  `type`, `gid`, `name`, `slug`, `description`, `hidden`, `showdomainoptions`, `welcomeemail`,
  `stockcontrol`, `qty`, `proratabilling`, `proratadate`, `proratachargenextmonth`, `paytype`,
  `allowqty`, `subdomain`, `autosetup`, `servertype`, `servergroup`,
  `configoption1`, `configoption2`, `configoption3`, `configoption4`, `configoption5`,
  `configoption6`, `configoption7`, `configoption8`, `configoption9`, `configoption10`,
  `configoption11`, `configoption12`, `configoption13`, `configoption14`, `configoption15`,
  `configoption16`, `configoption17`, `configoption18`, `configoption19`, `configoption20`,
  `configoption21`, `configoption22`, `configoption23`, `configoption24`,
  `freedomain`, `freedomainpaymentterms`, `freedomaintlds`, `recurringcycles`, `autoterminatedays`,
  `autoterminateemail`, `configoptionsupgrade`, `billingcycleupgrade`, `upgradeemail`,
  `overagesenabled`, `overagesdisklimit`, `overagesbwlimit`, `overagesdiskprice`, `overagesbwprice`,
  `tax`, `affiliateonetime`, `affiliatepaytype`, `affiliatepayamount`, `order`, `retired`,
  `is_featured`, `color`, `tagline`, `short_description`, `created_at`, `updated_at`
) VALUES (
  'other', @group_id, 'Trial License', 'venom-trial-license',
  'Test the full power for 7 days.\n- 1 Main Server\n- No Load Balancers\n- 24/7 Ticketing',
  0, 0, 0,
  0, 0, 0, 0, 0, 'onetime',
  0, '', '', 'licensing', 0,
  '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',
  '', '', '', 0, 0,
  0, 0, '', 0,
  '', 0, 0, 0.0000, 0.0000,
  0, 0, '', 0.00, 1, 0,
  0, '#9abb3a', 'Test the full power for 7 days', '7-day trial license (software only)', @now, @now
);
SET @trial_pid = LAST_INSERT_ID();

-- -----------------------------------------------------
-- Pro License
-- -----------------------------------------------------
INSERT INTO `tblproducts` (
  `type`, `gid`, `name`, `slug`, `description`, `hidden`, `showdomainoptions`, `welcomeemail`,
  `stockcontrol`, `qty`, `proratabilling`, `proratadate`, `proratachargenextmonth`, `paytype`,
  `allowqty`, `subdomain`, `autosetup`, `servertype`, `servergroup`,
  `configoption1`, `configoption2`, `configoption3`, `configoption4`, `configoption5`,
  `configoption6`, `configoption7`, `configoption8`, `configoption9`, `configoption10`,
  `configoption11`, `configoption12`, `configoption13`, `configoption14`, `configoption15`,
  `configoption16`, `configoption17`, `configoption18`, `configoption19`, `configoption20`,
  `configoption21`, `configoption22`, `configoption23`, `configoption24`,
  `freedomain`, `freedomainpaymentterms`, `freedomaintlds`, `recurringcycles`, `autoterminatedays`,
  `autoterminateemail`, `configoptionsupgrade`, `billingcycleupgrade`, `upgradeemail`,
  `overagesenabled`, `overagesdisklimit`, `overagesbwlimit`, `overagesdiskprice`, `overagesbwprice`,
  `tax`, `affiliateonetime`, `affiliatepaytype`, `affiliatepayamount`, `order`, `retired`,
  `is_featured`, `color`, `tagline`, `short_description`, `created_at`, `updated_at`
) VALUES (
  'other', @group_id, 'Pro License', 'venom-pro-license',
  'Perfect for growing networks.\n- 1 Main Server\n- 1 FREE Load Balancer\n- Additional LB: $10 each',
  0, 0, 0,
  0, 0, 0, 0, 0, 'recurring',
  0, '', '', 'licensing', 0,
  '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',
  '', '', '', 0, 0,
  0, 0, '', 0,
  '', 0, 0, 0.0000, 0.0000,
  0, 0, '', 0.00, 2, 0,
  1, '#3f8cff', 'Perfect for growing networks', '1 free load balancer included', @now, @now
);
SET @pro_pid = LAST_INSERT_ID();

-- -----------------------------------------------------
-- Ultra License
-- -----------------------------------------------------
INSERT INTO `tblproducts` (
  `type`, `gid`, `name`, `slug`, `description`, `hidden`, `showdomainoptions`, `welcomeemail`,
  `stockcontrol`, `qty`, `proratabilling`, `proratadate`, `proratachargenextmonth`, `paytype`,
  `allowqty`, `subdomain`, `autosetup`, `servertype`, `servergroup`,
  `configoption1`, `configoption2`, `configoption3`, `configoption4`, `configoption5`,
  `configoption6`, `configoption7`, `configoption8`, `configoption9`, `configoption10`,
  `configoption11`, `configoption12`, `configoption13`, `configoption14`, `configoption15`,
  `configoption16`, `configoption17`, `configoption18`, `configoption19`, `configoption20`,
  `configoption21`, `configoption22`, `configoption23`, `configoption24`,
  `freedomain`, `freedomainpaymentterms`, `freedomaintlds`, `recurringcycles`, `autoterminatedays`,
  `autoterminateemail`, `configoptionsupgrade`, `billingcycleupgrade`, `upgradeemail`,
  `overagesenabled`, `overagesdisklimit`, `overagesbwlimit`, `overagesdiskprice`, `overagesbwprice`,
  `tax`, `affiliateonetime`, `affiliatepaytype`, `affiliatepayamount`, `order`, `retired`,
  `is_featured`, `color`, `tagline`, `short_description`, `created_at`, `updated_at`
) VALUES (
  'other', @group_id, 'Ultra License', 'venom-ultra-license',
  'Zero limits, peak performance.\n- 1 Main Server\n- Unlimited Load Balancers\n- Priority VIP Support',
  0, 0, 0,
  0, 0, 0, 0, 0, 'recurring',
  0, '', '', 'licensing', 0,
  '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',
  '', '', '', 0, 0,
  0, 0, '', 0,
  '', 0, 0, 0.0000, 0.0000,
  0, 0, '', 0.00, 3, 0,
  0, '#7b65ff', 'Zero limits, peak performance', 'Unlimited load balancers', @now, @now
);
SET @ultra_pid = LAST_INSERT_ID();

-- -----------------------------------------------------
-- Pricing for all active currencies
-- -----------------------------------------------------
INSERT INTO `tblpricing`
(`type`, `currency`, `relid`, `msetupfee`, `qsetupfee`, `ssetupfee`, `asetupfee`, `bsetupfee`, `tsetupfee`, `monthly`, `quarterly`, `semiannually`, `annually`, `biennially`, `triennially`)
SELECT
  'product', c.`id`, @trial_pid,
  0.00, 0.00, 0.00, 0.00, 0.00, 0.00,
  50.00, -1.00, -1.00, -1.00, -1.00, -1.00
FROM `tblcurrencies` c;

INSERT INTO `tblpricing`
(`type`, `currency`, `relid`, `msetupfee`, `qsetupfee`, `ssetupfee`, `asetupfee`, `bsetupfee`, `tsetupfee`, `monthly`, `quarterly`, `semiannually`, `annually`, `biennially`, `triennially`)
SELECT
  'product', c.`id`, @pro_pid,
  0.00, 0.00, 0.00, 0.00, 0.00, 0.00,
  100.00, -1.00, -1.00, -1.00, -1.00, -1.00
FROM `tblcurrencies` c;

INSERT INTO `tblpricing`
(`type`, `currency`, `relid`, `msetupfee`, `qsetupfee`, `ssetupfee`, `asetupfee`, `bsetupfee`, `tsetupfee`, `monthly`, `quarterly`, `semiannually`, `annually`, `biennially`, `triennially`)
SELECT
  'product', c.`id`, @ultra_pid,
  0.00, 0.00, 0.00, 0.00, 0.00, 0.00,
  300.00, -1.00, -1.00, -1.00, -1.00, -1.00
FROM `tblcurrencies` c;

-- -----------------------------------------------------
-- Additional Load Balancer addon (Pro only)
-- -----------------------------------------------------
INSERT INTO `tbladdons`
(`packages`, `name`, `description`, `billingcycle`, `allowqty`, `tax`, `showorder`, `hidden`, `retired`, `downloads`, `autoactivate`, `suspendproduct`, `welcomeemail`, `type`, `module`, `server_group_id`, `prorate`, `weight`, `autolinkby`, `created_at`, `updated_at`)
VALUES
(CAST(@pro_pid AS CHAR), @addon_name, 'Add additional load balancer nodes for Pro licenses. Billed per extra node.', 'Monthly', 2, 0, 1, 0, 0, '', '', 0, 0, '', '', 0, 0, 0, '', @now, @now);
SET @addon_id = LAST_INSERT_ID();

INSERT INTO `tblpricing`
(`type`, `currency`, `relid`, `msetupfee`, `qsetupfee`, `ssetupfee`, `asetupfee`, `bsetupfee`, `tsetupfee`, `monthly`, `quarterly`, `semiannually`, `annually`, `biennially`, `triennially`)
SELECT
  'addon', c.`id`, @addon_id,
  0.00, 0.00, 0.00, 0.00, 0.00, 0.00,
  10.00, -1.00, -1.00, -1.00, -1.00, -1.00
FROM `tblcurrencies` c;

COMMIT;

-- =====================================================
-- Done: Product plans + pricing + load balancer addon seeded.
-- =====================================================
