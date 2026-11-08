# Project agent notes

## Current status (2026-11-08)

- Working files: `v13/index.html` and root `index.html` (keep both in sync)
- Last published work: About page — the three membership names under Education & Credentials are now the AHG, ABC, and WNPS logo pictures.
- Contact page remains published: gold outline on the Discovery Call button, Hands at Desk photo under it, link out to the booking page. No calendar embed.
- Repo state: site changes are on `origin main`. The videos below are local only and are not committed.
- Word docs in the folder are historical change lists, not the current backlog
- Next step: the user will choose which MP4 to put on the site, and where. Do not commit `videos/RevealBotanicals_Videos_061626.zip` (about 108 MB; GitHub rejects files over 100 MB).

Videos ready in `videos/`, converted from the zip, not on the website yet:

- `IMG_7273.mp4` — 12 seconds, 14.6 MB, 1920×1080
- `IMG_7258.mp4` — 31 seconds, 42.0 MB, 1920×1080
- `AdobeStock_379225077.mp4` — 15 seconds, 21.3 MB, 1920×1080. Baikal Skullcap stock clip.

`pictures/` is where photos are dropped. `videos/` is where videos are dropped. Web video format for this site is MP4.

ffmpeg 9.0.2 is installed for this Windows user (`winget install --id Gyan.FFmpeg -e --scope user`). New shells can run `ffmpeg`. Use it to convert `.mov` files to H.264 MP4. iPhone clips are often HEVC and need the BT.709 conversion before they will look right on the site.

Open items:

- Comfrey image is still embedded as base64; host it on Adobe/Squarespace before go-live (see `SQUARESPACE-MIGRATION-NOTES.md`)
- Botanical Insights cards are still placeholders
- Per-image Sanctuary credit strings are still verbose (footer line is the site-wide credit)

When a session ends, update this section (date, last work, open items, next step) before committing.

## Deploy workflow

After making website changes (to `index.html`, `v13/index.html`, or other site files that should go live):

1. Commit the relevant site files.
2. **Always push to `origin main`** so GitHub Pages updates — do not leave changes local-only unless the user asks to hold the push.

Do not commit untracked notes, Word docs, `agent-tools/`, `terminals/`, or temp files unless the user asks for those specifically.

Live prototype: https://sentito.github.io/reveal-botanicals-prototype/  
v13: https://sentito.github.io/reveal-botanicals-prototype/v13/
