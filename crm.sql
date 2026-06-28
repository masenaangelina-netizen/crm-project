SELECT 
    sales.department, 
    sales.family, 
    sales.category,
    COUNT(DISTINCT sales.member_id) AS unique_customers, 
    SUM(sales.gmv_amount) AS total_gmv, 
    SUM(sales.gmv_item_quantity) AS total_items
FROM 
    `twdatawarehouse-bsv8.dashboard_data_new.tw_sales_detail_new` AS sales
JOIN 
    `twdatawarehouse-bsv8.dashboard_data_new.tw_member_new` AS member
    ON sales.member_id = member.member_id
WHERE 
    sales.gmv_recorded_date BETWEEN DATE('2025-04-01') AND DATE('2026-06-30')
    AND sales.member_active_category = 'awaken'
GROUP BY 
    1, 2, 3
ORDER BY 
    total_gmv DESC