CREATE
    DATABASE IF NOT EXISTS Salesforce_External_DB DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE Salesforce_External_DB;

DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS contract;
DROP TABLE IF EXISTS campaign;
DROP TABLE IF EXISTS price_type;
DROP TABLE IF EXISTS price_record;
DROP TABLE IF EXISTS price_record_series_number;
DROP TABLE IF EXISTS sf_user;

-- 顧客マスタ
CREATE TABLE customer
(
    sf_customer_id         VARCHAR(18),
    start_date             DATE,
    end_date               DATE,
    birthday               DATE,
    last_name              VARCHAR(60),
    first_name             VARCHAR(60),
    kana_name              VARCHAR(120),
    age                    INT(3),
    gender                 VARCHAR(2),
    mail_address           VARCHAR(80),
    company                VARCHAR(60),
    company_kana           VARCHAR(60),
    company_rep_last_name  VARCHAR(60),
    company_rep_first_name VARCHAR(60),
    company_rep_kana       VARCHAR(120),
    home_phone_number      VARCHAR(40),
    phone_number           VARCHAR(40),
    postal_code            VARCHAR(8),
    address                VARCHAR(256),
    address_prefecture     VARCHAR(4),
    address_municipality   VARCHAR(80),
    address_street         VARCHAR(256),
    membership_no          VARCHAR(40),

    PRIMARY KEY (sf_customer_id)
);

-- 契約
CREATE TABLE contract
(
    Id                       VARCHAR(18),
    ShippingAddress          VARCHAR(100),
    BillingAddress           VARCHAR(100),
    CreatedByID              VARCHAR(18),
    Pricebook2Id             VARCHAR(18),
    OwnerId                  VARCHAR(18),
    ContractTerm             INT(11),
    Name                     VARCHAR(100),
    ContractNumber           VARCHAR(100),
    EndDate                  DATE,
    StartDate                DATE,
    OwnerExpirationNotice    VARCHAR(100),
    LastModifiedById         VARCHAR(18),
    ActivatedById            VARCHAR(18),
    ActivatedDate            DATETIME,
    SpecialTerms             VARCHAR(4000),
    Status                   VARCHAR(100),
    CompanySignedDate        DATE,
    CompanySignedId          VARCHAR(18),
    Description              TEXT,
    CustomerSignedDate       DATE,
    CustomerSignedId         VARCHAR(18),
    CustomerSignedTitle      VARCHAR(40),
    AccountId                VARCHAR(18),
    identifier               VARCHAR(200) UNIQUE,
    district_id__c           VARCHAR(18),
    PriceRecord__c           VARCHAR(18),
    Riyouteishibi__c         DATE,
    UsePeriod__c             VARCHAR(100),
    StartUseDate__c          DATE,
    ReferredContract__c      VARCHAR(18),
    Account__c               VARCHAR(18),
    InquiryId__c             VARCHAR(18),
    KeiyakuStatus__c         VARCHAR(100),
    ContractType__c          VARCHAR(100),
    ContractPlatNames__c     VARCHAR(255),
    ContractValidatedDate__c DATE,
    payMethod__c             VARCHAR(100),
    PaymentTerm__c           VARCHAR(100),
    ImportedContractId__c    VARCHAR(18),
    kaiyakubi__c             DATE,
    MoveFlag__c              BOOL,
    FarmName__c              VARCHAR(18),

    PRIMARY KEY (Id)
);

-- キャンペーン
CREATE TABLE campaign
(
    sf_campaign_id      VARCHAR(18),
    sf_campaign_type    VARCHAR(256),
    text                VARCHAR(256),
    other_text          VARCHAR(256),
    alliance_text       VARCHAR(256),
    campaign_start_date DATE,
    campaing_end_date   DATE,
    discount_type       VARCHAR(4),
    entrance_fee        VARCHAR(2),
    discount_span_year  INT(2),
    discount_amount     DECIMAL(8),
    gift_ticket_flg     BOOLEAN,
    sf_farm_id          VARCHAR(18),

    PRIMARY KEY (sf_campaign_id)
);

-- 価格タイプ
CREATE TABLE price_type
(
    id              VARCHAR(18),
    price_type_id   VARCHAR(80),
    price_type_name VARCHAR(80),
    PRIMARY KEY (price_type_id)
);

-- 価格レコード
CREATE TABLE price_record
(
    sf_price_record_id  VARCHAR(128),
    created_by_id       VARCHAR(128),
    sf_district_id      VARCHAR(128),
    sf_farm_id          VARCHAR(18),
    last_modified_by_id VARCHAR(18),
    owner_id            VARCHAR(18),
    start_date          DATE,
    end_date            DATE,

    PRIMARY KEY (sf_price_record_id)
);

-- 価格レコード連続番号
CREATE TABLE price_record_series_number
(
    id                  VARCHAR(18),
    created_by_id       VARCHAR(128),
    start_date          DATE,
    end_date            DATE,
    create_date         DATE,
    series_number       INT(2),
    price               INT(2),
    sf_price_record_id  VARCHAR(128),
    price_type_id       VARCHAR(18),
    price_type_name     VARCHAR(18),
    owner_id            VARCHAR(18),
    last_modified_by_id VARCHAR(18),

    PRIMARY KEY (series_number, sf_price_record_id)
);

-- SFユーザマスタ
CREATE TABLE sf_user
(
    sf_user_id             VARCHAR(18),
    sf_user_login_password VARCHAR(256),
    start_date             DATE,
    end_date               DATE,

    PRIMARY KEY (sf_user_id)
);