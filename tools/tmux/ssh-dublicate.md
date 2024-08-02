# It is not as good as we Want but ok 
To duplicate a pane that maintains the session of `newuser` without having to log in again, you can use the `tmux` `capture-pane` and `paste-buffer` commands to achieve this.


Here’s a step-by-step approach:

1. **Split the Pane**:
   - Split the current pane horizontally or vertically as needed:
     ```bash
     Ctrl + b then "
     ```
     or
     ```bash
     Ctrl + b then %
     ```

2. **Send the SSH Command to the New Pane**:
   - Use the `send-keys` command to send the `ssh newuser@localhost` command to the new pane. Assuming your new pane is `1`:
     ```bash
     Ctrl + b then :
     ```
   - Type the following command and press `Enter`:
     ```bash
     send-keys -t 1 'ssh newuser@localhost' C-m
     ```

3. **Duplicate the SSH Session**:
   - After sending the SSH command to the new pane, you may need to re-enter your password for the `newuser` if required. If you are using passwordless SSH (e.g., using SSH keys), the session should start automatically.

4. **Ensure Both Panes are on the Same User**:
   - Now, both panes should be logged in as `newuser`.

Here is a consolidated set of commands to do this:

1. **Split the Pane**:
   ```bash
   Ctrl + b then "
   ```

2. **Send the SSH Command to the New Pane**:
   ```bash
   Ctrl + b then :
   send-keys -t 1 'ssh newuser@localhost' C-m
   ```

### Example tmux commands:

1. **Split Pane**:
   ```bash
   Ctrl + b then "
   ```

2. **Send SSH Command**:
   ```bash
   Ctrl + b then :
   send-keys -t 1 'ssh newuser@localhost' C-m
   ```

This will ensure that the new pane will run commands as `newuser` without requiring a new login. If your SSH session requires a password, you'll need to enter it again when prompted. If you're using SSH keys, the session should start immediately without further authentication.