#!/usr/bin/env bash
#
# Vendor setup script for Xiaomi Raphael
# Maintainer: ZabukaZuzu
# Purpose: Automatically clone all required repositories

set -e

echo ""
echo "=============================================="
echo "   Starting vendor setup for Xiaomi Raphael   "
echo "=============================================="
echo ""

start_time=$(date +%s)

# Repositories to fetch
declare -A repos=(
  ["vendor/xiaomi/raphael"]="https://github.com/Evolution-X-Devices/vendor_xiaomi_raphael.git -b bka --depth=1"
  ["kernel/xiaomi/raphael"]="https://github.com/Evolution-X-Devices/kernel_xiaomi_raphael.git -b bka --depth=1"
  ["vendor/xiaomi/miuicamera"]="https://codeberg.org/Evolution-X/vendor_xiaomi_miuicamera.git -b bka --depth=1"
  ["packages/apps/ViPER4AndroidFX"]="https://github.com/Evolution-X-Devices/packages_apps_ViPER4AndroidFX.git -b bka"
)

# Clone each repo
for path in "${!repos[@]}"; do
    echo "→ Cloning $path ..."
    rm -rf "$path" >/dev/null 2>&1
    if git clone ${repos[$path]} "$path"; then
        echo "   ✓ Completed: $path"
    else
        echo "   ✗ Failed: $path"
    fi
done

end_time=$(date +%s)
duration=$((end_time - start_time))
minutes=$((duration / 60))
seconds=$((duration % 60))

echo ""
echo "----------------------------------------------"
echo " All repositories cloned successfully"
echo " Time taken: ${minutes}m ${seconds}s"
echo "----------------------------------------------"
echo ""
