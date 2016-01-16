if which ipfw >/dev/null; then
    #fake slow network
    alias slowNetwork='sudo ipfw pipe 1 config bw 350kbit/s plr 0.05 delay 500ms && sudo ipfw add pipe 1 dst-port http'
    alias flushNetwork='sudo ipfw flush'
fi