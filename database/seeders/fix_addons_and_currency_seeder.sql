-- =====================================================
-- Venom Codes - Fix Addons Visibility + Default Currency (USD)
-- WARNING: DEVELOPMENT / STAGING USE ONLY
-- =====================================================
-- This script:
-- 1) Sets USD as default currency
-- 2) Moves existing clients to USD currency id
-- 3) Normalizes Additional Load Balancer addon package mapping
-- 4) Seeds active Pro services for clients (so addon appears in client area)
--
-- Run via PowerShell:
-- Get-Content "F:\xampp\htdocs\venom-codes.test\client\database\seeders\fix_addons_and_currency_seeder.sql" -Raw | & "F:\xampp\mysql\bin\mysql.exe" --login-path=venom venom-codes
-- =====================================================

START TRANSACTION;

SET @now_ts = NOW();
SET @today = CURDATE();
SET @next_due = DATE_ADD(CURDATE(), INTERVAL 30 DAY);
SET @usd_currency_id = (SELECT `id` FROM `tblcurrencies` WHERE `code` = 'USD' LIMIT 1);
SET @pro_pid = (SELECT `id` FROM `tblproducts` WHERE `slug` = 'venom-pro-license' LIMIT 1);
SET @addon_id = (SELECT `id` FROM `tbladdons` WHERE `name` = 'Additional Load Balancer' LIMIT 1);

-- 1) USD as system default currency
UPDATE `tblcurrencies`
SET `default` = CASE WHEN `id` = @usd_currency_id THEN 1 ELSE 0 END;

-- 2) Existing clients -> USD (seed/demo consistency)
UPDATE `tblclients`
SET `currency` = @usd_currency_id
WHERE @usd_currency_id IS NOT NULL;

-- 3) Force addon package mapping to Pro product id
UPDATE `tbladdons`
SET `packages` = CAST(@pro_pid AS CHAR),
    `allowqty` = 2
WHERE `id` = @addon_id
  AND @pro_pid IS NOT NULL;

-- 4) Ensure each client has an active Pro service so addon is orderable
INSERT INTO `tblhosting`
(`userid`, `orderid`, `packageid`, `server`, `regdate`, `domain`, `paymentmethod`,
 `qty`, `firstpaymentamount`, `amount`, `billingcycle`, `nextduedate`, `nextinvoicedate`,
 `termination_date`, `completed_date`, `domainstatus`, `username`, `password`, `notes`,
 `subscriptionid`, `promoid`, `promocount`, `suspendreason`, `overideautosuspend`,
 `overidesuspenduntil`, `dedicatedip`, `assignedips`, `ns1`, `ns2`, `diskusage`, `disklimit`,
 `bwusage`, `bwlimit`, `lastupdate`, `created_at`, `updated_at`)
SELECT
  c.`id`,
  0,
  @pro_pid,
  0,
  @today,
  CONCAT('license-client-', c.`id`, '.local'),
  'paypal',
  1,
  100.00,
  100.00,
  'Monthly',
  @next_due,
  @next_due,
  '0000-00-00',
  '0000-00-00',
  'Active',
  '',
  '',
  'Seeded Pro license service for addon visibility',
  '',
  0,
  0,
  '',
  0,
  '0000-00-00',
  '',
  '',
  '',
  '',
  0,
  0,
  0,
  0,
  @now_ts,
  @now_ts,
  @now_ts
FROM `tblclients` c
WHERE @pro_pid IS NOT NULL
  AND NOT EXISTS (
    SELECT 1
    FROM `tblhosting` h
    WHERE h.`userid` = c.`id`
      AND h.`packageid` = @pro_pid
      AND h.`domainstatus` IN ('Active', 'Pending', 'Suspended', 'Completed')
  );

COMMIT;

-- =====================================================
-- Done: Addon visibility + USD default currency fixed.
-- =====================================================
