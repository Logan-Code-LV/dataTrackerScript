# 🌐 Network Data Tracker

> *Keep tabs on your bandwidth useage* 📊

A lightweight bash script that monitors your network usage in real-time. Perfect for when you're curious about how much data you're burning through.

## ✨ What It Does

This nifty script tracks your network traffic from the moment you start it, giving you:
- **Download tracking** - See how much data you've pulled down
- **Upload monitoring** - Keep an eye on your outbound traffic  
- **Total usage** - Combined stats because math is hard
- **Real-time updates** - Check your usage whenever you want

## 🚀 Quick Start

Make it executable and run:
```bash
chmod +x network_tracker.sh
./network_tracker.sh
```

## 🎮 How to Use

Once running, you've got two commands:
- Type `data` - Shows your current network usage since starting the script
- Type `exit` - Gracefully exits (because we're civilized here)

## 📱 Sample Output

```
Starting network usage tracking...
Type 'data' to show network usage or 'exit' to quit: data

Network Usage Since Start:
Downloaded: 45 MB
Uploaded: 12 MB
Total: 57.23 MB
```

## 🔧 How It Works

The script uses `netstat -ib` to grab interface statistics and does some awk magic to:
1. Parse byte counters from all network interfaces
2. Calculate the difference from your starting point
3. Convert everything to human-readable MB values
4. Present it in a clean format

## 📋 Requirements

- Bash shell (obviously)
- `netstat` command (standard on most Unix-like systems)
- `bc` calculator (for those precise decimal calculations)
- A burning desire to know your data usage

## 🎯 Perfect For

- Monitoring data usage on metered connections
- Keeping track during large downloads/uploads

## 🤝 Contributing

Found a bug? Want to add features? Fork it, fix it, PR it! This script is simple by design but there's always room for improvement.

## 📄 License

Do whatever you want with it. It's just a bash script, not rocket science.

---

*Made with ❤️* ☕
