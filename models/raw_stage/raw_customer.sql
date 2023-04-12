SELECT
    C.C_CUSTKEY AS CUSTOMER_KEY,
    C.SRC_TIMESTAMP AS SRC_TIMESTAMP,
    c.C_NAME AS CUSTOMER_NAME,
    c.C_ADDRESS AS CUSTOMER_ADDRESS,
    c.C_NATIONKEY AS CUSTOMER_NATION_KEY,
    c.C_PHONE AS CUSTOMER_PHONE,
    c.C_ACCTBAL AS CUSTOMER_ACCBAL,
    c.C_MKTSEGMENT AS CUSTOMER_MKTSEGMENT,
    c.C_COMMENT AS CUSTOMER_COMMENT,
    c.C_COMMENT AS CUSTOMER_COMMENTS,
    c.C_TIER AS CUSTOMER_TIER
FROM {{ source('tpch_sample', 'CUSTOMER_SCD2') }} AS C