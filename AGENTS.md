# Project agent notes

## Current status (2026-11-13)

- Working files: `v13/index.html` and root `index.html` (keep both in sync)
- Last published work: on the About page, “Reveal Botanicals is set…” sits at the top of the Yellow Aster Butte photo, in the site’s darker purple (`#5C4080`). On a phone that photo is the full width of the screen so the words stay on the sky. On a wider screen the photo stays 70% of the page width.
- On the homepage, “Ready to Feel Better?” sits on the bottom of the aurora photo. “Your health journey…” stays below that photo.
- “The Path Forward” on the Services page is bold. Its size is still 40px, and 32px on a phone.
- The page names in the menu are 22px. On a screen narrower than 1280px the menu is the button, so those larger names stay whole. Below 1540px the words beside the logo are hidden; the logo already reads Reveal Botanicals.
- The Hemlock Trail video stays on the left of The Path Forward and reaches that section title.
- The homepage specialty line says “Immunometabolic.”
- The homepage title “Reveal Botanicals” sits 10px lower.
- The menu bar remains 112px tall, with `pictures/RB Logo.png` filling that height. Menu page names are 22px.
- The nursing line still ends with “Oncology, Cardiothoracic.” The three organization logos under it are 161px tall.
- Homepage remains: the hero photo is behind “Reveal Botanicals,” with the original dark tint. `videos/FoxGlovePath.mp4` plays on a muted loop between “Immerse Yourself” and “How I Offer Support.” A refresh opens at the top of the page.
- Contact page remains published: gold outline on the Discovery Call button, Hands at Desk photo under it, link out to the booking page. No calendar embed.
- Services page remains published: “Integrated with BODYSITE” matches “The Path Forward” at 40px (32px on a phone).
- Repo state: the homepage uses the 26-second cut. The untrimmed source is also in the repo at `videos/Fox Glove with path.mp4` (31.3 seconds, about 42 MB) and is not used on the page. Do not commit `videos/RevealBotanicals_Videos_061626.zip` (about 108 MB; GitHub rejects files over 100 MB).
- Word docs in the folder are historical change lists, not the current backlog
- Next step: waiting on the next change. The dark tint stays on the hero photo only. The foxglove video has no tint.

On the site:

- `videos/FoxGlovePath.mp4` — 26 seconds, about 24.2 MB, 1920×1080. Poster: `pictures/FoxGlovePath-poster.jpg`.
- `videos/HemlockTrailStream-5s.mp4` — 5 seconds, about 13.1 MB, portrait 1080×1920, with sound. Loops while the pointer is over the video on the left of The Path Forward. On a phone, a tap starts it and a second tap pauses it. Poster: `pictures/HemlockTrailStream-poster.jpg`.
- `videos/HemlockTrailStream.mp4` — the full clip, about 10 seconds, about 28 MB. It stays in the repo and is not used on the page.

Other clips in `videos/`, local only:

- `HemlockTrailStream.mov` — original phone clip. The 5-second MP4 is on the Services page. Do not commit the `.mov`.
- `Butterflies.mp4`
- `AdobeStock_379225077.mp4` — Baikal Skullcap stock clip

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
