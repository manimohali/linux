```html
<!-- ======================== Start ==================== -->
```

```ini
[mysqld]
# Basic Settings
innodb_buffer_pool_size = 1G
innodb_log_file_size = 256M
innodb_log_buffer_size = 16M
max_connections = 50

# Query Cache Settings
#query_cache_type = 1
#query_cache_size = 64M

# Thread Settings
thread_cache_size = 8

# Temporary Table Settings
tmp_table_size = 64M
max_heap_table_size = 64M

# Buffer Settings
sort_buffer_size = 4M
join_buffer_size = 4M

# Cache Settings
table_open_cache = 2000
table_definition_cache = 2000

# General Settings
key_buffer_size = 16M
read_buffer_size = 2M
read_rnd_buffer_size = 8M
```

### Applying the Configuration

1. **Edit the MySQL Configuration File:**
   Open your MySQL configuration file, typically located at `/etc/mysql/my.cnf` or `/etc/my.cnf`.

   ```bash
   sudo nano /etc/mysql/my.cnf
   ```

2. **Apply the New Settings:**
   Add the above settings under the `[mysqld]` section.

3. **Restart MySQL:**
   Restart the MySQL service to apply the new configuration.

   ```bash
   sudo systemctl restart mysql
   ```

### Additional Steps

1. **Analyze and Optimize Tables:**
   Periodically analyze and optimize your tables to keep them performing well.

   ```sql
   ANALYZE TABLE wp_posts;
   OPTIMIZE TABLE wp_posts;
   ANALYZE TABLE wp_postmeta;
   OPTIMIZE TABLE wp_postmeta;
   ```

2. **Monitor Performance:**
   Use tools like `mysqltuner` and `MySQL Workbench` to monitor and adjust settings as needed based on actual usage.

   ```bash
   sudo apt-get install mysqltuner
   mysqltuner
   ```

3. **Index Maintenance:**
   Ensure your indexes are appropriate and up-to-date based on your query patterns.

By applying these configurations and steps, you should see improved performance for your MySQL server within the constraints of your available hardware resources.


```sql
SHOW VARIABLES LIKE 'innodb_buffer_pool_size';
SHOW VARIABLES LIKE 'innodb_log_file_size';
SHOW VARIABLES LIKE 'innodb_log_buffer_size';
SHOW VARIABLES LIKE 'max_connections';
SHOW VARIABLES LIKE 'query_cache_type';
SHOW VARIABLES LIKE 'query_cache_size';
SHOW VARIABLES LIKE 'thread_cache_size';
SHOW VARIABLES LIKE 'tmp_table_size';
SHOW VARIABLES LIKE 'max_heap_table_size';
SHOW VARIABLES LIKE 'sort_buffer_size';
SHOW VARIABLES LIKE 'join_buffer_size';
SHOW VARIABLES LIKE 'table_open_cache';
SHOW VARIABLES LIKE 'table_definition_cache';
SHOW VARIABLES LIKE 'key_buffer_size';
SHOW VARIABLES LIKE 'read_buffer_size';
SHOW VARIABLES LIKE 'read_rnd_buffer_size';
```

```html
<!-- ======================== End ==================== -->
```


USE mani_db;

-- Analyze and optimize wp_posts
ANALYZE TABLE wp_posts;
OPTIMIZE TABLE wp_posts;

-- Analyze and optimize wp_postmeta
ANALYZE TABLE wp_postmeta;
OPTIMIZE TABLE wp_postmeta;



