# Project agent notes

## Current status (2026-11-14)

- Working files: `v13/index.html` and root `index.html` (keep both in sync)
- Last published work: the Hemlock video beside The Path Forward blends its ending into the opening, so the restart does not jump.
- The page names on the menu bar sit together on the right. The gap between names is 17px.
- On the About page, “Reveal Botanicals is set…” is a darker blue (`#0E3A6E`), a little heavier, with a light edge so it stands out on the sky.
- On the homepage, “Your health journey…” and the Schedule button sit 20px below the aurora photo.
- The Hemlock Trail video on Services is the 2.5-to-5.5-second passage, with the ending dissolved into the opening so the loop restarts on the same motion.
- On Services, “The Path Forward” is 42px (34px on a phone). The five step sentences are 15px. “New to herbalism…” uses the darker body color `#2D2438`.
- The page names on the menu bar are 18px. They had been 14px, then 22px.
- The Hemlock Trail video on the Services page plays as soon as that page is open. Sound plays only while the pointer is over the video. On a phone, a tap turns the sound on and a second tap turns it off. The loop is `videos/HemlockTrailStream-loop.mp4`.
- On the About page, “Reveal Botanicals is set…” sits at the top of the Yellow Aster Butte photo, in a darker blue (`#0E3A6E`). On a phone that photo is the full width of the screen so the words stay on the sky. On a wider screen the photo stays 70% of the page width.
- On the homepage, “Ready to Feel Better?” sits on the bottom of the aurora photo. “Your health journey…” and the Schedule button start 20px below that photo.
- “The Path Forward” on the Services page is bold, 42px, and 34px on a phone. The five sentences under it are 15px. “New to herbalism…” is `#2D2438`.
- The page names on the menu bar are 18px and sit together on the right, with 17px between each name. On a screen narrower than 1280px the menu is the button, so those names stay whole. Below 1540px the words beside the logo are hidden; the logo already reads Reveal Botanicals. The opened phone menu names stay 22px.
- The Hemlock Trail video stays on the left of The Path Forward. Its top lines up with the title. Its bottom hangs about 20px below the last step. The colored box ends about 30px lower than it did. On a phone the video stays the same size under the steps, and the box ends 30px lower.
- The homepage specialty line says “Immunometabolic.”
- The homepage title “Reveal Botanicals” sits 10px lower.
- The menu bar remains 112px tall, with `pictures/RB Logo.png` filling that height. Its fill is solid `--warm-white` (`#FDFAFD`), with no blur. Menu page names on the bar are 18px.
- The nursing line still ends with “Oncology, Cardiothoracic.” The three organization logos under it are 161px tall.
- Homepage remains: the hero photo is behind “Reveal Botanicals,” at 95% opacity, with the original dark tint. The title stays solid white. `videos/FoxGlovePath.mp4` plays on a muted loop between “Immerse Yourself” and “How I Offer Support.” A refresh opens at the top of the page.
- Contact page remains published: gold outline on the Discovery Call button, Hands at Desk photo under it, link out to the booking page. No calendar embed.
- Services page remains published: “Integrated with BODYSITE” is 40px (32px on a phone).
- Repo state: the homepage uses the 26-second cut. The untrimmed source is also in the repo at `videos/Fox Glove with path.mp4` (31.3 seconds, about 42 MB) and is not used on the page. Do not commit `videos/RevealBotanicals_Videos_061626.zip` (about 108 MB; GitHub rejects files over 100 MB).
- Word docs in the folder are historical change lists, not the current backlog
- Next step: waiting on the next change. Do not reopen the solid menu bar, the grouped 17px menu names, the Path Forward spacing, the blended Hemlock loop, or the About caption color. The hero photo stays at 95% opacity with the original dark tint. The foxglove video has no tint.

On the site:

- `videos/FoxGlovePath.mp4` — 26 seconds, about 24.2 MB, 1920×1080. Poster: `pictures/FoxGlovePath-poster.jpg`.
- `videos/HemlockTrailStream-loop.mp4` — 2.5 seconds, about 8.4 MB, portrait 1080×1920, with sound. Made from the 2.5-to-5.5-second passage. The last half-second dissolves into the opening, so the file’s last frame continues into its first frame. Plays on the left of The Path Forward as soon as Services is open, and loops. Sound plays only while the pointer is over it. On a phone, a tap turns the sound on and a second tap turns it off. Poster: `pictures/HemlockTrailStream-poster.jpg`.
- `videos/HemlockTrailStream.mp4` — the full clip, about 10 seconds, about 28 MB. It stays in the repo and is not used on the page.

Other clips in `videos/`, local only:

- `HemlockTrailStream.mov` — original phone clip. The blended loop on the Services page is made from the 2.5-to-5.5-second passage. Do not commit the `.mov`.
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
