To enable and use copy-paste functionality in `tmux`, follow these steps:

1. **Configure tmux for Copy-Paste**:
   Add the following configurations to your `.tmux.conf` file to make the copy-paste process easier and more compatible with modern clipboard usage:
   ```bash
   # Enable mouse support
   set -g mouse on
   
   # Set vi-style key bindings
   setw -g mode-keys vi
   
   # Use system clipboard (requires xclip or pbcopy on macOS)
   bind-key -T copy-mode-vi 'y' send -X copy-pipe-and-cancel "xclip -selection clipboard -in"
   ```

   - `set -g mouse on`: Enables mouse support for scrolling and selection.
   - `setw -g mode-keys vi`: Sets vi-style key bindings for navigation in copy mode.
   - `bind-key -T copy-mode-vi 'y' send -X copy-pipe-and-cancel "xclip -selection clipboard -in"`: Binds the `y` key to copy the selection to the system clipboard using `xclip`. Replace `xclip -selection clipboard -in` with `pbcopy` if you're on macOS.

2. **Reload tmux Configuration**:
   After adding the above lines to your `.tmux.conf`, reload the tmux configuration:
   ```bash
   tmux source-file ~/.tmux.conf
   ```

3. **Using Copy Mode**:
   - **Enter Copy Mode**:
     Press `Ctrl + b` then `[`

   - **Navigate and Select Text**:
     Use the arrow keys to navigate or `k` and `j` for vim-style navigation.
     Press `Space` to start the selection, navigate to the end of the selection, and press `y` to copy the selected text to the clipboard.

   - **Exit Copy Mode**:
     Press `q` or `Ctrl + c`.

4. **Paste in tmux**:
   - To paste the copied text within tmux, use `Ctrl + b` then `]`.

### Additional Notes:
- **Clipboard Utilities**:
  - On Linux, you can use `xclip` or `xsel` to handle clipboard operations.
  - On macOS, you can use `pbcopy` and `pbpaste`.

- **Clipboard Setup**:
  - If you are using `xclip`, install it using:
    ```bash
    sudo apt-get install xclip
    ```
  - If you are using `pbcopy` on macOS, it is typically pre-installed.


  