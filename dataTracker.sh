#!/bin/bash

# Function to get total bytes in/out from all interfaces
get_bytes() {
  netstat -ib | awk '
    BEGIN { total_in=0; total_out=0 }
    NR>1 && $7 ~ /^[0-9]+$/ && $10 ~ /^[0-9]+$/ {
      total_in += $7;
      total_out += $10;
    }
    END { print total_in, total_out }'
}

echo "Starting network usage tracking..."
read start_in start_out < <(get_bytes)

while true; do
  echo -n "Type 'data' to show network usage or 'exit' to quit: "
  read input

  if [[ "$input" == "data" ]]; then
    read curr_in curr_out < <(get_bytes)

    total_in=$((curr_in - start_in))
    total_out=$((curr_out - start_out))
    total_bytes=$((total_in + total_out))
    total_mb=$(echo "scale=2; $total_bytes/1024/1024" | bc)

    echo ""
    echo "Network Usage Since Start:"
    echo "Downloaded:   $((total_in / 1024 / 1024)) MB"
    echo "Uploaded:     $((total_out / 1024 / 1024)) MB"
    echo "Total:        $total_mb MB"
    echo ""
  elif [[ "$input" == "exit" ]]; then
    echo "Exiting."
    break
  else
    echo "Unrecognized command. Please type 'data' or 'exit'."
  fi
done
