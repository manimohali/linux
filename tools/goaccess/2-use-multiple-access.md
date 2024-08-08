Yes, you can use multiple access log files with `goaccess` by specifying each log file in the command. There are a few ways to achieve this:

### Method 1: Specifying Multiple Log Files

You can specify multiple log files directly in the command:
```bash
goaccess /path/to/access.log /path/to/another_access.log -o report.html --log-format=COMBINED
```

### Method 2: Using Wildcards

If the log files are in the same directory and follow a similar naming pattern, you can use a wildcard:
```bash
goaccess /path/to/access*.log -o report.html --log-format=COMBINED
```

### Method 3: Using a Log List File

You can create a file that lists all your log files and then use that file with `goaccess`:
1. Create a file, e.g., `log_list.txt`, and list all your log files, one per line:
   ```plaintext
   /path/to/access.log
   /path/to/another_access.log
   /path/to/yet_another_access.log
   ```

2. Use the `-f` option to specify the file containing the list of log files:
   ```bash
   goaccess -f log_list.txt -o report.html --log-format=COMBINED
   ```

### Example Command

If you have multiple log files located in `/home/mani/Downloads/`, you can use:
```bash
goaccess /home/mani/Downloads/access.log /home/mani/Downloads/another_access.log -o report.html --log-format=COMBINED
```

Or, if you have multiple logs following a pattern, such as `access1.log`, `access2.log`, etc.:
```bash
goaccess /home/mani/Downloads/access*.log -o report.html --log-format=COMBINED
```

Or, using a log list file:
1. Create `log_list.txt`:
   ```plaintext
   /home/mani/Downloads/access.log
   /home/mani/Downloads/another_access.log
   /home/mani/Downloads/yet_another_access.log
   ```

2. Run `goaccess` with the log list file:
   ```bash
   goaccess -f log_list.txt -o report.html --log-format=COMBINED
   ```

These methods will allow you to analyze multiple access log files with `goaccess` and generate a combined report.



Example:

```bash
goaccess /home/mani/Downloads/lab/logs/access*.log /home/mani/Downloads/lab/logs/access.log.* -o report.html --log-format=COMBINED
```