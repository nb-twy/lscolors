STR="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456"
for bg in $(seq 0 256); do
    for fg in $(seq 0 256); do
        # No need for 01 or 02 with 256 color support
        for s in 00 04; do
            echo -e "\e[$s;38;5;$fg;48;5;$bg""m$s;38;5;$fg;48;5;$bg   $STR\e[0m"
        done
    done
done
