The binary data shown in your `tail` command output indicates that the journal files are in a binary format, not plain text. To view these logs in a readable, formatted view, you should use the `journalctl` command instead of directly reading the journal files.

Here’s how to do it:

### Using `journalctl`
To view the last 10 log entries:
```bash
sudo journalctl -n 10
```

To view the last 10 log entries for a specific service (e.g., `jenkins.service`):
```bash
sudo journalctl -u jenkins.service -n 10
```

To follow the log entries in real-time (similar to `tail -f`):
```bash
sudo journalctl -f
```

To follow the log entries for a specific service in real-time:
```bash
sudo journalctl -u jenkins.service -f
```

### Explanation
- **`sudo journalctl -n 10`**: Shows the last 10 log entries.
- **`sudo journalctl -u jenkins.service -n 10`**: Shows the last 10 log entries specifically for the Jenkins service.
- **`sudo journalctl -f`**: Follows new log entries as they are added, similar to `tail -f`.
- **`sudo journalctl -u jenkins.service -f`**: Follows new log entries for the Jenkins service in real-time.

### Customizing Output
You can customize the output of `journalctl` using various options:

- **`--since` and `--until`**: To specify a time range.
  ```bash
  sudo journalctl --since "2023-08-01 00:00:00" --until "2023-08-05 23:59:59"
  ```
- **`-p`**: To filter by priority (e.g., errors only).
  ```bash
  sudo journalctl -p err
  ```
- **`-o`**: To change the output format (e.g., `json`, `json-pretty`, `short`, etc.).
  ```bash
  sudo journalctl -o json-pretty
  ```

By using `journalctl`, you can easily view and analyze system logs in a human-readable format.
