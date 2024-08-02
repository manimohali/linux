To enable scrolling in `tmux`, you can use the built-in `copy-mode`. Here's how you can do it:

1. **Enter Copy Mode**:
   - Press `Ctrl + b` then `[` to enter copy mode.

2. **Navigate in Copy Mode**:
   - Use the arrow keys to scroll up and down, or `Page Up`/`Page Down` keys for faster navigation.
   - You can also use `vim`-like key bindings if enabled, such as `k` to move up and `j` to move down.

3. **Exit Copy Mode**:
   - Press `q` or `Ctrl + c` to exit copy mode.

To make scrolling more intuitive, you might also want to enable mouse support in `tmux`. This allows you to use the mouse wheel to scroll. Here’s how to enable it:

1. **Enable Mouse Support**:
   - Add the following line to your `.tmux.conf` file:
     ```bash
     set -g mouse on
     ```
   - Then reload the tmux configuration by either restarting tmux or running the following command inside tmux:
     ```bash
     tmux source-file ~/.tmux.conf
     ```
    