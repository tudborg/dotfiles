
if command -v youtube-dl >/dev/null; then
    function play {
        # Skip DASH manifest for speed purposes. This might actually disable
        # being able to specify things like 'bestaudio' as the requested format,
        # but try anyway.
        # Use "$*" so that quoting the requested song isn't necessary.
        youtube-dl --default-search=ytsearch: \
                   --youtube-skip-dash-manifest \
                   --output="${TMPDIR:-/tmp/}%(title)s-%(id)s.%(ext)s" \
                   --restrict-filenames \
                   --format="bestaudio" \
                   --exec=mplayer "$*"
    }

    function mp3 {
        # Get the best audio, convert it to MP3, and save it to the current
        # directory.
        youtube-dl --default-search=ytsearch: \
                   --restrict-filenames \
                   --format=bestaudio \
                   --extract-audio \
                   --audio-format=mp3 \
                   --audio-quality=1 "$*"
    }
fi
