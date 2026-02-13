Select * from social_media_performance;
-- 1.1. Thống kê tổng lượt tương tác, tỷ lệ tương tác, view
Select 
    "Platform",
    ROUND(AVG("Engagement")::numeric,0) AS avg_engagement,
    ROUND(AVG("Engagement_Rate")::numeric,4) AS avg_engagement_rate,
    ROUND(AVG("Views")::numeric,0) AS avg_views
from social_media_performance
GROUP BY "Platform"
ORDER BY avg_engagement DESC;


-- 1.2. Xác định loại nội dung  nào mang lại hiệu quả cao nhất
SELECT
    "Content_Type",
    ROUND(AVG("Engagement")::numeric, 0) AS avg_engagement,
    ROUND(AVG("Engagement_Rate")::numeric, 4) AS avg_engagement_rate,
    ROUND(AVG("Views")::numeric, 0) AS avg_views
FROM social_media_performance
GROUP BY "Content_Type"
ORDER BY avg_engagement DESC;

-- 1.3. Xác định kiểu bài nào mang lại hiệu quả cao nhất
SELECT
    "Post_Type",
    ROUND(AVG("Engagement")::numeric, 0) AS avg_engagement,
    ROUND(AVG("Engagement_Rate")::numeric, 4) AS avg_engagement_rate,
    ROUND(AVG("Views")::numeric, 0) AS avg_views
FROM social_media_performance
GROUP BY "Post_Type"
ORDER BY avg_engagement DESC;





-- 2. Danh mục nội dung nào (ví dụ: quảng bá sản phẩm, giáo dục) mang lại hiệu quả tốt nhất
-- ở các khu vực khác nhau?

SELECT
    "Content_Category",
	"Region",
    ROUND(AVG("Engagement")::numeric, 0) AS avg_engagement,
    ROUND(AVG("Engagement_Rate")::numeric, 4) AS avg_engagement_rate,
    ROUND(AVG("Views")::numeric, 0) AS avg_views
FROM social_media_performance
GROUP BY "Content_Category", "Region"
ORDER BY  avg_engagement DESC;





--3. Các chỉ số hiệu suất thay đổi như thế nào tùy theo nền tảng, định dạng bài đăng hoặc cách sử dụng hashtag?
-- Platform × Post_Type
SELECT "Platform", 
		"Post_Type",
		 ROUND(AVG("Engagement")::numeric, 0) AS avg_engagement,
   		 ROUND(AVG("Engagement_Rate")::numeric, 4) AS avg_engagement_rate,
    	 ROUND(AVG("Views")::numeric, 0) AS avg_views,
    	 ROUND(AVG("Click_Through_Rate")::numeric, 4) AS avg_ctr
FROM social_media_performance
GROUP BY "Platform", "Post_Type"
ORDER BY avg_engagement DESC;

-- Platform × Hashtag
SELECT
    "Platform",
    "Main_Hashtag",
    COUNT(*) AS post_count,
    ROUND(AVG("Impressions")::numeric, 0) AS avg_impressions,
    ROUND(AVG("Clicks")::numeric, 0) AS avg_clicks
FROM social_media_performance
GROUP BY "Platform", "Main_Hashtag"
HAVING COUNT(*) >= 20
ORDER BY avg_impressions DESC;






--4.Ngày và giờ nào là lý tưởng nhất để đăng nội dung nhằm đạt được tương tác tối đa?
-- Giờ
SELECT
    "Post_Hour",
    ROUND(AVG("Engagement")::numeric,0) AS avg_engagement
FROM social_media_performance
GROUP BY "Post_Hour"
ORDER BY avg_engagement DESC;

-- Ngày
SELECT
    "Day_Name",
    ROUND(AVG("Engagement")::numeric,0) AS avg_engagement
FROM social_media_performance
GROUP BY "Day_Name"
ORDER BY avg_engagement DESC;





-- 5. Có sự khác biệt theo khu vực về hiệu suất tương tác và tỷ lệ click (CTR) không?
SELECT
    "Region",
    ROUND(AVG("Engagement")::numeric, 0) AS avg_engagement,
    ROUND(AVG("Engagement_Rate")::numeric, 4) AS avg_engagement_rate,
    ROUND(AVG("Click_Through_Rate")::numeric, 4) AS avg_ctr,
    ROUND(AVG("Views")::numeric, 0) AS avg_views
FROM social_media_performance
GROUP BY "Region"
ORDER BY avg_engagement DESC;





-- 6. Những hashtag nào hiệu quả nhất trong việc tăng số lần hiển thị hoặc lượt click?
SELECT
    "Main_Hashtag",
    COUNT(*) AS post_count,
    ROUND(AVG("Impressions")::numeric, 0) AS avg_impressions,
    ROUND(AVG("Clicks")::numeric, 0) AS avg_clicks,
    ROUND(AVG("Click_Through_Rate")::numeric, 4) AS avg_ctr
FROM social_media_performance
GROUP BY "Main_Hashtag"
HAVING COUNT(*) >= 30
ORDER BY avg_clicks DESC;





-- 7.Quốc gia hoặc khu vực nào liên tục có lượt xem video cao hoặc sự quan tâm lớn đến phát trực tiếp (live stream)?

SELECT
    "Region",
    ROUND(AVG("Video_Views")::numeric, 0) AS avg_video_views,
	ROUND(AVG("Live_Stream_Views")::numeric, 0) AS avg_live_stream_views
FROM social_media_performance
GROUP BY "Region";




--8. Có sự tương quan nào giữa mức độ tương tác với danh mục nội dung hoặc thời gian đăng bài không?
--Content_Category
SELECT
    "Content_Category",
    ROUND(AVG("Engagement")::numeric, 0) AS avg_engagement
FROM social_media_performance
GROUP BY "Content_Category"
ORDER BY avg_engagement DESC;
--Post_Hour
SELECT
    "Post_Hour",
    ROUND(AVG("Engagement")::numeric, 0) AS avg_engagement
FROM social_media_performance
GROUP BY "Post_Hour"
ORDER BY "Post_Hour";



--9. Các loại nội dung tự nhiên (organic) so với nội dung được quảng cáo (promoted) khác nhau như thế nào về phạm vi tiếp cận và hiệu suất?
SELECT
    "Content_Type",
    COUNT(*) AS total_posts,
    ROUND(AVG("Impressions")::numeric, 0) AS avg_impressions,
    ROUND(AVG("Views")::numeric, 0) AS avg_views,
    ROUND(AVG("Engagement")::numeric, 0) AS avg_engagement,
    ROUND(AVG("Engagement_Rate")::numeric, 4) AS avg_engagement_rate,
    ROUND(AVG("Click_Through_Rate")::numeric, 4) AS avg_ctr
FROM social_media_performance
GROUP BY "Content_Type";





