-- Payment Gateways Seeder
-- This file seeds the tblpaymentgateways table with common payment gateway configurations

-- Clear existing payment gateway configurations
TRUNCATE TABLE `tblpaymentgateways`;

-- Bank Transfer Payment Gateway
INSERT INTO `tblpaymentgateways` (`gateway`, `setting`, `value`, `order`) VALUES
('banktransfer', 'name', 'Bank Transfer', 1),
('banktransfer', 'instructions', 'Bank Name:\nPayee Name:\nSort Code:\nAccount Number:', 1),
('banktransfer', 'disabled', '', 1);

-- PayPal Payment Gateway
INSERT INTO `tblpaymentgateways` (`gateway`, `setting`, `value`, `order`) VALUES
('paypal', 'name', 'PayPal', 2),
('paypal', 'email', '', 2),
('paypal', 'forceonetime', '', 2),
('paypal', 'forceoncheckout', '', 2),
('paypal', 'disabled', '', 2);

-- Stripe Payment Gateway
INSERT INTO `tblpaymentgateways` (`gateway`, `setting`, `value`, `order`) VALUES
('stripe', 'name', 'Stripe', 3),
('stripe', 'publishable_key', '', 3),
('stripe', 'secret_key', '', 3),
('stripe', 'webhook_endpoint', '', 3),
('stripe', 'webhook_secret', '', 3),
('stripe', 'disabled', '', 3);

-- Credit Card Payment Gateway
INSERT INTO `tblpaymentgateways` (`gateway`, `setting`, `value`, `order`) VALUES
('authorize', 'name', 'Authorize.net', 4),
('authorize', 'loginid', '', 4),
('authorize', 'transkey', '', 4),
('authorize', 'testmode', 'on', 4),
('authorize', 'disabled', '', 4);

-- 2Checkout Payment Gateway
INSERT INTO `tblpaymentgateways` (`gateway`, `setting`, `value`, `order`) VALUES
('twocheckout', 'name', '2Checkout', 5),
('twocheckout', 'accountnumber', '', 5),
('twocheckout', 'secretword', '', 5),
('twocheckout', 'testmode', 'on', 5),
('twocheckout', 'disabled', '', 5);

-- Skrill Payment Gateway
INSERT INTO `tblpaymentgateways` (`gateway`, `setting`, `value`, `order`) VALUES
('moneybookers', 'name', 'Skrill', 6),
('moneybookers', 'email', '', 6),
('moneybookers', 'disabled', '', 6);

-- Perfect Money Payment Gateway
INSERT INTO `tblpaymentgateways` (`gateway`, `setting`, `value`, `order`) VALUES
('perfectmoney', 'name', 'Perfect Money', 7),
('perfectmoney', 'account', '', 7),
('perfectmoney', 'alternatepassphrase', '', 7),
('perfectmoney', 'disabled', '', 7);

-- Payza Payment Gateway
INSERT INTO `tblpaymentgateways` (`gateway`, `setting`, `value`, `order`) VALUES
('payza', 'name', 'Payza', 8),
('payza', 'merchantid', '', 8),
('payza', 'securitycode', '', 8),
('payza', 'disabled', '', 8);

-- Crypto Payment Gateway
INSERT INTO `tblpaymentgateways` (`gateway`, `setting`, `value`, `order`) VALUES
('coinbase', 'name', 'Coinbase Commerce', 9),
('coinbase', 'apiKey', '', 9),
('coinbase', 'apiSecret', '', 9),
('coinbase', 'webhookSecret', '', 9),
('coinbase', 'disabled', '', 9);

-- Razorpay Payment Gateway
INSERT INTO `tblpaymentgateways` (`gateway`, `setting`, `value`, `order`) VALUES
('razorpay', 'name', 'Razorpay', 10),
('razorpay', 'key_id', '', 10),
('razorpay', 'key_secret', '', 10),
('razorpay', 'webhook_secret', '', 10),
('razorpay', 'disabled', '', 10);

-- Cash on Delivery Payment Gateway
INSERT INTO `tblpaymentgateways` (`gateway`, `setting`, `value`, `order`) VALUES
('cashondelivery', 'name', 'Cash on Delivery', 11),
('cashondelivery', 'instructions', 'Please prepare the exact amount for delivery.', 11),
('cashondelivery', 'disabled', '', 11);

-- Cheque Payment Gateway
INSERT INTO `tblpaymentgateways` (`gateway`, `setting`, `value`, `order`) VALUES
('cheque', 'name', 'Cheque', 12),
('cheque', 'instructions', 'Please make your cheque payable to:\n\nSend to:\n\nInclude your invoice number on the back of the cheque.', 12),
('cheque', 'disabled', '', 12);

-- Western Union Payment Gateway
INSERT INTO `tblpaymentgateways` (`gateway`, `setting`, `value`, `order`) VALUES
('westernunion', 'name', 'Western Union', 13),
('westernunion', 'instructions', 'Please send payment via Western Union to:\n\nName:\nAddress:\n\nMTCN Number:', 13),
('westernunion', 'disabled', '', 13);

-- MoneyGram Payment Gateway
INSERT INTO `tblpaymentgateways` (`gateway`, `setting`, `value`, `order`) VALUES
('moneygram', 'name', 'MoneyGram', 14),
('moneygram', 'instructions', 'Please send payment via MoneyGram to:\n\nName:\nAddress:\n\nReference Number:', 14),
('moneygram', 'disabled', '', 14);

-- BitPay Payment Gateway
INSERT INTO `tblpaymentgateways` (`gateway`, `setting`, `value`, `order`) VALUES
('bitpay', 'name', 'BitPay', 15),
('bitpay', 'apiKey', '', 15),
('bitpay', 'apiSecret', '', 15),
('bitpay', 'disabled', '', 15);

-- Square Payment Gateway
INSERT INTO `tblpaymentgateways` (`gateway`, `setting`, `value`, `order`) VALUES
('square', 'name', 'Square', 16),
('square', 'accessToken', '', 16),
('square', 'locationId', '', 16),
('square', 'disabled', '', 16);

-- Mercado Pago Payment Gateway
INSERT INTO `tblpaymentgateways` (`gateway`, `setting`, `value`, `order`) VALUES
('mercadopago', 'name', 'Mercado Pago', 17),
('mercadopago', 'client_id', '', 17),
('mercadopago', 'client_secret', '', 17),
('mercadopago', 'disabled', '', 17);

-- Paystack Payment Gateway
INSERT INTO `tblpaymentgateways` (`gateway`, `setting`, `value`, `order`) VALUES
('paystack', 'name', 'Paystack', 18),
('paystack', 'public_key', '', 18),
('paystack', 'secret_key', '', 18),
('paystack', 'disabled', '', 18);

-- Mollie Payment Gateway
INSERT INTO `tblpaymentgateways` (`gateway`, `setting`, `value`, `order`) VALUES
('mollie', 'name', 'Mollie', 19),
('mollie', 'apiKey', '', 19),
('mollie', 'description', 'Payment', 19),
('mollie', 'disabled', '', 19);

-- Sofort Payment Gateway
INSERT INTO `tblpaymentgateways` (`gateway`, `setting`, `value`, `order`) VALUES
('sofort', 'name', 'Sofort', 20),
('sofort', 'configkey', '', 20),
('sofort', 'disabled', '', 20);

-- iDEAL Payment Gateway
INSERT INTO `tblpaymentgateways` (`gateway`, `setting`, `value`, `order`) VALUES
('ideal', 'name', 'iDEAL', 21),
('ideal', 'merchantid', '', 21),
('ideal', 'secretkey', '', 21),
('ideal', 'disabled', '', 21);

-- SEPA Payment Gateway
INSERT INTO `tblpaymentgateways` (`gateway`, `setting`, `value`, `order`) VALUES
('sepa', 'name', 'SEPA', 22),
('sepa', 'account_holder', '', 22),
('sepa', 'iban', '', 22),
('sepa', 'bic', '', 22),
('sepa', 'instructions', 'Please transfer the amount to the following bank account:', 22),
('sepa', 'disabled', '', 22);

-- WeChat Pay Payment Gateway
INSERT INTO `tblpaymentgateways` (`gateway`, `setting`, `value`, `order`) VALUES
('wechatpay', 'name', 'WeChat Pay', 23),
('wechatpay', 'appid', '', 23),
('wechatpay', 'mchid', '', 23),
('wechatpay', 'apikey', '', 23),
('wechatpay', 'disabled', '', 23);

-- Alipay Payment Gateway
INSERT INTO `tblpaymentgateways` (`gateway`, `setting`, `value`, `order`) VALUES
('alipay', 'name', 'Alipay', 24),
('alipay', 'partner', '', 24),
('alipay', 'key', '', 24),
('alipay', 'disabled', '', 24);

-- Paymentwall Payment Gateway
INSERT INTO `tblpaymentgateways` (`gateway`, `setting`, `value`, `order`) VALUES
('paymentwall', 'name', 'Paymentwall', 25),
('paymentwall', 'project_key', '', 25),
('paymentwall', 'secret_key', '', 25),
('paymentwall', 'widget_code', '', 25),
('paymentwall', 'disabled', '', 25);
