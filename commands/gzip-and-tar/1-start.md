
## How to Unzip 
**Unzip a File**
To extract `access.log.9.gz` in the current directory:
```sh
gunzip access.log.9.gz
```

To extract `access.log.9.gz` in another directory (e.g., `/path/to/dir`):
```sh
gunzip -c access.log.9.gz > /path/to/dir/access.log.9
```

**Unzip a folder**
To extract the `myfolder.tar.gz` file, use the following command:

```sh
tar -xzf myfolder.tar.gz

#with verbose
tar -xzvf myfolder.tar.gz
```



## How to zip 

**Zip a File**
To compress a file with `gzip`, use the following command:

```sh
gzip filename
```

This will compress `filename` and create a file named `filename.gz`.



**Zip a folder**

To compress a folder with `gzip`, you first need to archive it using `tar`, and then compress the archive. Here’s how to do it for a folder named `myfolder`:

```sh
tar -czf myfolder.tar.gz myfolder

#with verbose
tar -czvf myfolder.tar.gz myfolder
```



## How to zip and Unzip in Specific folder. 

To compress a folder (`myfolder`) and save the archive to a specific directory (`/path/to/destination`):

```sh
tar -czvf /path/to/destination/myfolder.tar.gz myfolder
```

To extract the archive (`myfolder.tar.gz`) to a specific directory (`/path/to/destination`):

```sh
tar -xzvf myfolder.tar.gz -C /path/to/destination
```