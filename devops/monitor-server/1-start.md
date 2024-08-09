To monitor your current server traffic in Ubuntu, you can use a variety of free and open-source tools. Here's a guide to help you get started:

### 1. **Netstat**
   - **Netstat** is a command-line tool that provides network statistics. It's useful for checking active connections, routing tables, and network interface statistics.

   **How to Use:**
   ```bash
   netstat -tn
   ```
   This command shows all active TCP connections. You can add `-u` for UDP connections.

### 2. **iftop**
   - **iftop** is a real-time console-based network bandwidth monitoring tool. It shows a list of network connections from/to your server and how much bandwidth each connection is using.

   **Installation:**
   ```bash
   sudo apt-get install iftop
   ```
   **Usage:**
   ```bash
   sudo iftop
   ```
   - **Tips:** Use the arrow keys to navigate, and `q` to quit.

### 3. **nload**
   - **nload** is a command-line tool that visualizes network traffic in real-time. It shows incoming and outgoing traffic separately with graphs.

   **Installation:**
   ```bash
   sudo apt-get install nload
   ```
   **Usage:**
   ```bash
   sudo nload
   ```

### 4. **vnStat**
   - **vnStat** is a network traffic monitor that tracks the data consumed by your network interfaces. It doesn’t capture live traffic but provides usage statistics over time.

   **Installation:**
   ```bash
   sudo apt-get install vnstat
   ```
   **Usage:**
   ```bash
   vnstat
   ```
   - **Tips:** Use `vnstat -l` for live traffic monitoring.

### 5. **Wireshark**
   - **Wireshark** is a powerful network protocol analyzer that captures and displays data packets in real-time. It's more advanced and provides detailed insights into the traffic.

   **Installation:**
   ```bash
   sudo apt-get install wireshark
   ```
   **Usage:**
   ```bash
   sudo wireshark
   ```
   - **Tips:** Run it with root privileges, and you'll be able to capture and analyze packets for any interface.

### 6. **Prometheus and Grafana (Advanced)**
   - **Prometheus** is a monitoring system that collects metrics, and **Grafana** is a visualization tool. Together, they can be set up to monitor network traffic along with many other server metrics.
   - **Prometheus Deafult Port** http://localhost:9090/


   **Installation:**
   - This setup is more complex and may be better once you're comfortable with the basics.

### Getting Started:
1. **Install the tools:** Start by installing `iftop` or `nload` for basic real-time monitoring.
2. **Check your traffic:** Run the tools to see the current traffic on your server.
3. **Explore more tools:** Once you're comfortable, you can explore more advanced setups like Wireshark for deep analysis or Prometheus with Grafana for a full monitoring solution.

Let me know if you need any more help with these tools or guidance on how to set them up!