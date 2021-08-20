#!/usr/local/bin/fish

set battperc (pmset -g batt | grep -o "[0-9][0-9]*\%")
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

