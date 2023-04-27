#!/bin/sh

# https://unix.stackexchange.com/a/603784/217674

# Open tmux panes with wisersaver server running
# tmux new-session \; \
#     send-keys 'startWisersaver' C-m \; \
#     split-window -v  \; \
#     send-keys 'wiseup' C-m \; \
#     split-window -v  \; \
#     send-keys 'wiseup && npm run watch:adops' C-m \; \
#     split-window -v  \; \
#     send-keys 'wiseup && npm run watch:client' C-m \;
# -2 attach-session -d \;


tmux new-session \;            select-pane -T "Django Server" \; \
    send-keys 'cowsay "#1" && startWisersaver' C-m \; \
    \; \
    \; \
    split-window -h \;         select-pane -T "Vue 3 - Vite Server" \; \
    send-keys 'cowsay "#2" && wiseup && cd front_end && npm run dev' C-m \; \
    \; \
    \; \
    split-window -v -p 66 \;   select-pane -T "Terminal" \; \
    send-keys 'cowsay "#3" && cd front_end && npm run dev' C-m \; \
    \; \
    \; \
    split-window -v \;         select-pane -T "Terminal" \; \
    send-keys 'cowsay "#4"' C-m \; \
    select-pane -t 0 \; \
    \; \
    \; \
    split-window -v -p 66 \;   select-pane -T "Vue 2 - Client" \; \
    send-keys 'cowsay "#5" && wiseup && npm run watch:client' C-m \; \
    \; \
    \; \
    split-window -v \;         select-pane -T "Vue 2 - Ad Ops" \; \
    send-keys 'cowsay "#6" && wiseup && npm run watch:adops' C-m \;
