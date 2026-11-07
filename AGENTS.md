# Project agent notes

## Current status (2026-11-07)

- Working files: `v13/index.html` and root `index.html` (keep both in sync)
- Last published work: Contact page — gold outline (`#E8D4A0`, the homepage gold) on the Discovery Call booking button. `pictures/Hands at Desk.jpeg` sits under that button. The button links out to the Nylas booking page. No calendar is embedded on this site.
- Repo state: site changes are on `origin main`. The videos below are local only and are not committed.
- Word docs in the folder are historical change lists, not the current backlog
- Next step: the user will choose which MP4 to put on the site, and where. Do not commit `videos/RevealBotanicals_Videos_061626.zip` (about 108 MB; GitHub rejects files over 100 MB).

Videos ready in `videos/`, converted from the zip, not on the website yet:

- `IMG_7273.mp4` — 12 seconds, 14.6 MB, 1920×1080
- `IMG_7258.mp4` — 31 seconds, 42.0 MB, 1920×1080
- `AdobeStock_379225077.mp4` — 15 seconds, 21.3 MB, 1920×1080. Baikal Skullcap stock clip.

`pictures/` is where photos are dropped. `videos/` is where videos are dropped. Web video format for this site is MP4.

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
