# Project agent notes

## Current status (2026-11-14)

- Working files: `v13/index.html` and root `index.html` (keep both in sync)
- Last published work: On Pricing, the photo above the footer is `pictures/elecampane.jpeg`. It keeps the full content width and its natural height (1280×771), so on a wide screen it is about 675px tall.
- On About, the landscape is `pictures/YellowAsterButte with words.web.jpg`. The words are part of the photo. The old caption on top of the photo is gone.
- The page names on the menu bar sit together on the right. The gap between names is 17px.
- On the About page, “Reveal Botanicals is set…” is printed in the Yellow Aster Butte photo. There is no separate caption on top of it.
- On the homepage, “Your health journey…” and the Schedule button sit 20px below the aurora photo.
- The left side of The Path Forward is `pictures/Ptarmigan view.jpeg` (640×853). Trail Mtn Forest and the Hemlock stream clips stay in the repo and are not on the page.
- On Services, “The Path Forward” is 42px (34px on a phone). The five step sentences are 15px. “New to herbalism…” uses the darker body color `#2D2438`.
- The page names on the menu bar are 18px. They had been 14px, then 22px.
- The Path Forward photo has no sound control. Homepage foxglove still plays muted.
- On the About page, the Yellow Aster Butte photo with the words already in it is 70% of the page width on a wide screen and the full width on a phone.
- On the homepage, “Ready to Feel Better?” sits on the bottom of the aurora photo. “Your health journey…” and the Schedule button start 20px below that photo.
- “The Path Forward” on the Services page is bold, 42px, and 34px on a phone. The five sentences under it are 15px. “New to herbalism…” is `#2D2438`.
- The page names on the menu bar are 18px and sit together on the right, with 17px between each name. On a screen narrower than 1280px the menu is the button, so those names stay whole. Below 1540px the words beside the logo are hidden; the logo already reads Reveal Botanicals. The opened phone menu names stay 22px.
- Ptarmigan view lines up with “The Path Forward.” On a wide screen the photo top matches the heading and the photo bottom matches the last line of step 5. The colored box still ends about 60px under that line. On a phone the steps come first, then the photo at its natural size, and the box still ends 110px under the photo.
- The homepage specialty line says “Immunometabolic.”
- The homepage title “Reveal Botanicals” sits 10px lower.
- The menu bar remains 112px tall, with `pictures/RB Logo.png` filling that height. Its fill is solid `--warm-white` (`#FDFAFD`), with no blur. Menu page names on the bar are 18px.
- The nursing line still ends with “Oncology, Cardiothoracic.” The three organization logos under it are 161px tall.
- Homepage remains: the hero photo is behind “Reveal Botanicals,” at 90% opacity, with the original dark tint. The title stays solid white. `videos/FoxGlovePath.mp4` plays on a muted loop between “Immerse Yourself” and “How I Offer Support.” A refresh opens at the top of the page.
- Contact page remains published: gold outline on the Discovery Call button, Hands at Desk photo under it, link out to the booking page. No calendar embed.
- Services page: “Integrated with BODYSITE” is 40px (32px on a phone). The title and the seven items are on the left. `pictures/Carol at Desk.jpeg` is on the right, with Visit BodySite Portal on the lower part of the photo. On a phone the items stack, then the photo. The FullScript icon is the white supplement bottle.
- Repo state: the homepage uses the 26-second cut. The untrimmed source is also in the repo at `videos/Fox Glove with path.mp4` (31.3 seconds, about 42 MB) and is not used on the page. Do not commit `videos/RevealBotanicals_Videos_061626.zip` (about 108 MB; GitHub rejects files over 100 MB).
- Word docs in the folder are historical change lists, not the current backlog
- Next step: waiting on the next change. The FullScript icon is the white supplement bottle. Do not put the Hemlock stream back on The Path Forward. Do not reopen the solid menu bar or the grouped 17px menu names. Do not put a caption back on the Yellow Aster Butte photo. The hero photo stays at 90% opacity with the original dark tint. The foxglove video has no tint. The Pricing foxglove stays on the left of the title and the four services.

On the site:

- `videos/FoxGlovePath.mp4` — 26 seconds, about 24.2 MB, 1920×1080. Poster: `pictures/FoxGlovePath-poster.jpg`.
- `videos/HemlockTrailStream-loop.mp4` — 2.5 seconds, about 8.4 MB, portrait 1080×1920. Not used on the page. Poster: `pictures/HemlockTrailStream-poster.jpg`.
- `videos/HemlockTrailStream.mp4` — the full clip, about 10 seconds, about 28 MB. Not used on the page.
- `pictures/Ptarmigan view.jpeg` — on the left of The Path Forward. 640×853.
- `pictures/Trail Mtn Forest.jpeg` — no longer on the page. 640×904.

Other clips in `videos/`, local only:

- `HemlockTrailStream.mov` — original phone clip. Do not commit the `.mov`.
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
