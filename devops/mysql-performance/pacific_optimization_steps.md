
USE mani_db;

Optimized Query: SELECT ID FROM wp_posts posts LEFT JOIN wp_postmeta postmeta ON posts.ID = postmeta.post_id WHERE posts.post_status = 'publish'  
--  Previous schema 

CREATE TABLE `wp_posts` (
  `ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int NOT NULL DEFAULT '0',
  `post_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=2803001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci




-- Analyze and optimize wp_posts
ANALYZE TABLE wp_posts;
OPTIMIZE TABLE wp_posts;

-- Analyze and optimize wp_postmeta
ANALYZE TABLE wp_postmeta;
OPTIMIZE TABLE wp_postmeta;


Fix:
ALTER TABLE wp_posts MODIFY post_date datetime NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE wp_posts MODIFY post_date_gmt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE wp_posts MODIFY post_modified datetime NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE wp_posts MODIFY post_modified_gmt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP;

OPTIMIZE TABLE wp_posts;

CREATE INDEX idx_post_status ON wp_posts(post_status);
CREATE INDEX idx_post_id ON wp_postmeta(post_id);
CREATE INDEX idx_posts_status_id ON wp_posts(post_status, ID);
CREATE INDEX idx_postmeta_post_id ON wp_postmeta(post_id);




---------------------------
Working:
---------------------------

Optimized query: SELECT ID FROM wp_posts posts LEFT JOIN wp_postmeta postmeta ON posts.ID = postmeta.post_id WHERE posts.post_status = 'publish'             AND ( posts.post_title LIKE '%M001-63-5070-425%' or posts.post_content LIKE '%M001-63-5070-425%' OR ( postmeta.meta_key = '_sku' AND postmeta.meta_value LIKE '%M001-63-5070-425%' ) ) AND posts.post_type IN ('product','product_variation');



  ```sql
   EXPLAIN SELECT ID 
   FROM wp_posts posts 
   LEFT JOIN wp_postmeta postmeta 
   ON posts.ID = postmeta.post_id 
   WHERE posts.post_status = 'publish'
     AND ( posts.post_title LIKE '%M001-63-5070-425%' 
           OR posts.post_content LIKE '%M001-63-5070-425%' 
           OR ( postmeta.meta_key = '_sku' AND postmeta.meta_value LIKE '%M001-63-5070-425%' ) )
     AND posts.post_type IN ('product','product_variation');
   ```



Fix:
2. **Add Indexes:**
   Make sure we have indexes on the columns used in the `WHERE` clause.

   ```sql
   
   CREATE INDEX idx_post_type_status ON wp_posts(post_type, post_status);
   CREATE INDEX idx_post_title ON wp_posts(post_title(255));
   CREATE INDEX idx_post_content ON wp_posts(post_content(500));
   CREATE INDEX idx_postmeta_meta_key_value ON wp_postmeta(meta_key(100), meta_value(500));
    ```

    ```sql
    CREATE INDEX idx_posts_status_type ON wp_posts(post_status, post_type, ID);
    CREATE INDEX idx_postmeta_sku ON wp_postmeta(post_id, meta_key(100), meta_value(500));
    ```

### Full-Text Search Implementation Example

For improving the search performance on `post_title` and `post_content`:

```sql
CREATE FULLTEXT INDEX ft_index ON wp_posts(post_title, post_content);


**Create Composite Indexes:**
CREATE INDEX idx_posts_type_status_title_content ON wp_posts(post_type, post_status, post_title(100), post_content(100));
