
###### unzip all access logs and move to dir `/home/mani/Downloads/lab/logs/`

```bash
mkdir -p /home/mani/Downloads/lab/logs/
for file in /home/mani/Downloads/access.log.*.gz; do
  gunzip -c "$file" > /home/mani/Downloads/lab/logs/$(basename "${file%.gz}")
done
```

