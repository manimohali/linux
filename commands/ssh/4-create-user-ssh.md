Sure! Here's a clear separation of steps for setting up an SSH user with a password, with keys, and with both, indicating which steps need to be done on the server side and which on the user's local machine.

### Server-Side Steps

#### 1. Create SSH User with Password

1. **Add the new user**:
   ```sh
   sudo adduser newuser
   ```
   Follow the prompts to set a password and provide any additional information.

2. **Allow the user to use SSH** (optional if sudo access is needed):
   ```sh
   sudo usermod -aG sudo newuser
   ```

#### 2. Prepare for SSH Key Authentication

1. **Create the `.ssh` directory and `authorized_keys` file for the new user**:
   ```sh
   sudo mkdir /home/newuser/.ssh
   sudo touch /home/newuser/.ssh/authorized_keys
   sudo chown -R newuser:newuser /home/newuser/.ssh
   sudo chmod 700 /home/newuser/.ssh
   sudo chmod 600 /home/newuser/.ssh/authorized_keys
   ```

2. **Edit the SSH configuration file to allow both password and key-based authentication**:
   ```sh
   sudo nano /etc/ssh/sshd_config
   ```
   Ensure the following lines are set:
   ```sh
   PasswordAuthentication yes
   PubkeyAuthentication yes
   ```

3. **Restart the SSH service to apply changes**:
   ```sh
   sudo systemctl restart ssh
   ```

### User (Local Machine) Steps

#### 1. Generate SSH Keys (if not already done)

1. **Generate SSH keys**:
   ```sh
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```
   Follow the prompts to save the key files. The default location is usually `~/.ssh/id_rsa` for the private key and `~/.ssh/id_rsa.pub` for the public key.

#### 2. Copy the Public Key to the Server

1. **Copy the public key to the remote server**:
   ```sh
   ssh-copy-id newuser@remote_server_ip
   ```
   This will add your public key to the `~/.ssh/authorized_keys` file of the `newuser` on the remote server.

### Summary of Steps

#### Server-Side

1. **Create the user and set a password**:
   ```sh
   sudo adduser newuser
   ```
2. **Allow the user to use SSH (optional)**:
   ```sh
   sudo usermod -aG sudo newuser
   ```
3. **Prepare SSH directory and file**:
   ```sh
   sudo mkdir /home/newuser/.ssh
   sudo touch /home/newuser/.ssh/authorized_keys
   sudo chown -R newuser:newuser /home/newuser/.ssh
   sudo chmod 700 /home/newuser/.ssh
   sudo chmod 600 /home/newuser/.ssh/authorized_keys
   ```
4. **Edit SSH configuration**:
   ```sh
   sudo nano /etc/ssh/sshd_config
   ```
   Ensure these lines are set:
   ```sh
   PasswordAuthentication yes
   PubkeyAuthentication yes
   ```
5. **Restart SSH service**:
   ```sh
   sudo systemctl restart ssh
   ```

#### User (Local Machine)

1. **Generate SSH keys**:
   ```sh
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```
2. **Copy the public key to the server**:
   ```sh
   ssh-copy-id newuser@remote_server_ip
   ```

This setup allows the `newuser` to log in using either a password or an SSH key.




<!-- ======================================================================================================= -->


To configure the same user (`newuser`) to use both SSH and SFTP with different authentication methods, you can create an SFTP-specific configuration that forces password authentication only when using SFTP. This involves using a custom SSH configuration for SFTP connections.

Here are the steps to achieve this setup:

### Server-Side Steps

1. **Create the SFTP Directory for the User**

   Create a directory for SFTP access that will be used as the chroot jail. This directory must be owned by root and not writable by any other users.

   ```sh
   sudo mkdir -p /home/newuser/sftp/upload
   sudo chown root:root /home/newuser/sftp
   sudo chmod 755 /home/newuser/sftp
   sudo chown newuser:newuser /home/newuser/sftp/upload
   ```

2. **Edit the SSH Configuration**

   Edit the SSH daemon configuration file to configure the SFTP user and enforce password authentication for SFTP connections.

   ```sh
   sudo nano /etc/ssh/sshd_config
   ```

   Add the following lines at the end of the file:

   ```sh
   Match User newuser
       ChrootDirectory /home/newuser/sftp
       ForceCommand internal-sftp
       AllowTcpForwarding no
       X11Forwarding no
       PasswordAuthentication yes
       PubkeyAuthentication no
   ```

   This configuration forces password authentication for SFTP connections by the user `newuser`.

3. **Restart the SSH Service**

   ```sh
   sudo systemctl restart ssh
   ```

### Summary of Steps

1. **Create and set permissions for the SFTP directory**:
   ```sh
   sudo mkdir -p /home/newuser/sftp/upload
   sudo chown root:root /home/newuser/sftp
   sudo chmod 755 /home/newuser/sftp
   sudo chown newuser:newuser /home/newuser/sftp/upload
   ```

2. **Edit the SSH configuration**:
   ```sh
   sudo nano /etc/ssh/sshd_config
   ```

   Add the following lines:

   ```sh
   Match User newuser
       ChrootDirectory /home/newuser/sftp
       ForceCommand internal-sftp
       AllowTcpForwarding no
       X11Forwarding no
       PasswordAuthentication yes
       PubkeyAuthentication no
   ```

3. **Restart the SSH service**:
   ```sh
   sudo systemctl restart ssh
   ```

### Explanation

- **ChrootDirectory**: Restricts the user's file access to the specified directory.
- **ForceCommand internal-sftp**: Forces the user to use the SFTP subsystem.
- **AllowTcpForwarding no**: Disables TCP forwarding for the user.
- **X11Forwarding no**: Disables X11 forwarding for the user.
- **PasswordAuthentication yes**: Enables password authentication for the user.
- **PubkeyAuthentication no**: Disables public key authentication for the user.

With this configuration, `newuser` will use password authentication for SFTP connections, while still being able to use either public key or password authentication for regular SSH connections.






<!-- =================================================================================================================== -->

The error message `fatal: bad ownership or modes for chroot directory component "/home/newuser/"` indicates that the ownership or permissions for the directory `/home/newuser/` are incorrect for chroot. For chroot to work correctly, the directory and all its parent directories up to the root must be owned by root and not writable by any other user.

### Fixing Directory Ownership and Permissions

Let's ensure the directory permissions and ownership are correctly set:

1. **Set Ownership and Permissions for the Home Directory**

   ```sh
   sudo chown root:root /home/newuser
   sudo chmod 755 /home/newuser
   ```

2. **Set Ownership and Permissions for the SFTP Directory**

   ```sh
   sudo mkdir -p /home/newuser/sftp/upload
   sudo chown root:root /home/newuser/sftp
   sudo chmod 755 /home/newuser/sftp
   sudo chown newuser:newuser /home/newuser/sftp/upload
   ```

### Summary of Commands

1. **Ensure `/home/newuser` is owned by root and has the correct permissions**:
   ```sh
   sudo chown root:root /home/newuser
   sudo chmod 755 /home/newuser
   ```

2. **Ensure `/home/newuser/sftp` and `/home/newuser/sftp/upload` have the correct ownership and permissions**:
   ```sh
   sudo mkdir -p /home/newuser/sftp/upload
   sudo chown root:root /home/newuser/sftp
   sudo chmod 755 /home/newuser/sftp
   sudo chown newuser:newuser /home/newuser/sftp/upload
   ```

3. **Restart the SSH service**:
   ```sh
   sudo systemctl restart ssh
   ```

After correcting the ownership and permissions, try logging in again using SFTP:

```sh
sftp newuser@remote_server_ip
```

By following these steps, the issue with directory ownership and permissions should be resolved, allowing `newuser` to use SFTP with password authentication correctly.