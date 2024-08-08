The permissions on your key files look correct for the private and public key files. Here's a quick breakdown of what these permissions mean and how to proceed with `ssh-copy-id`:

### File Permissions Breakdown

1. **Private Key (`id_newuser`)**:
   ```
   rw-------  1 mani mani 3389 Jul 23 16:18 id_newuser
   ```
   - `rw-------` (600): Read and write permissions for the owner only. This is correct for a private key, as it should be kept secure.

2. **Public Key (`id_newuser.pub`)**:
   ```
   -rw-r--r--  1 mani mani  748 Jul 23 16:18 id_newuser.pub
   ```
   - `rw-r--r--` (644): Read and write permissions for the owner, read-only for others. This is correct for a public key.

### Copying the Public Key to the Server

To copy the public key to the server for the user `newuser`, use the `ssh-copy-id` command. Make sure you specify the correct path to your new public key file:

```sh
ssh-copy-id -i ~/.ssh/id_newuser.pub newuser@remote_server_ip
```

### Summary of Steps

1. **Ensure the private key file has the correct permissions** (already correct in your case):
   ```sh
   chmod 600 ~/.ssh/id_newuser
   ```

2. **Ensure the public key file has the correct permissions** (already correct in your case):
   ```sh
   chmod 644 ~/.ssh/id_newuser.pub
   ```

3. **Copy the public key to the server**:
   ```sh
   ssh-copy-id -i ~/.ssh/id_newuser.pub newuser@remote_server_ip
   ```

4. **Verify SSH Access**:
   After copying the public key, you can verify SSH access using the new key:
   ```sh
   ssh -i ~/.ssh/id_newuser newuser@remote_server_ip
   ```

By following these steps, you ensure that your keys are properly configured and that the public key is correctly copied to the server for the `newuser`.