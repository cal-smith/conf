#!/usr/bin/env fish

if test (uname) = "Linux"
    set battperc (cat /sys/class/power_supply/BAT1/capacity)
else
    # MacOS
    set battperc (pmset -g batt | grep -o "[0-9][0-9]*\%")
end

set battnum (math (echo $battperc | grep -o "[0-9]*") + 0)

if test $battnum -gt 75
    echo ☀︎ ☀︎ ☀︎ ☀︎
else if test $battnum -gt 50
    echo ☀︎ ☀︎ ☀︎ ☼
else if test $battnum -gt 25
    echo ☀︎ ☀︎ ☼ ☼
else if test $battnum -gt 0
    echo ☀︎ ☼ ☼ ☼
else
    echo ☼ ☼ ☼ ☼
end

